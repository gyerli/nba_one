import selenium
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from pyvirtualdisplay import Display
import time
import os
import sys

os.system('clear')

username = sys.argv[1]
password = sys.argv[2]
login_url = "https://www.fanduel.com/p/login#login"
csv_file = "https://api.fanduel.com/fixture-lists/13466/players"

display = Display(visible=0, size=(1800,1600))
#display.start()

profile = webdriver.FirefoxProfile()
profile.set_preference("general.useragent.override","Mozilla/5.0 (Windows NT 6.1; Win64; x64)")
driver=webdriver.Firefox(profile)
driver.get(login_url)

time.sleep(3)

u = driver.find_element_by_id('email')
p = driver.find_element_by_id('password')

u.send_keys(username)
p.send_keys(password)

l = driver.find_element_by_xpath("//*[@type='submit']")
l.submit()

#driver.get(csv_file)

print(l)

