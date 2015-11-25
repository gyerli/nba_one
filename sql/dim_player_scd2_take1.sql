with new_values as
(
select 
  public.hash8(p.person_id) dim_player_guid,
  p.person_id crc_str,
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
  crc_str                   = nv.crc_str,
  id                        = nv.id,
  first_name                = nv.first_name,
  last_name                 = nv.last_name,
  display_first_last        = nv.display_first_last,
  display_last_comma_first  = nv.display_last_comma_first,
  display_fi_last           = nv.display_fi_last,
  birthdate                 = nv.birthdate,
  school                    = nv.school,
  country                   = nv.country,
  last_affiliation          = nv.last_affiliation,
  height                    = nv.height,
  weight                    = nv.weight,
  season_exp                = nv.season_exp,
  jersey                    = nv.jersey,
  nba_pos                   = nv.nba_pos,
  fd_pos                    = nv.fd_pos,
  dk_pos                    = nv.dk_pos,
  rosterstatus              = nv.rosterstatus,
  team_id                   = nv.team_id,
  team_name                 = nv.team_name,
  team_abbrv                = nv.team_abbrv,
  team_code                 = nv.team_code,
  team_city                 = nv.team_city,
  playercode                = nv.playercode,
  from_year                 = nv.from_year,
  to_year                   = nv.to_year,
  dleague_flag              = nv.dleague_flag,
  games_played_flag         = nv.games_played_flag,
  updated_at 		    = now(),
  is_active		    = true
from new_values nv
where dp.dim_player_guid = nv.dim_player_guid
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