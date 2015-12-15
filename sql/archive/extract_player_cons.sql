copy (select * from rpt.mvw_player_consolidated where season >= 201314) 
to '/tmp/player_consolidated.csv'
With delimiter '|'
CSV 
  HEADER 
