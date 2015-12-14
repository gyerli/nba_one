select 
    ps.player, 
    ps.loc, 
    ps.team, 
    ps.opponent, 
    ps.game_date, 
    tla_c.off_rating, 
    tla_o.def_rating , 
    ps.season,
    p.age, 
    lnd.get_player_days_rest(p.player_id, p.season) days_rest,

    po.pts * 0.8715039 pts_rank,
    pa.pie * 0.7958694 pie_rank,
    po.min * 0.7457481 min_rank,
    pa.usg_pct * 0.7006278 usg_pct_rank,
    po.tov * 0.6086654 tov_rank,
    po.reb * 0.5533486 reb_rank,
    po.ast * 0.4750345 ast_rank,
    po.stl * 0.4744307 stl_rank,
    po.blk * 0.3305021 blk_rank,
	

    pa.usg_pct,coalesce(pra.usg_pct, pa.usg_pct) pra_usg_pct,
    po.min min,coalesce(pr.min, po.min) dr_min,
    po.reb,coalesce(pr.reb, po.reb) dr_reb,  
    po.ast,coalesce(pr.ast, po.ast) dr_ast,
    po.blk,coalesce(pr.blk, po.blk) dr_blk,
    po.pts,coalesce(pr.pts, po.pts) dr_pts,
    po.stl,coalesce(pr.stl, po.stl) dr_stl,
    po.tov,coalesce(pr.tov, po.tov) dr_tov,
    pa.pie,coalesce(pra.pie, pa.pie) pra_pie
  from stg.vw_player_schedule ps
    inner join lnd.vw_players p on (ps.player_id = p.player_id and 
				    split_part(ps.season,'-',1)::int8 = p.season)
    inner join lnd.vw_player_overall_base po on (ps.player_id = po.playerid and 
						 ps.season = po.season and 
						 po.min::float > 20)
    INNER JOIN lnd.vw_player_overall_advanced pa on (ps.player_id = pa.playerid and 
						     ps.season = pa.season)
    LEFT OUTER JOIN lnd.vw_player_days_rest_base pr ON (po.playerid = pr.playerid AND 
							po.season = pr.season AND 
							pr.group_value = lnd.get_player_days_rest(p.player_id, p.season))
    LEFT OUTER JOIN lnd.vw_player_days_rest_advanced pra ON (po.playerid = pra.playerid AND 
							     po.season = pra.season AND 
							     pra.group_value = lnd.get_player_days_rest(p.player_id, p.season))
    inner join lnd.vw_team_general_location_advanced tla_o on (ps.opponent_team_id = tla_o.teamid and
							       ps.season = tla_o.season AND 
							       ps.loc = tla_o.team_game_location)
    inner join lnd.vw_team_general_location_advanced tla_c on (ps.team_id = tla_c.teamid and
							       ps.season = tla_c.season AND 
							       ps.loc = tla_c.team_game_location)
--WHERE ps.game_date = to_char('now'::text::date::timestamp with time zone, 'YYYYMMDD'::text)::bigint
