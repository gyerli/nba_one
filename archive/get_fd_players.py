import json
import pandas as pd
import requests
import urllib


url = 'https://api.fanduel.com/fixture-lists/13466/players'
response = requests.get(url, auth=('gursoy@yerli.org','t1mBirti'))

data = json.loads(response.text)

df_players = pd.DataFrame(data)
df_players['season'] = '2015-16'
df_players['season_type'] = 'Regular+Season'

_df_players = pd.DataFrame()

_df_players = _df_players.append(df_players)

_df_players.to_csv('/home/gursoy/work/nba/fd_players.dat')

