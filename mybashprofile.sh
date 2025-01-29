#!/bin/bash
############################################################################
############################## MYBASHPROFILE ###############################
############################################################################
#Author: Willian T.A.F. Silva (willian.silva@evobiolab.com).
############################################################################

#Add to your ~/.bashrc or ~/.bash_profile file the following lines of code (without the hashtags):
#source <PATH TO mybashprofile.sh> #Read mybashprofile.sh whenever you log in.

############################################################################
#START UP:

#When running this script via sbatch (add -l to sbatch script shebang) to ensure that 
#we return to the submission directory before the sbatch script starts.
CURRENTLOCATION=$(echo $(readlink -f .)) 

#Home directories.
HOME=<?????> #Personal home directory.
PROJHOME=<?????> #Project home directory.

cd ${HOME}

############################################################################
#INTERNAL FIELD SEPARATOR (IFS):

ORIGINALIFS=$'\n' #Save original internal field separator (IFS).
IFS_SPACE=$' '
IFS_TAB=$'\t'
IFS_LINE=$'\n'
IFS=$'\n' 

############################################################################
#HISTORY:

export HISTTIMEFORMAT="%Y%m%d%H%M%S: $ "
export HISTSIZE=10000000
export HISTFILESIZE=10000000
#export HISTCONTROL=ignoredups:erasedups #Avoid duplicates.
shopt -s histappend #When the shell exits, append to the history file instead of overwriting it.

############################################################################
#COLORS:

export LS_COLORS="rs=0:di=48;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:\
bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:\
sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:\
ex=38;5;34:\
*.gz=38;5;9:*README.txt=48;5;9:*.script=38;5;99:*.slurm=38;5;55:*.Rscript=38;5;99:*.Rlog=38;5;55:\
*.pdf=38;5;9:*.tbi=38;5;88:*.tar=38;5;9:*.tgz=38;5;9:*.zip=38;5;9:*.jar=38;5;9:*.war=38;5;9:\
*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:\
*.mov=38;5;13:*.mpeg=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.mp3=38;5;45:" 
#GNU (38=foreground color; 48=background color; 4=underlined; 5=flashing text; 1=bold; 0=default).
#export CLICOLOR=1 #iOS.
#export LSCOLORS=ExBxhxhxCxhxhxCxCxExEx #iOS.

#Color of users on terminal:
SIMPLEPS1="[\u@\h:\W]$ " #Simple version with no colors. # USERNAME @ HOSTNAME: WORKINGDIR $ 
ORIGINALPS1="[\[\e[1;32m\]\u\[\e[m\]@\[\e[1;31m\]\h\[\e[m\]:\[\e[1;34m\]\W\[\e[m\]]$ " #The block \[\e[0;32m\]\h\[\e[m\] defines the information to show (\h) and its color (36). Result: [williansilva@WilliansMBP2015:~]$ 
export PS1="[\[\e[1;32m\]\u\[\e[m\]@\[\e[1;31m\]\h\[\e[m\]:\[\e[1;34m\]\W\[\e[m\]]$ " #The block \[\e[0;32m\]\h\[\e[m\] defines the information to show (\h) and its color (36). Result: [williansilva@WilliansMBP2015:~]$ 

############################################################################
#IMPORTANT PATHS (define paths to important files and directories):

