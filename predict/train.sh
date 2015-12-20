#!/bin/bash
DATE=`date +%Y%m%d`
echo $DATE

psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_train where season_str in ('2013-14','2014-15','2015-16')) 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_train_${DATE}.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
echo /home/gursoy/work/h2o-3.6.0.8/data/player_train_${DATE}.csv is written
