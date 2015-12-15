#!/bin/bash
sudo chmod +r /home/gursoy/Downloads/*.csv
unset -v latest
for file in "/home/gursoy/Downloads"/Fan*.csv; do
  [[ $file -nt $latest ]] && latest=$file
done
echo $latest
psql -U ictsh -d nba <<EOF
copy lnd.fd_players (id, position, first_name, last_name, fppg, played, salary, game, team, opponent, injury_indicator, injury_details, unknown, unnamed)
from '$latest'
With delimiter ','
CSV
  HEADER
  quote as '"'
EOF
mv $latest /home/gursoy/Downloads/archive
