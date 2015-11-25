select 
  public.hash8(pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) dim_player_guid,
  (pts.player_id::integer||'|'||replace(pts.season_id,'-','')::integer||'|'||pts.team_id) crc_str,
  pts.player_id::integer player_id,
  coalesce(
	player, 
	initcap(split_part(replace(pa.playercode,'HISTADD_',''),'_',1)) || ' ' || initcap(split_part(replace(pa.playercode,'HISTADD_',''),'_',2)) ) player_name,
  pa.display_last_comma_first,
  pa.playercode,
  pts.team_id , 
  t.team_name team_name, 
  t.team_abbrv team_abbrv, 
  p.position pos, 
  replace(pts.season_id,'-','')::integer season, 
  (split_part(p.height,'-',1)::integer * 12 + split_part(p.height,'-',2)::integer) height, 
  p.weight::double precision weight, 
  p.birth_date dob, 
  p.age, 
  p.num jersey_num, 
  p.exp experience_years, 
  p.school
from stg.vw_player_team_season pts
left outer join lnd.vw_players p on (pts.player_id = p.player_id and 
									 pts.team_id = p.teamid and
									 pts.season_id = p.l_season)
left outer join lnd.vw_teams t on (pts.team_id = t.team_id)									 
left outer join lnd.vw_players_all pa on (pts.player_id = pa.person_id)
  
--where pts.player_id=1626204
order by season_id asc

