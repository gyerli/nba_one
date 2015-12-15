copy (select * from ml.vw_player_training) 
to '/tmp/player_training.csv'
With delimiter '|'
CSV 
  HEADER 
