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
HOME=????? #Personal home directory.
PROJHOME=????? #Project home directory.

cd ${HOME}

#Create the following directories:
#mkdir $(echo "${HOME}/myscripts")
#mkdir $(echo "${HOME}/myscripts/scripts-submitted")
#mkdir $(echo "${HOME}/myoutput")
#mkdir $(echo "${HOME}/myslurm")
#mkdir $(echo "${HOME}/mytmp")
#mkdir $(echo "${HOME}/mytrash")
#mkdir $(echo "${HOME}/myapplications")

#mkdir $(echo "${PROJHOME}/${USER}-workingdir")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/output")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/original-files")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/tmp")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/trash")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/.screenshots")
#mkdir $(echo "${PROJHOME}/${USER}-workingdir/testdir")

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
*.gz=38;5;9:*README.txt=48;5;9:\
*.script=38;5;99:*.slurm=38;5;55:*.Rscript=38;5;99:*.Rlog=38;5;55:\
*.pdf=38;5;9:*.tbi=38;5;88:\
*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:\
*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:\
*.Z=38;5;9:*.dz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:\
*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:\
*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:\
*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:\
*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:\
*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:\
*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:\
*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:\
*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:\
*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:\
*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:\
*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:\
*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:" #GNU (38=foreground color; 48=background color; 4=underlined; 5=flashing text; 1=bold; 0=default).
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
PATHTOMYTRASH=$(echo ${HOME}/mytrash) #Trash directory.
PATHTOMYTMP=$(echo ${HOME}/mytmp) #Temporary files directory.
PATHTOMYAPPLICATIONS=$(echo ${HOME}/myapplications) #My applications.
PATHTOMYSLURM=$(echo ${HOME}/myslurm) #SLURM directory.
MYSLURMFILE="${PATHTOMYSLURM}/slurm-%J.out" #SLURM file.
PATHTOMYSCRIPTS=$(echo ${HOME}/myscripts) #My scripts.
PATHTOMYSBATCHSCRIPTS=$(echo ${PATHTOMYSCRIPTS}/scripts-sbatch) #SBATCH scripts. Clone from GitHub.
PATHTOMYGENERALSCRIPTS=$(echo ${PATHTOMYSCRIPTS}/scripts-general) #General scripts. Clone from GitHub.
PATHTOMYBASHPROFILES=$(echo ${PATHTOMYSCRIPTS}/bashprofiles) #Bash profiles. Clone from GitHub.
PATHTOMYSUBMITTEDSCRIPTS=$(echo ${PATHTOMYSCRIPTS}/scripts-submitted) #Submitted scripts.
PATHTOMYPIPELINES=$(echo ${PATHTOMYSCRIPTS}/bioinformatics-pipelines) #Bioinformatics pipelines. Clone from GitHub.

#PROJECT DIRECTORIES:
PATHTOPROJWORKINGDIR=$(echo ${PROJHOME}/${USER}-workingdir) #Working directory.
PATHTOPROJOUTPUT=$(echo ${PATHTOPROJWORKINGDIR}/output) #Output directory.
PATHTOPROJORIGINALFILES=$(echo ${PATHTOPROJWORKINGDIR}/original-files) #Original files directory.
PATHTOPROJTMP=$(echo ${PATHTOPROJWORKINGDIR}/tmp) #Temporary files directory.
PATHTOPROJTRASH=$(echo ${PATHTOPROJWORKINGDIR}/trash) #Temporary files directory.
PATHTOPROJTESTDIR=$(echo ${PATHTOPROJWORKINGDIR}/test) #Temporary test directory.
PATHTOPROJSCREENSHOTS=$(echo ${PATHTOPROJWORKINGDIR}/.screenshots) #Screenshots directory.

############################################################################
#IMPORTANT VARIABLES (define variables):

#FILES:
REFGAL6=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Gallus_gallus.GRCg6a.dna.toplevel.fa) #Reference genomes (Gal6).
REFGAL7B=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Gallus_gallus.bGalGal1.mat.broiler.GRCg7b.dna.toplevel.fa) #Reference genome (Gal7b).
REFHOMOGRCh38=$(echo ${PATHTOPROJORIGINALFILES}/referencegenomes/Homo_sapiens.GRCh38.dna.toplevel.fa) #Reference genome (Homo sapiens).

#PROJECT VARAIBLES:
PROJECT_ID=????? #Compute project ID.
PARTITION_DEFAULT_UPPMAX=core
PARTITION_DEFAULT_PDC=shared
MYEMAILADDRESS=?????

############################################################################
#PATH (define directories containing executable files/scripts):

#General:
export PATH=$PATH:${PATHTOMYSBATCHSCRIPTS}:${PATHTOMYGENERALSCRIPTS}:${PATHTOMYBASHPROFILES}:${PATHTOMYSUBMITTEDSCRIPTS}

#Installed applications.
export PATH=$PATH:$(echo ${PATHTOMYAPPLICATIONS}/?????) #Path to some specific installation.
export R_LIBS_USER=$(echo ${PATHTOMYAPPLICATIONS}/R/library) #Path to local R applications.

############################################################################
#EXECUTABLE FILES (automatically make all .sh files in the directory executable):

chmod -R +x $(find ${PATHTOMYSCRIPTS} -name "*.sh")
chmod -R +x $(find ${PATHTOMYSCRIPTS} -name "*.R")
chmod -R +x $(find ${PATHTOMYSCRIPTS} -name "*.py")

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
#Shortcut to test directory.
alias projtest='cd ${PATHTOPROJTESTDIR}' 
#Shortcut to trash directory.
alias projtrash='cd ${PATHTOPROJTRASH}'
#Shortcut to specific projects.
alias proj1='cd ${PATHTOPROJOUTPUT}/?????' 

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
#Run interactive mode for quick/test jobs (Dardel/PDC).
alias interactivejob='salloc -A ${PROJECT_ID} -p shared -c 1 -t 06:00:00 ' 
#Log off from all active sessions.
alias logoffall='pkill -u ${USER}'
#Full host name.
alias hostname='hostname -f'

############################################################################
#FUNCTIONS:

function mymodules {
    echo "---> Loading modules ..."
    echo "---> module load UPPMAX/1.0.0"
    module load UPPMAX/1.0.0
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
    #echo "---> module load GATK"
    #module load GATK
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