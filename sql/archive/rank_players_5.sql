/*
1) Distribute injured player's minutes to all players
2) Distribute injured player's minutes to related position players
*/
SELECT ROW_NUMBER() over (partition BY season, pos order by player) gr,
  a.player,
  a.pos,
  RANK() OVER (PARTITION BY season, pos ORDER BY a.pts_rank + a.pie_rank + a.min_rank + a.usg_pct_rank + a.tov_rank + a.reb_rank + a.ast_rank + a.stl_rank + a.blk_rank ) ictsh_rank,
  a.loc,
  a.team,
  a.opponent,
  a.salary,
  a.fppg,
  a.min,
  coalesce(a.sm_min,0) avail_min_inj,
  a.injury,
  a.injury_det,
  a.off_rating,
  a.def_rating,
  pts_rank,
  pie_rank,
  min_rank,
  usg_pct_rank,
  tov_rank,
  reb_rank,
  ast_rank,
  stl_rank,
  blk_rank,
  a.age,
  a.days_rest,
  a.game_date
FROM
  (SELECT 
    ps.player,
    fp.position pos,
    ps.loc,
    ps.team,
    ps.opponent,
    ps.game_date,
    tla_c.off_rating,
    tla_o.def_rating ,
    ps.season,
    fp.salary,
    fp.fppg,
    fp.injury_indicator injury,
    fp.injury_details injury_det,
    p.age,
    lnd.get_player_days_rest(p.player_id, p.season) days_rest,
    rank() over (partition BY ps.season, fp.position order by po.pts     * 0.8715039 DESC) pts_rank,
    rank() over (partition BY ps.season, fp.position order by pa.pie     * 0.7958694 DESC) pie_rank,
    rank() over (partition BY ps.season, fp.position order by po.min     * 0.7457481 DESC) min_rank,
    rank() over (partition BY ps.season, fp.position order by pa.usg_pct * 0.7006278 DESC) usg_pct_rank,
    rank() over (partition BY ps.season, fp.position order by po.tov     * 0.6086654 ASC) tov_rank,
    rank() over (partition BY ps.season, fp.position order by po.reb     * 0.5533486 DESC) reb_rank,
    rank() over (partition BY ps.season, fp.position order by po.ast     * 0.4750345 DESC) ast_rank,
    rank() over (partition BY ps.season, fp.position order by po.stl     * 0.4744307 DESC) stl_rank,
    rank() over (partition BY ps.season, fp.position order by po.blk     * 0.3305021 DESC) blk_rank,
    pa.usg_pct,COALESCE(pra.usg_pct, pa.usg_pct) pra_usg_pct,
    po.min MIN,COALESCE(pr.min, po.min) dr_min,
    po.reb,COALESCE(pr.reb, po.reb) dr_reb,
    po.ast,COALESCE(pr.ast, po.ast) dr_ast,
    po.blk,COALESCE(pr.blk, po.blk) dr_blk,
    po.pts,COALESCE(pr.pts, po.pts) dr_pts,
    po.stl,COALESCE(pr.stl, po.stl) dr_stl,
    po.tov,COALESCE(pr.tov, po.tov) dr_tov,
    pa.pie,COALESCE(pra.pie, pa.pie) pra_pie,
    inj_p.sm_min
  FROM stg.vw_player_schedule ps
  INNER JOIN lnd.vw_players p ON (ps.player_id = p.player_id AND 
                                  split_part(ps.season,'-',1)::int8 = p.season)
  INNER JOIN lnd.vw_fd_players fp ON (ps.player = fp.first_name || ' ' || fp.last_name)
  INNER JOIN lnd.vw_player_overall_base po ON (ps.player_id  = po.playerid AND 
                                               ps.season     = po.season )
  INNER JOIN lnd.vw_player_overall_advanced pa ON (ps.player_id = pa.playerid AND 
                                                  ps.season    = pa.season)
  LEFT OUTER JOIN lnd.vw_player_days_rest_base pr ON (po.playerid = pr.playerid AND 
                                                      po.season = pr.season AND 
                                                      pr.group_value = lnd.get_player_days_rest(p.player_id, p.season))
  LEFT OUTER JOIN lnd.vw_player_days_rest_advanced pra ON (po.playerid     = pra.playerid AND 
                                                           po.season       = pra.season AND 
                                                           pra.group_value = lnd.get_player_days_rest(p.player_id, p.season))
  INNER JOIN lnd.vw_team_general_location_advanced tla_o ON (ps.opponent_team_id = tla_o.teamid AND 
                                                             ps.season           = tla_o.season AND 
                                                             ps.loc              = tla_o.team_game_location)
  INNER JOIN lnd.vw_team_general_location_advanced tla_c ON (ps.team_id     = tla_c.teamid AND 
                                                             ps.season      = tla_c.season AND 
                                                             ps.loc         = tla_c.team_game_location)
  LEFT OUTER JOIN ( SELECT p1.teamid, p1.season, sum(po1.min) sm_min
                      FROM lnd.vw_fd_players fp1    
                        inner join lnd.vw_players p1 ON (p1.player = fp1.first_name || ' ' || fp1.last_name)
                        INNER JOIN lnd.vw_player_overall_base po1 ON (p1.player_id  = po1.playerid AND 
                                                                     p1.season     = split_part(po1.season,'-',1)::int8 )
                      WHERE (fp1.injury_indicator = 'O')
                      GROUP BY p1.teamid, p1.season ) inj_p on (p.teamid = inj_p.teamid and p.season = inj_p.season)
                                                             
  WHERE ps.game_date = TO_CHAR('now'::text::DATE::TIMESTAMP WITH TIME ZONE, 'YYYYMMDD'::text)::bigint
  ) a
  --where team not in ('DET','LAC') and opponent not in ('LAC','DET')
--where team = 'ORL'
ORDER BY pos,
  ictsh_rank