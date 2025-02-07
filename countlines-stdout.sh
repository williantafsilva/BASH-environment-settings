#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Count the number of lines in each file.

##Input: Input files.
##Output: Number of lines in each file.

##Usage: 
##countlines-stdout.sh <INPUT FILE>

############################################################################
##ACTIONS:

##Input.

INPUTFILE="$@"

##Process.

IFS=$' '
echo "Number of lines:"
find ${INPUTFILE} -maxdepth 0 | while read F ; do
	FILEX=$(readlink -f ${F})
	echo "-----> ${FILEX}: $(cat ${FILEX} | wc -l)"
done
IFS='$ORIGINALIFS'