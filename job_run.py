import psycopg2 as pg
import argparse
import sys
import datetime
import time
import logging
from subprocess import call
# Common NBA modules
import common as cmn
import teams as mTeams
import get_team_roster as mGetTeamRoster
import get_games as mGetGames
import players as mPlayers
import games as mGames


def check_args(args):
    rootLogger.info('Checking imput paramaters => {0}'.format(args))

    if args['name'] not in cmn.valid_job_names:
        rootLogger.error('Not a valid job name => {0}'.format(args['name']))
        sys.exit(1)

    if args['season_type'] not in cmn.valid_season_types:
        rootLogger.error('Incorrect season type => {0}'.format(args['season_type']))
        sys.exit(1)

    if args['history']:
        if args['season'] is None:
            rootLogger.error('HISTORY requested (-k) but SEASON (-s) is not entered')
            sys.exit(1)

        if args['season'] not in cmn.valid_seasons:
            rootLogger.error('Not a valid SEASON (-s) => {0}'.format(args['season']))
            sys.exit(1)

        if args['season_type'] is None:
            rootLogger.error('HISTORY requested (-k) but SEASON_TYPE (-p) is not entered')
            sys.exit(1)

        if args['season'] == cmn.current_season:
            rootLogger.error('HISTORY requested (-k) but SEASON (-s) is current season ({0})' \
                             .format(cmn.current_season))
            sys.exit(1)

        if args['teams'] is None:
            rootLogger.warn('Team list is not entered. Extracting all teams')

    else:  # extracting data from current season
        rootLogger.info('Extracting current season {0}.'.format(cmn.current_season))
        rootLogger.info('GAME_SCHEDULE table will be used to get the games after LSET.')
        rootLogger.info('LSET will be retrieved from JOB table for JOB_NAME={0}'.format(args['name']))

        if args['season'] is not None and args['season'] != cmn.current_season:
            rootLogger.error('CURRENT_SEASON requested but SEASON (-s) is entered:{0}'.format(args['season']))
            sys.exit(1)

        if args['season'] is not None and args['season'] == cmn.current_season:
            rootLogger.warn('CURRENT_SEASON requested but SEASON (-s) entered ({0}) is already CURRENT_SEASON'. \
                            format(args['season']))

        if args['teams'] is not None:
            rootLogger.warn('Team list is not necessary. Team list will be retrieved from the games after LSET')

    rootLogger.info('Completed checking imput parameters. Everything looks good')


def start_job_run(p_job_id, p_job_name, p_job_run_start_dtm, p_job_run_params):
    job_cur = conn.cursor()

    l_job_status_cd = 'RUN'
    if g_manual:
        l_job_status_cd = 'MNL'

    sql = "INSERT INTO job.job_run " \
          "(job_id, job_name, job_run_start_dtm, job_status_cd, job_run_params) " \
          "VALUES " \
          "(%s, %s, %s, %s, %s) " \
          "RETURNING job_run_id"
    rootLogger.debug('start_job_run SQL => {0}'.format(sql))
    job_cur.execute(sql, (p_job_id, p_job_name, p_job_run_start_dtm, l_job_status_cd, p_job_run_params))
    job_run_id = job_cur.fetchone()[0]
    rootLogger.info('Retrieved JOB_RUN_ID => {0}'.format(job_run_id))
    conn.commit()
    return job_run_id


