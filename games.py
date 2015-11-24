import json
import pandas as pd
import requests
import sys
import datetime
import logging
import common as cmn
import socks
import socket

gameLogger = logging.getLogger('job_run')

teams = list()
games = list()
season = str()
season_type = str()
job_detail_name = str()
dt_str = str()

socks.setdefaultproxy(proxy_type=socks.PROXY_TYPE_SOCKS5, addr="127.0.0.1", port=9050)

def pull_game_player_trck_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_trck_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_trck_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_four_factor_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_four_factor_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_four_factor_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_usage_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_usage_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_usage_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_scoring_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_scoring_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_scoring_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_misc_stat(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_misc_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_misc_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_box_score_adv(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_adv_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_adv_stat_' + dt_str + '.' + season + '.dat', sep='|')


def pull_game_box_score(measure_api, measure_url):
    _df_player = pd.DataFrame()
    _df_team = pd.DataFrame()
    _df_starter_bench = pd.DataFrame()

    for game in games:
        base_url = measure_url.replace('^game_id^', str(game[0]))
        base_url = base_url.replace('^season_type^', season_type)
        base_url = base_url.replace('^season^', season)

        gameLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
        gameLogger.info('{0}/{1}/{2}/{3}/{4}'.format(game[0], game[1], game[2], season, job_detail_name))

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

    _df_player.to_csv(cmn.data_folder + 'game_player_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_team.to_csv(cmn.data_folder + 'game_team_stat_' + dt_str + '.' + season + '.dat', sep='|')
    _df_starter_bench.to_csv(cmn.data_folder + 'game_starter_bench_' + dt_str + '.' + season + '.dat', sep='|')


def main(p_measures, p_teams, p_games, p_season, p_season_type, p_dt_str):
    global teams
    global games
    global season
    global season_type
    global job_detail_name
    global dt_str

    teams = p_teams
    games = p_games
    season = p_season
    season_type = p_season_type
    dt_str = p_dt_str

    for measure in p_measures:
        measure_api = measure[2]
        measure_stat = measure[0]
        measure_url = measure[3]
        job_detail_name = measure[4]
        is_measure_active = measure[5]

        if not is_measure_active:
            continue

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
