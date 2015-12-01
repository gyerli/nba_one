SELECT gp.game_id,
	gp.game_date,
	gp.team_id,
	gp.team_abbrv,
	gp.opp_team_id,
	gp.opp_team_abbrv,
	gp.player_id,
	gp.player_name,
	gp.matchup,
	gp.seconds / 60 AS minutes,
	gt.wl,
	gt.team_loc,
	g.ht_pts,
	g.rt_pts,
	g.wl winning_side,
	dr.*
	
   FROM rpt.fct_game_player gp
     left join rpt.fct_game_team gt on ( gp.game_id = gt.game_id and
 										 gp.team_id = gt.team_id )
     left join rpt.dim_game g on ( gp.game_id = g.id and
								   g.is_active = true )
	 LEFT JOIN lnd.vw_player_overall_advanced pa ON gp.player_id = pa.playerid AND gp.season = replace(pa.season::text, '-'::text, ''::text)::integer
	 LEFT JOIN lnd.vw_player_overall_base pb ON gp.player_id = pb.playerid AND gp.season = replace(pb.season::text, '-'::text, ''::text)::integer
     LEFT JOIN lnd.vw_player_days_rest_base dr ON (gp.player_id = dr.playerid AND 
                                                   gp.season = replace(dr.season,'-','')::INTEGER AND 
                                                   dr.group_value =  
                                                     CASE
														WHEN (gp.game_date - a.previous_game_date) = 0 THEN '0 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) = 1 THEN '1 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) = 2 THEN '2 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) = 3 THEN '3 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) = 4 THEN '4 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) = 5 THEN '5 Days Rest'::text
														WHEN (gp.game_date - a.previous_game_date) > 5 THEN '6+ Days Rest'::text
														ELSE 'Unknown Days Rest'::text
													 END )
	 
  WHERE 1=1
  and gp.team_abbrv = 'SAS'
  and gp.season = 201516
  and gp.player_name = 'Kawhi Leonard'
  ORDER BY gp.game_date