def start_job_detail_run(p_job_id, p_job_detail_id, p_job_run_id, p_job_name, p_job_detail_name,
                         p_job_detail_run_params):
    job_detail_cur = conn.cursor()

    l_job_status_cd = 'RUN'
    if g_manual:
        l_job_status_cd = 'MNL'

    sql = "INSERT INTO job.job_detail_run" \
          "(job_run_id, job_id, job_detail_id, job_name, job_detail_name, " \
          " job_detail_run_start_dtm, job_status_cd, job_detail_run_params) " \
          "VALUES (%s, %s, %s, %s, %s, %s, %s, %s) " \
          "RETURNING job_detail_run_id "
    rootLogger.debug('start_job_detail_run SQL => {0}'.format(sql))
    job_detail_run_id = job_detail_cur.execute(sql, \
                                               (p_job_run_id, p_job_id, p_job_detail_id, p_job_name, p_job_detail_name, \
                                                cmn.now(), l_job_status_cd, p_job_detail_run_params))
    job_detail_run_id = job_detail_cur.fetchone()[0]
    rootLogger.info('Retrieved JOB_DETAIL_RUN_ID => {0}'.format(job_detail_run_id))
    conn.commit()
    return job_detail_run_id


def end_job_run(p_job_id, p_job_run_id, p_job_status_cd):
    job_cur = conn.cursor()
    l_job_status_cd = p_job_status_cd
    if g_manual:
        l_job_status_cd = 'MNL'

    # update job_run end_dtm and SUCCESS or FAIL
    rootLogger.info('Ending job_run_id=>{0} with {1} status'.format(p_job_run_id, l_job_status_cd))
    sql = "UPDATE job.job_run " \
          "   SET job_run_end_dtm = %s, " \
          "       job_status_cd = %s " \
          " WHERE job_run_id = %s "
    try:
        job_cur.execute(sql, (cmn.now(), l_job_status_cd, p_job_run_id))
        rootLogger.debug('end_job_run SQL => {0}'.format(job_cur.query))
        rootLogger.info('job_run_id=>{0} updated'.format(p_job_run_id))
    except Exception as e:
        rootLogger.error('Error ending job run', exc_info=True)

    # update JOB table LSET for successful execution if season is current season and not manual execution
    if p_job_status_cd == 'DNE' and g_season == cmn.current_season and not g_manual:
        rootLogger.info('Request was current season. Now updating LSET {0} for JOB job_id => {1}'. \
                        format(dt_str, p_job_id))
        sql = "UPDATE job.job " \
              "   SET lset = %s " \
              " WHERE job_id = %s "
        try:
            job_cur.execute(sql, (dt_str, p_job_id))
        except Exception as e:
            rootLogger.error('Error updating LSET')

        rootLogger.info('end_job_run SQL => {0}'.format(job_cur.query))
    conn.commit()


def end_job_detail_run(p_job_detail_run_id, p_job_status_cd):
    job_detail_cur = conn.cursor()
    l_job_status_cd = p_job_status_cd
    if g_manual:
        l_job_status_cd = 'MNL'

    rootLogger.info('Ending job_detail_run_id=>{0} with {1} status'.format(job_detail_run_id, l_job_status_cd))
    sql = "UPDATE job.job_detail_run " \
          "   SET job_detail_run_end_dtm = %s, " \
          "       job_status_cd = %s " \
          " WHERE job_detail_run_id = %s "

    try:
        job_detail_cur.execute(sql, (cmn.dt(datetime.datetime.now()), l_job_status_cd, p_job_detail_run_id))
        rootLogger.debug('end_job_detail_run SQL => {0}'.format(job_detail_cur.query))
    except Exception as e:
        rootLogger.error('Error ending job detail run', exc_info=True)

    conn.commit()


def get_job_details(p_job_name):
    sql = "SELECT j.job_id, jd.job_detail_id, j.job_name, jd.job_detail_name " + \
          "  FROM  job.job j " + \
          "    INNER JOIN job.job_detail jd ON ( j.job_id = jd.job_id ) " + \
          " WHERE j.job_name = '{0}'".format(p_job_name)

    rootLogger.debug('JOB DETAIL SQL => ${0}'.format(sql))
    try:
        cur = conn.cursor()
        cur.execute(sql)
        jd = cur.fetchall()
        rootLogger.debug('Fetched job detail records: {0}'.format(jd))
    except Exception as e:
        rootLogger.error('Error getting job detail records:', exc_info=True)

    return jd


