import json
import pandas as pd
import requests
import psycopg2 as pg
import sys
import argparse
import datetime
from importlib.machinery import SourceFileLoader

dt = SourceFileLoader('dt','/home/gursoy/work/nba/lib/dt.py').load_module()

teams = list()
games = list()
season = str()
season_type = str()
job_detail_name = str()

dt_str = dt.dt(datetime.datetime.now())

def pull_game_player_trck_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_trck_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_trck_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_four_factor_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)


        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_four_factor_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_four_factor_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_usage_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/'+ job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)


        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_usage_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_usage_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_scoring_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/'+ job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_scoring_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_scoring_stat_' + dt_str + '.' + season + '.dat', sep='|')

def pull_game_misc_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/'+ job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_misc_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_misc_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_box_score_adv(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)

    _df_player.to_csv('./data/game_player_adv_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_adv_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_box_score(measure_api, measure_url):

    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()
    _df_starter_bench = pd.DataFrame()

    for game in games:

        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        # print(base_url)
        print( str(game[0]) + '/' + game[2] + '/'+ job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        team_header = data['resultSets'][1]['headers']
        team_data = data['resultSets'][1]['rowSet']

        starter_bench_header = data['resultSets'][2]['headers']
        starter_bench_data = data['resultSets'][2]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season'] = season
        df_player['season_type'] = season_type

        df_team = pd.DataFrame(team_data, columns=team_header)
        df_team['season'] = season
        df_team['season_type'] = season_type

        df_starter_bench = pd.DataFrame(starter_bench_data, columns=starter_bench_header)
        df_starter_bench['season'] = season
        df_starter_bench['season_type'] = season_type


        _df_player = _df_player.append(df_player)
        _df_team = _df_team.append(df_team)
        _df_starter_bench = _df_starter_bench.append(df_starter_bench)

    _df_player.to_csv('./data/game_player_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv('./data/game_team_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_starter_bench.to_csv('./data/game_starter_bench_' + dt_str + '.' + season + '.dat', sep='|')

def sql_measure(args):
    sql = "SELECT measure_seq, measure_type, measure_api, measure_url, jm.job_detail_name " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          "  WHERE jd.job_name = 'games'"

    if args['name'] is not None:
        sql = sql + " AND jm.job_detail_name = '" + args['name'] + "'"

    sql = sql + " ORDER BY order_seq asc"
    # print(sql)
    return sql


def sql_team(args):
    team_list = ''
    sql = "SELECT team_name, team_key, team_abbrv, team_id " + \
          "  FROM lnd.teams t "

    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + " WHERE team_abbrv in (" + team_list[:-1] + ")"

    # print(sql)
    return sql

def sql_game(args):
    team_list = ''
    sql = "SELECT g.game_id, g.team_id, g.matchup " + \
          "  FROM lnd.games g " + \
          "   INNER JOIN lnd.teams t ON ( g.team_id = t.team_id ) " + \
          " WHERE 1=1"

    if season is not None:
        sql = sql + " AND g.season = '" + args['season'] + "'"

    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + " AND team_abbrv in (" + team_list[:-1] + ")"

    # print(sql)
    return sql


def main():

    global teams
    global games
    global season
    global season_type
    global job_detail_name

    parser = argparse.ArgumentParser(
        description='Extracts game statistics from nba.com')
    parser.add_argument('-n', '--name', help='Job detail name.', required=False)
    parser.add_argument('-s', '--season', help='NBA season (e.g. 2014-15)', required=False, default='2015-16')
    parser.add_argument('-t', '--teams', help='Comma separated list of team abbrv', required=False)
    parser.add_argument('-p', '--season_type', help='Season type (P=>Pre Season, R=>Regular Season, O=>Playoffs)',
                        required=False, default='R')
    args = vars(parser.parse_args())

    season = args['season']

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

    # Get the teams from the database
    cur.execute(sql_team(args))
    teams = cur.fetchall()

    # get the measures from the database
    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    cur.execute(sql_game(args))
    games = cur.fetchall()

    for measure in measures:
        measure_api = measure[2]
        measure_stat = measure[0]
        measure_url = measure[3]
        job_detail_name = measure[4]

        # print(measure_stat)

        if measure_stat == 1:
            pull_game_box_score(measure_api, measure_url)
        elif measure_stat == 2:
            pull_game_box_score_adv(measure_api, measure_url)
        elif measure_stat == 3:
            pull_game_misc_stat(measure_api, measure_url)
        elif measure_stat == 4:
            pull_game_scoring_stat(measure_api, measure_url)
        elif measure_stat == 5:
            pull_game_usage_stat(measure_api, measure_url)
        elif measure_stat == 6:
            pull_game_four_factor_stat(measure_api, measure_url)
        elif measure_stat == 7:
            pull_game_player_trck_stat(measure_api, measure_url)
        else:
            print('Error:No measure stat found')


if __name__ == "__main__":
    main()
