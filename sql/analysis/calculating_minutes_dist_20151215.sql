select
distinct
a.season,
a.team,
a.player,
a.player_id,
a.fd_pos,
format('%s %s', case when a.injury_indicator = 'O' then 'OUT' else a.injury_indicator end,a.injury_details) injury_info,
a.wk,
a.wkly_num_games,
a.tot_wkly_player_time,
a.tot_wkly_pos_time,
round((a.tot_wkly_player_time::numeric / a.tot_wkly_pos_time::numeric)::numeric,3) pct_wkly_player_time
from
(
select
ps.season,
ps.team,
ps.player,
ps.player_id,
p.fd_pos,
fd.injury_indicator,
injury_details,
gp.seconds,
extract('week' from gp.game_date) wk,
coalesce(gp.seconds,0) player_time,
coalesce(count(gp.seconds) over (partition by gp.season, gp.team_abbrv, p.fd_pos, ps.player_id, extract('week' from gp.game_date)),0) wkly_num_games,
coalesce(sum(gp.seconds) over (partition by gp.season, gp.team_abbrv, p.fd_pos, ps.player_id, extract('week' from gp.game_date)),0) tot_wkly_player_time,
sum(gp.seconds) over (partition by gp.season, gp.team_abbrv, p.fd_pos, extract('week' from gp.game_date)) tot_wkly_pos_time,
ps.game_date
from rpt.mvw_player_schedule ps
left outer join rpt.fct_game_player gp on ps.game_id = gp.game_id and ps.player_id = gp.player_id
left outer join rpt.dim_player p on ps.player_id = p.id and p.is_active = true
left outer join lnd.vw_fd_players fd on p.fd_id = fd.id
where ps.season = 201516
--and ps.team = 'MEM'
--and p.fd_pos is not null
--and ps.player = 'Jonas Valanciunas'
) a
where 1=1
and wk = extract('week' from current_date) -1 
--and fd_pos is null
--where a.game_date = current_date - 1
order by a.team, a.fd_pos, a.wk, a.player
;

-- 
-- select 
-- ps.player_id,
-- ps.player_name,
-- ps.team_abbreviation team_abbrv,
-- g.game_date,
-- trim(split_part(ps.comment,'-',1)) status_code,
-- trim(split_part(ps.comment,'-',2)) status_desc
-- from lnd.vw_game_player_stat ps
-- left join rpt.dim_game g on ps.game_id = g.id and replace(ps.season,'-','')::integer = g.season
-- --where comment is not null
-- where 1=1
-- and ps.player_name = 'Jonas Valanciunas'  
-- order by g.game_date desc
-- limit 100  
-- ;
-- 
-- select 
--     gp.player_id,
--     gp.team_id,
--     gp.team_abbrv,
--     gp.season,
--     min(gp.game_date) start_date,
-- 	max(gp.game_date) end_date
-- from rpt.fct_game_player gp
-- where player_name = 'Hedo Turkoglu'
-- group by     
-- gp.player_id,
-- gp.player_name,
-- gp.team_id,
-- gp.team_abbrv,
-- gp.season
-- order by gp.season, start_date