def get_job(p_job_name):
    sql = "SELECT j.job_id, j.job_name, j.lset" + \
          "  FROM  job.job j " + \
          " WHERE j.job_name = '{0}'".format(p_job_name)
    rootLogger.debug('JOB SQL => ${0}'.format(sql))
    try:
        cur = conn.cursor()
        cur.execute(sql)
        j = cur.fetchone()
        rootLogger.debug('Fetched job record: {0}'.format(j))
    except Exception as e:
        rootLogger.error('Error getting job record:', exc_info=True)

    return j


def get_teams(p_history, p_teams, p_job_lset):
    sql = "SELECT DISTINCT t.team_name, t.team_key, t.team_abbrv, t.team_id " \
          "  FROM lnd.teams t"

    if p_history and p_teams is not None:  # team list entered in command line w/ history
        team_list = str()
        t = p_teams.split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"

        sql = sql + " WHERE t.team_abbrv IN ({0})".format(team_list[:-1])

    if p_history and p_teams is None:  # team list is not entered. getting all the teams stas historically
        sql = sql + " WHERE 1=1"  # All teams

    if not p_history:  # current season based on LSET
        lst_sql = "SELECT lnd.get_schedule_team_list('{0}')".format(cmn.dt(p_job_lset))
        cur = conn.cursor()
        cur.execute(lst_sql)
        lst = cur.fetchone()[0]
        if len(lst) > 0:
            sql = sql + " WHERE team_abbrv IN ({0})".format(lst)
            rootLogger.info("Team schedule is used based on LSET => ({0}). " \
                            "List of teams to pull => {1}".format(p_job_lset, lst))
        else:
            rootLogger.info("No game found based on LSET => {0}".format(p_job_lset))
            return None
    try:
        cur = conn.cursor()
        cur.execute(sql)
        rootLogger.debug(cur.query)
        t = cur.fetchall()
        return t
    except Exception as e:
        rootLogger.error('Error getting TEAM records:', exc_info=True)
        sys.exit(1)


def get_players(p_history, p_teams, p_season):
    team_list = str()
    for team in p_teams:
        team_list = team_list + "'" + team[2] + "',"

    sql = "SELECT DISTINCT player, player_id, season, t.team_abbrv " \
          "  FROM lnd.players p " \
          "   INNER JOIN lnd.teams t ON ( p.teamid = t.team_id ) " \
          " WHERE t.team_abbrv IN ({0}) " \
          "   AND p.season = '{1}' " \
          " ORDER BY player ".format(team_list[:-1], p_season.split('-')[0])

    rootLogger.debug(sql)

    try:
        cur = conn.cursor()
        cur.execute(sql)
        rootLogger.debug(cur.query)
        p = cur.fetchall()
        return p
    except Exception as e:
        rootLogger.error('Error getting PLAYER records:', exc_info=True)
        sys.exit(1)


def get_games(p_history, p_teams, p_job_lset):
    sql = "SELECT DISTINCT g.game_id, g.matchup, g.game_date " \
          "  FROM lnd.vw_games g " \
          "    INNER JOIN lnd.teams t ON ( g.team_id = t.team_id ) " \
          " WHERE g.season = '{0}'" \
          "   AND matchup LIKE '%@%' ".format(g_season)

    if p_history and p_teams is not None:  # team list entered in command line w/ history
        team_list = str()
        for team in p_teams:
            team_list = team_list + "'" + team[2] + "',"

        sql = sql + " AND t.team_abbrv IN ({0})".format(team_list[:-1])

    if p_history and p_teams is None:  # team list is not entered. getting all the teams stas historically
        sql = sql + " AND 1=1 "  # All teams

    if not p_history:  # current season based on LSET
        sql = sql + "   AND g.game_date BETWEEN '{0}' and (now() - interval '1 day') ".format(p_job_lset)

    sql = sql + ' ORDER by g.game_date '
    try:
        cur = conn.cursor()
        cur.execute(sql)
        rootLogger.debug(cur.query)
        g = cur.fetchall()
        return g
    except Exception as e:
        rootLogger.error('Error getting GAME records:', exc_info=True)
        sys.exit(1)


