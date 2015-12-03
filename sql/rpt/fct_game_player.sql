﻿with new_values as
(
SELECT 
  public.hash8(gp.game_id || '|' || gp.team_id || '|' || coalesce(gp.player_id,-1))::BIGINT fct_game_player_guid,
  (gp.game_id || '|' || gp.team_id || '|' || coalesce(gp.player_id,-1))::varchar crc_str,
  gp.game_id, 
  g.dim_game_guid,
  fgt.game_date,
  gp.team_id, 
  t.dim_team_guid,
  fgt.team_abbrv,
  fgt.team_loc,
  fgt.opp_team_id,
  ot.dim_team_guid dim_opp_team_guid,
  fgt.opp_team_abbrv,
  fgt.opp_team_loc,
  coalesce(gp.player_id,-1) player_id, 
  coalesce(p.dim_player_guid,-1) dim_player_guid, 
  gp.player_name,
  p.display_first_last,
  fgt.matchup,
  replace(gp.season,'-','')::integer season,
  CASE 
    WHEN gp.season_type = 'Regular+Season' THEN 'RS'
    WHEN gp.season_type = 'Playoffs' THEN 'PO'
    WHEN gp.season_type = 'Pre+Season' THEN 'PS'
    ELSE 'U'
  end::varchar season_type,
  p.nba_pos,
  gp.start_position, 
  gp.comment cmnt, 
  gp.min,
  split_part(gp.min,':',1)::integer * 60 + split_part(gp.min,':',2)::integer seconds,
  gp.fgm, 
  gp.fga, 
  gp.fg_pct,
  gp.fg3m, 
  gp.fg3a, 
  gp.fg3_pct, 
  gp.ftm, 
  gp.fta, 
  gp.ft_pct, 
  gp.oreb, 
  gp.dreb, 
  gp.reb, 
  gp.ast, 
  gp.stl, 
  gp.blk, 
  gp.tov, 
  gp.pf, 
  gp.pts, 
  gp.plus_minus,
  gpa.off_rating,
  gpa.def_rating,
  gpa.net_rating,
  gpa.ast_pct,
  gpa.ast_tov,
  gpa.ast_ratio,
  gpa.oreb_pct,
  gpa.dreb_pct,
  gpa.reb_pct,
  gpa.tm_tov_pct,
  gpa.efg_pct,
  gpa.ts_pct,
  gpa.usg_pct,
  gpa.pace,
  gpa.pie,
  gpm.pts_off_tov,
  gpm.pts_2nd_chance,
  gpm.pts_fb,
  gpm.pts_paint,
  gpm.opp_pts_off_tov,
  gpm.opp_pts_2nd_chance,
  gpm.opp_pts_fb,
  gpm.opp_pts_paint,
  gpm.blk gpm_blk,
  gpm.blka,
  gpm.pf gpm_pf,
  gpm.pfd,
  gff.efg_pct gff_efg_pct,
  gff.fta_rate,
  gff.tm_tov_pct gff_tm_tov_pct,
  gff.oreb_pct gff_oreb_pct,
  gff.opp_efg_pct,
  gff.opp_fta_rate,
  gff.opp_tov_pct,
  gff.opp_oreb_pct,
  gsc.pct_fga_2pt,
  gsc.pct_fga_3pt,
  gsc.pct_pts_2pt,
  gsc.pct_pts_2pt_mr,
  gsc.pct_pts_3pt,
  gsc.pct_pts_fb,
  gsc.pct_pts_ft,
  gsc.pct_pts_off_tov,
  gsc.pct_pts_paint,
  gsc.pct_ast_2pm,
  gsc.pct_uast_2pm,
  gsc.pct_ast_3pm,
  gsc.pct_uast_3pm,
  gsc.pct_ast_fgm,
  gsc.pct_uast_fgm,
  trck.spd,
  trck.dist,
  trck.orbc,
  trck.drbc,
  trck.rbc,
  trck.tchs,
  trck.sast,
  trck.ftast,
  trck.pass,
  trck.ast trck_ast,
  trck.cfgm,
  trck.cfga,
  trck.cfg_pct,
  trck.ufgm,
  trck.ufga,
  trck.ufg_pct,
  trck.fg_pct trck_fg_pct,
  trck.dfgm,
  trck.dfga,
  trck.dfg_pct,
  gusg.usg_pct gusg_usg_pct,
  gusg.pct_fgm,
  gusg.pct_fga,
  gusg.pct_fg3m,
  gusg.pct_fg3a,
  gusg.pct_ftm,
  gusg.pct_fta,
  gusg.pct_oreb,
  gusg.pct_dreb,
  gusg.pct_reb,
  gusg.pct_ast,
  gusg.pct_tov,
  gusg.pct_stl,
  gusg.pct_blk,
  gusg.pct_blka,
  gusg.pct_pf,
  gusg.pct_pfd,
  gusg.pct_pts
  
FROM lnd.vw_game_player_stat gp
left outer join rpt.fct_game_team fgt on ( gp.game_id = fgt.game_id and
				           gp.team_id = fgt.team_id )
left outer join rpt.dim_game g on (fgt.game_id = g.id and
                                   g.is_active = true)
left outer join rpt.dim_team t on (fgt.team_id = t.id and
                                   t.is_active = true )                                   
left outer join rpt.dim_team ot on (fgt.team_id = ot.id and
                                    ot.is_active = true )                                   
left outer join rpt.dim_player p on ( gp.player_id = p.id and
				  p.is_active = true)
left outer join lnd.vw_game_player_adv_stat gpa on ( gp.player_id = gpa.player_id and
						 gp.team_id = gpa.team_id and
						 gp.game_id = gpa.game_id )
left outer join lnd.vw_game_player_misc_stat gpm on ( gp.player_id = gpm.player_id and
						 gp.team_id = gpm.team_id and
						 gp.game_id = gpm.game_id )
left outer join lnd.vw_game_player_four_factor_stat gff on ( gp.player_id = gff.player_id and
						 gp.team_id = gff.team_id and
						 gp.game_id = gff.game_id )
left outer join lnd.vw_game_player_scoring_stat	gsc on ( gp.player_id = gsc.player_id and
						 gp.team_id = gsc.team_id and
						 gp.game_id = gsc.game_id )
left outer join lnd.vw_game_player_trck_stat trck on ( gp.player_id = trck.player_id and
						 gp.team_id = trck.team_id and
						 gp.game_id = trck.game_id )
left outer join lnd.vw_game_player_usage_stat gusg on ( gp.player_id = gusg.player_id and
						 gp.team_id = gusg.team_id and
						 gp.game_id = gusg.game_id )		 
--where 1=1
-- and gp.game_id = '0021300001'
--  and gp.player_id = 203076
--order by game_date desc  
--limit 1000  
),
upsert as
(
UPDATE rpt.fct_game_player gp
   SET 
crc_str                 = nv.crc_str,
game_id                 = nv.game_id,
dim_game_guid           = nv.dim_game_guid,
game_date               = nv.game_date,
team_id                 = nv.team_id,
dim_team_guid           = nv.dim_team_guid,
team_abbrv              = nv.team_abbrv,
team_loc		= nv.team_loc,
opp_team_id             = nv.opp_team_id,
dim_opp_team_guid       = nv.dim_opp_team_guid,
opp_team_abbrv          = nv.opp_team_abbrv,
opp_team_loc		= nv.opp_team_loc,
player_id               = nv.player_id,
dim_player_guid         = nv.dim_player_guid,
player_name             = nv.player_name,
display_first_last      = nv.display_first_last,
matchup                 = nv.matchup,
season                  = nv.season,
season_type             = nv.season_type,
nba_pos          	= nv.nba_pos,
start_position          = nv.start_position,
cmnt                    = nv.cmnt,
min                     = nv.min,
seconds                 = nv.seconds,
fgm                     = nv.fgm,
fga                     = nv.fga,
fg_pct                  = nv.fg_pct,
fg3m                    = nv.fg3m,
fg3a                    = nv.fg3a,
fg3_pct                 = nv.fg3_pct,
ftm                     = nv.ftm,
fta                     = nv.fta,
ft_pct                  = nv.ft_pct,
oreb                    = nv.oreb,
dreb                    = nv.dreb,
reb                     = nv.reb,
ast                     = nv.ast,
stl                     = nv.stl,
blk                     = nv.blk,
tov                     = nv.tov,
pf                      = nv.pf,
pts                     = nv.pts,
plus_minus              = nv.plus_minus,
off_rating              = nv.off_rating,
def_rating              = nv.def_rating,
net_rating              = nv.net_rating,
ast_pct                 = nv.ast_pct,
ast_tov                 = nv.ast_tov,
ast_ratio               = nv.ast_ratio,
oreb_pct                = nv.oreb_pct,
dreb_pct                = nv.dreb_pct,
reb_pct                 = nv.reb_pct,
tm_tov_pct              = nv.tm_tov_pct,
efg_pct                 = nv.efg_pct,
ts_pct                  = nv.ts_pct,
usg_pct                 = nv.usg_pct,
pace                    = nv.pace,
pie                     = nv.pie,
pts_off_tov             = nv.pts_off_tov,
pts_2nd_chance          = nv.pts_2nd_chance,
pts_fb                  = nv.pts_fb,
pts_paint               = nv.pts_paint,
opp_pts_off_tov         = nv.opp_pts_off_tov,
opp_pts_2nd_chance      = nv.opp_pts_2nd_chance,
opp_pts_fb              = nv.opp_pts_fb,
opp_pts_paint           = nv.opp_pts_paint,
gpm_blk                 = nv.gpm_blk,
blka                    = nv.blka,
gpm_pf                  = nv.gpm_pf,
pfd                     = nv.pfd,
gff_efg_pct             = nv.gff_efg_pct,
fta_rate                = nv.fta_rate,
gff_tm_tov_pct          = nv.gff_tm_tov_pct,
gff_oreb_pct            = nv.gff_oreb_pct,
opp_efg_pct             = nv.opp_efg_pct,
opp_fta_rate            = nv.opp_fta_rate,
opp_tov_pct             = nv.opp_tov_pct,
opp_oreb_pct            = nv.opp_oreb_pct,
pct_fga_2pt             = nv.pct_fga_2pt,
pct_fga_3pt             = nv.pct_fga_3pt,
pct_pts_2pt             = nv.pct_pts_2pt,
pct_pts_2pt_mr          = nv.pct_pts_2pt_mr,
pct_pts_3pt             = nv.pct_pts_3pt,
pct_pts_fb              = nv.pct_pts_fb,
pct_pts_ft              = nv.pct_pts_ft,
pct_pts_off_tov         = nv.pct_pts_off_tov,
pct_pts_paint           = nv.pct_pts_paint,
pct_ast_2pm             = nv.pct_ast_2pm,
pct_uast_2pm            = nv.pct_uast_2pm,
pct_ast_3pm             = nv.pct_ast_3pm,
pct_uast_3pm            = nv.pct_uast_3pm,
pct_ast_fgm             = nv.pct_ast_fgm,
pct_uast_fgm            = nv.pct_uast_fgm,
spd                     = nv.spd,
dist                    = nv.dist,
orbc                    = nv.orbc,
drbc                    = nv.drbc,
rbc                     = nv.rbc,
tchs                    = nv.tchs,
sast                    = nv.sast,
ftast                   = nv.ftast,
pass                    = nv.pass,
trck_ast                = nv.trck_ast,
cfgm                    = nv.cfgm,
cfga                    = nv.cfga,
cfg_pct                 = nv.cfg_pct,
ufgm                    = nv.ufgm,
ufga                    = nv.ufga,
ufg_pct                 = nv.ufg_pct,
trck_fg_pct             = nv.trck_fg_pct,
dfgm                    = nv.dfgm,
dfga                    = nv.dfga,
dfg_pct                 = nv.dfg_pct,
gusg_usg_pct            = nv.gusg_usg_pct,
pct_fgm                 = nv.pct_fgm,
pct_fga                 = nv.pct_fga,
pct_fg3m                = nv.pct_fg3m,
pct_fg3a                = nv.pct_fg3a,
pct_ftm                 = nv.pct_ftm,
pct_fta                 = nv.pct_fta,
pct_oreb                = nv.pct_oreb,
pct_dreb                = nv.pct_dreb,
pct_reb                 = nv.pct_reb,
pct_ast                 = nv.pct_ast,
pct_tov                 = nv.pct_tov,
pct_stl                 = nv.pct_stl,
pct_blk                 = nv.pct_blk,
pct_blka                = nv.pct_blka,
pct_pf                  = nv.pct_pf,
pct_pfd                 = nv.pct_pfd,
pct_pts                 = nv.pct_pts,
updated_at           = now(),
is_active            = true
from new_values nv
where gp.fct_game_player_guid = nv.fct_game_player_guid
returning gp.*	
)
INSERT INTO rpt.fct_game_player(
            fct_game_player_guid, crc_str, game_id, dim_game_guid, game_date, team_id, dim_team_guid, team_abbrv, team_loc,
            opp_team_id, dim_opp_team_guid, opp_team_abbrv, opp_team_loc, player_id, dim_player_guid, player_name, display_first_last, 
            matchup, season, season_type, nba_pos, start_position, cmnt, min, seconds, 
            fgm, fga, fg_pct, fg3m, fg3a, fg3_pct, ftm, fta, ft_pct, oreb, 
            dreb, reb, ast, stl, blk, tov, pf, pts, plus_minus, off_rating, 
            def_rating, net_rating, ast_pct, ast_tov, ast_ratio, oreb_pct, 
            dreb_pct, reb_pct, tm_tov_pct, efg_pct, ts_pct, usg_pct, pace, 
            pie, pts_off_tov, pts_2nd_chance, pts_fb, pts_paint, opp_pts_off_tov, 
            opp_pts_2nd_chance, opp_pts_fb, opp_pts_paint, gpm_blk, blka, 
            gpm_pf, pfd, gff_efg_pct, fta_rate, gff_tm_tov_pct, gff_oreb_pct, 
            opp_efg_pct, opp_fta_rate, opp_tov_pct, opp_oreb_pct, pct_fga_2pt, 
            pct_fga_3pt, pct_pts_2pt, pct_pts_2pt_mr, pct_pts_3pt, pct_pts_fb, 
            pct_pts_ft, pct_pts_off_tov, pct_pts_paint, pct_ast_2pm, pct_uast_2pm, 
            pct_ast_3pm, pct_uast_3pm, pct_ast_fgm, pct_uast_fgm, spd, dist, 
            orbc, drbc, rbc, tchs, sast, ftast, pass, trck_ast, cfgm, cfga, 
            cfg_pct, ufgm, ufga, ufg_pct, trck_fg_pct, dfgm, dfga, dfg_pct, 
            gusg_usg_pct, pct_fgm, pct_fga, pct_fg3m, pct_fg3a, pct_ftm, 
            pct_fta, pct_oreb, pct_dreb, pct_reb, pct_ast, pct_tov, pct_stl, 
            pct_blk, pct_blka, pct_pf, pct_pfd, pct_pts, created_at, updated_at, 
            is_active)
