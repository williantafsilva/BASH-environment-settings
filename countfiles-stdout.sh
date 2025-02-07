#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Count number of files in a directory.

##Input $1: Directory.
##Input $2: Maximum depth.
##Output: Number of files in input directory.

##Usage: 
##countfiles-stdout.sh <INPUT DIRECTORY>

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
DIRSPACE=$(echo "${INPUTDIR}" | sed -e "s/[^-][^\/]*\//.|/g" -e "s/.|\([^ ]\)/|.|\1/" | sed 's/[a-z]//g' | sed 's/[A-Z]//g' | sed 's/[0-9]//g' | sed 's/-//g' | sed 's/|\./  /g' | sed 's/|/ /g' | sed 's/\.//g')
echo "${DIRSPACE}Directories: $(find ${INPUTDIR}/* -maxdepth 0 -type d | wc -l)
${DIRSPACE}Files:
$(find ${INPUTDIR}/* -maxdepth 0 -type f -print | awk -F . '{print $NF}' | sort | uniq -c | sort -n | sed 's/^[ \t]*//' | sed -e "s/^/${DIRSPACE}      /")
${DIRSPACE}TOTAL (files + directories): $(find ${INPUTDIR}/* -maxdepth 0 | wc -l)"
find $(echo "${INPUTDIR}/*") -maxdepth ${MAXDEPTH} -type d | while read D ; do
	echo ${D} | sed -e "s/[^-][^\/]*\//.|/g" -e "s/.|\([^ ]\)/|.|\1/"
	DIRSPACE=$(echo "${D}" | sed -e "s/[^-][^\/]*\//.|/g" -e "s/.|\([^ ]\)/|.|\1/" | sed 's/[a-z]//g' | sed 's/[A-Z]//g' | sed 's/[0-9]//g' | sed 's/-//g' | sed 's/|\./  /g' | sed 's/|/ /g' | sed 's/\.//g')
	echo "${DIRSPACE}Directories: $(find ${D}/* -maxdepth 0 -type d | wc -l)"
	echo "${DIRSPACE}Files:"
	FILEEXTENSIONS=$(find ${D}/* -maxdepth 0 -type f -print | awk -F . '{print $NF}' | sort | uniq -c | sort -n | sed 's/^[ \t]*//' | sed -e "s/^/${DIRSPACE}      /")
	echo ${FILEEXTENSIONS}
	echo "${DIRSPACE}TOTAL (files + directories): $(find ${D}/* -maxdepth 0 | wc -l)"
done
echo "----------------------------------------------------------------------------
Directories: $(find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} -type d | wc -l)
Files:
$(find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} -type f -print | awk -F . '{print $NF}' | sort | uniq -c | sort -n | sed 's/^[ \t]*//' | sed -e "s/^/      /")
TOTAL (files + directories): $(find ${INPUTDIR}/* -maxdepth ${MAXDEPTH} | wc -l)
----------------------------------------------------------------------------"
IFS='$ORIGINALIFS'