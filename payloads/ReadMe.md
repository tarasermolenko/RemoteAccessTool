## How it works:

### Payloads
This directory contains all of the payloads that the RAT will use on the target systems. 

### stage 1
Gets administrative permissions so it can be installed
Add exclusion paths for the `Startup` and `Temp` directories so Defender doesn't give us any issues. 
Installs and runs our `stage2` file.
Delete Itself

### stage 2
Installs and sets up the RAT and it's dependencies.
Create a local admin account that will be used to modify the system. 
Creates a working directory in the `Temp` directory to store files the RAT will use.
Enable persistant SSH so we can remotely access the target computer with our administrative account. 
Download and run our `hide-user.reg` and `confirm-reg.vbs` and invoke them. 
Hide administrative account and self delete.

### hide-user.reg
Registry file that hides our administrative user from the system log in page.

### confirm-reg.vbs
When installing the `hide-user.reg` file, we need to interact with some interactive windows. 
To bypass the confirmations windows, use this vbs file to inject keystrokes.

### update.sh
A file used by our main.py file in order to check for updates and update the RAT



#### Notes
Powershell wont run automatically because windows is trying to be secure, but we can use command line to run it for us.