#!/bin/bash
# Once pre_pick.sh is processed and minutes edited for injured players
# This file is run to extract that table to be fed to H2O ML model
DATE=`date +%Y%m%d`
echo $DATE
DATA_FILE=${PWD}/data/player_pick_${DATE}.csv
psql -U ictsh -d nba <<EOF
\x
copy (select * from picks.predict_$DATE) 
to '${DATA_FILE}'
With delimiter '|'
CSV 
  HEADER;
EOF
echo ${DATA_FILE} is written
