# BASH environment settings

## BASH profile

- Edit mybashprofile.sh, substituting <?????> with your specific information.

- Add the path to your BASH profile to your ~/.bashrc or ~/.bash_profile file:

```
source <PATH TO mybashprofile.sh> #Read mybashprofile.sh whenever you log in.
```

## Important directories

- Create the following directories:

	- Working directory (${PROJHOME}/${USER}-workingdir): USER-specific directory within the project directory where all USER's activity will take place.

	- Scripts directory (${HOME}/myscripts): Directory where USER will have all their scripts (cloned from GitHub, or otherwise). This directory should be in the personal directory of USER to avoid loss of script files in the event of project discontinuation.

	- Local applications directory (${HOME}/myapplications): Directory where USER installs softwares that are not available through the cluster.

	- SLURM directory (${HOME}/myslurm): Directory where slurm log files will be saved.

	- Safe directory (${PROJHOME}/${USER}-workingdir/safe): Directory where files and directories (original, not copies) that need to be temporarily protected from modifications during intermediate steps of a process (or testing). These files should be moved back to their original directory as soon as possible. Files and directories are moved to/from safe using tosafe-stdout.sh and fromsafe-stdout.sh.

	- Original files directory (${PROJHOME}/${USER}-workingdir/original-files): Directory with raw data and original files that should not be modified.

	- Output directory (${PROJHOME}/${USER}-workingdir/output): Directory where all USER's output will (processed files and results) be stored.

	- Trash directory (${PROJHOME}/${USER}-workingdir/trash): Directory with files and directories that were deleted using totrash-stdout.sh. The trash directory needs to be cleared regularly to free up disk space.

	- Tmp directory (${PROJHOME}/${USER}-workingdir/tmp): Directory with temporary copies of files and directories created using totmp-stdout.sh.

	- Export directory (${PROJHOME}/${USER}-workingdir/export): Directory with copies of files created using toexport-stdout.sh that will be exported.

	- Test directory (${PROJHOME}/${USER}-workingdir/test): Directory with files and directories used for testing commands, scripts, processes, etc. It also contains copies of directories and files created using totest-stdout.sh.

### Personal directory ($HOME)

```
#Scripts directory: this is where your github repositories will be cloned into.
mkdir $(echo "${HOME}/myscripts")

#Submitted scripts directory: this is where a copy of all the submitted scripts will be saved.
mkdir $(echo "${HOME}/myscripts/scripts-submitted")

#Output directory: 
mkdir $(echo "${HOME}/myoutput")

#Local applications directory:
mkdir $(echo "${HOME}/myapplications")

#SLURM directory: 
mkdir $(echo "${HOME}/myslurm")

#Safe directory:
mkdir $(echo "${HOME}/mysafe")

#Trash directory: 
mkdir $(echo "${HOME}/mytrash")

#TMP directory: 
mkdir $(echo "${HOME}/mytmp")

#Export directory:
mkdir $(echo "${HOME}/myexport")

#Test directory:
mkdir $(echo "${HOME}/mytest")
```

### Project directory ($PROJHOME)

```
#Project working directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir")

#Project output directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/output")

#Project original files directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/original-files")

#Project safe directory:
mkdir $(echo "${PROJHOME}/${USER}-workingdir/safe")

#Project trash directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/trash")

#Project TMP directory:
mkdir $(echo "${PROJHOME}/${USER}-workingdir/tmp")

#Project export directory:
mkdir $(echo "${PROJHOME}/${USER}-workingdir/export")

#Project test directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/test")
```

## Import scripts from GitHub

### Configure Git

```
cd ${HOME}

git config --list --show-origin #Check current configuration.

git config --global user.name "<USER NAME>"

git config --global user.email <E-MAIL>
```

### Set up GitHub authentication via SSH

- Create SSH key (add "\_github" to the file name when prompted and use no password).

```
cd ${HOME}

ssh-keygen -t ed25519 -C "<E-MAIL>" 
```

- Start SSH agent in the background.

```
eval "$(ssh-agent -s)"
```

- Add your SSH private key to the ssh-agent.

```
ssh-add ~/.ssh/id_ed25519_github
```

- Verify that you have a private key generated and loaded into SSH.

```
ssh-add -l -E sha256
```

- Add the SSH public key to your account on GitHub (for authetication) (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

- Verify you can connect to GitHub.

```
ssh -T git@github.com
```

- Verify that list of SSH keys on GitHub matches the output from the ssh-add command.

```
ssh-add -l -E md5
```

### Clone GitHub repositories (first time only)

```
git clone git@github.com:williantafsilva/BASH-environment-settings.git
```

### Update GitHub repositories

Recommendation: Create a script (e.g., githubsync.sh) to update all your GitHub repositories with a single command call.

- Start SSH agent in the background.

```
eval "$(ssh-agent -s)"
```

- Add your SSH private key to the ssh-agent.

```
ssh-add ~/.ssh/id_ed25519_github
```

- Go to the repository directory cloned from GitHub.

```
cd <PATH TO REPOSITORY DIRECTORY>
```

- Pull repository from GitHub.

```
git stash
git pull origin
```
