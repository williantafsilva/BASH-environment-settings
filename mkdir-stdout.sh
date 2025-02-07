#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Create a directory with a pre-filled README.txt file and log the creation of the directory.

##Input 1: Output location.
##Input 2: Directory name.
##Output: Directory with a README.txt file.

##Usage: 
##mkdir-stdout.sh <OUTPUT LOCATION> <DIRECTORY NAME>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

ARGS="$@"

if [[ -z "$2" ]] ; then
	OUTPUTLOCATION=$(readlink -f .)
	OUTPUTDIRNAME=$1
else
	OUTPUTLOCATION=$(readlink -f $1)
	OUTPUTDIRNAME=$2
fi
OUTPUTDIR=$(echo "${OUTPUTLOCATION}/${OUTPUTDIRNAME}-job${RUNDATE}")

##Process.

IFS=$'\t'
mkdir -p ${OUTPUTDIR}
echo "########################################################################
################################ README ################################
########################################################################
" >> $(echo "${OUTPUTDIR}/README.txt")

echo "NEW DIRECTORY: ${OUTPUTDIR}"

echo "########################################################################
Date: ${RUNDATE}
mkdir-stdout.sh ${ARGS}
" >> $(echo "${OUTPUTLOCATION}/README.txt")
IFS='$ORIGINALIFS'