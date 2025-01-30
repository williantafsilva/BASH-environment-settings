#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move input files to project trash directory.

##Input 1: Input files.
##Output: Files in project trash directory.

##Usage: 
##totrash-stdout.sh <INPUT FILES>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

INPUT="$@"

##Process.

#Path to trash directory.
TRASHDIR=$(echo "${PATHTOPROJTRASH}/trash-${RUNDATE}")

#Create trash subdirectory.
mkdir -p ${TRASHDIR} 

IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do

	FILEX=$(readlink -f ${F})
	echo "Moving to trash: ${FILEX}"
	FILEXLOCATION=${FILEX%/*}
	mv ${FILEX} ${TRASHDIR}
	
	echo "########################################################################
Date: ${RUNDATE}
totrash-stdout.sh ${FILEX}
" >> $(echo "${FILEXLOCATION}/README.txt")
	
	echo "########################################################################
Date: ${RUNDATE}
totrash-stdout.sh ${FILEX}
" >> $(echo "${PATHTOPROJTRASH}/README.txt")

done
IFS='$ORIGINALIFS'