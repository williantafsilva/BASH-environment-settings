#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy files to project export directory.

##Input: Files.
##Output: Copy of files in project export directory.

##Usage: 
##toexport-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.

INPUT="$@"

##Process.

IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJEXPORT}
	echo "Copy of file ${F} created in directory ${PATHTOPROJEXPORT}"
done
IFS='$ORIGINALIFS'