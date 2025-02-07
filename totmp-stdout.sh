#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Copy files to project tmp directory.

##Input: Target files/directories.
##Output: Copies of files in project tmp directory.

##Usage: 
##totmp-stdout.sh <FILES>

############################################################################
##ACTIONS:

##Input.

INPUT="$@"

##Process.

IFS=$' '
find ${INPUT} -maxdepth 0 | while read F ; do
	cp -r ${F} ${PATHTOPROJTMP}
	echo "Copy of file ${F} created in directory ${PATHTOPROJTMP}"
done
IFS='$ORIGINALIFS'