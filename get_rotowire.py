import csv
import json
import pandas as pd
import requests
import sys
import datetime
import logging
import common as cmn

getTeamRosterLogger = logging.getLogger('job_run')

teams = list()
season = str()
season_type = str()
dt_str = str()
job_detail_name = str()

def pull_players_rotowire(measure_url):
    _df_player = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))

        getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
        getTeamRosterLogger.info(str(player[0]) + '/' + str(player[1]) + '/' + season + '/' + job_detail_name)

        try:
          response = requests.get(base_url)
          data = json.loads(response.text)
        except Exception as e:
          getTeamRosterLogger.warn("{0} doesn't have any rotowire".format(player[0])) 
          continue

        player_data = data['PlayerRotowires']

        df_player = pd.DataFrame(player_data)
        df_player['season_type'] = season_type
        df_player['season'] = season

        _df_player = _df_player.append(df_player)

    _df_player.to_csv(cmn.data_folder + 'player_rotowire_' + dt_str + '.' + season + '.dat', sep='|')

def main(p_measures, p_teams, p_players, p_season, p_season_type, p_dt_str):

    global teams
    global players
    global season
    global season_type
    global dt_str
    global job_detail_name

    teams = p_teams
    players = p_players
    season = p_season
    season_type = p_season_type
    dt_str = p_dt_str

    getTeamRosterLogger.info('Starting GET_TEAM_ROSTER processing')

    for measure in p_measures:
        measure_url = measure[3]
        measure_seq = measure[0]
        job_detail_name = measure[4]
        is_measure_active = measure[5]

        if not is_measure_active:
            continue

        if measure_seq == 1:
            pull_players_rotowire(measure_url)
        else:
            getTeamRosterLogger.error('Error:No measure stat found')

