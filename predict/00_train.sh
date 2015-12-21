#!/bin/bash
DATE=`date +%Y%m%d`
echo $DATE
DATA_FILE=${PWD}/data/player_train_${DATE}.csv

psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_train where season_str in ('2013-14','2014-15','2015-16')) 
to '${DATA_FILE}'
With delimiter '|'
CSV 
  HEADER;
EOF
echo Training file ${DATA_FILE} is written
