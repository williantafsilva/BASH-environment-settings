# BASH environment settings - Dardel/PDC

## 1. Get a SUPR NAISS account.

If you don not have a SUPR NAISS account yet, register at https://supr.naiss.se/

## 2. Create an SSH key and add it to your SSH config file.

1. Open your terminal.

2. Create an ~/.shh directory.

```
cd ${HOME}
mkdir -p .ssh
chmod 700 ~/.ssh
```

3. Generate an SSH key.

```
ssh-keygen -t ed25519 -f ~/.ssh/id-ed25519-pdc
```

4. Add your SSH key to your SSH configuration file.

```
echo "Host dardel.pdc.kth.se
	IdentityFile $(readlink -f ~/.ssh/id-ed25519-pdc)" >> ~/.ssh/config
```

## 3. Register your SSH key on PDC Login Portal.

1. Open your SSH public key, select everything and copy it to the clipboard.

```
less ~/.ssh/id-ed25519-pdc.pub
```

2. Open PDC Login Portal (https://loginportal.pdc.kth.se/) in an internet browser and log in (authenticate your identity to PDC).

3. Select **Add new key**.

4. Paste your **SSH public key**.

5. Choose a key name to identify the computer where your SSH key is located (e.g., Personal computer, My MacBook).

6. Save.

## 4. Log into Dardel/PDC.

1. Open the terminal.

2. Log into Dardel (change **\<USERNAME\>** for your Dardel username).

```
ssh USERNAME@dardel.pdc.kth.se
```

3. Now you have access to Dardel/PDC via the terminal.

## 5. Set up ThinLinc.

1. Download and install ThinLinc in your local machine (https://www.cendio.com/thinlinc/download/). If you have a MacBook, follow the instructions on https://www.cendio.com/resources/docs/tag/client_macos.html#installing-the-macos-client.

2. Open ThinLinc and type in your Dardel/PDC username and the server address to Dardel (**dardel-vnc.pdc.kth.se**).

3. Go to **Advanced > Options > Security**, select **Public Key** as the **Authentication Method** and click **OK**.

4. In **Key**, select your private SSH key file (used to log into Dardel/PDC).

5. Click **Connect** and, if prompted a password, type in the password you used when you created you SSH key.

6. Now you have access to Dardel/PDC via ThinLinc.

## 6. Create important directories.

1. Log into Dardel/PDC in a terminal (via ssh), or open the terminal on ThinLinc.

2. Create directories in your **HOME** directory.

```
mkdir $(echo "${HOME}/myscripts") #Scripts directory.
mkdir $(echo "${HOME}/myscripts/scripts-submitted") #Submitted scripts directory.
mkdir $(echo "${HOME}/myoutput") #Output directory.
mkdir $(echo "${HOME}/myapplications") #Local applications directory.
mkdir $(echo "${HOME}/myslurm") #SLURM directory.
mkdir $(echo "${HOME}/mysafe") #Safe directory.
mkdir $(echo "${HOME}/mytrash") #Trash directory.
mkdir $(echo "${HOME}/mytmp") #tmp directory.
mkdir $(echo "${HOME}/myexport") #Export directory.
mkdir $(echo "${HOME}/mytest") #Test directory.
```

3. Create directories in your **PROJECT** directory.

```
PROJHOME=


```


## General recommendations

- Raw data should be organized within the ${PROJHOME}/original-files directory.

All our raw data and original files need to be moved to a subdirectory called original-files, which is located in the storage project directory (PROJHOME=/cfs/klemming/projects/supr/sllstore2017078), so if the raw data you are using are not in ${PROJHOME}/original-files and you are the only one using that data set, you can move it to a subdirectory in ${PROJHOME}/original-files. 

- Create README files for every directory and keep it updated.

Make a habit of creating README files for every directory you create and keep those README files updated with all the information about the data the directory contains, so that future users can understand what the directory contains and how the data was obtained, without having to find that information elsewhere.

- Keep your activity within your ${PROJHOME}/${USER}-workingdir directory.

- Keep copies of the scripts used to process data in the same directory where the corresponding output data was stored and add notes to the README file.

- These tools can help you manage your scripts and synchronize your local machine and your GitHub repositories: GitHub Desktop (https://github.com/apps/desktop), Sublime Text (https://www.sublimetext.com/), Visual Studio Code (https://code.visualstudio.com/).

## Important directories

- Create the following directories:

	- Working directory (${PROJHOME}/${USER}-workingdir): USER-specific directory within the project directory where all USER's activity will take place.

	- Scripts directory (${HOME}/myscripts): Directory where USER will have all their scripts (cloned from GitHub, or otherwise). This directory should be in the personal directory of USER to avoid loss of script files in the event of project discontinuation.

	- Local applications directory (${HOME}/myapplications): Directory where USER installs softwares that are not available through the cluster.

	- SLURM directory (${HOME}/myslurm): Directory where slurm log files will be saved.

	- Safe directory (${PROJHOME}/${USER}-workingdir/safe): Directory where files and directories (original, not copies) that need to be temporarily protected from modifications during intermediate steps of a process (or testing). These files should be moved back to their original directory as soon as possible. Files and directories are moved to/from safe using tosafe-stdout.sh and fromsafe-stdout.sh.

	- Original files directory (${PROJHOME}/${USER}-workingdir/original-files): Directory with raw data and original files that should not be modified.

	- Output directory (${PROJHOME}/${USER}-workingdir/output): Directory where all USER's output (processed files and results) will be stored.

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

## BASH profile

- Edit mybashprofile.sh, substituting <?????> with your specific information.

- Add the path to your BASH profile to your ~/.bashrc or ~/.bash_profile file:

```
source <PATH TO mybashprofile.sh> #Read mybashprofile.sh whenever you log in.
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

- Go to the directory where the repository clone will be stored.

```
cd ${PATHTOMYSCRIPTSDIR}
```

- Import repository.

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

## Useful scripts

Some of the scripts available here require the definition of the following environment variables (mybashprofile.sh): PATHTOPROJSAFE, PATHTOMYSLURM, PATHTOPROJEXPORT, PATHTOPROJTEST, PATHTOPROJTMP, PATHTOPROJTRASH.

- countfiles-stdout.sh: Count number of files in a directory.

- countlines-stdout.sh: Count the number of lines in each file.

- cp-stdout.sh: Copy files to a target directory.

- dirstructure-stdout.sh: Show directory hierarchy.

- joblog-stdout.sh: View log file (in ${PATHTOMYSLURM}) of an SBATCH job.

- ls-stdout.sh: List files in input directory.

- mkdir-stdout.sh: Create a directory with a pre-filled README.txt file and log the creation of the directory.

- mkREADME-stdout.sh: Create a README.txt file with a header.

- mv-stdout.sh: Move or change name of input file.

- njobs-stdout.sh: Retrieve the number of pending, running, completed, failed and cancelled sbatch jobs submitted by the user.

- searchwithinfiles-stdout.sh: Search files that contain a specific string.

- toexport-stdout.sh: Copy files to project export directory (${PATHTOPROJEXPORT}).

- toREADME-stdout.sh: Add note to README.txt file.

- tosafe-stdout.sh: Move target files/directories TO the project safe directory (${PATHTOPROJSAFE}).

- fromsafe-stdout.sh: Move target files/directories FROM the project safe directory (${PATHTOPROJSAFE}).

- totest-stdout.sh: Copy files to project test directory (${PATHTOPROJTEST}).

- totmp-stdout.sh: Copy files to project tmp directory (${PATHTOPROJTMP}).

- totrash-stdout.sh: Move input files to project trash directory (${PATHTOPROJTRASH}).
