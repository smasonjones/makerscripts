#!usr/bin/python

import sys
import os
import shutil

masterfile = open(sys.argv[1],'r')
filelist = open("files",'w')
if not os.path.exists('genomes'):
	os.mkdir('genomes')
for line in masterfile:
	linearr = line.split()
	if(linearr[0] != "#Target"):
		family = linearr[1].split('.')
		family = family[0] 
		species = os.path.splitext(linearr[0])[0]
		completedir = 'genomes/' + family + '/'
		if not os.path.exists(completedir):
			os.mkdir(completedir)
		completedir = 'genomes/' + family + '/' + species + '/'
		if not os.path.exists(completedir):
               		os.mkdir(completedir)
		
		filelist.write(os.getcwd() + '/' + completedir + "\n")
		for path in linearr:
			if(path.find('.') > -1):
				try:
					shutil.copy(path, completedir + path)
				except:
					print path + " not found. If previously run, it has been moved. If not, double check file paths."
masterfile.close()
masterfile = open(sys.argv[1],'r')
for line in masterfile:
	linearr = line.split()
	if(linearr[0] != "#Target"):
		for path in linearr:
			if(path.find('.') > -1):
				try:
					os.remove(path)	
				except:
					print ""	
print "Done."