#PERSONAL DIRECTORIES:
PATHTOMYOUTPUT=$(echo ${HOME}/myoutput) #Output directory.
PATHTOMYSAFE=$(echo ${HOME}/mysafe) #Output directory.
PATHTOMYTRASH=$(echo ${HOME}/mytrash) #Trash directory.
PATHTOMYTMP=$(echo ${HOME}/mytmp) #Temporary files directory.
PATHTOMYEXPORT=$(echo ${HOME}/myexport) #Export directory.
PATHTOMYTEST=$(echo ${HOME}/mytest) #Test directory.
PATHTOMYAPPLICATIONS=$(echo ${HOME}/myapplications) #My applications.
PATHTOMYSLURM=$(echo ${HOME}/myslurm) #SLURM directory.
MYSLURMFILE="${PATHTOMYSLURM}/slurm-%J.out" #SLURM file.
PATHTOMYSCRIPTSDIR=$(echo ${HOME}/myscripts) #My scripts.
PATHTOMYBASHPROFILES=$(echo ${PATHTOMYSCRIPTSDIR}/bashprofiles) #Bash profiles. Clone from GitHub.
PATHTOMYSCRIPTS=$(echo ${PATHTOMYSCRIPTSDIR}/scripts) #Scripts. Clone from GitHub.
PATHTOMYSUBMITTEDSCRIPTS=$(echo ${PATHTOMYSCRIPTSDIR}/scripts-submitted) #Submitted scripts.

#PROJECT DIRECTORIES:
PATHTOPROJWORKINGDIR=$(echo ${PROJHOME}/${USER}-workingdir) #Working directory.
PATHTOPROJOUTPUT=$(echo ${PATHTOPROJWORKINGDIR}/output) #Output directory.
PATHTOPROJORIGINALFILES=$(echo ${PATHTOPROJWORKINGDIR}/original-files) #Original files directory.
PATHTOPROJSAFE=$(echo ${PATHTOPROJWORKINGDIR}/safe) #Safe directory.
PATHTOPROJTMP=$(echo ${PATHTOPROJWORKINGDIR}/tmp) #Temporary files directory.
PATHTOPROJEXPORT=$(echo ${PATHTOPROJWORKINGDIR}/export) #Export directory.
PATHTOPROJTRASH=$(echo ${PATHTOPROJWORKINGDIR}/trash) #Trash directory.
PATHTOPROJTEST=$(echo ${PATHTOPROJWORKINGDIR}/test) #Test test directory.

############################################################################
#IMPORTANT VARIABLES (define variables):

#FILES:
REFGAL6=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Gallus_gallus.GRCg6a.dna.toplevel.fa) #Reference genomes (Gal6).
REFGAL7B=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.fa) #Reference genome (Gal7b).
REFHOMOGRCh38=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Homo_sapiens.GRCh38.dna.toplevel.fa) #Reference genome (Homo sapiens).

#PROJECT VARAIBLES:
PROJECT_ID=<?????> #Compute project ID.
PARTITION_DEFAULT=shared
MYEMAIL=<?????>

############################################################################
#PATH (define directories containing executable files/scripts):

#General:
export PATH=$PATH:\
${PATHTOMYBASHPROFILES}:\
${PATHTOMYSCRIPTS}:\
${PATHTOMYSUBMITTEDSCRIPTS}

#Installed applications.
export PATH=$PATH:$(echo ${PATHTOMYAPPLICATIONS}/<?????>) #Path to some specific installation.
export R_LIBS_USER=$(echo ${PATHTOMYAPPLICATIONS}/R/library) #Path to local R applications.

############################################################################
#EXECUTABLE FILES (automatically make all .sh files in the directory executable):

chmod -R +x $(find ${PATHTOMYSCRIPTSDIR} -name "*.sh")
chmod -R +x $(find ${PATHTOMYSCRIPTSDIR} -name "*.R")

############################################################################
#ALIASES:

#General:
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls -hF --color=always'
alias rm='rm -iv'
alias now='date +"%Y%m%d%H%M%S"'
alias pathto='readlink -f' #Show full path to file/directory.
alias sizeof='du -hc' #Show file/directory size.
alias sourcebash='source ~/.bashrc' #Reset bash.
#alias sourcebash='source ~/.bash_profile' #Reset bash.
alias listcommands='compgen -c' #List all possible commands.
alias editbash='vi ~/.bashrc'
#alias editbash='vi ~/.bash_profile'
alias open='display'

#Actions:
alias lsw='ls-stdout.sh'
alias mvw='mv-stdout.sh'
alias rmw='rm-stdout.sh'
alias mkdirw='mkdir-stdout.sh'
alias str='dirstructure-stdout.sh'

