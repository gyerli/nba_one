drop table picks.predict_20151211;
CREATE table picks.predict_20151211 as
select * from ml.vw_predict
where game_date = current_date
--and player not in ('Beno Udrih','James Ennis','Mario Chalmers','Jarnell Stokes')
;
ALTER TABLE picks.predict_20151211
  ADD CONSTRAINT pk_predict_20151211 PRIMARY KEY (player,team);