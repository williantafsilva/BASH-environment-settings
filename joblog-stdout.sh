#!/bin/bash -l
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##View log file of an SBATCH job.

##Input: SBATCH job ID.
##Output: Print log file of the SBATCH job.

##Usage: 
##joblog-stdout.sh <JOB ID>

############################################################################
##ACTIONS:

##Input.

JOBID=$1

##Process.

less $(ls ${PATHTOMYSLURM}/* | grep ${JOBID}) 
#scontrol write batch_script ${JOBID} - #Alternative.