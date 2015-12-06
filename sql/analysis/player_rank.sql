select *
from 
(
select 
ps.*,
pc.player_id,
pc.game_id,
pc.player_name,
pc.nba_pos,
fp.position fd_pos,
fp.salary,
fp.injury_indicator,
fp.injury_details,
pc.game_date,
pc.player_dr,
ps.team,
ps.opponent opp,
pc.team_loc,

dense_rank() over (partition by fp.position order by pc.moving_avg_fdpts desc) min_rank,
dense_rank() over (partition by fp.position order by pc.rest_mins desc) rest_min_rank,
dense_rank() over (partition by fp.position order by pc.loc_mins desc) loc_min_rank,

dense_rank() over (partition by fp.position order by pc.moving_avg_min desc) fdpts_rank,
dense_rank() over (partition by fp.position order by pc.rest_fdpts desc) rest_fdpts_rank,
dense_rank() over (partition by fp.position order by pc.loc_fdpts desc) loc_fdpts_rank,

dense_rank() over (partition by fp.position order by pc.pie_season desc) pie_season_rank,
dense_rank() over (partition by fp.position order by pc.loc_pie desc) loc_pie_rank,
dense_rank() over (partition by fp.position order by pc.rest_pie desc) rest_pie_rank,

pc.opp_w_pct,
pc.opp_off_rating,
pc.opp_def_rating,
pc.opp_net_rating,

pc.d_fg_pct,
pc.normal_fg_pct,
pc.pct_plusminus,

pc.moving_avg_min,
pc.rest_mins,
pc.loc_mins,

pc.rest_fdpts,
pc.loc_fdpts,

pc.pie_season,
pc.rest_pie,
pc.loc_pie
from rpt.mvw_player_schedule ps
    inner join ( select t.*,
		        row_number() over ( partition by player_id order by game_date desc) rn
                   from rpt.mvw_player_consolidated t ) pc on ( ps.player_id = pc.player_id and
						                pc.rn = 1)
    inner JOIN lnd.vw_fd_players fp ON ps.player = (fp.first_name || ' ' || fp.last_name)
    LEFT JOIN lnd.vw_team_general_location_advanced tla_opp ON gp.opp_team_id = tla_opp.teamid AND gp.season = replace(tla_opp.season::text, '-'::text, ''::text)::integer AND gp.opp_team_loc::text = tla_opp.team_game_location::text
where ps.game_date = to_char('now'::date::timestamp with time zone, 'YYYYMMDD')::bigint
) a
order by 
a.fd_pos, 
a.min_rank + a.rest_min_rank + a.loc_min_rank + a.fdpts_rank + a.rest_fdpts_rank + a.loc_fdpts_rank + a.pie_season_rank + a.loc_pie_rank + a.rest_pie_rank 