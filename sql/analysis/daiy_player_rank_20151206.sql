select
b.player,
b.player_id,
b.game_id,
b.age,
b.nba_pos,

b.fd_pos,
b.salary,
b.fppg,
b.injury,
b.injury_det,

b.loc,
b.team_id,
b.team_abbrv,
b.opp_team_id,
b.opp_team_abbrv,
b.season_str,
b.season,
b.game_date,
b.previous_game_date,
b.player_days_rest,

b.min_season,
b.fdpts_season,
b.pie_season,

b.min_loc,
b.fdpts_loc,
b.pie_loc,

COALESCE(dr_base.min, b.min_season) AS min_rest,
COALESCE(dr_base.ast * 1.5 + dr_base.reb * 1.2 + dr_base.pts + dr_base.stl * 2 + dr_base.blk * 2 - dr_base.tov, b.fdpts_season) AS fdpts_rest,
coalesce(dr_adv.pie, b.pie_season) as pie_rest,

b.opp_w_pct,
b.opp_off_rating,
b.opp_def_rating,
b.opp_net_rating,

opp_def.d_fgm,
opp_def.d_fga,
opp_def.d_fg_pct,
opp_def.normal_fg_pct,
opp_def.pct_plusminus
from 
(
select 
a.player,
a.player_id,
a.game_id,
a.age,
a.nba_pos,

a.fd_pos,
a.salary,
a.fppg,
a.injury,
a.injury_det,

a.loc,
a.team_id,
a.team_abbrv,
a.opp_team_id,
a.opp_team_abbrv,
a.season_str,
a.season,
a.game_date,
a.previous_game_date,
lnd.get_days_rest(a.game_date, a.previous_game_date) player_days_rest,

a.min_season,
a.fdpts_season,
a.pie_season,

a.min_loc,
a.fdpts_loc,
a.pie_loc,

a.opp_w_pct,
a.opp_off_rating,
a.opp_def_rating,
a.opp_net_rating

from
(
SELECT 
ps.player,
ps.player_id,
ps.game_id,
ps.age,
p.nba_pos,

fp.position fd_pos,
fp.salary,
fp.fppg,
fp.injury_indicator AS injury,
fp.injury_details AS injury_det,

ps.loc,
ps.team_id,
ps.team team_abbrv,
ps.opponent_team_id opp_team_id,
ps.opponent opp_team_abbrv,
ps.season_str,
ps.season,

to_date(ps.game_date::Text, 'YYYYMMDD') game_date,
to_date((lag(ps.game_date, 1) OVER (ORDER BY ps.season, ps.team_id, ps.player_id, ps.game_date))::TEXT,'YYYYMMDD') previous_game_date,

pb.min min_season,
pb.ast * 1.5 + pb.reb * 1.2 + pb.pts + pb.stl * 2 + pb.blk * 2 - pb.tov fdpts_season,
pa.pie pie_season,

ploc.min min_loc,
ploc.ast * 1.5 + ploc.reb * 1.2 + ploc.pts + ploc.stl * 2 + ploc.blk * 2 - ploc.tov fdpts_loc,
ploc_adv.pie pie_loc,

tla_opp.w_pct AS opp_w_pct,
tla_opp.off_rating AS opp_off_rating,
tla_opp.def_rating AS opp_def_rating,
tla_opp.net_rating AS opp_net_rating

from rpt.mvw_player_schedule ps
left join rpt.dim_player p on ps.player_id = p.id and p.is_active = true
left JOIN lnd.vw_fd_players fp ON ps.player = fp.first_name || ' ' || fp.last_name
LEFT JOIN lnd.vw_player_overall_advanced pa ON ps.player_id = pa.playerid AND ps.season_str = pa.season
LEFT JOIN lnd.vw_player_overall_base pb ON ps.player_id = pb.playerid AND ps.season_str = pb.season
LEFT JOIN lnd.vw_player_location_base ploc ON ps.player_id = ploc.playerid AND ps.season_str = ploc.season AND ps.loc = ploc.group_value
LEFT JOIN lnd.vw_player_location_advanced ploc_adv ON ps.player_id = ploc_adv.playerid AND ps.season_str = ploc_adv.season AND ps.loc = ploc_adv.group_value
LEFT JOIN lnd.vw_team_general_location_advanced tla_opp ON ps.opponent_team_id = tla_opp.teamid AND ps.season_str = tla_opp.season AND ps.opp_loc = tla_opp.team_game_location
) a
where a.game_date = current_date
--and a.team_abbrv = 'PHX'
) b
LEFT JOIN lnd.vw_player_days_rest_base dr_base ON b.player_id = dr_base.playerid AND b.season_str = dr_base.season AND dr_base.group_value = b.player_days_rest
LEFT JOIN lnd.vw_player_days_rest_advanced dr_adv ON b.player_id = dr_adv.playerid AND b.season_str = dr_adv.season AND dr_adv.group_value = b.player_days_rest
LEFT JOIN ( 
  SELECT pd.season,
    p.team_abbrv,
    p.team_id,
    p.nba_pos,
    round(avg(pd.d_fgm)::numeric, 3) AS d_fgm,
    round(avg(pd.d_fga)::numeric, 3) AS d_fga,
    round(avg(pd.d_fg_pct)::numeric, 3) AS d_fg_pct,
    round(avg(pd.normal_fg_pct)::numeric, 3) AS normal_fg_pct,
    round(avg(pd.pct_plusminus)::numeric, 3) AS pct_plusminus
   FROM lnd.vw_player_defense pd
     JOIN rpt.dim_player p ON pd.playerid = p.id
  WHERE pd.defense_category = 'Overall' 
    AND p.team_abbrv IS NOT NULL
  GROUP BY pd.season, p.team_abbrv, p.team_id, p.nba_pos) opp_def ON b.season_str = opp_def.season AND b.opp_team_id = opp_def.team_id AND b.nba_pos = opp_def.nba_pos
where fd_pos is not null
order by fd_pos, fppg desc 