#!usr/bin/python

import os

origopts = open("maker_opts.ctl",'r')
newopts = open("maker_opts2.ctl",'w')
path = os.getcwd()
basename = path.split('/')
basename = basename[-1]

for line in origopts:
	if(line.find("snaphmm=") >-1):
		newopts.write("snaphmm=" + basename + ".snap.retrain.hmm\n")
#	elif(line.find("maker_gff=")>-1):
#		newopts.write("maker_gff=" + basename + ".maker.output.old/" + basename + ".all.functional.gff\n")
#	elif(line.find("altest_pass=") >-1):
 #              newopts.write("altest_pass=1\n")
#	elif(line.find("est_pass=") >-1):
#		newopts.write("est_pass=1\n")
#	elif(line.find("protein_pass=") >-1):
#		newopts.write("protein_pass=1\n")
#	elif(line.find("rm_pass=") >-1):
#		newopts.write("rm_pass=1\n")
	else:
		newopts.write(line)


os.rename("maker_opts.ctl","maker_opts.ctl.old")
os.rename("maker_opts2.ctl","maker_opts.ctl")
