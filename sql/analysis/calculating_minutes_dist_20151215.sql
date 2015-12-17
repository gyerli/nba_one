select
ps.team,
ps.player,
p.fd_pos,
extract('week' from gp.game_date) wk,
coalesce(gp.seconds,0) player_time,
coalesce(sum(gp.seconds) over (partition by gp.season, gp.team_abbrv, p.fd_pos, gp.game_date),0) pos_time,
round(coalesce(gp.seconds,0) / (sum(gp.seconds) over (partition by ps.season, ps.team, p.fd_pos, ps.game_date))::numeric,2) pct_game_time,
round(coalesce(gp.seconds,0) / (sum(gp.seconds) over (partition by ps.season, ps.team, p.fd_pos, extract('week' from gp.game_date)))::numeric,2) pct_wkly_time,
ps.game_date
from rpt.mvw_player_schedule ps
left outer join rpt.fct_game_player gp on ps.game_id = gp.game_id and ps.player_id = gp.player_id
left outer join rpt.dim_player p on ps.player_id = p.id and p.is_active = true
where ps.season = 201516
--and ps.team = 'MEM'
--and p.fd_pos is not null
--and ps.player = 'Jonas Valanciunas'
and ps.game_date between '2015-12-01' and current_date - 1
order by ps.team, p.fd_pos, ps.game_date
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
