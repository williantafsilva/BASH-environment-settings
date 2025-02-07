#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Create a pre-filled README.txt file.

##Input: Output location.
##Output: README.txt file.

##Usage: 
##mkREADME-stdout.sh <OUTPUT LOCATION>

############################################################################
##ACTIONS:

##Input.

if [[ -z "$1" ]] ; then
	OUTPUTLOCATION=$(readlink -f .)
else
	OUTPUTLOCATION=$(readlink -f $1)
fi

##Process.

IFS=$'\t'
echo "########################################################################
################################ README ################################
########################################################################
" >> $(echo "${OUTPUTLOCATION}/README.txt")
IFS='$ORIGINALIFS'