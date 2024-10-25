# BASH environment settings




## Create important directories.

Personal directory:

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

#TMP directory: 
mkdir $(echo "${HOME}/mytmp")

#Trash directory: 
mkdir $(echo "${HOME}/mytrash")
```

Project directory:

```
#Project working directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir")

#Project output directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/output")

#Project original files directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/original-files")

#Project screenshots directory (hidden): 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/.screenshots")

#Project test directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/testdir")

#Project TMP directory:
mkdir $(echo "${PROJHOME}/${USER}-workingdir/tmp")

#Project trash directory: 
mkdir $(echo "${PROJHOME}/${USER}-workingdir/trash")
```

## Clone GitHub repositories.

```

```


############################################################################
#Import scripts from GitHub.
#echo "---> Synchronizing GitHub repositories..."

#Configure Git.
#cd ${HOME}
#git config --list --show-origin #Check current configuration.
#git config --global user.name "Willian Silva"
#git config --global user.email willian.silva@evobiolab.com
#Set up GitHub authentication via SSH.
#cd ${HOME}
#ssh-keygen -t ed25519 -C "willian.silva@evobiolab.com" #Create SSH key (add "_github" to the file name when prompted and use no password).
#eval "$(ssh-agent -s)" #Start SSH agent in the background.
#ssh-add ~/.ssh/id_ed25519_github #Add your SSH private key to the ssh-agent.
#ssh-add -l -E sha256 #Verify that you have a private key generated and loaded into SSH.
#Add the SSH public key to your account on GitHub (for authetication) (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
#ssh -T git@github.com #Verify you can connect to GitHub.
#ssh-add -l -E md5 #Verify that list of SSH keys on GitHub matches the output from the ssh-add command.
#Clone GitHub depositories (first time only).
#git clone git@github.com:williantafsilva/scripts-pdc.git
#git clone git@github.com:williantafsilva/scripts-general.git
#git clone git@github.com:williantafsilva/bashprofiles.git
#git clone git@github.com:williantafsilva/bioinformatics-pipelines.git

#Update all GitHub depositories. Create a separate script for this to avoid errors when using scp.
#eval "$(ssh-agent -s)" #Start SSH agent in the background.
#ssh-add ~/.ssh/id_ed25519_github #Add your SSH private key to the ssh-agent.
#cd ${PATHTOMYSBATCHSCRIPTS}
#git stash
#git pull origin
#cd ${PATHTOMYGENERALSCRIPTS}
#git stash
#git pull origin
#cd ${PATHTOMYBASHPROFILES}
#git stash
#git pull origin
#cd ${PATHTOMYPIPELINES}
#git stash
#git pull origin
#cd ${HOME}



