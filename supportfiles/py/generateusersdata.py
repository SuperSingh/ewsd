from names import *
from pprint import pprint
from sys import path

print 'Generating Humans... Please wait.'

h = HumanPool(200)

f = open(sys.path[0] + '/namedata.txt', 'w')

for i in h.humans:
	d = i.data
	out = ""
	out += d['firstname'][0:2] + d['middlename'][0:1] + d['lastname'][0:2] + ','
	out += d['firstname'] + ','
	out += d['middlename'][:-1] + ','
	out += d['lastname'] + ','
	out += '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918' + '\n'
	f.write(out.lower())

f.close()

raw_input("Done! Press any key to continue.")
