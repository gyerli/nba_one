SELECT 
  public.hash8(gp.game_id || '|' || gp.team_id || '|' || gp.player_id)::BIGINT fct_game_player_guid,
  (gp.game_id || '|' || gp.team_id || '|' || gp.player_id)::varchar crc_str,
  gp.game_id, 
  fgt.game_date,
  gp.team_id, 
  fgt.team_abbrv,
  fgt.opp_team_id,
  fgt.opp_team_abbrv,
  gp.player_id, 
  gp.player_name,
  p.player_name,
  fgt.matchup,
  replace(gp.season,'-','')::integer season,
  CASE 
    WHEN gp.season_type = 'Regular+Season' THEN 'RS'
    WHEN gp.season_type = 'Playoffs' THEN 'PO'
    WHEN gp.season_type = 'Pre+Season' THEN 'PS'
    ELSE 'U'
  end::varchar season_type,
  gp.start_position, 
  gp.comment cmnt, 
  gp.min,
  split_part(gp.min,':',1)::integer * 60 + split_part(gp.min,':',2)::integer seconds,
  gp.fgm, 
  gp.fga, 
  gp.fg_pct,
  gp.fg3m, 
  gp.fg3a, 
  gp.fg3_pct, 
  gp.ftm, 
  gp.fta, 
  gp.ft_pct, 
  gp.oreb, 
  gp.dreb, 
  gp.reb, 
  gp.ast, 
  gp.stl, 
  gp.blk, 
  gp.tov, 
  gp.pf, 
  gp.pts, 
  gp.plus_minus 
  FROM lnd.vw_game_player_stat gp
    left outer join rpt.fct_game_team fgt on ( gp.game_id = fgt.game_id and
											   gp.team_id = fgt.team_id )
    left outer join rpt.dim_player p on ( gp.player_id = p.id and 
									      replace(gp.season,'-','')::integer = p.season)											   
where gp.game_id = '0021400001'
  and gp.player_id = 2422
limit 100  
