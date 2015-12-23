select
season,
team,
fd_pos,
round(avg((min/tot_pos_min) * pct_plusminus),3) avg_norm_plusminus
from
(
  SELECT 
    p.display_first_last player_name,
    replace(pd.season,'-','') season,
    p.team_abbrv team,
    p.team_id,
    p.nba_pos,
    coalesce(fd.position, fpx.position, xpo.fd_pos) fd_pos,
    pb.min::numeric min,
    (sum(pb.min) over (partition by pd.season, team_abbrv, coalesce(fd.position, fpx.position, xpo.fd_pos)))::numeric tot_pos_min,
    pd.pct_plusminus::numeric pct_plusminus
   FROM lnd.vw_player_defense pd
     JOIN rpt.dim_player p ON pd.playerid = p.id and p.is_active = true
     left join lnd.vw_player_overall_base pb on (pd.playerid = pb.playerid and pd.season = pb.season)
     LEFT JOIN stg.xlat_player xp ON pd.playerid = xp.player_id
     LEFT JOIN lnd.vw_fd_players fd ON p.fd_id = fd.id
     LEFT JOIN lnd.vw_fd_players fpx ON upper(xp.src_name::text) = ((replace(upper(fpx.first_name::text), '.'::text, ''::text) || ' '::text) || upper(fpx.last_name::text))
     left join stg.xlat_nba_pos xpo on ( p.nba_pos = xpo.nba_pos )
  WHERE pd.defense_category = 'Overall' 
    AND p.team_abbrv IS NOT NULL
) a    
group by season,team,fd_pos
