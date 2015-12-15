copy (select * from rpt.mvw_fct_game_player) 
to '/tmp/fct_game_player.csv'
With delimiter '|'
CSV 
  HEADER 
