#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move target files/directories to the project safe directory (${PATHTOPROJSAFE}).

##Input $1: Output location
##Input $2: SAFE subdirectory name (or safe tag).
##Output: Move target files/directories from project safe directory to output directory.
##Use fromsafe-stdout.sh <TAG> to move target files/directories the specified directory.

##Usage: 
##fromsafe-stdout.sh <OUTPUT LOCATION> <SAFE TAG>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

OUTPUTLOCATION=$(readlink -f $1)
SAFEDIRNAME=$2

##Process.

SAFESUBDIR=$(echo "${PATHTOPROJSAFE}/${SAFEDIRNAME}")

#Move input files/directories.
echo "----------------------------------------------
The following files/directories will be moved from ${PATHTOPROJSAFE} to ${OUTPUTLOCATION}:
$(find ${SAFESUBDIR}/* -maxdepth 0)
"
mv ${SAFESUBDIR}/* ${OUTPUTLOCATION}