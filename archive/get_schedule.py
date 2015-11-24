import json
import pandas as pd
import requests
import psycopg2 as pg
import sys
import argparse
import datetime
from datetime import timedelta, date
from importlib.machinery import SourceFileLoader

dt = SourceFileLoader('dt','/home/gursoy/work/nba/lib/dt.py').load_module()

dt_str = dt.dt(datetime.datetime.now())


season = str()
season_type = str()

def pull_schedule(dt, url):

    _df_game = pd.DataFrame()

    start_date = dt[0]
    end_date = dt[1]

    print(start_date)
    print(end_date)

    delta = datetime.timedelta(days=1)
    while start_date <= end_date:
        base_url = url.replace('^date^', start_date.strftime("%Y%m%d"))
        print(base_url)
        print('Getting games for the date => ' + start_date.strftime("%Y%m%d"))
        response = requests.get(base_url)
        if response.status_code == 404:
            print('No game found on => ' + start_date.strftime("%Y%m%d"))
            start_date += delta
            continue

        data = json.loads(response.text)

        game_date = data['dt']
        games = data['games']

        for game in games:
            game_id = game['gid']
            game_url = game['game_url']
            away_team_id = game['teams'][0]['id']
            home_team_id = game['teams'][1]['id']
            away_team_abbrv = game['teams'][0]['awayTeam']
            home_team_abbrv = game['teams'][1]['homeTeam']

            df_game = pd.DataFrame(
                {'game_id' : [game_id],
                 'game_date' : [game_date],
                 'game_url' : [game_url],
                 'away_team_id' : [away_team_id],
                 'away_team_abbrv' : [away_team_abbrv],
                 'home_team_id' : [home_team_id],
                 'home_team_abbrv' : [home_team_abbrv],
                 'season' : [season],
                 'season_type' : [season_type]
                 })

            _df_game = _df_game.append(df_game)

        start_date += delta



    _df_game.to_csv('/home/gursoy/work/nba/game_schedule_' + season + '.dat', sep='|')


def sql_measure(args):
    sql = "SELECT measure_seq, measure_type, measure_api, measure_url, jm.job_detail_name " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          "  WHERE jd.job_name = 'get_schedule'"

    sql = sql + " ORDER BY order_seq asc "
    print(sql)
    return sql


def sql_start_end(args):
    sql = "SELECT start_date, end_date " + \
          "  FROM lnd.season_start_end " + \
          " WHERE season = '" + args['season'] + "'" + \
          "   AND season_type = '" + args['season_type'] + "'"

    return sql


def main():

    parser = argparse.ArgumentParser(description='Extract past and future scheduled NBA games')
    parser.add_argument('-n', '--name', help='Job detail name.', required=False)
    parser.add_argument('-s', '--season', help='NBA season (e.g. 2014-15)', required=False, default='2015-16')
    parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)',
                        required=False, default='R')
    args = vars(parser.parse_args())

    global season
    global season_type

    season = args['season']

    season_type = args['season_type']

    conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")
    cur = conn.cursor()

    # get the measures from the database
    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    cur.execute(sql_start_end(args))
    dates = cur.fetchone()

    for measure in measures:
        measure_url = measure[3]

        pull_schedule(dates, measure_url)


if __name__ == "__main__":
    main()


# http://data.nba.com/data//json/nbacom/2015/gameline/^date^/games.json
