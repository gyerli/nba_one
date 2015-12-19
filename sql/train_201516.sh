psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_train where season_str = '2015-16') 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_train_201516.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
echo training file for 2015-16 is written
echo /home/gursoy/work/h2o-3.6.0.8/data/player_train_201516.csv
