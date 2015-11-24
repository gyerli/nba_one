import json
import pandas as pd
import requests
import sys
import datetime
import logging
import common as cmn

getGamesLogger = logging.getLogger('job_run')

teams = list()
season = str()
season_type = str()
dt_str = str()
job_detail_name = str()


def pull_games(measure_url):
    _df_game = pd.DataFrame()

    base_url = measure_url.replace('^season^', season)
    base_url = base_url.replace('^season_type^', season_type)

    getGamesLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(), base_url))
    getGamesLogger.info('Getting games for' + '/' + season + '/' + job_detail_name)

    response = requests.get(base_url)
    data = json.loads(response.text)

    game_header = data['resultSets'][0]['headers']
    game_data = data['resultSets'][0]['rowSet']

    df_game = pd.DataFrame(game_data, columns=game_header)
    df_game['season'] = season
    df_game['season_type'] = season_type

    _df_game = _df_game.append(df_game)
    _df_game.to_csv(cmn.data_folder + 'games_' + dt_str + '.' + season + '.dat', sep='|')


def main(p_measures, p_teams, p_season, p_season_type, p_dt_str):
    global teams
    global season
    global season_type
    global dt_str
    global job_detail_name

    teams = p_teams
    season = p_season
    season_type = p_season_type
    dt_str = p_dt_str

    getGamesLogger.info('Starting GET_GAMES processing')

    for measure in p_measures:
        measure_url = measure[3]
        measure_seq = measure[0]
        is_measure_active = measure[5]

        if not is_measure_active:
            continue

        if measure_seq == 1:
            pull_games(measure_url)
        else:
            getGamesLogger.error('Error:No measure stat found => ' + str(measure_seq))
