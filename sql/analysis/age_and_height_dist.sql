select 
    p.display_first_last,
    p.birthdate,
    extract('day' from now() - p.birthdate) AS age_in_days,
    p.height,
    wm.wk,
	wm.wkly_num_games,
	wm.tot_wkly_player_time,
	wm.tot_wkly_pos_time,
	wm.pct_wkly_player_time
    
  from rpt.dim_player p
    left join rpt.mvw_player_weekly_minutes wm on ( p.id = wm.player_id and
                                                    wm.wk = extract('week' from now()) - 1 and
                                                    p.is_active = true)
where 1=1
and wm.season = 201516
and rosterstatus = 'Active'  
--and birthdate is null
--and height is null
--limit 100
  