#!/bin/bash
# Create table to edit players to change minutes for injuries
# Then this table will extracted and fed into H2O ML module
DATE=`date +%Y%m%d`
echo $DATE

psql -U ictsh -d nba <<EOF
\x
DROP TABLE IF EXISTS picks.predict_${DATE};
CREATE TABLE picks.predict_${DATE} AS
SELECT * FROM ml.vw_predict
WHERE game_date = current_date
--and player not in ('Beno Udrih','James Ennis','Mario Chalmers','Jarnell Stokes')
;
ALTER TABLE picks.predict_${DATE}
  ADD CONSTRAINT pk_predict_${DATE} PRIMARY KEY (player,team);
EOF
