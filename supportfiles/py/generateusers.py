import sys, string

fileout = open(sys.path[0] + '/sqlout.txt', 'w')

db_name = 'db_ewsd'
db_table = 'prefixes'

data = open(sys.path[0] + '/namedata.txt', 'r')

for i in data:
	d = i.split(',')
	fileout.write('INSERT INTO `user`(`user_name`, `user_pass`, `user_fname`, `user_oname`, `user_lname`, `user_permission`) VALUES ("%s", "%s", "%s", "%s", "%s", "1");\n' % (d[0], d[4][:-1], d[1], d[2], d[3]))
data.close()
fileout.close()

