psql -U ictsh -d nba <<EOF
\x
copy (select * from picks.predict_20151211) 
to '/home/gursoy/work/h2o-3.6.0.8/data/player_pick.csv'
With delimiter '|'
CSV 
  HEADER;
EOF