def get_measures(p_job_name, p_job_detail_name):
    sql = "SELECT measure_seq, measure_type, measure_api, measure_url, jm.job_detail_name, jm.active_flag " \
          "  FROM job.job_detail jd " \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " \
          "  WHERE jd.job_name = %s " \
          "    AND jm.job_detail_name = %s " \
          "  ORDER BY order_seq "
    try:
        cur = conn.cursor()
        cur.execute(sql, (p_job_name, p_job_detail_name))
        rootLogger.debug(cur.query)
        m = cur.fetchall()
        return m
    except Exception as e:
        rootLogger.error('Error getting MEASURE records:', exc_info=True)


####################################################################################
# M A I N  M O D U L E
####################################################################################

# Database
conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")

# Logging
# ===================================================
rootLogger = logging.getLogger('job_run')
rootLogger.setLevel(logging.DEBUG)
# create file handler which logs even debug messages
fh = logging.FileHandler("{0}job_run.log".format(cmn.log_folder))
fh.setLevel(logging.DEBUG)
# create console handler with a higher log level
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
ch.setFormatter(formatter)
fh.setFormatter(formatter)
# add the handlers to logger
rootLogger.addHandler(ch)
rootLogger.addHandler(fh)

# Current date and time converted to standard string
dt_str = cmn.now()

parser = argparse.ArgumentParser(description='Executes job and job details')
parser.add_argument('-n', '--name', help='Job name (NOT Job detail).', required=True)
parser.add_argument('-k', '--history', help='Extract earlier seasons.', action='store_true')
parser.add_argument('-s', '--season', help='NBA season (e.g. 2014-15)', required=False)
parser.add_argument('-t', '--teams', help='Comma separated list of team abbrv', required=False)
parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)')
parser.add_argument('-m', '--manual', help='Manually run single job or job detail', required=False, action='store_true')
args = vars(parser.parse_args())

# Verify sanity and compatibility of all the arguments
check_args(args)

rootLogger.info('Getting master job record using name argument (-n) entered')
job = get_job(args['name'])
rootLogger.debug('Job record: {0}'.format(job))

# Set the global variables
g_job_name = args['name']
g_job_id = job[0]
g_job_name = args['name']
g_season = args['season']
g_season_type = cmn.season_type_dict[args['season_type']]
g_teams = args['teams']
g_history = args['history']
g_manual = args['manual']

if not g_history:
    g_season = cmn.current_season

if g_manual:
    g_job_lset = datetime.datetime(1900, 1, 1, 12, 00, 00, 00)
else:
    g_job_lset = job[2]
# JOB hasn't been run ever, if LSET is not set in JOB record
if g_job_lset is None and not g_manual:
    g_job_lset = datetime.date(1900, 1, 1)
    rootLogger.warn('JOB hasn''t been run ever. LSET is not set in JOB record using LSET =>{0}'.format(g_job_lset))

if g_manual:
    rootLogger.warn(
        'Manual job run requested. JOB table''s LSET won''t be updated and current LSET set to {0}'.format(g_job_lset))

# Now we need to get the list of teams to be processed either from argument (-t) or LSET
rootLogger.info('Global variables. g_job_id: {0}, g_job_name: {1}, g_job_lset: {2}, ' \
                'g_season: {3}, g_season_type: {4}, g_manual: {5}'. \
                format(g_job_id, g_job_name, g_job_lset, g_season, g_season_type, g_manual))

rootLogger.info("Starting JOB {0} ({1}) LSET => {2}".format(g_job_name, g_job_id, g_job_lset))
try:
    # start job_run record
    command_line_received = " ".join(sys.argv[0:])
    job_run_id = start_job_run(g_job_id, g_job_name, dt_str, command_line_received)
except pg.Error as e:
    rootLogger.error("Can't start job. INSERT job_run failed", exc_info=True)
    sys.exit(1)