#Change directory.
#Shortcut to working directory.
alias projdir='cd ${PATHTOPROJWORKINGDIR}'
#Shortcut to scripts directory.
alias myscripts='cd ${PATHTOMYSCRIPTS}' 
#Shortcut to temporary files directory.
alias mytmpdir='cd ${PATHTOMYTMP}' 
alias projtmp='cd ${PATHTOPROJTMP}'
#Shortcut to safe directory.
alias projsafe='cd ${PATHTOPROJSAFE}' 
alias mysafedir='cd ${PATHTOMYSAFE}' 
#Shortcut to trash directory.
alias projtrash='cd ${PATHTOPROJTRASH}' 
alias mytrashdir='cd ${PATHTOMYTRASH}' 
#Shortcut to export directory.
alias projexport='cd ${PATHTOPROJEXPORT}' 
alias myexportdir='cd ${PATHTOMYEXPORT}' 
#Shortcut to test directory.
alias projtest='cd ${PATHTOPROJTEST}' 
alias mytestdir='cd ${PATHTOMYTEST}' 

#Shortcut to specific projects.
alias proj1='cd ${PATHTOPROJOUTPUT}/<?????>' 

#SLURM information.
#Shortcut to currently running jobs.
alias myjobs='squeue -u ${USER}'
#List my current and recent jobs.
alias listmyjobs='sacct --format="JobID,Partition,JobName%30,User,State,Elapsed,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+"'
#Shortcut for recent (and current) jobs.
alias recentjobs='sacct --uid ${USER} --format="User,JobID,JobName,Partition,AllocCPUS,AllocNodes,CPUTime,Start,End,State,ExitCode" | grep -v ".ext+" | grep -v ".ex+" | grep -v ".bat+" | grep -v ".ba+"' 
#Shortcut to command of last sbatch job.
alias lastjob='history | grep sbatch | tail -n 1' 
#Shortcut to last slurm file.
alias lastslurm='less $(echo ${PATHTOMYSLURM}/$(ls -Art ${PATHTOMYSLURM}/ | tail -n 1))'

#Other aliases.
#Log off from all active sessions.
alias logoffall='pkill -u ${USER}'
#Full host name.
alias hostname='hostname -f'
#Project news flash.
alias newsflash='less +G ${PROJHOME}/NEWSFLASH.txt'

#Project aliases.
#Run interactive mode for quick/test jobs (Dardel/PDC).
alias interactivejob='salloc -A ${PROJECT_ID} -p shared -c 1 -t 06:00:00 ' 

############################################################################
#FUNCTIONS:

function mymodules {
    echo "---> Loading modules ..."
    echo "---> module load PDC/23.12"
    module load PDC/23.12
    echo "---> module load bioinfo-tools"
    module load bioinfo-tools
    echo "---> module load bcftools"
    module load bcftools
    echo "---> module load vcftools"
    module load vcftools
    echo "---> module load samtools"
    module load samtools
    echo "---> module load bamtools"
    module load bamtools
    echo "---> module load star/2.7.11a"
    module load star/2.7.11a
    echo "---> module load GATK"
    module load GATK
    #echo "---> module load clustalo/1.2.4"
    #module load clustalo/1.2.4
    #echo "---> module load bowtie2/2.5.2"
    #module load bowtie2/2.5.2
    #echo "---> module load bwa/0.7.18"
    #module load bwa/0.7.18
    echo "---> module load R/4.4.1-cpeGNU-23.12"
    module load R/4.4.1-cpeGNU-23.12
    echo "---> module load python/3.12.1"
    module load python/3.12.1
    #echo "---> module load SHAPEIT/v5.1.1"
    #module load SHAPEIT/v5.1.1
    #echo "---> module load Beagle/5.4"
    #module load Beagle/5.4
}

############################################################################
#MINOR SYSTEM CORRECTIONS:

#unalias ls-l

############################################################################
cd ${CURRENTLOCATION} #Return to original location.