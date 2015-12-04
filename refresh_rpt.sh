echo Refreshing dim_player
psql -U ictsh -d nba -f ./sql/rpt/dim_player.sql
echo Refreshing dim_game
psql -U ictsh -d nba -f ./sql/rpt/dim_game.sql
echo Refreshing dim_fct_game_team
psql -U ictsh -d nba -f ./sql/rpt/fct_game_team.sql
echo Refreshing dim_fct_game_player
psql -U ictsh -d nba -f ./sql/rpt/fct_game_player.sql
echo Refreshing materialized views
psql -U ictsh -d nba -f ./sql/rpt/refresh_mvws.sql

