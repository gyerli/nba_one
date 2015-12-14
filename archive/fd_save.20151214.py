import urllib.parse
import urllib.request
import urllib.response
import sys
from ghost import Ghost

username = sys.argv[1]
password = sys.argv[2]
login_url = "https://www.fanduel.com/p/login#login"

ghost = Ghost()
with ghost.start() as session:
  page, extra_resource = session.open(login_url)
  assert page.http_status==200 


