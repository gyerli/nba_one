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
),
upsert_deactv as
(
update rpt.dim_player dp
   set 
  rosterstatus              = nv.rosterstatus,
  updated_at 		    = now(),
  end_date		    = now(),
  is_active		    = false
from new_values nv
where dp.id = nv.id
and dp.rosterstatus != nv.rosterstatus
returning dp.*
),
inserted_new as 
(
INSERT INTO rpt.dim_player(
            dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
            display_last_comma_first, display_fi_last, birthdate, school, 
            country, last_affiliation, height, weight, season_exp, jersey, 
            nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
            team_code, team_city, playercode, from_year, to_year, dleague_flag, 
            games_played_flag, created_at, updated_at, is_active, start_date, 
            end_date)
SELECT dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
       display_last_comma_first, display_fi_last, birthdate, school, 
       country, last_affiliation, height, weight, season_exp, jersey, 
       nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
       team_code, team_city, playercode, from_year, to_year, dleague_flag, 
       games_played_flag, now(), now(), true, now(), null
  FROM new_values
 where not exists ( select 1
		      from upsert_deactv up
		     where up.dim_player_guid = new_values.dim_player_guid )
)
INSERT INTO rpt.dim_player(
            dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
            display_last_comma_first, display_fi_last, birthdate, school, 
            country, last_affiliation, height, weight, season_exp, jersey, 
            nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
            team_code, team_city, playercode, from_year, to_year, dleague_flag, 
            games_played_flag, created_at, updated_at, is_active, start_date, 
            end_date)
SELECT dim_player_guid, crc_str, id, first_name, last_name, display_first_last, 
       display_last_comma_first, display_fi_last, birthdate, school, 
       country, last_affiliation, height, weight, season_exp, jersey, 
       nba_pos, fd_pos, dk_pos, rosterstatus, team_id, team_name, team_abbrv, 
       team_code, team_city, playercode, from_year, to_year, dleague_flag, 
       games_played_flag, now(), now(), true, now(), null
  FROM new_values
 where exists ( select 1
		      from upsert_deactv up
		     where up.dim_player_guid = new_values.dim_player_guid )