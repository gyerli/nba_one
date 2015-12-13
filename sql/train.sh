psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_train) 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_train.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
