with new_values as
(
select 
  public.hash8(p.person_id|| '|' || now()) dim_player_guid,
  p.person_id|| '|' || now() crc_str,
  p.person_id id,
  p.first_name,
  p.last_name,
  p.display_first_last,
  p.display_last_comma_first,
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
  fd.position fd_pos,
  dk.position dk_pos,
  p.rosterstatus,
  p.team_id,
  p.team_name,
  p.team_abbreviation team_abbrv,
  p.team_code,
  p.team_city,
  p.playercode,
  p.from_year,
  p.to_year,
  p.dleague_flag,
  p.games_played_flag
from lnd.vw_player_info p 
left outer join lnd.vw_fd_players fd on (p.display_first_last = fd.first_name || ' ' || fd.last_name)
left outer join lnd.vw_dk_players dk on (p.display_first_last = dk.name)
--where person_id = 201571
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
and (da.first_name <>                 nv.first_name OR 
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
            dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
            display_last_comma_first, display_fi_last, birthdate, school, 
            country, last_affiliation, height, weight, season_exp, jersey, 
            nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
            team_code, team_city, playercode, from_year, to_year, dleague_flag, games_played_flag, 
            created_at, updated_at, is_active, start_date, end_date)
SELECT dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
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
SELECT dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
   display_last_comma_first, display_fi_last, birthdate, school, 
   country, last_affiliation, height, weight, season_exp, jersey, 
   nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
   team_code, team_city, playercode, from_year, to_year, dleague_flag, games_played_flag, 
   now(), now(), true, now(), null::timestamp
 FROM new_values
 where exists ( select 1
		          from update_deactv up
		         where up.id = new_values.id )
		     
