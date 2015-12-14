select 
    gps.player_name,
    g.season,
    g.team_abbreviation,
    g.game_date,
    g.matchup,
    g.wl,
    replace(gps.min,':','.')::FLOAT min,
    gps.pts,
    gps.ast,
    round((gps.pts/replace(gps.min,':','.')::float)::numeric,2) ppm,
    g.plus_minus,
    gpa.off_rating,
    LAG(gpa.off_rating,1) over(order by g.game_id, g.team_id, gps.player_id, game_date) prev_off_rating,
    round(AVG(gpa.off_rating) over(order by g.season, g.team_id, gps.player_id)::numeric,2) avg_off_rating,
    --gpa.def_rating,
    --gpa.net_rating,
    LAG(g.plus_minus,1) over(order by g.game_id, g.team_id, gps.player_id, game_date) prev_plus_minus

    
  from lnd.vw_game_player_stat gps
    inner join lnd.vw_games g on (gps.game_id = g.game_id and
							      gps.team_id = g.team_id )
	inner join lnd.vw_game_player_adv_stat gpa on (gps.game_id = gpa.game_id AND
												   gps.player_id = gpa.player_id )
where gps.player_name = 'Anthony Davis'
--and g.season = '2015-16'

--order by game_date