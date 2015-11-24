import glob
import os
from subprocess import call
import common as cmn

files = glob.glob(cmn.data_folder + '*.dat')
for file in files:
    table_name = os.path.basename(file).lower().replace('+','_').replace('.dat','')
    call (['csvsql','-d', '|', '-i', 'postgresql', '--table', table_name, file])
