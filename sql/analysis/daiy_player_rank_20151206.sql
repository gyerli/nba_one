select 
player,
age,
nba_pos,
fd_pos,
salary,
fppg,
injury,
injury_det,
rotowire_caption,
min_inj_dist,

loc,
team_abbrv,
opp_team_abbrv,
season_str,
player_days_rest,

min_season_rank + min_pot_inj_rank + 
fdpts_season_rank + usg_pct_season_rank + pie_season_rank + 
min_loc_rank + fdpts_loc_rank + usg_pct_loc_rank + pie_loc_rank + 
min_rest_rank + fdpts_rest_rank + usg_pct_rest_rank + pie_rest_rank + 
opp_w_pct_rank + opp_def_rating_rank + pct_plusminus_rank tot_rank,

min_season_rank + ((-20/min_pot_inj_rank)+min_pot_inj_rank) + 
fdpts_season_rank + usg_pct_season_rank + pie_season_rank + 
min_loc_rank + fdpts_loc_rank + usg_pct_loc_rank + pie_loc_rank + 
min_rest_rank + fdpts_rest_rank + usg_pct_rest_rank + pie_rest_rank + 
opp_w_pct_rank + opp_def_rating_rank + ((-20/pct_plusminus_rank)+pct_plusminus_rank) adj_tot_rank,

min_season_rank,
min_pot_inj_rank,
fdpts_season_rank,
usg_pct_season_rank,
pie_season_rank,

min_loc_rank,
fdpts_loc_rank,
usg_pct_loc_rank,
pie_loc_rank,

min_rest_rank,
fdpts_rest_rank,
usg_pct_rest_rank,
pie_rest_rank,

opp_w_pct_rank,
opp_def_rating_rank,

pct_plusminus,
pct_plusminus_rank


from
(
select
b.player,
b.age,
b.nba_pos,

b.fd_pos,
b.salary,
b.fppg,
b.injury,
b.injury_det,
b.rotowire_caption,
team_inj.min_inj_dist,

b.loc,
b.team_abbrv,
b.opp_team_abbrv,
b.season_str,
b.player_days_rest,

case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.min_season,0) desc) end min_season_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by b.min_season + coalesce(team_inj.min_inj_dist,0) desc) end min_pot_inj_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.fdpts_season,0) desc) end fdpts_season_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.usg_pct_season,0) desc) end usg_pct_season_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.pie_season,0) desc) end pie_season_rank,

case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.min_loc,0) desc) end min_loc_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.fdpts_loc,0) desc) end fdpts_loc_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.usg_pct_loc,0) desc) end usg_pct_loc_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.pie_loc,0) desc) end pie_loc_rank,

case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by COALESCE(dr_base.min, b.min_season) desc ) end AS min_rest_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by COALESCE(dr_base.ast * 1.5 + dr_base.reb * 1.2 + dr_base.pts + dr_base.stl * 2 + dr_base.blk * 2 - dr_base.tov, b.fdpts_season) desc) end AS fdpts_rest_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(dr_adv.usg_pct, b.usg_pct_season) desc) end as usg_pct_rest_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(dr_adv.pie, b.pie_season) desc) end as pie_rest_rank,

case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.opp_w_pct,0) asc) end opp_w_pct_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(b.opp_def_rating,0) desc) end opp_def_rating_rank,
case when b.injury = 'O' then 99 else dense_rank() over (partition by b.fd_pos order by coalesce(opp_def.pct_plusminus,0) desc) end pct_plusminus_rank,
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
a.rotowire_caption,

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
a.usg_pct_season,
a.pie_season,

a.min_loc,
a.fdpts_loc,
a.usg_pct_loc,
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
rw.listitemcaption rotowire_caption,

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
pa.usg_pct usg_pct_season,
pa.pie pie_season,


ploc.min min_loc,
ploc.ast * 1.5 + ploc.reb * 1.2 + ploc.pts + ploc.stl * 2 + ploc.blk * 2 - ploc.tov fdpts_loc,
ploc_adv.usg_pct usg_pct_loc,
ploc_adv.pie pie_loc,

