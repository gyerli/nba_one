select * from ml.pr where to_date(game_date,'YYYY-MM-DD') between current_date -2 and current_date
order by game_date desc
drop view ml.pr;
create or replace view ml.pr
as

SELECT
ps.player,
--ps.player_id,
ps.loc,
--ps.team_id,
ps.team,
--ps.opponent_team_id,
ps.opponent,
ps.opp_loc,
ps.game_date::TEXT game_date,
ps.game_date - p.birthdate age_in_days,
to_char(ps.game_date,'MON') mnth,
case 
  when ps.game_date between s.regular_season_start and s.regular_season_end then 'RS'
  when ps.game_date between s.playoffs_start and s.playoffs_end then 'PO'
  ELSE 'UNK'
end season_type,

case 
  when ps.game_date between s.regular_season_start and s.all_star_date then 'B'
  when ps.game_date between s.all_star_date and s.regular_season_end then 'A'
  ELSE 'U'
end before_after_all_star,

ps.season_str,
CASE WHEN gp.seconds = 0 THEN NULL ELSE gp.seconds END AS seconds,
gp.ast * 1.5 + gp.reb * 1.2 + gp.pts + gp.stl * 2 + gp.blk * 2 - gp.tov AS fdpts,
avg(gp.ast * 1.5 + gp.reb * 1.2 + gp.pts + gp.stl * 2 + gp.blk * 2 - gp.tov) over (partition by ps.player_id, ps.season) AS avg_fdpts,
lnd.get_days_rest(ps.game_date, lag(ps.game_date, 1) OVER (ORDER BY ps.season, ps.team_id, ps.player_id, ps.game_date)) AS player_days_rest,
lnd.get_days_rest(ps.game_date, lag(ps.game_date, 1) OVER (ORDER BY ps.season, ps.opponent_team_id, ps.game_date)) AS opp_team_days_rest,
t.plus_minus,
t.pie,
t.def_rating,
t.pts,
t.fga,
t.pace,
t.efg_pct,
t.blka,
t.pts_fb,
t.tm_tov_pct,
t.off_rating,
t.pf,
t.oreb_pct,
t.pts_2nd_chance,
t.fta_rate,
t.reb_pct,
t.ft_pct,
t.dreb,
t.pts_off_tov,
t.fg3_pct,
t.blk,
t.pct_pts_2pt_mr,
t.pts_paint,
t.dreb_pct,
t.pct_pts_off_tov,
t.pfd,
t.fg3a,
t.pct_pts_3pt,
t.pct_pts_fb,
t.ts_pct,
t.pct_pts_paint,
t.stl,
t.ast,
t.pct_pts_2pt,
t.fg_pct,
t.pct_pts_ft,
t.oreb
FROM rpt.mvw_player_schedule ps
 left join rpt.dim_player p on ( ps.player_id = p.id and p.is_active = true)
 left join rpt.dim_season s on ( ps.season = s.id )
 LEFT JOIN rpt.fct_game_player gp ON ps.game_id = gp.game_id AND ps.player_id = gp.player_id
 LEFT JOIN rpt.fct_game_team t ON ps.game_id = t.game_id AND ps.opponent_team_id = t.team_id
WHERE 1=1
--and ps.game_date between current_date - 3 and current_date - 1
--and ps.game_date = current_date - 1
and ps.season >= 200809
--and ps.opponent_team_id = 1610612737
--and ps.player_id = 2045
AND gp.seconds > 0
--limit 100
