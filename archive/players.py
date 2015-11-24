#!/usr/bin/env python

import json
import pandas as pd
import requests
import psycopg2 as pg
import sys
import argparse
import datetime
from importlib.machinery import SourceFileLoader

dt = SourceFileLoader('dt','/home/gursoy/work/nba/lib/dt.py').load_module()
common = SourceFileLoader('dt','/home/gursoy/work/nba/lib/common.py').load_module()

dt_str = dt.dt(datetime.datetime.now())


teams = list()
players = list()
season = str()
season_type = str()
job_detail_name = str()


def pull_player_defense_log(measure_api, measure_type, measure_url):
    _df_defense = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(player[0] + '/' + season + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        defense_header = data['resultSets'][0]['headers']
        defense_data = data['resultSets'][0]['rowSet']

        df_defense = pd.DataFrame(defense_data, columns=defense_header)
        df_defense['PlayerID'] = player[1]
        df_defense['season'] = season
        df_defense['season_type'] = season_type


        _df_defense = _df_defense.append(df_defense)
        _df_defense = common.df_convert(_df_defense)

    _df_defense.to_csv('./data/player_defense_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_pass_log(measure_api, measure_type, measure_url):
    _df_passes_made = pd.DataFrame()
    _df_passes_rcvd = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(player[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)

        response = requests.get(base_url)
        data = json.loads(response.text)

        passes_made_header = data['resultSets'][0]['headers']
        passes_made_data = data['resultSets'][0]['rowSet']

        passes_rcvd_header = data['resultSets'][1]['headers']
        passes_rcvd_data = data['resultSets'][1]['rowSet']

        df_passes_made = pd.DataFrame(passes_made_data, columns=passes_made_header)
        df_passes_made['PlayerID'] = player[1]
        df_passes_made['season'] = season
        df_passes_made['season_type'] = season_type

        df_passes_rcvd = pd.DataFrame(passes_rcvd_data, columns=passes_rcvd_header)
        df_passes_rcvd['PlayerID'] = player[1]
        df_passes_rcvd['season'] = season
        df_passes_rcvd['season_type'] = season_type

        _df_passes_made = _df_passes_made.append(df_passes_made)
        _df_passes_rcvd = _df_passes_rcvd.append(df_passes_rcvd)

        _df_passes_made = common.df_convert(_df_passes_made)
        _df_passes_rcvd = common.df_convert(_df_passes_rcvd)

    _df_passes_made.to_csv('./data/player_passes_made_' + dt_str + '.' + season + '.dat', sep='|')
    _df_passes_rcvd.to_csv('./data/player_passes_rcvd_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_reb_log(measure_api, measure_type, measure_url):
    # OverallRebounding
    # ShotTypeRebounding
    # NumContestedRebounding
    # ShotDistanceRebounding
    # RebDistanceRebounding

    _df_overall = pd.DataFrame()
    _df_shot_type = pd.DataFrame()
    _df_num_contested = pd.DataFrame()
    _df_shot_dist = pd.DataFrame()
    _df_reb_dist = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(player[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)

        response = requests.get(base_url)
        data = json.loads(response.text)

        overall_header = data['resultSets'][0]['headers']
        overall_data = data['resultSets'][0]['rowSet']

        shot_type_header = data['resultSets'][1]['headers']
        shot_type_data = data['resultSets'][1]['rowSet']

        num_contested_header = data['resultSets'][2]['headers']
        num_contested_data = data['resultSets'][2]['rowSet']

        shot_dist_header = data['resultSets'][3]['headers']
        shot_dist_data = data['resultSets'][3]['rowSet']

        reb_dist_header = data['resultSets'][4]['headers']
        reb_dist_data = data['resultSets'][4]['rowSet']

        df_overall = pd.DataFrame(overall_data, columns=overall_header)
        df_overall['PlayerID'] = player[1]
        df_overall['season'] = season
        df_overall['season_type'] = season_type

        df_shot_type = pd.DataFrame(shot_type_data, columns=shot_type_header)
        df_shot_type['PlayerID'] = player[1]
        df_shot_type['season'] = season
        df_shot_type['season_type'] = season_type

        df_num_contested = pd.DataFrame(num_contested_data, columns=num_contested_header)
        df_num_contested['PlayerID'] = player[1]
        df_num_contested['season'] = season
        df_num_contested['season_type'] = season_type

        df_shot_dist = pd.DataFrame(shot_dist_data, columns=shot_dist_header)
        df_shot_dist['PlayerID'] = player[1]
        df_shot_dist['season'] = season
        df_shot_dist['season_type'] = season_type

        df_reb_dist = pd.DataFrame(reb_dist_data, columns=reb_dist_header)
        df_reb_dist['PlayerID'] = player[1]
        df_reb_dist['season'] = season
        df_reb_dist['season_type'] = season_type

        _df_overall = _df_overall.append(df_overall)
        _df_shot_type = _df_shot_type.append(df_shot_type)
        _df_num_contested = _df_num_contested.append(df_num_contested)
        _df_shot_dist = _df_shot_dist.append(df_shot_dist)
        _df_reb_dist = _df_reb_dist.append(df_reb_dist)

        _df_overall = common.df_convert(_df_overall)
        _df_shot_type = common.df_convert(_df_shot_type)
        _df_num_contested = common.df_convert(_df_num_contested)
        _df_shot_dist = common.df_convert(_df_shot_dist)
        _df_reb_dist = common.df_convert(_df_reb_dist)

    _df_overall.to_csv('./data/player_reb_log_overall_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_type.to_csv('./data/player_reb_log_shot_type_' + dt_str + '.' + season + '.dat', sep='|')
    _df_num_contested.to_csv('./data/player_reb_log_num_contested_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_dist.to_csv('./data/player_reb_log_shot_dist_' + dt_str + '.' + season + '.dat', sep='|')
    _df_reb_dist.to_csv('./data/player_reb_log_reb_dist_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_shot_log(measure_api, measure_type, measure_url):
    # OverallShooting
    # GeneralShooting
    # ShotClockShooting
    # DribbleShooting
    # ClosestDefenderShooting
    # ClosestDefender10ftPlusShooting
    # TouchTimeShooting

    _df_overall = pd.DataFrame()
    _df_general = pd.DataFrame()
    _df_shot_clock = pd.DataFrame()
    _df_dribble = pd.DataFrame()
    _df_closest_def = pd.DataFrame()
    _df_closest_def_10ft_plus = pd.DataFrame()
    _df_touch_time = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(player[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        overall_header = data['resultSets'][0]['headers']
        overall_data = data['resultSets'][0]['rowSet']

        general_header = data['resultSets'][1]['headers']
        general_data = data['resultSets'][1]['rowSet']

        shot_clock_header = data['resultSets'][2]['headers']
        shot_clock_data = data['resultSets'][2]['rowSet']

        dribble_header = data['resultSets'][3]['headers']
        dribble_data = data['resultSets'][3]['rowSet']

        closest_def_header = data['resultSets'][4]['headers']
        closest_def_data = data['resultSets'][4]['rowSet']

        closest_def_10ft_plus_header = data['resultSets'][5]['headers']
        closest_def_10ft_plus_data = data['resultSets'][5]['rowSet']

        touch_time_header = data['resultSets'][6]['headers']
        touch_time_data = data['resultSets'][6]['rowSet']

        df_overall = pd.DataFrame(overall_data, columns=overall_header)
        df_overall['PlayerID'] = player[1]
        df_overall['season'] = season
        df_overall['season_type'] = season_type

        df_general = pd.DataFrame(general_data, columns=general_header)
        df_general['PlayerID'] = player[1]
        df_general['season'] = season
        df_general['season_type'] = season_type

        df_shot_clock = pd.DataFrame(shot_clock_data, columns=shot_clock_header)
        df_shot_clock['PlayerID'] = player[1]
        df_shot_clock['season'] = season
        df_shot_clock['season_type'] = season_type

        df_dribble = pd.DataFrame(dribble_data, columns=dribble_header)
        df_dribble['PlayerID'] = player[1]
        df_dribble['season'] = season
        df_dribble['season_type'] = season_type

        df_closest_def = pd.DataFrame(closest_def_data, columns=closest_def_header)
        df_closest_def['PlayerID'] = player[1]
        df_closest_def['season'] = season
        df_closest_def['season_type'] = season_type

        df_closest_def_10ft_plus = pd.DataFrame(closest_def_10ft_plus_data, columns=closest_def_10ft_plus_header)
        df_closest_def_10ft_plus['PlayerID'] = player[1]
        df_closest_def_10ft_plus['season'] = season
        df_closest_def_10ft_plus['season_type'] = season_type

        df_touch_time = pd.DataFrame(touch_time_data, columns=touch_time_header)
        df_touch_time['PlayerID'] = player[1]
        df_touch_time['season'] = season
        df_touch_time['season_type'] = season_type

        _df_overall = _df_overall.append(df_overall)
        _df_general = _df_general.append(df_general)
        _df_shot_clock = _df_shot_clock.append(df_shot_clock)
        _df_dribble = _df_dribble.append(df_dribble)
        _df_closest_def = _df_closest_def.append(df_closest_def)
        _df_closest_def_10ft_plus = _df_closest_def_10ft_plus.append(df_closest_def_10ft_plus)
        _df_touch_time = _df_touch_time.append(df_touch_time)

        _df_overall = common.df_convert(_df_overall)
        _df_general = common.df_convert(_df_general)
        _df_shot_clock = common.df_convert(_df_shot_clock)
        _df_dribble = common.df_convert(_df_dribble)
        _df_closest_def = common.df_convert(_df_closest_def)
        _df_closest_def_10ft_plus = common.df_convert(_df_closest_def_10ft_plus)
        _df_touch_time = common.df_convert(_df_touch_time)

    _df_overall.to_csv('./data/player_shot_log_overall_' + dt_str + '.' + season + '.dat', sep='|')
    _df_general.to_csv('./data/player_shot_log_general_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_clock.to_csv('./data/player_shot_log_shot_clock_' + dt_str + '.' + season + '.dat', sep='|')
    _df_dribble.to_csv('./data/player_shot_log_dribble_' + dt_str + '.' + season + '.dat', sep='|')
    _df_closest_def.to_csv('./data/player_shot_log_closest_def_' + dt_str + '.' + season + '.dat', sep='|')
    _df_closest_def_10ft_plus.to_csv('./data/player_shot_trck_closest_def_10ft_plus_'+ dt_str + '.' + season + '.dat', sep='|')
    _df_touch_time.to_csv('./data/player_shot_log_touch_time_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_game_log(measure_api, measure_type, measure_url):
    _df_game_log = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)

        print(player[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)

        response = requests.get(base_url)
        data = json.loads(response.text)

        game_log_header = data['resultSets'][0]['headers']
        game_log_data = data['resultSets'][0]['rowSet']

        df_game_log_data = pd.DataFrame(game_log_data, columns=game_log_header)
        df_game_log_data['PlayerID'] = player[1]
        df_game_log_data['season'] = season
        df_game_log_data['season_type'] = season_type

        _df_game_log = _df_game_log.append(df_game_log_data)
        _df_game_log = common.df_convert(_df_game_log)

    _df_game_log.to_csv('./data/player_game_log_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_stats(measure_api, measure_type, measure_url):
    _df_overall = pd.DataFrame()
    _df_location = pd.DataFrame()
    _df_win_lose = pd.DataFrame()
    _df_month = pd.DataFrame()
    _df_pre_post_allstar = pd.DataFrame()
    _df_days_rest = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)

        print(player[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)

        response = requests.get(base_url)
        data = json.loads(response.text)

        overall_header = data['resultSets'][0]['headers']
        location_header = data['resultSets'][1]['headers']
        win_lose_header = data['resultSets'][2]['headers']
        month_header = data['resultSets'][3]['headers']
        pre_post_allstar_header = data['resultSets'][4]['headers']
        days_rest_header = data['resultSets'][5]['headers']

        overall_data = data['resultSets'][0]['rowSet']
        location_data = data['resultSets'][1]['rowSet']
        win_lose_data = data['resultSets'][2]['rowSet']
        month_data = data['resultSets'][3]['rowSet']
        pre_post_allstar_data = data['resultSets'][4]['rowSet']
        days_rest_data = data['resultSets'][5]['rowSet']

        df_overall_data = pd.DataFrame(overall_data, columns=overall_header)
        df_overall_data['PlayerID'] = player[1]
        df_overall_data['season'] = season
        df_overall_data['season_type'] = season_type

        df_location_data = pd.DataFrame(location_data, columns=location_header)
        df_location_data['PlayerID'] = player[1]
        df_location_data['season'] = season
        df_location_data['season_type'] = season_type

        df_win_lose_data = pd.DataFrame(win_lose_data, columns=win_lose_header)
        df_win_lose_data['PlayerID'] = player[1]
        df_win_lose_data['season'] = season
        df_win_lose_data['season_type'] = season_type

        df_month_data = pd.DataFrame(month_data, columns=month_header)
        df_month_data['PlayerID'] = player[1]
        df_month_data['season'] = season
        df_month_data['season_type'] = season_type

        df_pre_post_allstar_data = pd.DataFrame(pre_post_allstar_data, columns=pre_post_allstar_header)
        df_pre_post_allstar_data['PlayerID'] = player[1]
        df_pre_post_allstar_data['season'] = season
        df_pre_post_allstar_data['season_type'] = season_type

        df_days_rest_data = pd.DataFrame(days_rest_data, columns=days_rest_header)
        df_days_rest_data['PlayerID'] = player[1]
        df_days_rest_data['season'] = season
        df_days_rest_data['season_type'] = season_type

        _df_overall = _df_overall.append(df_overall_data)
        _df_location = _df_location.append(df_location_data)
        _df_win_lose = _df_win_lose.append(df_win_lose_data)
        _df_month = _df_month.append(df_month_data)
        _df_pre_post_allstar = _df_pre_post_allstar.append(df_pre_post_allstar_data)
        _df_days_rest = _df_days_rest.append(df_days_rest_data)

        _df_overall = common.df_convert(_df_overall)
        _df_location = common.df_convert(_df_location)
        _df_win_lose = common.df_convert(_df_win_lose)
        _df_month = common.df_convert(_df_month)
        _df_pre_post_allstar = common.df_convert(_df_pre_post_allstar)
        _df_days_rest = common.df_convert(_df_days_rest)

    _df_overall.to_csv('./data/player_overall_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_location.to_csv('./data/player_location_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_win_lose.to_csv('./data/player_win_lose_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_month.to_csv('./data/player_month_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_pre_post_allstar.to_csv('./data/player_pre_post_allstar_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_days_rest.to_csv('./data/player_days_rest_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def sql_measure(args):
    sql = "SELECT measure_seq, measure_type, measure_api, measure_url, jm.job_detail_name " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          "  WHERE jd.job_name = 'players'"

    if args['name'] is not None:
        sql = sql + " AND jm.job_detail_name = '" + args['name'] + "'"

    sql = sql + " ORDER BY order_seq asc "
    print(sql)
    return sql


def sql_team(args):
    team_list = ''
    sql = "SELECT team_name, team_key, team_abbrv, team_id " + \
          "  FROM lnd.teams t "

    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + "WHERE team_abbrv in (" + team_list[:-1] + ")"

    print(sql)
    return sql


def sql_player(args):
    team_list = ''
    sql = "SELECT player, player_id, season " + \
          "  FROM lnd.players p " + \
          "   INNER JOIN lnd.teams t ON ( p.teamid = t.team_id ) " + \
          " WHERE 1=1"

    if season is not None:
        sql = sql + " AND p.season = " + args['season'].split("-")[0]

    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + " AND team_abbrv in (" + team_list[:-1] + ")"

    print(sql)
    return sql


def main():
    global teams
    global players
    global season
    global season_type
    global job_detail_name

    parser = argparse.ArgumentParser(
        description='Extracts team statistics from nba.com. \
                     If no argument is used, it will run through \
                     all measures, all the teams, for the current season')
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

    cur.execute(sql_player(args))
    players = cur.fetchall()

    # get the measures from the database
    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    for measure in measures:
        measure_api = measure[2]
        measure_stat = measure[0]
        measure_type = measure[1]
        measure_url = measure[3]
        job_detail_name = measure[4]


        if measure_stat == 1:
            pull_player_stats(measure_api, measure_type, measure_url)
        elif measure_stat == 2:
            pull_player_game_log(measure_api, measure_type, measure_url)
        elif measure_stat == 3:
            pull_player_shot_log(measure_api, measure_type, measure_url)
        elif measure_stat == 4:
            pull_player_reb_log(measure_api, measure_type, measure_url)
        elif measure_stat == 5:
            pull_player_pass_log(measure_api, measure_type, measure_url)
        elif measure_stat == 6:
            pull_player_defense_log(measure_api, measure_type, measure_url)
        else:
            print('Error:No measure stat found')


if __name__ == "__main__":
    main()
