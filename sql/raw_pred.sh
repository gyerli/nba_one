psql -U ictsh -d nba <<EOF
\x
copy (select * from ml.vw_predict where game_date = current_date) 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_predict.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
