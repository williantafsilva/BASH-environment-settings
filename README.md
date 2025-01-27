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