tla_opp.w_pct AS opp_w_pct,
tla_opp.off_rating AS opp_off_rating,
tla_opp.def_rating AS opp_def_rating,
tla_opp.net_rating AS opp_net_rating

from rpt.mvw_player_schedule ps
left join rpt.dim_player p on ps.player_id = p.id and p.is_active = true
left JOIN lnd.vw_fd_players fp ON upper(ps.player) = replace(upper(fp.first_name),'.','') || ' ' || upper(fp.last_name)
LEFT JOIN lnd.vw_player_overall_advanced pa ON ps.player_id = pa.playerid AND ps.season_str = pa.season
LEFT JOIN lnd.vw_player_overall_base pb ON ps.player_id = pb.playerid AND ps.season_str = pb.season
LEFT JOIN lnd.vw_player_location_base ploc ON ps.player_id = ploc.playerid AND ps.season_str = ploc.season AND ps.loc = ploc.group_value
LEFT JOIN lnd.vw_player_location_advanced ploc_adv ON ps.player_id = ploc_adv.playerid AND ps.season_str = ploc_adv.season AND ps.loc = ploc_adv.group_value
LEFT JOIN lnd.vw_team_general_location_advanced tla_opp ON ps.opponent_team_id = tla_opp.teamid AND ps.season_str = tla_opp.season AND ps.opp_loc = tla_opp.team_game_location
left join ( select 
			playerid, 
			listitemcaption, 
			row_number() over (partition by playerid order by listitempubdate desc) rn 
			from lnd.vw_player_rotowire) rw on ps.player_id = rw.playerid and rw.rn = 1
where pb.min > 15
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
    fp1.position,
    round(avg(pb.min/1+pd.d_fgm)::numeric, 3) AS d_fgm,
    round(avg(pb.min/1+pd.d_fga)::numeric, 3) AS d_fga,
    round(avg(pb.min/1+pd.d_fg_pct)::numeric, 3) AS d_fg_pct,
    round(avg(pb.min/1+pd.normal_fg_pct)::numeric, 3) AS normal_fg_pct,
    round(avg(pb.min/1+pd.pct_plusminus)::numeric, 3) AS pct_plusminus
   FROM lnd.vw_player_defense pd
     JOIN rpt.dim_player p ON pd.playerid = p.id
     left outer join lnd.vw_player_overall_base pb on (pd.playerid = pb.playerid and pd.season = pb.season)
     left join lnd.vw_fd_players fp1 on (replace(upper(p.first_name),'.','') = upper(fp1.first_name) and 
										 p.last_name = fp1.last_name and
										 p.is_active = true)
  WHERE pd.defense_category = 'Overall' 
    AND p.team_abbrv IS NOT NULL
  GROUP BY pd.season, p.team_abbrv, p.team_id, fp1.position) opp_def ON b.season_str = opp_def.season AND b.opp_team_id = opp_def.team_id AND b.fd_pos = opp_def.position
left join ( SELECT 
		  p1.team_id, 
		  fp1.position, 
		  sum(po1.min) min_inj_dist
		FROM lnd.vw_fd_players fp1    
		inner join rpt.dim_player p1 ON (replace(upper(p1.first_name),'.','') = upper(fp1.first_name) and 
										 p1.last_name = fp1.last_name and
										 p1.is_active = true)
		INNER JOIN lnd.vw_player_overall_base po1 ON (p1.id  = po1.playerid AND 
													  po1.season = '2015-16' )
		WHERE (fp1.injury_indicator = 'O')
		GROUP BY p1.team_id, fp1.position) team_inj on ( b.team_id = team_inj.team_id and b.fd_pos = team_inj.position )
where 1=1
--and fd_pos is not null
) c
where 1=1
--and team_abbrv = 'TOR'
order by fd_pos,adj_tot_rank