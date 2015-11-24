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

season = str()
season_type = str()

def pull_games(measure_url):

    _df_game = pd.DataFrame()

    base_url = measure_url.replace('^season^', season)
    base_url = base_url.replace('^season_type^', season_type)


    print(base_url)
    print('Getting game log for the season => ' + season)
    response = requests.get(base_url)
    data = json.loads(response.text)

    game_header = data['resultSets'][0]['headers']
    game_data = data['resultSets'][0]['rowSet']

    df_game = pd.DataFrame(game_data, columns=game_header)
    df_game['season'] = season
    df_game['season_type'] = season_type

    _df_game = _df_game.append(df_game)
    _df_game.to_csv('./data/games_' + dt_str + '.' + season + '.dat', sep='|')


def sql_measure(args):

    sql = "SELECT measure_seq, measure_type, measure_api, measure_url " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          "  WHERE jd.job_detail_name = 'game_log' "

    print(sql)
    return sql


def main():
    global season
    global season_type

    parser = argparse.ArgumentParser(
        description='Extracts game log information from nba.com')
    # ignore job detail name parameter since it has only one job_detail
    parser.add_argument('-n','--name', help='Job detail name.', required=False)
    parser.add_argument('-s','--season', help='NBA season (e.g. 2014-15)', required=False, default='2015-16')
    parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)')
    args = vars(parser.parse_args())

    season = args['season']
    # print(season)

    if args['season_type'] is None:
        season_type = 'R'
    else:
        season_type = args['season_type']

    if season_type == 'P':
        season_type = 'Pre+Season'
    elif season_type == 'R':
        season_type = 'Regular+Season'
    elif season_type == 'O':
        season_type = 'Playoffs'
    else:
        print('Incorrect season type => ' + season_type)
        sys.exit()

    conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")
    cur = conn.cursor()

    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    for measure in measures:
        measure_url = measure[3]
        measure_seq = measure[0]

        #print('url => ' + measure_url )
        #print('seq => ' + str(measure_seq))


        if measure_seq == 1:
            pull_games(measure_url)
        else:
            print('Error:No measure stat found => ' + str(measure_seq))

    conn.close()
    sys.exit()

if __name__ == "__main__":
    main()
