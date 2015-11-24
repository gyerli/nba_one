/*
TO DO
===========================
1) Add opponent team's defensive rating/efficiency
2) Add own team's offensive rating/efficiency
*/

SELECT 
  player,
  player_id,
--  p.position,
--  lnd.get_pos(p.POSITION) nba_pos,
  fd_position,
  team_abbrv,
  opponent,
  salary,
  fppg,
  --rank() OVER (partition by season, fd_position order by minutes_rank + reb_rank + ast_rank + blk_rank + pts_rank + stl_rank ASC) ictsh_rank,
  rank() OVER (partition by season, fd_position order by usg_rank + reb_rank + ast_rank + blk_rank + pts_rank + stl_rank ASC) ictsh_rank,
  rank() OVER (partition by season, fd_position order by pr_usg_rank + pr_reb_rank + pr_ast_rank + pr_blk_rank + pr_pts_rank + pr_stl_rank ASC) pr_ictsh_rank,
  usg_rank,
  pr_usg_rank,
  minutes_rank,
  pr_minutes_rank,
  reb_rank,
  pr_reb_rank,
  ast_rank,
  pr_ast_rank,
  blk_rank,
  pr_blk_rank,
  pts_rank,
  pr_pts_rank,
  stl_rank,
  pr_stl_rank,
  pace_rank,
  pie_rank,
  age,
  days_rest,

  usg_pct,
  
  min,
  dr_min,
  reb,
  dr_reb,  
  ast,
  dr_ast,
  blk,
  dr_blk,  
  pts,
  dr_pts,
  stl,
  dr_stl,
  pie,
  pace,
  plus_minus

FROM (
select 
  p.player_id,
  p.player,
  p.position,
  lnd.get_pos(p.POSITION) nba_pos,
  fp.position fd_position,
  p.age,
  lnd.get_player_days_rest(p.player_id, p.season) days_rest,
  fp.fppg,
  fp.salary,
  t.team_abbrv,
  fp.opponent,
  rank() over (partition by pl.season, fp.position order by pa.usg_pct::float desc) usg_rank,
  rank() over (partition by pl.season, fp.position order by pl.min::float desc) minutes_rank,
  rank() over (partition by pl.season, fp.position order by pl.reb::float desc) reb_rank,
  rank() over (partition by pl.season, fp.position order by pl.ast::float desc) ast_rank,
  rank() over (partition by pl.season, fp.position order by pl.blk::float desc) blk_rank,
  rank() over (partition by pl.season, fp.position order by pl.pts::float desc) pts_rank,
  rank() over (partition by pl.season, fp.position order by pl.stl::float desc) stl_rank,
  rank() over (partition by pl.season, fp.position order by pa.pace::float desc) pace_rank,
  rank() over (partition by pl.season, fp.position order by pa.pie::float desc) pie_rank,

  rank() over (partition by pl.season, fp.position order by COALESCE(pra.usg_pct::float, pa.usg_pct::float) desc) pr_usg_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.min::float,pl.min::float) desc) pr_minutes_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.reb::float,pl.reb::float) desc) pr_reb_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.ast::float,pl.ast::float) desc) pr_ast_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.blk::float,pl.blk::float) desc) pr_blk_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.pts::float,pl.pts::float) desc) pr_pts_rank,
  rank() over (partition by pl.season, fp.position order by coalesce(pr.stl::float,pl.stl::float) desc) pr_stl_rank,

  pa.usg_pct,
  pl.min min,
  pr.min dr_min,
  pl.reb,
  pr.reb dr_reb,  
  pl.ast,
  pr.ast dr_ast,
  pl.blk,
  pr.blk dr_blk,
  pl.pts,
  pr.pts dr_pts,
  pl.stl,
  pr.stl dr_stl,
  pa.pie,
  pa.pace,
  pl.plus_minus,
  pl.season
  
from lnd.vw_player_overall_base pl
  INNER JOIN lnd.vw_player_overall_advanced pa on (pl.playerid = pa.playerid and pl.season = pa.season)
  inner join lnd.vw_players p on (pl.playerid = p.player_id and split_part(pl.season,'-',1)::int8 = p.season)
  LEFT OUTER JOIN lnd.vw_player_days_rest_base pr ON (pl.playerid = pr.playerid AND pl.season = pr.season AND pr.group_value = lnd.get_player_days_rest(p.player_id, p.season))
  LEFT OUTER JOIN lnd.vw_player_days_rest_advanced pra ON (pl.playerid = pra.playerid AND pl.season = pra.season AND pra.group_value = lnd.get_player_days_rest(p.player_id, p.season))
  inner join lnd.vw_teams t on (p.teamid = t.team_id)
  INNER join lnd.vw_fd_players fp on (p.player = fp.first_name || ' ' || fp.last_name)
where pl.season = '2015-16'  
and pl.min::float > 20
and t.team_id in ( select home_team_id from lnd.game_schedule WHERE game_date = to_char(current_date, 'YYYYMMDD')::int8
		     union 
		   select away_team_id from lnd.game_schedule WHERE game_date = to_char(current_date, 'YYYYMMDD')::int8)
AND (fp.injury_indicator is NULL or length(fp.injury_indicator) = 0)
) a
ORDER BY 
  fd_position,
  pr_ictsh_rank
