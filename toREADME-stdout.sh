#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Add note to README.txt file.

##Input 1: Output location.
##Input 2: Quoted string to be added to README.txt file.
##Output: Note on README.txt file.

##Usage: 
##toREADME-stdout.sh <OUTPUT LOCATION> <QUOTED STRING>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

OUTPUTLOCATION=$(readlink -f $1)

#Process.

IFS=$'\t'
ARGS="${@:2}"
echo "########################################################################
Date: ${RUNDATE}
${ARGS}
" >> $(echo "${OUTPUTLOCATION}/README.txt")
IFS='$ORIGINALIFS'