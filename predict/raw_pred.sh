#!/bin/bash
DATE=`date +%Y%m%d`
echo $DATE
DATA_FILE=${PWD}/data/player_predict_${DATE}.csv

psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_predict where game_date = current_date) 
to '${DATA_FILE}'
With delimiter '|'
CSV 
  HEADER;
EOF

echo ${DATA_FILE} is written
