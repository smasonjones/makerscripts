#!usr/bin/python
import sys
import os

file = open(sys.argv[1],'r')
file_new = open(sys.argv[1]+".new",'w')
for line in file:
	if line[0] == '>':
		linearr = line.split('>')
		if linearr[1] == linearr[2]:
			file_new.write(">"+linearr[5])
		else:
			file_new.write(line)
	else:
		file_new.write(line)
os.remove(sys.argv[1])
os.rename(sys.argv[1]+"new",sys.argv[1])
			
