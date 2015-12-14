-- create table stg.pick_5_20151110
-- as
-- select * from stg.pick_5

--  drop table stg.pick_5_20151111_2;
--  create table stg.pick_5_20151111_2
--  as
-- select *
-- from (
--  SELECT 
--    substring(split_part(player, ' ', 1) from 1 for 1) || '.' || split_part(player, ' ', 2) player, pos, team, salary, gr, 
--    dense_rank() over (partition by pos ORDER BY ictsh_rank) rn
--  FROM stg.picks_20151111_2
--  WHERE game_date = to_char('now'::text::date::timestamp with time zone, 'YYYYMMDD'::text)::bigint
-- --AND diff_off_def_rank < 0 
-- ) a
-- WHERE a.rn <= 7
-- and a.salary >= 4000
-- ;

--select * from stg.picks_20151111

select 
-- pg1.player, pg1.pos, pg1.team, pg1.salary, pg1.rn pg1_rnk,
-- pg2.player, pg2.pos, pg2.team, pg2.salary, pg2.rn pg2_rnk,
-- sg1.player, sg1.pos, sg1.team, sg1.salary, sg1.rn sg1_rnk,
-- sg2.player, sg2.pos, sg2.team, sg2.salary, sg2.rn sg2_rnk,
-- sf1.player, sf1.pos, sf1.team, sf1.salary, sf1.rn sf1_rnk,
-- sf2.player, sf2.pos, sf2.team, sf2.salary, sf2.rn sf2_rnk,
-- pf1.player, pf1.pos, pf1.team, pf1.salary, pf1.rn pf1_rnk,
-- pf2.player, pf2.pos, pf2.team, pf2.salary, pf2.rn pf2_rnk,
format('%s[%s][%s], %s[%s][%s]',pg1.player,pg1.rn,pg1.salary, pg2.player,pg2.rn,pg2.salary) pg,
format('%s[%s][%s], %s[%s][%s]',sg1.player,sg1.rn,sg1.salary, sg2.player,sg2.rn,sg2.salary) sg,
format('%s[%s][%s], %s[%s][%s]',sf1.player,sf1.rn,sf1.salary, sf2.player,sf2.rn,sf2.salary) sf,
format('%s[%s][%s], %s[%s][%s]',pf1.player,pf1.rn,pf1.salary, pf2.player,pf2.rn,pf2.salary) pf,
format('%s[%s][%s]',c.player,c.rn,c.salary) c,
pg1.salary + pg2.salary + sg1.salary + sg2.salary + sf1.salary + sf2.salary + pf1.salary + pf2.salary + c.salary sal_sum,
pg1.rn + pg2.rn + sg1.rn + sg2.rn + sf1.rn + sf2.rn + pf1.rn + pf2.rn + c.rn rnk_sum
from 
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'PG' ) PG1,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'PG' ) PG2,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'SG' ) SG1,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'SG' ) SG2,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'SF' ) SF1,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'SF' ) SF2,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'PF' ) PF1,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'PF' ) PF2,
(select player, pos, team, salary, rn from stg.pick_5_20151111_2 WHERE pos = 'C' ) C
WHERE 1=1

AND pg1.player != pg2.player
AND sg1.player != sg2.player
AND sf1.player != sf2.player
AND pf1.player != pf2.player

--and md5(sg1.player || sg2.player) <> md5(sg2.player || sg1.player)

AND pg1.salary + pg2.salary + sg1.salary + sg2.salary + sf1.salary + sf2.salary + pf1.salary + pf2.salary + c.salary <= 60000
and pg1.salary + pg2.salary + sg1.salary + sg2.salary + sf1.salary + sf2.salary + pf1.salary + pf2.salary + c.salary >= 59000

-- AND upper(sg1.player) not like '%WADE%'
-- AND upper(sg2.player) not like '%WADE%'
order by rnk_sum ASC, sal_sum DESC

