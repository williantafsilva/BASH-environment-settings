# BASH environment settings - Dardel/PDC

## 1. Get a SUPR NAISS account.

- 1.1. If you don not have a SUPR NAISS account yet, register at https://supr.naiss.se/.

- 1.2. Log into SUPR NAISS and request a Dardel/PCD account.

## 2. Create an SSH key and add it to your SSH config file.

- 2.1. Open your terminal.

- 2.2. Create an ~/.shh directory.

	```
	cd ${HOME}
	mkdir -p .ssh
	chmod 700 ~/.ssh
	```

- 2.3. Generate an SSH key.

	```
	ssh-keygen -t ed25519 -f ~/.ssh/id-ed25519-pdc
	```

- 2.4. Add your SSH key to your SSH configuration file.

	```
	echo "Host dardel.pdc.kth.se
		IdentityFile $(readlink -f ~/.ssh/id-ed25519-pdc)" >> ~/.ssh/config
	```

## 3. Register your SSH key on PDC Login Portal.

- 3.1. Open your SSH public key, select everything and copy it to the clipboard.

	```
	less ~/.ssh/id-ed25519-pdc.pub
	```

- 3.2. Open PDC Login Portal (https://loginportal.pdc.kth.se/) in an internet browser and log in (authenticate your identity to PDC).

- 3.3. Select **Add new key**.

- 3.4. Paste your **SSH public key**.

- 3.5. Choose a key name to identify the computer where your SSH key is located (e.g., Personal computer, My MacBook).

- 3.6. Save.

## 4. Log into Dardel/PDC.

- 4.1. Open the terminal.

- 4.2. Log into Dardel (change **\<USERNAME\>** for your Dardel username).

	```
	ssh <USERNAME>@dardel.pdc.kth.se
	```

- 4.3. Now you have access to Dardel/PDC via the terminal.

## 5. Set up ThinLinc.

- 5.1. Download and install ThinLinc in your local machine (https://www.cendio.com/thinlinc/download/). If you have a MacBook, follow the instructions on https://www.cendio.com/resources/docs/tag/client_macos.html#installing-the-macos-client.

- 5.2. Open ThinLinc and type in your Dardel/PDC username and the server address to Dardel (**dardel-vnc.pdc.kth.se**).

- 5.3. Go to **Advanced > Options > Security**, select **Public Key** as the **Authentication Method** and click **OK**.

- 5.4. In **Key**, select your private SSH key file (used to log into Dardel/PDC).

- 5.5. Click **Connect** and, if prompted a password, type in the password you used when you created you SSH key.

- 5.6. Now you have access to Dardel/PDC via ThinLinc.

## 6. Create important directories.

- 6.1. Read about these directories before creating them.

	- USER's **HOME** directory is USER-specific and should be used to store files that are not linked to any particular storage or compute project. If the USER leaves a PDC storage project, the USER will still have access to the files in their USER's **HOME** directory.	

	- **Storage project home directory** contains all the files linked to the specific project. Many USERS have access to the project storage directory, so it is important to have the following subdirectories:

		- **original-files** (storage project subdirectory) contains all the raw data that will be shared among members of the project. This subdirectory will be created by the storage project manager. Do not modify any of the files within the **original-files** directory unless you receive permission from the storage manager.

		- **project-bash-settings** (storage project subdirectory) contains shared scripts and USER-specific bash settings. This subdirectory will be created by the storage project manager. Do not modify any of the files within the **project-bash-settings** directory unless you receive permission from the storage manager.

		- **${USER}-workingdir** (storage project subdirectory) contains all the files produced by the USER. All your activity should be restricted to your working directory. This subdirectory will be created by the storage project manager. Never create files or directories **outside** your working directory unless you receive permission from the storage project manager.

	```
	#Find the path to your USER's HOME directory and your storage project home directory.
	projinfo
	```

	- Important **${USER}-workingdir** subdirectories (to be created by the USER):

		- **${USER}-workingdir/original-files** contains raw data and original files that are USER-specific or that were downloaded by the USER and will not be shared among other members of the project.

		- **${USER}-workingdir/scripts** contains project-related scripts written by the USER (or cloned from GitHub). Scripts that are not linked to the project should be in the personal directory of USER to avoid loss of script files in the event of project discontinuation.

		- **${USER}-workingdir/scripts/scripts-submitted** contains copies of sbatch scripts submitted by the USER. To automatically save a copy of the submitted scripts, the USER needs to write sbatch scripts including the command `cat $0 > <PATH TO SUBMITTED SCRIPTS DIRECTORY>/job${SLURM_JOB_ID}.sh`, changing **\<PATH TO SUBMITTED SCRIPTS DIRECTORY\>** for the full path to this directory.

		- **${USER}-workingdir/output** contains all the USER's output (processed files and results).

		- **${USER}-workingdir/applications** contains the USER's installations of softwares that are not available through the cluster.

		- **${USER}-workingdir/slurm** contains slurm log files from project-related sbatch jobs submitted by the USER.

		- **${USER}-workingdir/trash** contains files and directories that were deleted using the script **totrash-stdout.sh** (mentioned in step 7). The trash directory needs to be cleared regularly to free up disk space.

		- **${USER}-workingdir/tmp** contains temporary copies of files and directories. Copies of files and directories can be created in the **tmp** directory using the script **totmp-stdout.sh** (mentioned in step 7).

		- **${USER}-workingdir/export** contains copies of files that will be exported by the user. Having an **export** directory allows us to import files from the server (from outside the server, using *scp* or *rsync*) using always the path to the **export** directory instead of a different path every time files need to be imported. Copies of files and directories can be created in the **export** directory using the script **toexport-stdout.sh** (mentioned in step 7). To import files from your **export** directory to your local machine, use the command `scp -r <USER>@dardel.pdc.kth.se:<PATH TO EXPORT DIRECTORY>/* .`, changing **\<USER\>** for your *Dardel/PDC* username and **\<PATH TO EXPORT DIRECTORY\>** for the full path to your **export directory** on *Dardel/PDC*. You can also create an alias (e.g., *importfrompdc*) in your local machine so that you do not need to type the whole command every time you need to import files from your **export** directory.

	- Important **HOME** subdirectories (to be created by the USER): The USER is adviced to create the subdirectories above also in the USER's **HOME** directory, but using the prefix *my* to distinguish them from the **${USER}-workingdir** subdirectories. These subdirectories should be used in precesses that are not linked to any **storage project** and are not shared with any other USER.

		- **${HOME}/myoriginalfiles**

		- **${HOME}/myscripts**

		- **${HOME}/myscripts/scripts-submitted**

		- **${HOME}/myoutput**

		- **${HOME}/myapplications**

		- **${HOME}/myslurm**

		- **${HOME}/mytrash**

		- **${HOME}/mytmp**

		- **${HOME}/myexport**

- 6.2. Log into Dardel/PDC in a terminal (via ssh), or open the terminal on ThinLinc.

- 6.3. Define your PDC storage project directory (change **\<PATH TO STORAGE PROJECT HOME DIRECTORY\>** for the full path to your PDC **storage project home directory**, which can be found on https://supr.naiss.se/ or with the command `projinfo`).

	```
	PROJHOME=<PATH TO STORAGE PROJECT HOME DIRECTORY>
	```

- 6.4. **(FOR THE STORAGE PROJECT MANAGER ONLY)** Create the project **original-files** and **project-bash-settings-\<LAB NAME\>** (replace \<LAB NAME\> with the name of the research group, e.g., silvalab) subdirectories.

	```
	mkdir -p "${PROJHOME}/original-files" #Project original files directory.
	mkdir -p "${PROJHOME}/project-bash-settings-<LAB NAME>" #Project BASH settings directory.
	```	

- 6.5. Create your project working directory and give other users permission to read it.

	```
	mkdir -p "${PROJHOME}/${USER}-workingdir" #Create project working directory.
	chmod -R g+wrx "${PROJHOME}/${USER}-workingdir" #Set permissions.
	```

- 6.6. Create subdirectories in your **${USER}-workingdir** located in your PDC **storage project directory**.

	```
	mkdir -p "${PROJHOME}/${USER}-workingdir/original-files" #Project original files directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/scripts" #Project scripts directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/scripts/scripts-submitted" #Project submitted scripts directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/output" #Project output directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/applications" #Project local applications directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/slurm" #Project local applications directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/trash" #Project trash directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/tmp" #Project TMP directory.
	mkdir -p "${PROJHOME}/${USER}-workingdir/export" #Project export directory.
	```

- 6.7. Create directories in your USER's **HOME** directory.

	```
	mkdir -p "${HOME}/myoriginalfiles" #Original files directory.
	mkdir -p "${HOME}/myscripts" #Scripts directory.
	mkdir -p "${HOME}/myscripts/scripts-submitted" #Submitted scripts directory.
	mkdir -p "${HOME}/myoutput" #Output directory.
	mkdir -p "${HOME}/myapplications" #Local applications directory.
	mkdir -p "${HOME}/myslurm" #SLURM directory.
	mkdir -p "${HOME}/mytrash" #Trash directory.
	mkdir -p "${HOME}/mytmp" #tmp directory.
	mkdir -p "${HOME}/myexport" #Export directory.
	```

## 7. Configure your BASH profile.

Configuring your BASH profile can considerably facilitate your activity in the terminal. For example, one can define variables that are frequently used so that you do not need to define them every time you need them; one can change the color of different file types so that it is visually easier to find them; one can create aliases (shortcuts) to different commands; and one can add the paths to the scripts directory so that calling them becomes easier. The USER's BASH profile configuration can be defined with commands added to the USER's *~/.bashrc* file (which is located in the USER's **HOME** directory). The *~/.bashrc* file is loaded every time the USER logs in.

With that in mind and assuming you have all the directories mentioned in step 6, follow the next steps to add predefined useful settings to your BASH profile. These settings are located in the **${PROJHOME}/project-bash-settings-<LAB NAME>** directory and contain important variables, such as *PROJECT_ID*, as well as paths that can be used in scripts (with the shebang *#!/bin/bash -l*), and aliases to useful commands. However, most of these predefined BASH settings can only be used if the directories mentioned in step 6 exist.

- 7.1. Log into Dardel/PDC in a terminal (via ssh).

- 7.2. Add project and user settings to the beginning of your *~/.bashrc* file (change **\<PATH TO STORAGE PROJECT HOME DIRECTORY\>** for the full path to your PDC **storage project home directory**, which can be found on https://supr.naiss.se/ or with the command `projinfo`). Adding this `source` call to the beginning of your *~/.bashrc* file allows you to overwrite any variable that has been predefined in the **${PROJHOME}/project-bash-settings-<LAB NAME>** directory by defining such variable after/below the *source* call.

	```
	sed -i '1isource "<PATH TO STORAGE PROJECT HOME DIRECTORY>/project-bash-settings-<LAB NAME>/${USER}-settings.sh"' ~/.bashrc
	```

- 7.3. Load your BASH settings (*~/.bashrc*).

	```
	source ~/.bashrc
	```

- 7.4. Check which variables and aliases have been predefined in your BASH settings.

	```
	less "${PROJHOME}/project-bash-settings-<LAB NAME>/general-settings.sh"
	less "${PROJHOME}/project-bash-settings-<LAB NAME>/${USER}-settings.sh"
	```

- 7.5. Ask the storage project manager to add or remove specific variables, aliases or settings.

- 7.6. If the directories mentioned in step 6 exist, you should be able to use shared scripts, such as *totmp-sdtout.sh* (create a copy of a file in your project tmp directory) and *toexport-sdtout.sh* (create a copy of a file in your project test directory).

## 8. Import GitHub repositories.

GitHub is a useful tool to manage your scripts and projects. We can use GitHub to create a repository to store our scripts and connect our local machine to your scripts directory on Dardel/PDC, so that you create your scripts locally (local copy of your GitHub repository) using your favorite tools, then submit your changes to your online GitHub repository and, finally, pull the updated scripts from your online GitHub repository to your remote scripts directory on Dardel/PDC. Here I show how to connect to GitHub from Dardel/PDC, clone an existing GitHub repository and update the Dardel/PDC clone of the repository. 

- 8.1. Configure Git (change **\<USER NAME\>** for your GitHub username and **\<E-MAIL\>** for your GitHub-associated e-mail address).

	```
	cd ${HOME}
	git config --list --show-origin #Check current configuration.
	git config --global user.name "<USER NAME>"
	git config --global user.email <E-MAIL>
	```

- 8.2. Create an SSH key (change **\<E-MAIL\>** for your GitHub-associated e-mail address, and use no password when prompted) to access your GitHub account.

	```
	cd ${HOME}
	ssh-keygen -t ed25519 -f ~/.ssh/id-ed25519-github -C "<E-MAIL>" 
	```

- 8.3. Start the SSH agent in the background.

	```
	eval "$(ssh-agent -s)"
	```

- 8.4. Add your SSH private key to the ssh-agent.

	```
	ssh-add ~/.ssh/id-ed25519-github
	```

- 8.5. Verify that you have a private key generated and loaded into SSH.

	```
	ssh-add -l -E sha256
	```

- 8.6. Add the SSH public key to your account on GitHub (for authentication) (https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

- 8.6. Verify you can connect to GitHub.

	```
	ssh -T git@github.com
	```

- 8.7. Verify that the SSH key on GitHub matches the output from the ssh-add command.

	```
	ssh-add -l -E md5
	```

- 8.8. Clone GitHub repositories.

	- 8.8.1. Go to the directory where the repository clone will be stored.

		```
		cd "${PROJHOME}/${USER}-workingdir/scripts"
		```

	- 8.8.2. Import/clone repository (change **\<GITHUB REPOSITORY SSH ADDRESS\>** for the SSH address to the target GitHub repository, usually in the form *git<span>@</span>github.com:\<GITHUB USER\>/\<GITHUB REPOSITORY NAME\>.git*).

		```
		git clone <GITHUB REPOSITORY SSH ADDRESS>
		```

- 8.9. Update Dardel/PDC clones of GitHub repositories when necessary (whenever the online GitHub repository is updated). *Suggestion: Create a script (e.g., githubsync.sh) to update all your GitHub repositories simultaneously.*

	- 8.9.1. Start SSH agent in the background.

		```
		eval "$(ssh-agent -s)"
		```

	- 8.9.2. Add your SSH private key to the ssh-agent.

		```
		ssh-add ~/.ssh/id-ed25519-github
		```

	- 8.9.3. Go to the repository directory cloned from GitHub (change **\<GITHUB REPOSITORY NAME\>** for the name of the target GitHub repository).

		```
		cd "${PROJHOME}/${USER}-workingdir/scripts/<GITHUB REPOSITORY NAME>"
		```

	- 8.9.4. Pull repository from GitHub.

		```
		git stash
		git pull origin
		```

## 9. Important recommendations.

- 9.1. Keep raw data organized in the **${PROJHOME}/original-files** directory and do not modify or move them without the permission of the project manager.

- 9.2. Create README files for every directory and keep it updated. Make a habit of creating README files for every directory you create and keep those README files updated with all the information about the data the directory contains, so that future users (and even yourself) can understand what the directory contains and how the data was obtained, without having to find that information elsewhere.

- 9.3. Keep your activity within your the **${PROJHOME}/${USER}-workingdir** directory (or, as I put it, keep your mess in your own bedroom, don't bring it to the living room).

- 9.4. Keep copies of the scripts used to process data in the same directory where the corresponding output data is located and add notes to the README file.

- 9.5. These tools can help you manage your scripts and synchronize your local machine and your GitHub repositories: GitHub Desktop (https://github.com/apps/desktop), Sublime Text (https://www.sublimetext.com/), Visual Studio Code (https://code.visualstudio.com/).