except Exception as e:
    rootLogger.error("Can't start job. INSERT job_run failed", exc_info=True)
    rootLogger.error('Ending job with FLD status')
    end_job_run(job_run_id, 'FLD')
    sys.exit(1)

teams = get_teams(g_history, g_teams, g_job_lset)
if teams is None and not g_history:
    rootLogger.warn(
        'TEAMS => Current season is requested but there was no game played since LSET {0}'.format(g_job_lset))
    rootLogger.warn('Nothing to do. Exiting the job {0} with Did Not Run (DNR)'.format(g_job_name))
    end_job_run(g_job_id, job_run_id, 'DNR')
    sys.exit(0)

rootLogger.debug('List of teams to be used: {0}'.format(teams))

players = get_players(g_history, teams, g_season)
if g_job_name == 'players' and len(players) == 0:
    rootLogger.warn(
        'PLAYERS => No players selected either b/c no game played since LSET {0}'.format(g_job_lset))
    rootLogger.warn('Nothing to do. Exiting the job {0} with Did Not Run (DNR)'.format(g_job_name))
    end_job_run(g_job_id, job_run_id, 'DNR')
    sys.exit(0)

games = get_games(g_history, teams, g_job_lset)
if g_job_name == 'games' and len(games) == 0:
    rootLogger.warn(
        'GAMES => No games selected either b/c no game played since LSET {0} '
        'or games of requested season {1} is not loaded'.format(g_job_lset, g_season))
    rootLogger.warn('Nothing to do. Exiting the job {0} with Did Not Run (DNR)'.format(g_job_name))
    end_job_run(g_job_id, job_run_id, 'DNR')
    sys.exit(0)

rootLogger.debug('List of games to be used: {0}'.format(games))

# get the job_detail records
job_details = get_job_details(g_job_name)
rootLogger.debug('JOB_DETAIL records: {0}'.format(job_details))

# for each child job_detail record for a job, start a command line
rootLogger.info('Starting job detail iteration')
for job_detail in job_details:
    job_detail_id = job_detail[1]
    job_detail_name = job_detail[3]
    rootLogger.info('================Start job detail run================')
    rootLogger.info('Starting job detail: {0} ({1})'.format(job_detail_name, job_detail_id))
    rootLogger.info('Getting measure records: {0}/{1}'.format(g_job_name, job_detail_name))
    measures = get_measures(g_job_name, job_detail_name)
    rootLogger.debug('Measures retrieved: {0}'.format(measures))

    # start job_detail_run record
    rootLogger.info("Starting JOB_DETAIL {0} ({1}) ".format(job_detail_name, job_detail_id))
    job_detail_run_id = start_job_detail_run(g_job_id, job_detail_id, job_run_id, \
                                             g_job_name, job_detail_name, 'PUT PARAMS VARIABLE HERE')

    try:
        if g_job_name == 'get_team_roster':
            mGetTeamRoster.main(measures, teams, players, g_season, g_season_type, dt_str)
        if g_job_name == 'get_games':
            mGetGames.main(measures, teams, g_season, g_season_type, dt_str)
        if g_job_name == 'teams':
            mTeams.main(measures, teams, g_season, g_season_type, dt_str)
        if g_job_name == 'players':
            mPlayers.main(measures, teams, players, g_season, g_season_type, dt_str)
        if g_job_name == 'games':
            mGames.main(measures, teams, games, g_season, g_season_type, dt_str)


    except Exception as e:
        end_job_run(g_job_id, job_run_id, 'FLD')
        end_job_detail_run(job_detail_run_id, 'FLD')
        rootLogger.error('Error processing team module', exc_info=True)
        sys.exit(1)
        # job_detail_run successful. End the job_detail_run record with success
    end_job_detail_run(job_detail_run_id, 'DNE')
    rootLogger.info('================End job detail run==================')
# job_run successful. End the job_run record with success
end_job_run(g_job_id, job_run_id, 'DNE')
