import sys, string

fileout = open(sys.path[0] + '/sqlout.txt', 'w')

db_name = 'db_ewsd'
db_table = 'prefixes'

for x in string.ascii_lowercase:
	for y in string.ascii_lowercase:
		fileout.write("INSERT INTO `%s`.`%s` (`prefixes_prefix`, `prefixes_count`) VALUES ('%s', '%s');\n" % (db_name, db_table, x+y, 0))

fileout.close()