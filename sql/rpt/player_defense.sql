select 
p.display_first_last,
p.nba_pos,
pd.defense_category,
pd.freq,
pd.d_fgm,
pd.d_fga,
pd.d_fg_pct,
pd.normal_fg_pct,
pd.pct_plusminus
from lnd.vw_player_defense pd
  inner join rpt.dim_player p on (pd.playerid = p.id)
where exists ( select 1 
                 from rpt.fct_game_team
                where team_id = 'DEN')
and season = '2015-16'
and nba_pos = 'Guard-Forward'
and defense_category = 'Overall'
 