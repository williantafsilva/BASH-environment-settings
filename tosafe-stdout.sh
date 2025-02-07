#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Move target files/directories to the project safe directory (${PATHTOPROJSAFE}).

##Input: Target files/directories.
##Output: Move target files/directories to the project safe directory.
##Use fromsafe-stdout.sh <TAG> to move target files/directories to the specified directory.

##Usage: 
##tosafe-stdout.sh <TARGET DIRECTORY>

############################################################################
##ACTIONS:

RUNDATE=$(date +"%Y%m%d%H%M%S")

##Input.

INPUT="$@"

##Process.

#Recovery tag and directory name.
RECOVERYDIRNAME=$(echo "safe-${RUNDATE}-$(tr -dc A-Za-z0-9 </dev/urandom | head -c 10)")
RECOVERYDIR=$(echo "${PATHTOPROJSAFE}/${RECOVERYDIRNAME}")

#Create safe recovery directory.
mkdir -p ${RECOVERYDIR} 

#Move input files/directories.
mv ${INPUT} ${RECOVERYDIR} 

echo "----------------------------------------------
The following files/directories can now be found in ${RECOVERYDIR}:
$(find ${INPUT} -maxdepth 0)

To recover the files/directories above, use:
\$ fromsafe-stdout.sh <OUTPUT LOCATION> ${RECOVERYDIRNAME}
----------------------------------------------"