-- Materialized View: rpt.mvw_player_schedule

DROP MATERIALIZED VIEW rpt.mvw_player_schedule;

CREATE MATERIALIZED VIEW rpt.mvw_player_schedule AS 
 SELECT p.player,
    p.player_id,
    s.id game_id,
    p.age,
    'Home'::text AS loc,
    t.team_id,
    t.team_abbrv AS team,
    ta.team_id AS opponent_team_id,
    ta.team_abbrv AS opponent,
    'Road'::text AS opp_loc,
    s.season AS season_str,
    replace(s.season::text, '-'::text, ''::text)::integer AS season,
    s.game_date
   FROM rpt.dim_game s
     JOIN lnd.vw_teams t ON s.home_team_id = t.team_id
     JOIN lnd.vw_teams ta ON s.road_team_id = ta.team_id
     JOIN lnd.vw_players p ON t.team_id = p.teamid
  WHERE p.season = split_part(s.season::text, '-'::text, 1)::bigint
UNION
 SELECT p.player,
    p.player_id,
    s.id game_id,
    p.age,
    'Road'::text AS loc,
    t.team_id,
    t.team_abbrv AS team,
    th.team_id AS opponent_team_id,
    th.team_abbrv AS opponent,
    'Home'::text AS opp_loc,
    s.season AS season_str,
    replace(s.season::text, '-'::text, ''::text)::integer AS season,
    s.game_date
   FROM rpt.dim_game s
     JOIN lnd.vw_teams t ON s.road_team_id = t.team_id
     JOIN lnd.vw_teams th ON s.home_team_id = th.team_id
     JOIN lnd.vw_players p ON t.team_id = p.teamid
  WHERE p.season = split_part(s.season::text, '-'::text, 1)::bigint
WITH DATA;

ALTER TABLE rpt.mvw_player_schedule
  OWNER TO ictsh;
