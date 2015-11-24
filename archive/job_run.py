import psycopg2 as pg
import argparse
import sys
from subprocess import call
import datetime
import time
from importlib.machinery import SourceFileLoader

valid_job_names = ['teams', 'players', 'games', 'get_team_roster', 'get_games', 'get_schedule']
valid_seasons = ['2015-16', '2014-15', '2013-14', '2012-13', '2011-12', '2010-11', '2009-10', '2008-09',
                 '2007-08', '2006-07', '2005-06']
valid_season_types = ['P', 'R', 'O']

dt = SourceFileLoader('dt', '/home/gursoy/work/nba/lib/dt.py').load_module()
common = SourceFileLoader('dt','/home/gursoy/work/nba/lib/common.py').load_module()

dt_str = dt.dt(datetime.datetime.now())
nba_home = '/home/gursoy/work/nba/'

season = str()
job_id = int()
job_run_id = int()
job_lset = datetime.time(0, 0, 0)

conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")


def start_job_run(p_job_id, p_job_name, p_job_run_start_dtm, p_job_run_params):
    job_cur = conn.cursor()
    sql = "INSERT INTO job.job_run " \
          "(job_id, job_name, job_run_start_dtm, job_status_cd, job_run_params) " \
          "VALUES " \
          "(%s, %s, %s, %s, %s) " \
          "RETURNING job_run_id"

    job_cur.execute(sql, (p_job_id, p_job_name, p_job_run_start_dtm, 'RUN', p_job_run_params))
    job_run_id = job_cur.fetchone()[0]
    conn.commit()
    return job_run_id


def start_job_detail_run(p_job_id, p_job_detail_id, p_job_run_id, p_job_name, p_job_detail_name,
                         p_job_detail_run_params):
    job_detail_cur = conn.cursor()
    sql = "INSERT INTO job.job_detail_run" \
          "(job_run_id, job_id, job_detail_id, job_name, job_detail_name, " \
          " job_detail_run_start_dtm, job_status_cd, job_detail_run_params) " \
          "VALUES (%s, %s, %s, %s, %s, %s, %s, %s) " \
          "RETURNING job_detail_run_id "
    job_detail_run_id = job_detail_cur.execute(sql,
                                               (p_job_run_id, p_job_id, p_job_detail_id, p_job_name, p_job_detail_name, \
                                                dt.dt(datetime.datetime.now()), 'RUN', p_job_detail_run_params))
    job_detail_run_id = job_detail_cur.fetchone()[0]
    conn.commit()
    return job_detail_run_id


def end_job_run(p_job_id, p_job_run_id, p_job_status_cd):
    job_cur = conn.cursor()
    # update job_run end_dtm and SUCCESS or FAIL
    sql = "UPDATE job.job_run " \
          "   SET job_run_end_dtm = %s, " \
          "       job_status_cd = %s " \
          " WHERE job_run_id = %s "
    job_cur.execute(sql, (dt.dt(datetime.datetime.now()), p_job_status_cd, p_job_run_id))

    # update JOB table LSET for successful execution if season is current season
    if p_job_status_cd == 'DNE' and season == current_season:
        sql = "UPDATE job.job " \
              "   SET lset = %s " \
              " WHERE job_id = %s "
        job_cur.execute(sql, (dt_str, p_job_id))
    conn.commit()


def end_job_detail_run(p_job_detail_run_id, p_job_status_cd):
    job_detail_cur = conn.cursor()
    sql = "UPDATE job.job_detail_run " \
          "   SET job_detail_run_end_dtm = %s, " \
          "       job_status_cd = %s " \
          " WHERE job_detail_run_id = %s "
    job_detail_cur.execute(sql, (dt.dt(datetime.datetime.now()), p_job_status_cd, p_job_detail_run_id))
    conn.commit()


