#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Show directory hierarchy.

##Input 1: Directory.
##Input 2: Hierarchy depth.
##Output: Input directory hierarchy/structure.

##Usage: 
##dirstructure-stdout.sh <INPUT DIRECTORY> <MAXDEPTH>

############################################################################
##ACTIONS:

##Input.

if [[ -z "$1" ]] ; then
	INPUTDIR=$(readlink -f .)
else
	INPUTDIR=$(readlink -f $1)
fi

if [[ -z "$2" ]] ; then
	MAXDEPTH=0
else
	MAXDEPTH=$2
fi

##Process.

IFS=$'\t'
echo "----------------------------------------------------------------------------
Target directory: ${INPUTDIR}
Maximum hierarchical depth: ${MAXDEPTH}
----------------------------------------------------------------------------"
echo ${INPUTDIR} | sed -e "s/[^-][^\/]*\//.|/g" -e "s/.|\([^ ]\)/|.|\1/"
find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} | sort -n | sed -e "s/[^-][^\/]*\//.|/g" -e "s/.|\([^ ]\)/|.|\1/" #| (echo ${INPUTDIR} ; cat -)
echo "----------------------------------------------------------------------------"
echo "Directories: $(find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} -type d | wc -l)"
echo "Files:"
find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} -type f -print | awk -F . '{print $NF}' | sort | uniq -c | sort -n
echo "TOTAL (files + directories): $(find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} | wc -l)"
echo "----------------------------------------------------------------------------"
IFS='$ORIGINALIFS'