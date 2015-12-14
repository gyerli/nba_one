#import json
#import pandas as pd
#import requests
#import sys
#import base64
#from urllib.request import Request, urlopen

import urllib.parse
import urllib.request
import urllib.response
import sys
from ghost import Ghost

username = sys.argv[1]
password = sys.argv[2]
top_level_url = "https://api.fanduel.com/fixture-lists/13466/players"
user_agent = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64)'
values = {'name' : 'Gursoy Yerli'}
data = urllib.parse.urlencode(values)
data = data.encode('ascii')

# create an authorization handler
p = urllib.request.HTTPPasswordMgrWithDefaultRealm()
p.add_password(None, top_level_url, username, password);

auth_handler = urllib.request.HTTPBasicAuthHandler(p)

opener = urllib.request.build_opener(auth_handler)
opener.addheaders = [('User-agent', user_agent)]
urllib.request.install_opener(opener)


try:
    result = opener.open(top_level_url,data)
    messages = result.read()
    print (messages)
except IOError as e:
    print (e)

#q = Request("https://api.fanduel.com/fixture-lists/13466/players")
#s = '%s:%s'.format(username, password).replace('\n', '')
#base64string = base64.b64encode(s)
#q.add_header("Authorization", "Basic %s" % base64string)
#response = urlopen(q).read()

#print(response)

#data = json.loads(response.text)

#df_players = pd.DataFrame(data)
#df_players['season'] = '2015-16'
#df_players['season_type'] = 'Regular+Season'

#_df_players = pd.DataFrame()

#_df_players = _df_players.append(df_players)

#_df_players.to_csv('/home/gursoy/work/nba/fd_players.dat')

