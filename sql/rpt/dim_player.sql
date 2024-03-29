﻿with new_values as
(
select 
  public.hash8(a.person_id|| '|' || now()) dim_player_guid,
  a.person_id|| '|' || now() crc_str,
  a.person_id id,
  coalesce(fp.id, fpx.id) fd_id,
  coalesce(p.first_name, trim(split_part(a.display_last_comma_first,',',2))) first_name, 
  coalesce(p.last_name, trim(split_part(a.display_last_comma_first,',',1))) last_name,
  coalesce(p.display_first_last, trim(split_part(a.display_last_comma_first,',',2)) || ' ' || trim(split_part(a.display_last_comma_first,',',1)) ) display_first_last,
  coalesce(p.display_last_comma_first, a.display_last_comma_first) display_last_comma_first,
  p.display_fi_last,
  p.birthdate,
  p.school,
  p.country,
  p.last_affiliation,
  split_part(p.height,'-',1)::integer * 12 + split_part(p.height,'-',2)::integer height,
  p.weight,
  p.season_exp,
  p.jersey,
  p.position nba_pos,
  coalesce(fp.position,fpx.POSITION) fd_pos,
  dk.position dk_pos,
  p.rosterstatus,
  p.team_id,
  p.team_name,
  p.team_abbreviation team_abbrv,
  p.team_code,
  p.team_city,
  coalesce(p.playercode, a.playercode) playercode,
  coalesce(p.from_year, a.from_year) from_year,
  coalesce(p.to_year, a.to_year) to_year,
  p.dleague_flag,
  coalesce(p.games_played_flag, a.games_played_flag) games_played_flag
from lnd.vw_players_all a
left outer join lnd.vw_player_info p on ( a.person_id = p.person_id ) 
left join stg.xlat_player xp on (p.person_id = xp.player_id )
left JOIN lnd.vw_fd_players fp ON 
	replace(upper(coalesce(p.display_first_last, trim(split_part(a.display_last_comma_first,',',2)) || ' ' || trim(split_part(a.display_last_comma_first,',',1)) )),'.','') = replace(upper(fp.first_name),'.','') || ' ' || upper(fp.last_name) 
left JOIN lnd.vw_fd_players fpx ON 
	upper(xp.src_name) = replace(upper(fpx.first_name),'.','') || ' ' || upper(fpx.last_name) 
left outer join lnd.vw_dk_players dk on (p.display_first_last = dk.name)
WHERE a.person_id in (select player_id 
	                FROM lnd.vw_game_player_stat )
),
update_deactv as
(
update rpt.dim_player da
set 
  updated_at = now(),
  end_date	 = now(),
  is_active	 = false
from new_values nv
where da.id = nv.id
and da.is_active = true
and (da.fd_id <>					  nv.fd_id OR
	 da.first_name <>                 nv.first_name OR 
	 da.last_name <>                  nv.last_name OR 
	 da.display_first_last <>         nv.display_first_last OR 
	 da.display_last_comma_first <>   nv.display_last_comma_first OR 
	 da.display_fi_last <>            nv.display_fi_last OR 
	 da.birthdate <>                  nv.birthdate OR 
	 da.school <>                     nv.school OR 
	 da.country <>                    nv.country OR 
	 da.last_affiliation <>           nv.last_affiliation OR 
	 da.height <>                     nv.height OR 
	 da.weight <>                     nv.weight OR 
	 da.season_exp <>                 nv.season_exp OR 
	 da.jersey <>                     nv.jersey OR 
	 da.nba_pos <>                    nv.nba_pos OR 
	 da.fd_pos <>                     nv.fd_pos OR 
	 da.dk_pos <>                     nv.dk_pos OR 
	 da.rosterstatus <>               nv.rosterstatus OR 
	 da.team_id <>                    nv.team_id OR 
	 da.team_name <>                  nv.team_name OR 
	 da.team_abbrv <>                 nv.team_abbrv OR 
	 da.team_code <>                  nv.team_code OR 
	 da.team_city <>                  nv.team_city OR 
	 da.playercode <>                 nv.playercode OR 
	 da.from_year <>                  nv.from_year OR 
	 da.to_year <>                    nv.to_year OR 
	 da.dleague_flag <>               nv.dleague_flag OR 
	 da.games_played_flag <>          nv.games_played_flag)
returning da.*
)
INSERT INTO rpt.dim_player(
            dim_player_guid, crc_str, id, fd_id, first_name, last_name, display_first_last, 
            display_last_comma_first, display_fi_last, birthdate, school, 
            country, last_affiliation, height, weight, season_exp, jersey, 
            nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
            team_code, team_city, playercode, from_year, to_year, dleague_flag, games_played_flag, 
            created_at, updated_at, is_active, start_date, end_date)
SELECT dim_player_guid, crc_str, id, fd_id, first_name, last_name, display_first_last, 
   display_last_comma_first, display_fi_last, birthdate, school, 
   country, last_affiliation, height, weight, season_exp, jersey, 
   nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
   team_code, team_city, playercode, from_year, to_year, dleague_flag, games_played_flag, 
   now(), now(), true, now(), null::timestamp
FROM new_values
where not exists ( select 1
		             from rpt.dim_player dp
		            where dp.id = new_values.id )
union
SELECT dim_player_guid, crc_str, id, fd_id, first_name, last_name, display_first_last, 
   display_last_comma_first, display_fi_last, birthdate, school, 
   country, last_affiliation, height, weight, season_exp, jersey, 
   nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
   team_code, team_city, playercode, from_year, to_year, dleague_flag, games_played_flag, 
   now(), now(), true, now(), null::timestamp
 FROM new_values
 where exists ( select 1
		          from update_deactv up
		         where up.id = new_values.id )
		     
