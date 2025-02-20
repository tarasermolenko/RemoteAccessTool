# Project [IN PROGRESS]
Taras Ermolenko

#### Dev Road Map
- remote connection
- hide user
    - reconnaissance scan
        - ip addr for ssh
        - smtp results
- attacker console

## Overview: 
Remote Access Tool that can be used to control target computers.


### stage1
Gets administrative permissions to it can be installed
Add exclusion paths for the `Startup` and `Temp` directories so Defender doesn't give us any issues. 
Installs and runs our `stage2` file.
Delete Itself

### stage2
Installs and sets up the RAT and it's dependencies.
Create a local admin account that we will use to modify the system. 
Creates a working directory in the `Temp` directory to store files the RAT relies on. 
Enable persistant SSH so we can always remotely access the computer with our administrative account. 
Download and run our `hide-user.reg` and `confirm-reg.vbs` and invoke them. 
Hide administrative account and self delete.

### hide-user.reg
This is a registry file that hides our administrative user from the system log in page.

### confirm-reg.vbs
When installing the `hide-user.reg` file, we need to interact with some interactive windows. To bypass this, we use this vbs file to inject keystrokes and bypass the confirmations windows.
