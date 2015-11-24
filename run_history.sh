cd /home/gursoy/work/nba
python /home/gursoy/work/nba/job_run.py -n get_games -p R -k -s $1
python /home/gursoy/work/nba/job_run.py -n get_team_roster -p R -k -s $1

python /home/gursoy/work/nba/load_tables.py

python /home/gursoy/work/nba/job_run.py -n teams -p R -k -s $1
python /home/gursoy/work/nba/job_run.py -n players -p R -k -s $1
python /home/gursoy/work/nba/job_run.py -n games -p R -k -s $1

python /home/gursoy/work/nba/load_tables.py
