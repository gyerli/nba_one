copy (select * from ml.mvw_player_predict where season >= 201314) 
to '/tmp/player_predict.csv'
With delimiter '|'
CSV 
  HEADER 
