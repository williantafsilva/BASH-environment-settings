#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Search files that contain a specific string.

##Input 1: Input directory.
##Input 2: Quoted string.
##Output: List of files containing the input string.

##Usage: 
##searchwithinfiles-stdout.sh <INPUT DIRECTORY> <QUOTED STRING>

############################################################################
##ACTIONS:

##Input.

INPUTFILE=$(readlink -f $1)
STRING=$2

##Process.

IFS=$'\n'
find ${INPUTFILE} -type f -print0 | xargs -0 grep -l $(echo ${STRING})
IFS='$ORIGINALIFS'