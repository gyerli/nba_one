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

conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")

teams = list()
season = str()
season_type = str()
job_detail_name = str()


def pull_team_pass_trck(measure_api, measure_type, measure_url):
    # seasons = ['2014-15']
    # teams = csv.reader(open('./data/reference/teams.csv.debug', "rt"), delimiter='\t')

    _df_passes_made = pd.DataFrame()
    _df_passes_rcvd = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        passes_made_header = data['resultSets'][0]['headers']
        passes_made_data = data['resultSets'][0]['rowSet']

        passes_rcvd_header = data['resultSets'][1]['headers']
        passes_rcvd_data = data['resultSets'][1]['rowSet']

        df_passes_made = pd.DataFrame(passes_made_data, columns=passes_made_header)
        df_passes_made['TeamID'] = team[3]
        df_passes_made['season'] = season
        df_passes_made['season_type'] = season_type

        df_passes_rcvd = pd.DataFrame(passes_rcvd_data, columns=passes_rcvd_header)
        df_passes_rcvd['TeamID'] = team[3]
        df_passes_rcvd['season'] = season
        df_passes_rcvd['season_type'] = season_type

        _df_passes_made = _df_passes_made.append(df_passes_made)
        _df_passes_rcvd = _df_passes_rcvd.append(df_passes_rcvd)

        _df_passes_made = common.df_convert(_df_passes_made)
        _df_passes_rcvd = common.df_convert(_df_passes_rcvd)

    _df_passes_made.to_csv('./data/team_player_passes_made_' + dt_str + '.' + season + '.dat', sep='|')
    _df_passes_rcvd.to_csv('./data/team_player_passes_rcvd_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_reb_trck(measure_api, measure_type, measure_url):
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

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
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
        df_overall['TeamID'] = team[3]
        df_overall['season'] = season
        df_overall['season_type'] = season_type

        df_shot_type = pd.DataFrame(shot_type_data, columns=shot_type_header)
        df_shot_type['TeamID'] = team[3]
        df_shot_type['season'] = season
        df_shot_type['season_type'] = season_type

        df_num_contested = pd.DataFrame(num_contested_data, columns=num_contested_header)
        df_num_contested['TeamID'] = team[3]
        df_num_contested['season'] = season
        df_num_contested['season_type'] = season_type

        df_shot_dist = pd.DataFrame(shot_dist_data, columns=shot_dist_header)
        df_shot_dist['TeamID'] = team[3]
        df_shot_dist['season'] = season
        df_shot_dist['season_type'] = season_type

        df_reb_dist = pd.DataFrame(reb_dist_data, columns=reb_dist_header)
        df_reb_dist['TeamID'] = team[3]
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

    _df_overall.to_csv('./data/team_reb_trck_overall_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_type.to_csv('./data/team_reb_trck_shot_type_' + dt_str + '.' + season + '.dat', sep='|')
    _df_num_contested.to_csv('./data/team_reb_trck_num_contested_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_dist.to_csv('./data/team_reb_trck_shot_dist_' + dt_str + '.' + season + '.dat', sep='|')
    _df_reb_dist.to_csv('./data/team_reb_trck_reb_dist_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_shot_trck(measure_api, measure_type, measure_url):
    # GeneralShooting
    # ShotClockShooting
    # DribbleShooting
    # ClosestDefenderShooting
    # ClosestDefender10ftPlusShooting
    # TouchTimeShooting

    _df_general = pd.DataFrame()
    _df_shot_clock = pd.DataFrame()
    _df_dribble = pd.DataFrame()
    _df_closest_def = pd.DataFrame()
    _df_closest_def_10ft_plus = pd.DataFrame()
    _df_touch_time = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        general_header = data['resultSets'][0]['headers']
        general_data = data['resultSets'][0]['rowSet']

        shot_clock_header = data['resultSets'][1]['headers']
        shot_clock_data = data['resultSets'][1]['rowSet']

        dribble_header = data['resultSets'][2]['headers']
        dribble_data = data['resultSets'][2]['rowSet']

        closest_def_header = data['resultSets'][3]['headers']
        closest_def_data = data['resultSets'][3]['rowSet']

        touch_time_header = data['resultSets'][4]['headers']
        touch_time_data = data['resultSets'][4]['rowSet']

        closest_def_10ft_plus_header = data['resultSets'][5]['headers']
        closest_def_10ft_plus_data = data['resultSets'][5]['rowSet']

        df_general = pd.DataFrame(general_data, columns=general_header)
        df_general['TeamID'] = team[3]
        df_general['season'] = season
        df_general['season_type'] = season_type

        df_shot_clock = pd.DataFrame(shot_clock_data, columns=shot_clock_header)
        df_shot_clock['TeamID'] = team[3]
        df_shot_clock['season'] = season
        df_shot_clock['season_type'] = season_type

        df_dribble = pd.DataFrame(dribble_data, columns=dribble_header)
        df_dribble['TeamID'] = team[3]
        df_dribble['season'] = season
        df_dribble['season_type'] = season_type

        df_closest_def = pd.DataFrame(closest_def_data, columns=closest_def_header)
        df_closest_def['TeamID'] = team[3]
        df_closest_def['season'] = season
        df_closest_def['season_type'] = season_type

        df_closest_def_10ft_plus = pd.DataFrame(closest_def_10ft_plus_data, columns=closest_def_10ft_plus_header)
        df_closest_def_10ft_plus['TeamID'] = team[3]
        df_closest_def_10ft_plus['season'] = season
        df_closest_def_10ft_plus['season_type'] = season_type

        df_touch_time = pd.DataFrame(touch_time_data, columns=touch_time_header)
        df_touch_time['TeamID'] = team[3]
        df_closest_def_10ft_plus['season'] = season
        df_closest_def_10ft_plus['season_type'] = season_type

        _df_general = _df_general.append(df_general)
        _df_shot_clock = _df_shot_clock.append(df_shot_clock)
        _df_dribble = _df_dribble.append(df_dribble)
        _df_closest_def = _df_closest_def.append(df_closest_def)
        _df_closest_def_10ft_plus = _df_closest_def_10ft_plus.append(df_closest_def_10ft_plus)
        _df_touch_time = _df_touch_time.append(df_touch_time)

        _df_general = common.df_convert(_df_general)
        _df_shot_clock = common.df_convert(_df_shot_clock)
        _df_dribble = common.df_convert(_df_dribble)
        _df_closest_def = common.df_convert(_df_closest_def)
        _df_closest_def_10ft_plus = common.df_convert(_df_closest_def_10ft_plus)
        _df_touch_time = common.df_convert(_df_touch_time)

    _df_general.to_csv('./data/team_shot_trck_general_' + dt_str + '.' + season + '.dat', sep='|')
    _df_shot_clock.to_csv('./data/team_shot_trck_shot_clock_' + dt_str + '.' + season + '.dat', sep='|')
    _df_dribble.to_csv('./data/team_shot_trck_dribble_' + dt_str + '.' + season + '.dat', sep='|')
    _df_closest_def.to_csv('./data/team_shot_trck_closest_def_' + dt_str + '.' + season + '.dat', sep='|')
    _df_closest_def_10ft_plus.to_csv('./data/team_shot_trck_closest_def_10ft_plus_' + dt_str + '.' + season + '.dat', sep='|')
    _df_touch_time.to_csv('./data/team_shot_trck_touch_time_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_game_log(measure_api, measure_url):
    _df_game_log = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name)
        response = requests.get(base_url)
        data = json.loads(response.text)

        game_log_header = data['resultSets'][0]['headers']
        game_log_data = data['resultSets'][0]['rowSet']

        df_game_log = pd.DataFrame(game_log_data, columns=game_log_header)
        df_game_log['TeamID'] = team[3]
        df_game_log['season'] = season
        df_game_log['season_type'] = season_type

        _df_game_log = _df_game_log.append(df_game_log)

        _df_game_log = common.df_convert(_df_game_log)

    _df_game_log.to_csv('./data/team_game_log' + '_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_player_on_off_sum(measure_api, measure_type, measure_url):
    # seasons = ['2014-15']
    # teams = csv.reader(open('./data/teams.csv.debug', "rt"), delimiter='\t')

    _df_on_sum = pd.DataFrame()
    _df_off_sum = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        on_sum_header = data['resultSets'][1]['headers']
        on_sum_data = data['resultSets'][1]['rowSet']

        off_sum_header = data['resultSets'][2]['headers']
        off_sum_data = data['resultSets'][2]['rowSet']

        df_on_sum = pd.DataFrame(on_sum_data, columns=on_sum_header)
        df_on_sum['TeamID'] = team[3]
        df_on_sum['season'] = season
        df_on_sum['season_type'] = season_type

        df_off_sum = pd.DataFrame(off_sum_data, columns=off_sum_header)
        df_off_sum['TeamID'] = team[3]
        df_off_sum['season'] = season
        df_off_sum['season_type'] = season_type

        _df_on_sum = _df_on_sum.append(df_on_sum)
        _df_off_sum = _df_off_sum.append(df_off_sum)

        _df_on_sum = common.df_convert(_df_on_sum)
        _df_off_sum = common.df_convert(_df_off_sum)

    _df_on_sum.to_csv('./data/team_player_on_sum_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_off_sum.to_csv('./data/team_player_off_sum_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_player_on_off(measure_api, measure_type, measure_url):
    _df_on = pd.DataFrame()
    _df_off = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        on_header = data['resultSets'][1]['headers']
        on_data = data['resultSets'][1]['rowSet']

        off_header = data['resultSets'][2]['headers']
        off_data = data['resultSets'][2]['rowSet']

        df_on = pd.DataFrame(on_data, columns=on_header)
        df_on['TeamID'] = team[3]
        df_on['season'] = season
        df_on['season_type'] = season_type

        df_off = pd.DataFrame(off_data, columns=off_header)
        df_off['TeamID'] = team[3]
        df_off['season'] = season
        df_off['season_type'] = season_type

        _df_on = _df_on.append(df_on)
        _df_off = _df_off.append(df_off)

        _df_on = common.df_convert(_df_on)
        _df_off = common.df_convert(_df_off)

    _df_on.to_csv('./data/team_player_on_off_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_off.to_csv('./data/team_player_on_off_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_player(measure_api, measure_type, measure_url):
    _df_player = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][1]['headers']
        player_data = data['resultSets'][1]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['TeamID'] = team[3]
        df_player['season'] = season
        df_player['season_type'] = season_type

        _df_player = _df_player.append(df_player)
        _df_player = common.df_convert(_df_player)

    _df_player.to_csv('./data/team_player_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_lineup(measure_api, measure_type, measure_url):
    # seasons = ['2014-15']
    # teams = csv.reader(open('./data/teams.csv.debug', "rt"), delimiter='\t')

    _df_lineup = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        line_up_header = data['resultSets'][1]['headers']
        line_up_data = data['resultSets'][1]['rowSet']

        df_lineup = pd.DataFrame(line_up_data, columns=line_up_header)
        df_lineup['TeamID'] = team[3]
        df_lineup['season'] = season
        df_lineup['season_type'] = season_type

        _df_lineup = _df_lineup.append(df_lineup)
        _df_lineup = common.df_convert(_df_lineup)

    _df_lineup.to_csv('./data/team_lineup_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def pull_team_stats(measure_api, measure_type, measure_url):
    _df_overall = pd.DataFrame()
    _df_location = pd.DataFrame()
    _df_win_lose = pd.DataFrame()
    _df_month = pd.DataFrame()
    _df_prepost_allstar = pd.DataFrame()
    _df_days_rest = pd.DataFrame()

    for team in teams:
        # print('In team => ' + team[0])
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)
        base_url = base_url.replace('^season_type^', season_type)
        # print(base_url)
        print(team[0] + '/' + season + '/' + job_detail_name + '/' + measure_type)
        response = requests.get(base_url)
        data = json.loads(response.text)

        overall_header = data['resultSets'][0]['headers']
        location_header = data['resultSets'][1]['headers']
        win_lose_header = data['resultSets'][2]['headers']
        month_header = data['resultSets'][3]['headers']
        prepost_allstar_header = data['resultSets'][4]['headers']
        days_rest_header = data['resultSets'][5]['headers']

        overall_data = data['resultSets'][0]['rowSet']
        location_data = data['resultSets'][1]['rowSet']
        win_lose_data = data['resultSets'][2]['rowSet']
        month_data = data['resultSets'][3]['rowSet']
        prepost_allstar_data = data['resultSets'][4]['rowSet']
        days_rest_data = data['resultSets'][5]['rowSet']

        df_overall = pd.DataFrame(overall_data, columns=overall_header)
        df_overall['TeamID'] = team[3]
        df_overall['season'] = season
        df_overall['season_type'] = season_type

        df_location = pd.DataFrame(location_data, columns=location_header)
        df_location['TeamID'] = team[3]
        df_location['season'] = season
        df_location['season_type'] = season_type

        df_win_lose = pd.DataFrame(win_lose_data, columns=win_lose_header)
        df_win_lose['TeamID'] = team[3]
        df_win_lose['season'] = season
        df_win_lose['season_type'] = season_type

        df_month = pd.DataFrame(month_data, columns=month_header)
        df_month['TeamID'] = team[3]
        df_month['season'] = season
        df_month['season_type'] = season_type

        df_prepost_allstar = pd.DataFrame(prepost_allstar_data, columns=prepost_allstar_header)
        df_prepost_allstar['TeamID'] = team[3]
        df_prepost_allstar['season'] = season
        df_prepost_allstar['season_type'] = season_type

        df_day_rest = pd.DataFrame(days_rest_data, columns=days_rest_header)
        df_day_rest['TeamID'] = team[3]
        df_day_rest['season'] = season
        df_day_rest['season_type'] = season_type

        _df_overall = _df_overall.append(df_overall)
        _df_location = _df_location.append(df_location)
        _df_win_lose = _df_win_lose.append(df_win_lose)
        _df_month = _df_month.append(df_month)
        _df_prepost_allstar = _df_prepost_allstar.append(df_prepost_allstar)
        _df_days_rest = _df_days_rest.append(df_day_rest)


    if measure_api == 'teamdashboardbygeneralsplits':
        measure_api_abbr = 'team_general'
    elif measure_api == 'teamdashboardbyshootingsplits':
        measure_api_abbr = 'team_shooting'
    else:
        measure_api_abbr = 'team_unknown'

    _df_overall = common.df_convert(_df_overall)
    _df_location = common.df_convert(_df_location)
    _df_win_lose = common.df_convert(_df_win_lose)
    _df_month = common.df_convert(_df_month)
    _df_prepost_allstar = common.df_convert(_df_prepost_allstar)
    _df_days_rest = common.df_convert(_df_days_rest)

    _df_overall.to_csv('./data/' + measure_api_abbr + '_overall_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_location.to_csv('./data/' + measure_api_abbr + '_location_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_win_lose.to_csv('./data/' + measure_api_abbr + '_win_lose_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_month.to_csv('./data/' + measure_api_abbr + '_month_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_prepost_allstar.to_csv('./data/' + measure_api_abbr + '_prepost_allstar_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')
    _df_days_rest.to_csv('./data/' + measure_api_abbr + '_days_rest_' + measure_type + '_' + dt_str + '.' + season + '.dat', sep='|')


def sql_measure(args):
    sql = "SELECT measure_seq, measure_type, measure_api, measure_url, jm.job_detail_name " + \
          "  FROM job.job_detail jd " + \
          "  INNER JOIN job.measure jm ON ( jd.job_detail_name = jm.job_detail_name ) " + \
          "  WHERE jd.job_name = 'teams' " + \
          "    AND jm.active_flag = True "

    if args['name'] is not None:
        sql = sql + " AND jm.job_detail_name = '" + args['name'] + "'"

    return sql


def sql_team(args):
    team_list = ''
    sql = "SELECT team_name, team_key, team_abbrv, team_id " + \
          "  FROM lnd.teams t "

    # if -t argument passed to job, use it otherwise select the teams 
    # from the game_schedule table based on LSET parameter passed
    if args['teams'] is not None:
        t = args['teams'].split(',')
        for i in t:
            team_list = team_list + "'" + i + "',"
        sql = sql + "WHERE team_abbrv in (" + team_list[:-1] + ")"
        # print(sql)
        print('Team argument used. List of teams to pull => {0}'.format(args['teams']))
    # Consider LSET only for current season. Otherwise get all the teams
    elif args['season'] == common.current_season:
        lst_sql = "SELECT lnd.get_schedule_team_list('{0}')".format(args['lset'])
        cur = conn.cursor()
        cur.execute(lst_sql)        
        lst = cur.fetchone()[0]
        if lst != '':
          sql = sql + "WHERE team_abbrv IN (" + lst + ")"
          print("Team schedule is used based on LSET => ({0}). " \
                "List of teams to pull => {1}".format(args['lset'],lst))
        else:
          print("No game found based on LSET => {0}".format(args['lset']))
    # print(sql)
    return sql


def main():
    global teams
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
    parser.add_argument('-d', '--lset', help='LSET of parent job', required=False)
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

    cur = conn.cursor()

    # Get the teams from the database
    cur.execute(sql_team(args))
    teams = cur.fetchall()

	
    # get the measures from the database
    cur.execute(sql_measure(args))
    measures = cur.fetchall()

    for measure in measures:
        # print('seq => ' + str(measure[0]))
        # print('type => ' + measure[1])
        # print('api => ' + measure[2])
        # print('url => ' + measure[3])

        measure_api = measure[2]
        measure_stat = measure[0]
        measure_type = measure[1]
        measure_url = measure[3]
        job_detail_name = measure[4]

        if measure_stat == 1:
            pull_team_stats(measure_api, measure_type, measure_url)
        elif measure_stat == 2:
            pull_team_lineup(measure_api, measure_type, measure_url)
        elif measure_stat == 3:
            pull_team_player(measure_api, measure_type, measure_url)
        elif measure_stat == 4:
            pull_team_player_on_off(measure_api, measure_type, measure_url)
        elif measure_stat == 5:
            pull_team_player_on_off_sum(measure_api, measure_type, measure_url)
        elif measure_stat == 6:
            pull_team_game_log(measure_api, measure_url)
        elif measure_stat == 7:
            pull_team_shot_trck(measure_api, measure_type, measure_url)
        elif measure_stat == 8:
            pull_team_reb_trck(measure_api, measure_type, measure_url)
        elif measure_stat == 9:
            pull_team_pass_trck(measure_api, measure_type, measure_url)
        else:
            print('Error:No measure stat found')

    conn.close()
    sys.exit()


if __name__ == "__main__":
    main()
