select
  t.dim_player_guid,
  t.crc_str,
  t.player_id,
  team_id,
  team_abbrv,
  t.season,
  t.player_name,
  t.pos,
  fd.position fd_pos,
  dk.position dk_pos,
  coalesce(fd.position, dk.position, t.pos) pos,
  t.dob
from 
(
select 
  public.hash8(pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) dim_player_guid,
  (pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) crc_str,
  pts.player_id::integer player_id,
  pts.team_id, 
  t.team_abbrv team_abbrv, 
  replace(pts.season_id,'-','')::integer season,
  trim(trim(split_part(pa.display_last_comma_first,',',2)) || ' ' || trim(split_part(pa.display_last_comma_first,',',1))) player_name,
  p.position pos,
  (split_part(p.height,'-',1)::integer * 12 + split_part(p.height,'-',2)::integer) height,
  p.weight,
  p.birth_date dob,
  p.age,
  p.school
from lnd.vw_players p
left outer join stg.vw_player_team_season pts on (pts.player_id = p.player_id and 
						  pts.team_id = p.teamid and
						  pts.season_id = p.l_season)
left outer join lnd.vw_teams t on (pts.team_id = t.team_id)									 
left outer join lnd.vw_players_all pa on (pts.player_id = pa.person_id)
where 1=1
and pa.playercode not like '%HISTADD%'
) t
left outer join lnd.vw_fd_players fd on (t.player_name = fd.first_name || ' ' || fd.last_name)
left outer join lnd.vw_dk_players dk on (t.player_name = dk.name)
order by player_id
;

/*
select
  t.dim_player_guid,
  t.crc_str,
  t.player_id,
  team_id,
  team_abbrv,
  t.season,
  t.player_name,
--   t.pos,
--   fd.position fd_pos,
--   dk.position dk_pos,
  coalesce(fd.position, dk.position, t.pos) pos,
  t.dob
from 
(
select 
  public.hash8(pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) dim_player_guid,
  (pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) crc_str,
  pts.player_id::integer player_id,
  pts.team_id , 
  t.team_abbrv team_abbrv, 
  replace(pts.season_id,'-','')::integer season,
  trim(trim(split_part(pa.display_last_comma_first,',',2)) || ' ' || trim(split_part(pa.display_last_comma_first,',',1))) player_name, 
  --pa.display_last_comma_first,
  --pa.playercode,
  first_value(p.position) over (partition by pts.player_id ORDER BY pts.season_id desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) pos,
  first_value(p.birth_date) over (partition by pts.player_id ORDER BY pts.season_id desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) dob
  --first_value(p.weight) over (partition by pts.player_id ORDER BY pts.season_id desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)::double precision weight,
  --first_value((split_part(p.height,'-',1)::integer * 12 + split_part(p.height,'-',2)::integer)) over 
--	(partition by pts.player_id ORDER BY pts.season_id desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)::double precision height
from stg.vw_player_team_season pts
left outer join lnd.vw_players p on (pts.player_id = p.player_id and 
				     pts.team_id = p.teamid and
				     pts.season_id = p.l_season)
left outer join lnd.vw_teams t on (pts.team_id = t.team_id)									 
left outer join lnd.vw_players_all pa on (pts.player_id = pa.person_id)
where pa.playercode not like '%HISTADD%'
--where pts.player_id=1626204
) t
left outer join lnd.vw_fd_players fd on (t.player_name = fd.first_name || ' ' || fd.last_name)
left outer join lnd.vw_dk_players dk on (t.player_name = dk.name)
order by player_id, season asc
*/
