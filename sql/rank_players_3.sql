/* TODO
1) early personal foul
2) defensive rating of opponent
3) offensive rating of own team
*/
SELECT
    a.player, 
    a.pos, 
    a.loc, 
    a.team, 
    a.opponent,
    
    a.off_rating self_off_rating,
    a.def_rating opp_def_rating,
    
    a.self_off_rating_rank,
    a.opp_def_rating_rank,
  
    a.salary, 
    a.fppg,
    a.age, 
    a.days_rest,

    RANK() OVER (PARTITION BY season, pos ORDER BY a.usg_pct_rank + a.min_rank + a.pts_rank + a.reb_rank + a.ast_rank + a.blk_rank + a.stl_rank ASC) ictsh_rank,
    RANK() OVER (PARTITION BY season, pos ORDER BY a.pr_usg_pct_rank + a.pr_min_rank + a.pr_pts_rank + a.pr_reb_rank + a.pr_ast_rank + a.pr_blk_rank + a.pr_stl_rank ASC) pr_ictsh_rank,

    RANK() OVER (PARTITION BY season, pos ORDER BY a.usg_pct_rank + a.min_rank + a.pts_rank + a.reb_rank + a.ast_rank + a.blk_rank + a.stl_rank + a.opp_def_rating_rank ASC) ictsh_def_rate_rank,

    a.usg_pct_rank,
    a.pr_usg_pct_rank,
    a.min_rank,
    a.pr_min_rank,
    a.pts_rank,
    a.pr_pts_rank,
    a.reb_rank,
    a.pr_reb_rank,
    a.ast_rank,
    a.pr_ast_rank,
    a.blk_rank,
    a.pr_blk_rank,
    a.stl_rank,
    a.pr_stl_rank,
    a.tov_rank,
    a.pr_tov_rank,
    a.pie_rank,
    a.pr_pie_rank,
    
    a.usg_pct,
    a.pra_ugs_pct,
    a.min min,
    a.dr_min,
    a.reb,
    a.dr_reb,  
    a.ast,
    a.dr_ast,
    a.blk,
    a.dr_blk,
    a.pts,
    a.dr_pts,
    a.stl,
    a.dr_stl,
    a.tov,
    a.dr_tov,
    a.pie,
    a.pra_pie
FROM (
select 
    ps.player, fp.position pos, ps.loc, ps.team, ps.opponent, tla_c.off_rating, tla_o.def_rating , ps.season,
    fp.salary, fp.fppg,
    p.age, lnd.get_player_days_rest(p.player_id, p.season) days_rest,
    rank() over (partition by ps.season, fp.position order by pa.usg_pct::FLOAT DESC) usg_pct_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pra.usg_pct::FLOAT, pa.usg_pct::FLOAT) DESC) pr_usg_pct_rank,
    rank() over (partition by ps.season, fp.position order by po.min::FLOAT DESC)  min_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.min::FLOAT, po.min::FLOAT) DESC)  pr_min_rank,
    rank() over (partition by ps.season, fp.position order by po.pts::FLOAT DESC) pts_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.pts::FLOAT, po.pts::FLOAT) DESC) pr_pts_rank,
    rank() over (partition by ps.season, fp.position order by po.reb::FLOAT DESC) reb_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.reb::FLOAT, po.reb::FLOAT) DESC) pr_reb_rank,
    rank() over (partition by ps.season, fp.position order by po.ast::FLOAT DESC) ast_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.ast::FLOAT, po.ast::FLOAT) DESC) pr_ast_rank,
    rank() over (partition by ps.season, fp.position order by po.blk::FLOAT DESC) blk_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.blk::FLOAT, po.blk::FLOAT) DESC) pr_blk_rank,
    rank() over (partition by ps.season, fp.position order by po.stl::FLOAT DESC) stl_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.stl::FLOAT, po.stl::FLOAT) DESC) pr_stl_rank,
    rank() over (partition by ps.season, fp.position order by po.tov::FLOAT ASC) tov_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pr.tov::FLOAT, po.tov::FLOAT) ASC) pr_tov_rank,
    rank() over (partition by ps.season, fp.position order by pa.pie::FLOAT DESC) pie_rank,
    rank() over (partition by ps.season, fp.position order by COALESCE(pra.pie::FLOAT, pa.pie::FLOAT) DESC) pr_pie_rank,

    dense_RANK() OVER (PARTition by ps.season order by tla_o.def_rating DESC) opp_def_rating_rank,
    dense_RANK() OVER (PARTition by ps.season order by tla_c.off_rating desc) self_off_rating_rank,
    pa.usg_pct,
    coalesce(pra.usg_pct, pa.usg_pct) pra_ugs_pct,
    po.min min,
    coalesce(pr.min, po.min) dr_min,
    po.reb,
    coalesce(pr.reb, po.reb) dr_reb,  
    po.ast,
    coalesce(pr.ast, po.ast) dr_ast,
    po.blk,
    coalesce(pr.blk, po.blk) dr_blk,
    po.pts,
    coalesce(pr.pts, po.pts) dr_pts,
    po.stl,
    coalesce(pr.stl, po.stl) dr_stl,
    po.tov,
    coalesce(pr.tov, po.tov) dr_tov,
    
    pa.pie,
    coalesce(pra.pie, pa.pie) pra_pie
  from lnd.vw_player_schedule ps
    inner join lnd.vw_players p on (ps.player_id = p.player_id and 
				    split_part(ps.season,'-',1)::int8 = p.season)
    INNER join lnd.vw_fd_players fp on (ps.player = fp.first_name || ' ' || fp.last_name AND
					(fp.injury_indicator is NULL or length(fp.injury_indicator) = 0))
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

) a						
ORDER BY 
  pos,
  ictsh_def_rate_rank,
  pr_ictsh_rank,
  ictsh_rank
     