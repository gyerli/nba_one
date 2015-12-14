#!/bin/bash
# Once pre_pick.sh is processed and minutes edited for injured players
# This file is run to extract that table to be fed to H2O ML model
DATE=`date +%Y%m%d`
echo $DATE

psql -U ictsh -d nba <<EOF
\x
copy (select * from picks.predict_$DATE) 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_pick_${DATE}.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
