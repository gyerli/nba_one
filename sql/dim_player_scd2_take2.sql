with new_values as
(
select 
  public.hash8(p.person_id|| '|' || now()) dim_player_guid,
  p.person_id|| '|' || now() crc_str,
  p.person_id id,
  p.first_name,
  p.last_name,
  p.rosterstatus
from tmp.player_info p 
--where person_id = 201571
),
update_deactv as
(
update rpt.dim_p da
set 
  updated_at 		    = now(),
  end_date		    = now(),
  is_active		    = false
from new_values nv
where da.id = nv.id
and is_active = true
and (da.rosterstatus != nv.rosterstatus or da.last_name <> nv.last_name or da.first_name <> nv.first_name)
returning da.*
)
INSERT INTO rpt.dim_p(
            dim_player_guid, crc_str, id, first_name, last_name, rosterstatus,
            created_at, updated_at, is_active, start_date, end_date)
SELECT 
     dim_player_guid, crc_str, id, first_name, last_name, rosterstatus,
     now(), now(), true, now(), null::timestamp
  FROM new_values
 where not exists ( select 1
		      from rpt.dim_p dp
		     where dp.id = new_values.id )
union
SELECT 
     dim_player_guid, crc_str, id, first_name, last_name, rosterstatus,
     now(), now(), true, now(), null::timestamp
  FROM new_values
 where exists ( select 1
		      from update_deactv up
		     where up.id = new_values.id )
		     