SELECT fct_game_player_guid, crc_str, game_id, dim_game_guid, game_date, team_id, dim_team_guid, team_abbrv, team_loc,
       opp_team_id, dim_opp_team_guid, opp_team_abbrv, opp_team_loc, player_id, dim_player_guid, player_name, display_first_last, 
       matchup, season, season_type, nba_pos, start_position, cmnt, min, seconds, 
       fgm, fga, fg_pct, fg3m, fg3a, fg3_pct, ftm, fta, ft_pct, oreb, 
       dreb, reb, ast, stl, blk, tov, pf, pts, plus_minus, off_rating, 
       def_rating, net_rating, ast_pct, ast_tov, ast_ratio, oreb_pct, 
       dreb_pct, reb_pct, tm_tov_pct, efg_pct, ts_pct, usg_pct, pace, 
       pie, pts_off_tov, pts_2nd_chance, pts_fb, pts_paint, opp_pts_off_tov, 
       opp_pts_2nd_chance, opp_pts_fb, opp_pts_paint, gpm_blk, blka, 
       gpm_pf, pfd, gff_efg_pct, fta_rate, gff_tm_tov_pct, gff_oreb_pct, 
       opp_efg_pct, opp_fta_rate, opp_tov_pct, opp_oreb_pct, pct_fga_2pt, 
       pct_fga_3pt, pct_pts_2pt, pct_pts_2pt_mr, pct_pts_3pt, pct_pts_fb, 
       pct_pts_ft, pct_pts_off_tov, pct_pts_paint, pct_ast_2pm, pct_uast_2pm, 
       pct_ast_3pm, pct_uast_3pm, pct_ast_fgm, pct_uast_fgm, spd, dist, 
       orbc, drbc, rbc, tchs, sast, ftast, pass, trck_ast, cfgm, cfga, 
       cfg_pct, ufgm, ufga, ufg_pct, trck_fg_pct, dfgm, dfga, dfg_pct, 
       gusg_usg_pct, pct_fgm, pct_fga, pct_fg3m, pct_fg3a, pct_ftm, 
       pct_fta, pct_oreb, pct_dreb, pct_reb, pct_ast, pct_tov, pct_stl, 
       pct_blk, pct_blka, pct_pf, pct_pfd, pct_pts, now(), NULL, true 
        FROM new_values
where not exists ( 
		select 1 
		from upsert up
		where up.fct_game_player_guid = new_values.fct_game_player_guid )
;				  