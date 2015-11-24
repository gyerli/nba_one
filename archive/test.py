from importlib.machinery import SourceFileLoader
import datetime
import csv
import json
import pandas as pd
import requests
import psycopg2 as pg
import sys
import argparse
import subprocess

dt = SourceFileLoader('dt','/home/gursoy/work/nba/lib/dt.py').load_module()
common = SourceFileLoader('dt','/home/gursoy/work/nba/lib/common.py').load_module()
print(dt.dt(datetime.datetime.now()))


df = pd.DataFrame()
base_url = 'http://stats.nba.com/stats/commonteamroster?LeagueID=00&Season=2015-16&TeamID=1610612765'
response = requests.get(base_url)
data = json.loads(response.text)

h =  data['resultSets'][1]['headers']
d =  data['resultSets'][1]['rowSet']

df =  pd.DataFrame(d, columns=h)
print(df.dtypes) 
print('=============================')
#for column in df:
#    if df[column].name == 'TEAM_ID':
#        print('hello ' + df[column].name)
#       df[column] = df[column].astype(str)
df = common.df_convert(df)
print('=============================')
print(df.dtypes) 
df.to_csv('/home/gursoy/work/nba/z')
    #df[column].astype(float)
   
#try:
#    output, error = subprocess.check_call('echo "test123"', shell=True)
#    print(output)
#except Exception as e:
#    print(e)  

try:
    output = subprocess.check_output('echo "test123"', shell=True)
    print(str(output))
except:
    print('Ooops')

