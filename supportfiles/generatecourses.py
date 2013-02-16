import sys, string

fileout = open(sys.path[0] + '/sqlout.txt', 'w')

db_name = 'db_ewsd'
db_table = 'prefixes'

def gencode(x):
    return 'comp' + ('0' * int(4 - len(str(x)))) + str(x)

for x in xrange(2000):
	fileout.write("INSERT INTO `course`(`course_code`, `course_title`, `course_desc`) VALUES \
('%s', 'Generic Course Title', 'Generic Course Description');\n" % gencode(x))

fileout.close()