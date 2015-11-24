import glob
import os
from subprocess import call

files = glob.glob('./data/*.dat')
for file in files:
    table_name = os.path.basename(file).lower().replace('+','_').replace('.dat','')
    call (['csvsql','-d', '|', '-i', 'postgresql', '--table', table_name, file])
