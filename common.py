import psycopg2 as pg
import datetime
import time
import sys



# Global Variables
# ================
valid_job_names = ['teams', 'players', 'games', 'get_team_roster', 'get_games', 'get_schedule','get_rotowire']
valid_seasons = ['2015-16', '2014-15', '2013-14', '2012-13', '2011-12', '2010-11', '2009-10', '2008-09',
                 '2007-08', '2006-07', '2005-06']
valid_season_types = ['P', 'R', 'O']

int_columns = ['G', 'GP','W','L','TEAM_ID','TeamID','PLAYER_ID','PLAYERID' 'SORT_SEQUENCE',
               'CFID','VS_PLAYER_ID','SORT_ORDER','PASS_TEAMMATE_PLAYER_ID','VIDEO_AVAILABLE']

current_season = '2015-16'
current_season_type = 'R'

nba_home = '/home/gursoy/work/nba/'
data_folder = '/home/gursoy/work/data/'
log_folder = '/home/gursoy/work/log/'

season_type_dict = {'R': 'Regular+Season', 'P': 'Pre+Season', 'O': 'Playoffs'}

# Database
# ========

# Functions
# =========
# Date/Time
def dt(t):
    return t.strftime("%Y%m%d_%H%M%S")


def now():
    return dt(datetime.datetime.now())

# Transformations
def df_convert(df):
    for column in df:
        if df[column].name.upper() in int_columns:
            df[column] = df[column].astype(int)
    return df


# Job Control
def fn():
    import traceback
    return traceback.extract_stack(None, 2)[0][2]
