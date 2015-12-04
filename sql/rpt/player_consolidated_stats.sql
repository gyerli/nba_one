-- Materialized View: rpt.mvw_fct_game_player

--DROP MATERIALIZED VIEW rpt.mvw_fct_game_player;


select 
b.player_id,
b.player_name,
b.nba_pos,
b.game_date,
b.season,
b.player_days_rest,
b.team_abbrv team,
b.opp_team_abbrv opp_team,
b.team_loc,
b.min_game,
b.moving_avg_min,
coalesce(dr_base.min, b.min_game) rest_mins,
b.loc_mins,
b.fdpts_game,
b.moving_avg_fdpts,
coalesce(dr_base.ast * 1.5 + dr_base.reb * 1.2 + dr_base.pts + dr_base.stl * 2 + dr_base.blk * 2 - dr_base.tov, b.fdpts_game) rest_fdpts ,
coalesce(b.loc_fdpts, b.fdpts_game) loc_fdpts,
b.pie_game,
b.pie_season,
b.moving_avg_pie,
coalesce(dr_adv.pie, b.pie_game) rest_pie,
b.loc_pie,

b.opp_w_pct,
b.opp_off_rating,
b.opp_def_rating,
b.opp_net_rating,

opp_def.d_fgm,
opp_def.d_fga,
opp_def.d_fg_pct,
opp_def.normal_fg_pct,
opp_def.pct_plusminus

            
from
(
 SELECT a.player_id,
    a.player_name,
    a.game_id,
    a.game_date,
    a.previous_game_date,
    lnd.get_days_rest(a.game_date,a.previous_game_date) player_days_rest,
    a.player_game_day,
    a.team_id,
    a.team_abbrv,
    a.team_loc,
    a.opp_team_id,
    a.opp_team_abbrv,
    a.opp_team_loc,
    a.season,
    a.nba_pos,
    a.start_position,
    a.minutes AS min_game,
    round(a.moving_avg_min, 1) AS moving_avg_min,

    a.fdpts AS fdpts_game,
    round(a.moving_avg_fdpts::numeric, 2) AS moving_avg_fdpts,

    a.pie_game,
    a.pie_season,
    round(a.moving_avg_pie::numeric, 3) AS moving_avg_pie,

    a.opp_w_pct,
    a.opp_off_rating,
    a.opp_def_rating,
    a.opp_net_rating,

    a.loc_mins,
    a.loc_fdpts,
    a.loc_pie

   FROM ( SELECT gp.game_id,
            gp.game_date,
            lag(gp.game_date, 1) OVER (ORDER BY gp.season, gp.team_id, gp.player_id, gp.game_date) AS previous_game_date,
            row_number() OVER (PARTITION BY gp.season, gp.team_id, gp.player_id ORDER BY gp.game_date) AS player_game_day,
            gp.team_id,
            gp.team_abbrv,
            gp.team_loc,
            gp.opp_team_id,
            gp.opp_team_abbrv,
            gp.opp_team_loc,
            gp.player_id,
            gp.player_name,
            gp.matchup,
            gp.season,
            gp.season_type,
            gp.nba_pos,
            gp.start_position,
            gp.seconds / 60 AS minutes,
            avg(gp.seconds / 60) OVER (PARTITION BY gp.season, gp.team_id, gp.player_id ORDER BY gp.game_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS moving_avg_min,
            gp.ast * 1.5::double precision + gp.reb * 1.2::double precision + gp.pts + gp.stl * 2::double precision + gp.blk * 2::double precision - gp.tov AS fdpts,
            avg(gp.ast * 1.5::double precision + gp.reb * 1.2::double precision + gp.pts + gp.stl * 2::double precision + gp.blk * 2::double precision - gp.tov) OVER (PARTITION BY gp.season, gp.team_id, gp.player_id ORDER BY gp.game_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS moving_avg_fdpts,
            gp.pie AS pie_game,
            pa.pie AS pie_season,
            avg(gp.pie) OVER (PARTITION BY gp.season, gp.team_id, gp.player_id ORDER BY gp.game_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS moving_avg_pie,
            tla_opp.w_pct opp_w_pct,
	    tla_opp.off_rating opp_off_rating,
            tla_opp.def_rating opp_def_rating,
            tla_opp.net_rating opp_net_rating,
            ploc.ast * 1.5 + ploc.reb * 1.2 + ploc.pts + ploc.stl * 2 + ploc.blk * 2 - ploc.tov loc_fdpts,
	    ploc.min loc_mins,
            ploc_adv.pie loc_pie
           FROM rpt.fct_game_player gp
	     left join rpt.fct_game_team gt on ( gp.game_id = gt.game_id and
 					         gp.team_id = gt.team_id )
             LEFT JOIN lnd.vw_player_overall_advanced pa ON gp.player_id = pa.playerid AND gp.season = replace(pa.season::text, '-'::text, ''::text)::integer
             LEFT JOIN lnd.vw_player_overall_base pb ON gp.player_id = pb.playerid AND gp.season = replace(pb.season::text, '-'::text, ''::text)::integer
	     LEFT JOIN lnd.vw_team_general_location_advanced tla_opp ON (gp.opp_team_id = tla_opp.teamid AND 
								         gp.season = replace(tla_opp.season,'-','')::integer AND 
								         gp.opp_team_loc = tla_opp.team_game_location)
             left join lnd.vw_player_location_base ploc on ( gp.player_id = ploc.playerid and
                                                             gp.season = replace(ploc.season,'-','')::integer AND
                                                             gp.team_loc = ploc.group_value )									
             left join lnd.vw_player_location_advanced ploc_adv on ( gp.player_id = ploc_adv.playerid and
                                                                     gp.season = replace(ploc_adv.season,'-','')::integer AND
                                                                     gp.team_loc = ploc_adv.group_value )									

          WHERE gp.seconds > 0
          
          --and gp.season = 201516
          --and gp.player_name = 'Kawhi Leonard'
          ) a
) b
LEFT OUTER JOIN lnd.vw_player_days_rest_base dr_base ON (b.player_id = dr_base.playerid AND 
                                                         b.season = replace(dr_base.season,'-','')::integer AND 
                                                         dr_base.group_value = b.player_days_rest)
LEFT OUTER JOIN lnd.vw_player_days_rest_advanced dr_adv ON (b.player_id = dr_adv.playerid AND 
                                                            b.season = replace(dr_adv.season,'-','')::integer AND 
                                                            dr_adv.group_value = b.player_days_rest)
left join ( 
	select 
	pd.season,
	p.team_abbrv,
	p.team_id,
	p.nba_pos,
	round(avg(pd.d_fgm)::numeric,3) d_fgm,
	round(avg(pd.d_fga)::numeric,3) d_fga,
	round(avg(pd.d_fg_pct)::numeric,3) d_fg_pct,
	round(avg(pd.normal_fg_pct)::numeric,3) normal_fg_pct,
	round(avg(pd.pct_plusminus)::numeric,3) pct_plusminus
	from lnd.vw_player_defense pd
	  inner join rpt.dim_player p on (pd.playerid = p.id)
	where defense_category = 'Overall'
	and p.team_abbrv is not null
	group by 
	pd.season,
	p.team_abbrv,
	p.team_id,
	p.nba_pos ) opp_def on ( b.season = replace(opp_def.season,'-','')::INTEGER and
	                         b.opp_team_id = opp_def.team_id and
	                         b.nba_pos = opp_def.nba_pos )
where b.moving_avg_min >= 10
;