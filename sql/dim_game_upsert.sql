with new_values 
as
(
SELECT
  public.hash8(ht.game_id) dim_game_guid,
  ht.game_id crc_str,
  ht.game_id id,
  ht.game_date,
  replace(ht.season,'-','')::integer season,
  CASE 
    WHEN ht.season_type = 'Regular+Season' THEN 'RS'
    WHEN ht.season_type = 'Playoffs' THEN 'PO'
    WHEN ht.season_type = 'Pre+Season' THEN 'PS'
    ELSE 'U'
  END season_type,  
  ht.matchup,
  ht.team_id home_team_id,
  ht.team_abbreviation home_team_abbrv,
  rt.team_id road_team_id,
  rt.team_abbreviation road_team_abbrv,
  CASE 
    WHEN ht.wl = 'W' THEN 'H'
    ELSE 'R'
  END WL,
  ht.pts ht_pts,
  rt.pts rt_pts,
  ht.min minutes  
FROM  
  lnd.vw_games ht
    INNER JOIN lnd.vw_games rt ON ( ht.game_id = rt.game_id AND
                                    ht.team_id != rt.team_id AND
                                    rt.matchup like '%@%')
),
upsert as
(
UPDATE rpt.dim_game g
SET 
  crc_str=nv.crc_str, 
  id=nv.id, 
  game_date=nv.game_date, 
  season=nv.season, 
  season_type=nv.season_type, 
  matchup=nv.matchup, 
  home_team_id=nv.home_team_id, 
  home_team_abbrv=nv.home_team_abbrv, 
  road_team_id=nv.road_team_id, 
  road_team_abbrv=nv.road_team_abbrv, 
  wl=nv.wl, 
  ht_pts=nv.ht_pts, 
  rt_pts=nv.rt_pts, 
  minutes=nv.minutes, 
  updated_at=now(),
  is_active=true
from new_values nv
where g.dim_game_guid = nv.dim_game_guid
returning g.*  
)
INSERT INTO rpt.dim_game(
            dim_game_guid, crc_str, id, game_date, season, season_type, matchup, 
            home_team_id, home_team_abbrv, road_team_id, road_team_abbrv, 
            wl, ht_pts, rt_pts, minutes, created_at, updated_at, is_active, 
            start_date, end_date)
SELECT dim_game_guid, crc_str, id, game_date, season, season_type, matchup, 
       home_team_id, home_team_abbrv, road_team_id, road_team_abbrv, 
       wl, ht_pts, rt_pts, minutes, now(), now(), true, 
       now(), null
  FROM new_values
 where not exists ( select 1 
                      from upsert up
                     where up.dim_game_guid = new_values.dim_game_guid )
;            