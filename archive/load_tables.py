import sys
import glob
import os
import csv
import subprocess 
import argparse
import psycopg2 as pg

parser = argparse.ArgumentParser(description='Loads data files into database using their file names.')
parser.add_argument('-t','--truncate', help='Target tbale truncated (y/n)', required=False, default='n')
args = vars(parser.parse_args())

files = glob.glob('/home/gursoy/work/nba/data/*.dat')
archive_folder = '/home/gursoy/work/nba/data/archive/'

for file in files:
    columns = list(csv.reader(open(file, "rt"), delimiter='|'))[0]
    #col_list = '_unnamed'
    col_list = '_unnamed'
    for column in columns:
        # col = column.replace('\'','')
        if column == 'TO':
            col = column.replace('TO','TOV')
        else:
            col = column
        col_list = col_list + col.replace('\'','') + ','
    # print(col_list[0:-1])

    conn = pg.connect(database="nba", user="ictsh", password="gyerli", host="127.0.0.1", port="5432")
    cur = conn.cursor()

    table_name = os.path.basename(file).lower().replace('+','_').replace('.dat','')
    
    # now removing date time stamp from the file name to get table name
    table_name = '_'.join(table_name.split('_')[0:-2])

    sql = "copy lnd." + table_name + "(" + col_list[0:-1] + ")" + \
          "  from '" + file + "'"  + \
          " with delimiter '|' " + \
          " CSV " + \
          " header "

    cmd = 'psql -U ictsh -d nba -c "' + sql + '"'
    os.environ['PGPASSWORD']='gyerli'
    print ('---------------------------')
    try:
        cur.execute('select count(*) cnt from lnd.' + table_name)
        cnt = cur.fetchone()
        print('BEFORE => Loading ' + table_name + ' => ' + str(cnt[0]))
        print('loading ' + table_name + ' from ' + os.path.basename(file) )
        subprocess.check_call(cmd, shell=True)
        cur.execute('select count(*) cnt from lnd.' + table_name)
        cnt = cur.fetchone()
        print('AFTER => Loaded records in ' + table_name + ' => ' + str(cnt[0]))
        os.rename(file, archive_folder + os.path.basename(file) + '.loaded')
    except Exception as e:
        strerror = e.args[0]
        print(e) 
        print('Most recent SQL => ' + sql)
        sys.exit(1)

#    cmd = 'psql -U ictsh -d lnd -c "' + sql + '"'
#    cmd_delete = 'psql -U ictsh -d lnd -c "truncate table nba.' + table_name + '"'
#    print('loading ' + table_name + '...' )
#    os.environ['PGPASSWORD']='gyerli'
#    # print(cmd)
#    try:
#        if args['truncate'].upper() == 'Y':
#            check_call(cmd_delete, shell=True)
#            print('Table => ' + table_name + ' is truncated')
#        check_call(cmd, shell=True)
#        os.rename(file, archive_folder + os.path.basename(file) + '.loaded')     
#    except:
#        print('Error loading data for file name => ' + file)

