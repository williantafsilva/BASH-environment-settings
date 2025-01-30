#!/bin/bash
############################################################################
############################# STDOUT FUNCTION ##############################
############################################################################
##Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################
##SCRIPT DESCRIPTION:

##Description:
##Retrieve the number of pending, running, completed, failed and cancelled sbatch jobs submitted by the user.

##Input: NONE.
##Output: Number of pending, running, completed, failed and cancelled sbatch jobs submitted by the user.

##Usage: 
##njobs-stdout.sh

############################################################################
##ACTIONS:

##Process.

NPENDING=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "PENDING" | wc -l)
NRUNNING=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING" | wc -l)
NCOMPLETED=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "COMPLETED" | wc -l)
NFAILED=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "FAILED" | wc -l)
NTIMEOUT=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "TIMEOUT\|TIME_OUT\|TIME OUT" | wc -l)
NCANCELLED=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "CANCELLED" | wc -l)
NOUTOFMEMORY=$(sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "OUT_OF_MEMORY\|OUT OF MEMORY\|OUT_OF_ME+" | wc -l)

echo "----------------------------------------------------------------------------
SUBMITTED JOBS (from the last 7 days) (User: ${USER})
PENDING: ${NPENDING}
RUNNING: ${NRUNNING}
COMPLETED: ${NCOMPLETED}
FAILED: ${NFAILED}
TIMEOUT: ${NTIMEOUT}
OUT OF MEMORY: ${NOUTOFMEMORY}
CANCELLED: ${NCANCELLED}
----------------------------------------------------------------------------"
if [[ $((${NPENDING} + ${NRUNNING})) -gt 20 ]] ; then 
	if [[ ${NRUNNING} -le 20 ]] && [[ ${NPENDING} -le 20 ]] ; then
		sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|JobID"
		echo "----------------------------------------------------------------------------"
	elif [[ ${NRUNNING} -le 20 ]] && [[ ${NRUNNING} -gt 0 ]] && [[ ${NPENDING} -ge 20 ]] ; then
		sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|JobID"
		echo "----------------------------------------------------------------------------"
	elif [[ ${NRUNNING} -ge 20 ]] && [[ ${NPENDING} -le 20 ]] && [[ ${NPENDING} -gt 0 ]] ; then
		sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "PENDING\|JobID"
		echo "----------------------------------------------------------------------------"
	fi
elif [[ ${NRUNNING} -gt 0 ]] || [[ ${NPENDING} -gt 0 ]] ; then
	sacct --starttime=$(date --date='7 days ago' +%Y-%m-%d) --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+" | grep "RUNNING\|PENDING\|JobID"
	echo "----------------------------------------------------------------------------"
fi