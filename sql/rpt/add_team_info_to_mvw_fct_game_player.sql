SELECT gp.game_id,
	gp.game_date,
	lnd.get_revious_game_date(pa.season, gp.player_id, gp.game_date) ary,
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
	tla.*
	
   FROM rpt.fct_game_player gp
     left join rpt.fct_game_team gt on ( gp.game_id = gt.game_id and
 										 gp.team_id = gt.team_id )
     left join rpt.dim_game g on ( gp.game_id = g.id and
								   g.is_active = true )
	 LEFT JOIN lnd.vw_player_overall_advanced pa ON gp.player_id = pa.playerid AND gp.season = replace(pa.season::text, '-'::text, ''::text)::integer
	 LEFT JOIN lnd.vw_player_overall_base pb ON gp.player_id = pb.playerid AND gp.season = replace(pb.season::text, '-'::text, ''::text)::integer
	 LEFT JOIN lnd.vw_team_general_location_advanced tla ON (gp.opp_team_id = tla.teamid AND 
                                                             gp.season = replace(tla.season,'-','')::integer AND 
                                                             case 
                                                               when gt.team_loc = 'Home' then 'Road'
                                                               WHEN gt.team_loc = 'Road' then 'Home'
                                                             end = tla.team_game_location)
	 
  WHERE 1=1
  and gp.team_abbrv = 'SAS'
  and gp.season = 201516
  and gp.player_name = 'Kawhi Leonard'
  ORDER BY gp.game_date