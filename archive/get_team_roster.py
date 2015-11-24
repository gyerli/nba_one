import csv
import json
import pandas as pd
import requests
import psycopg2 as pg
import sys
import argparse
import datetime
from importlib.machinery import SourceFileLoader

dt = SourceFileLoader('dt','/home/gursoy/work/nba/lib/dt.py').load_module()

dt_str = dt.dt(datetime.datetime.now())

teams = list()
season = str()


def pull_coaches(measure_url):

    _df_coach = pd.DataFrame()
    for team in teams:
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        # print(base_url)
        print(team[0])
        response = requests.get(base_url)
        data = json.loads(response.text)

        coach_header = data['resultSets'][1]['headers']
        coach_data = data['resultSets'][1]['rowSet']

        df_coach = pd.DataFrame(coach_data, columns=coach_header)
        df_coach['TeamID'] = team[3]

        _df_coach = _df_coach.append(df_coach)

    _df_coach.to_csv('./data/coaches_' + dt_str + '.' + season + '.dat', sep='|')


def pull_players(measure_url):

    _df_player = pd.DataFrame()

    for team in teams:
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print(team[0])
        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['TeamID'] = team[3]

        _df_player = _df_player.append(df_player)

    _df_player.to_csv('./data/players_' + dt_str + '.' + season + '.dat', sep='|')


def sql_team(args):
    team_list = ''
    sql = "SELECT team_name, team_key, team_abbrv, team_id " + \
          "  FROM lnd.teams t "

    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + "WHERE team_abbrv in (" + team_list[:-1] + ")"
    # print(sql)

    return sql

def sql_measure(args):

    sql = "SELECT measure_seq, measure_type, measure_api, measure_url " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          " WHERE jd.job_name = 'get_team_roster' "

    if args['name'] is not None:
        sql = sql + "  AND jd.job_detail_name = '" + args['name'] + "'"

    # print(sql)
    return sql


def main():
    global teams
    global season

    parser = argparse.ArgumentParser(
        description='Extracts player information from nba.com using teams roster')
    parser.add_argument('-n','--name', help='Job detail name.', required=False)
    parser.add_argument('-s','--season', help='NBA season (e.g. 2014-15)', required=False, default='2015-16')
    parser.add_argument('-t', '--teams', help='Comma separated list of team abbrv', required=False)
    # Season type is not used in this job. Added this option just to run from job_run.py.
    # Need to add a column to job_detail table to code available parameters for each job_detail
    parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)',
                        required=False, default='R')
    # LSET for this job should be ignored as of 11/03/2015
    parser.add_argument('-d', '--lset', help='LSET of parent job', required=False)
    args = vars(parser.parse_args())

    season = args['season']
    # print(season)

    conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")
    cur = conn.cursor()

    cur.execute(sql_team(args))
    teams = cur.fetchall()

    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    for measure in measures:
        measure_url = measure[3]
        measure_seq = measure[0]

        #print('url => ' + measure_url )
        #print('seq => ' + str(measure_seq))


        if measure_seq == 1:
            pull_players(measure_url)
        elif measure_seq == 2:
            pull_coaches(measure_url)
        else:
            print('Error:No measure stat found => ' + str(measure_seq))

    conn.close()
    sys.exit()

if __name__ == "__main__":
    main()
