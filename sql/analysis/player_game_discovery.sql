select 
	--player_id, 
	player_name, 
	--game_id, 
	game_date, 
	days_rest, 
	player_game_day, 
	--team_id, 
	team_abbrv, 
	--opp_team_id, 
    opp_team_abbrv, 
    matchup, 
    --season, 
    --season_type, 
    start_position, 
    player_name, 
    min_game, 
    moving_avg_min, 
    fdpts_game, 
    fdpts_daily_rank, 
    moving_avg_fdpts, 
    pie_game, 
    nba_pos, 
    pie_daily_rank, 
    moving_avg_pie,
    stddev(min_game) over (partition by season, player_id) std_min
  from rpt.mvw_fct_game_player
where 1=1
--and team_abbrv = 'PHI'
and player_name = 'James Harden'
--and player_name like '%Covington'
and season = 201415
--and game_date = '2015-11-29'
--and pie_daily_rank < 10
--order by pie_daily_rank
order by game_date, pie_daily_rank