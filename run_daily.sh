cd /home/gursoy/work/nba
python /home/gursoy/work/nba/job_run.py -n get_games -p R
python /home/gursoy/work/nba/job_run.py -n get_team_roster -p R

python /home/gursoy/work/nba/load_tables.py

python /home/gursoy/work/nba/job_run.py -n teams -p R
python /home/gursoy/work/nba/job_run.py -n players -p R
python /home/gursoy/work/nba/job_run.py -n games -p R

python /home/gursoy/work/nba/load_tables.py

python /home/gursoy/work/nba/job_run.py -n get_rotowire -p R

python /home/gursoy/work/nba/load_tables.py
