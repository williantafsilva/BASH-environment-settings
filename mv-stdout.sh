#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move or change name of input file.

##Input 1: Input files.
##Input 2: Output file name or target directory.
##Output: Move or change name of input files.

##Usage: 
##mv-stdout.sh <INPUT FILE> <OUTPUT FILE NAME>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

ARGS="$@"
INPUTFILE="${@:1:$#-1}" ##All but last argument.
OUTPUTFILE="${@:$#}" ##Last argument.

##Process.

IFS=$' '
for F in ${INPUTFILE} ; do

	FILEX=$(readlink -f ${F})
	INPUTFILELOCATION=${FILEX%/*}
	mv ${FILEX} ${OUTPUTFILE}
	OUTPUTFILE=$(readlink -f ${OUTPUTFILE})
	echo "Moving/renaming file: ${FILEX} -----> ${OUTPUTFILE}"
	
	echo "########################################################################
Date: ${RUNDATE}
mv-stdout.sh ${FILEX} ${OUTPUTFILE}
" >> $(echo "${INPUTFILELOCATION}/README.txt")

done
IFS='$ORIGINALIFS'