def sql_job_detail(args):
    sql = "SELECT j.job_id, jd.job_detail_id, j.job_name, jd.job_detail_name " + \
          "  FROM  job.job j " + \
          "    INNER JOIN job.job_detail jd ON ( j.job_id = jd.job_id ) " + \
          " WHERE j.job_name = '" + args['name'] + "'"
    # print(sql)
    return (sql)


def sql_job(args):
    sql = "SELECT j.job_id, j.job_name, j.lset" + \
          "  FROM  job.job j " + \
          " WHERE j.job_name = '" + args['name'] + "'"
    # print(sql)
    return (sql)


def main():
    global job_id
    global job_run_id
    global season

    parser = argparse.ArgumentParser(description='Executes job and job details')
    parser.add_argument('-n', '--name', help='Job name (NOT Job detail).', required=True)
    parser.add_argument('-s', '--season', help='NBA season (e.g. 2014-15)', required=False, \
                         default=common.current_season)
    parser.add_argument('-t', '--teams', help='Comma separated list of team abbrv', required=False)
    parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)',
                         required=False, default='R')
    args = vars(parser.parse_args())

    name = args['name']
    if name not in valid_job_names:
        print('Not a valid job name => ' + args['name'])
        sys.exit()

    season = args['season']

    if season not in valid_seasons:
        print('Not a valid season => ' + args['season'])
        sys.exit()

    season_type = args['season_type']

    if season_type not in valid_season_types:
        print('Incorrect season type => ' + season_type)
        sys.exit(1)

    # get the parent job record
    cur = conn.cursor()
    cur.execute(sql_job(args))
    job = cur.fetchone()

    job_id = job[0]
    job_name = job[1]
    job_lset = job[2]

    if job_lset is None:
        job_lset = datetime.date(1900, 1, 1)

    print("Starting JOB {0} ({1}) LSET => {2} <=========================================". \
          format(job_name, job_id, job_lset))
    try:
        # start job_run record
        job_run_id = start_job_run(job_id, job_name, dt_str, " ".join(sys.argv[0:]))
    except pg.Error as e:
        print("Can't start job. INSERT job_run failed")
        print(e)
        sys.exit(1)
    except Exception as e:
        end_job_run(job_run_id, 'FLD')
        print(e)
        sys.exit(1)

    # get the job_detail records
    cur.execute(sql_job_detail(args))
    job_details = cur.fetchall()

    # for each child job_detail record for a job, start a command line
    for job_detail in job_details:

        job_detail_id = job_detail[1]
        job_detail_name = job_detail[3]

        cmd = 'python ' + nba_home + name + '.py ' + '-n ' + job_detail_name

        if season is not None:
            cmd = cmd + ' -s ' + season

        if args['teams'] is not None:
            cmd = cmd + ' -t ' + args['teams']

        if season_type is not None:
            cmd = cmd + ' -p ' + season_type

        # Add job's LSET date to parameter list with -d option
        #print(job_lset)
        #print(dt.dt(job_lset))
        cmd = cmd + ' -d ' + dt.dt(job_lset)
        print(cmd)

        print("Starting JOB_DETAIL {0} ({1}) <==========================". \
               format(job_detail_name, job_detail_id))
        # start job_detail_run record
        job_detail_run_id = start_job_detail_run(job_id, job_detail_id, job_run_id, job_name, job_detail_name, cmd)
        try:
            call(cmd, shell=True)
            # print('Not running jobs now... Testing logging functionality')
        except Exception as e:
            # if anything happend fail both job_run and job_detail_run
            end_job_run(job_id, job_run_id, 'FLD')
            end_job_detail_run(job_detail_run_id, 'FLD')
            print(e)
            sys.exit(1)
        # job_detail_run successful. End the job_detail_run record with success
        end_job_detail_run(job_detail_run_id, 'DNE')
    # job_run successful. End the job_run record with success
    end_job_run(job_id, job_run_id, 'DNE')

    conn.close()


if __name__ == "__main__":
    main()
