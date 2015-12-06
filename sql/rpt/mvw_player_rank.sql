-- Materialized View: rpt.mvw_player_rank

DROP MATERIALIZED VIEW rpt.mvw_player_rank;

CREATE MATERIALIZED VIEW rpt.mvw_player_rank AS 
 SELECT row_number() OVER (PARTITION BY a.season, a.pos ORDER BY a.player) AS gr,
    a.player,
    a.pos,
    dense_rank() OVER (PARTITION BY a.season, a.pos ORDER BY a.pts_rank + a.pie_rank + a.min_rank + a.usg_pct_rank + a.tov_rank + a.reb_rank + a.ast_rank + a.stl_rank + a.blk_rank) AS ictsh_rank,
    dense_rank() OVER (PARTITION BY a.season, a.pos ORDER BY a.dr_pts_rank + a.dr_pie_rank + a.dr_min_rank + a.dr_usg_pct_rank + a.dr_tov_rank + a.dr_reb_rank + a.dr_ast_rank + a.dr_stl_rank + a.dr_blk_rank) AS dr_ictsh_rank,
    a.loc,
    a.team,
    a.opponent,
    a.salary,
    a.fppg,
    a.min,
    COALESCE(a.sm_min, 0::double precision) AS avail_min_inj,
    a.injury,
    a.injury_det,
    a.off_rating,
    a.def_rating,
    a.pts_rank,
    a.pie_rank,
    a.min_rank,
    a.usg_pct_rank,
    a.tov_rank,
    a.reb_rank,
    a.ast_rank,
    a.stl_rank,
    a.blk_rank,
    a.age,
    a.days_rest,
    a.game_date
   FROM ( SELECT ps.player,
            fp."position" AS pos,
            ps.loc,
            ps.team,
            ps.opponent,
            ps.game_date,
            tla_c.off_rating,
            tla_o.def_rating,
            ps.season,
            fp.salary,
            fp.fppg,
            fp.injury_indicator AS injury,
            fp.injury_details AS injury_det,
            p.age,
            lnd.get_player_days_rest(p.player_id, p.season) AS days_rest,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.pts * 0.8715039::double precision DESC) AS pts_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY pa.pie * 0.7958694::double precision DESC) AS pie_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.min * 0.7457481::double precision DESC) AS min_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY pa.usg_pct * 0.7006278::double precision DESC) AS usg_pct_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.tov * 0.6086654::double precision) AS tov_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.reb * 0.5533486::double precision DESC) AS reb_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.ast * 0.4750345::double precision DESC) AS ast_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.stl * 0.4744307::double precision DESC) AS stl_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY po.blk * 0.3305021::double precision DESC) AS blk_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.pts, po.pts) * 0.8715039::double precision DESC) AS dr_pts_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pra.pie, pa.pie) * 0.7958694::double precision DESC) AS dr_pie_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.min, po.min) * 0.7457481::double precision DESC) AS dr_min_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pra.usg_pct, pa.usg_pct) * 0.7006278::double precision DESC) AS dr_usg_pct_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.tov, po.tov) * 0.6086654::double precision) AS dr_tov_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.reb, po.reb) * 0.5533486::double precision DESC) AS dr_reb_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.ast, po.ast) * 0.4750345::double precision DESC) AS dr_ast_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.stl, po.stl) * 0.4744307::double precision DESC) AS dr_stl_rank,
            dense_rank() OVER (PARTITION BY ps.season, fp."position" ORDER BY COALESCE(pr.blk, po.blk) * 0.3305021::double precision DESC) AS dr_blk_rank,
            pa.usg_pct,
            COALESCE(pra.usg_pct, pa.usg_pct) AS pra_usg_pct,
            po.min,
            COALESCE(pr.min, po.min) AS dr_min,
            po.reb,
            COALESCE(pr.reb, po.reb) AS dr_reb,
            po.ast,
            COALESCE(pr.ast, po.ast) AS dr_ast,
            po.blk,
            COALESCE(pr.blk, po.blk) AS dr_blk,
            po.pts,
            COALESCE(pr.pts, po.pts) AS dr_pts,
            po.stl,
            COALESCE(pr.stl, po.stl) AS dr_stl,
            po.tov,
            COALESCE(pr.tov, po.tov) AS dr_tov,
            pa.pie,
            COALESCE(pra.pie, pa.pie) AS pra_pie,
            inj_p.sm_min
           FROM rpt.mvw_player_schedule ps
             JOIN lnd.vw_players p ON ps.player_id = p.player_id AND ps.team_id = p.teamid AND ps.season::text = p.l_season::text
             JOIN lnd.vw_fd_players fp ON ps.player::text = ((fp.first_name::text || ' '::text) || fp.last_name::text)
             JOIN lnd.vw_player_overall_base po ON ps.player_id = po.playerid AND ps.season::text = po.season::text
             JOIN lnd.vw_player_overall_advanced pa ON ps.player_id = pa.playerid AND ps.season_str::text = pa.season::text
             LEFT JOIN lnd.vw_player_days_rest_base pr ON po.playerid = pr.playerid AND po.season::text = pr.season::text AND pr.group_value::text = lnd.get_player_days_rest(p.player_id, p.season)::text
             LEFT JOIN lnd.vw_player_days_rest_advanced pra ON po.playerid = pra.playerid AND po.season::text = pra.season::text AND pra.group_value::text = lnd.get_player_days_rest(p.player_id, p.season)::text
             JOIN lnd.vw_team_general_location_advanced tla_o ON ps.opponent_team_id = tla_o.teamid AND ps.season_str::text = tla_o.season::text AND ps.loc = tla_o.team_game_location::text
             JOIN lnd.vw_team_general_location_advanced tla_c ON ps.team_id = tla_c.teamid AND ps.season_str::text = tla_c.season::text AND ps.loc = tla_c.team_game_location::text
             LEFT JOIN ( SELECT p1.teamid,
                    p1.season,
                    sum(po1.min) AS sm_min
                   FROM lnd.vw_fd_players fp1
                     JOIN lnd.vw_players p1 ON p1.player::text = ((fp1.first_name::text || ' '::text) || fp1.last_name::text)
                     JOIN lnd.vw_player_overall_base po1 ON p1.player_id = po1.playerid AND p1.l_season::text = po1.season::text
                  WHERE fp1.injury_indicator::text = 'O'::text
                  GROUP BY p1.teamid, p1.season) inj_p ON p.teamid = inj_p.teamid AND p.season = inj_p.season
          WHERE ps.game_date = to_char('now'::text::date::timestamp with time zone, 'YYYYMMDD'::text)::bigint) a
  ORDER BY a.pos, dense_rank() OVER (PARTITION BY a.season, a.pos ORDER BY a.pts_rank + a.pie_rank + a.min_rank + a.usg_pct_rank + a.tov_rank + a.reb_rank + a.ast_rank + a.stl_rank + a.blk_rank)
WITH DATA;

ALTER TABLE rpt.mvw_player_rank
  OWNER TO ictsh;
