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


def pull_coaches(measure_url):

    _df_coach = pd.DataFrame()
    for team in teams:
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)

        getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
        getTeamRosterLogger.info(team[0] + '/' + season + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        coach_header = data['resultSets'][1]['headers']
        coach_data = data['resultSets'][1]['rowSet']

        df_coach = pd.DataFrame(coach_data, columns=coach_header)
        df_coach['TeamID'] = team[3]

        _df_coach = _df_coach.append(df_coach)

    _df_coach.to_csv(cmn.data_folder + 'coaches_' + dt_str + '.' + season + '.dat', sep='|')


def pull_players(measure_url):

    _df_player = pd.DataFrame()

    for team in teams:
        base_url = measure_url.replace('^team_id^', str(team[3]))
        base_url = base_url.replace('^season^', season)

        getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
        getTeamRosterLogger.info(team[0] + '/' + season + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['TeamID'] = team[3]
        df_player['l_season'] = season

        _df_player = _df_player.append(df_player)

    _df_player.to_csv(cmn.data_folder + 'players_' + dt_str + '.' + season + '.dat', sep='|')

def pull_all_players(measure_url):
   base_url = measure_url.replace('^season^', season)

   getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
   getTeamRosterLogger.info('Getting all players' + '/' + season + '/' + job_detail_name)

   response = requests.get(base_url)
   data = json.loads(response.text)

   player_header = data['resultSets'][0]['headers']
   player_data = data['resultSets'][0]['rowSet']

   df_player = pd.DataFrame(player_data, columns=player_header)
   df_player['season'] = season

   df_player.to_csv(cmn.data_folder + 'players_all_' + dt_str + '.' + season + '.dat', sep='|')


def pull_player_career(measure_url):

   _df_player_regular = pd.DataFrame()
   _df_player_post = pd.DataFrame()
   
   for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))

        getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
        getTeamRosterLogger.info(player[0] + '/' + str(player[1]) + '/' + season + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_regular_header = data['resultSets'][0]['headers']
        player_regular_data = data['resultSets'][0]['rowSet']

        player_post_header = data['resultSets'][2]['headers']
        player_post_data = data['resultSets'][2]['rowSet']

        df_player_regular = pd.DataFrame(player_regular_data, columns=player_regular_header)
        df_player_post = pd.DataFrame(player_post_data, columns=player_post_header)

        _df_player_regular = _df_player_regular.append(df_player_regular)
        _df_player_post = _df_player_post.append(df_player_post)

   _df_player_regular.to_csv(cmn.data_folder + 'player_career_regular_' + dt_str + '.' + season + '.dat', sep='|')
   _df_player_post.to_csv(cmn.data_folder + 'player_career_post_' + dt_str + '.' + season + '.dat', sep='|')

def pull_players_new(measure_url):
    _df_player = pd.DataFrame()

    for player in players:
        base_url = measure_url.replace('^player_id^', str(player[1]))
        base_url = base_url.replace('^season_type^', season_type)

        getTeamRosterLogger.debug('{0} - BASE_URL => {1}'.format(cmn.fn(),base_url))
        getTeamRosterLogger.info(str(player[0]) + '/' + season + '/' + job_detail_name)

        response = requests.get(base_url)
        data = json.loads(response.text)

        player_header = data['resultSets'][0]['headers']
        player_data = data['resultSets'][0]['rowSet']

        df_player = pd.DataFrame(player_data, columns=player_header)
        df_player['season_type'] = season_type
        df_player['season'] = season

        _df_player = _df_player.append(df_player)

    _df_player.to_csv(cmn.data_folder + 'player_info_' + dt_str + '.' + season + '.dat', sep='|')


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
            pull_players(measure_url)
        elif measure_seq == 2:
            pull_coaches(measure_url)
        elif measure_seq == 3:
            pull_all_players(measure_url)
        elif measure_seq == 4:
            pull_player_career(measure_url)
        elif measure_seq == 5:
            pull_players_new(measure_url)
        else:
            getTeamRosterLogger.error('Error:No measure stat found')
