# [IN PROGRESS]

```
██████╗ ███████╗███╗   ███╗ ██████╗ ████████╗███████╗     █████╗  ██████╗ ██████╗███████╗███████╗███████╗    ████████╗ ██████╗  ██████╗ ██╗     
██╔══██╗██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██╔════╝    ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
██████╔╝█████╗  ██╔████╔██║██║   ██║   ██║   █████╗      ███████║██║     ██║     █████╗  ███████╗███████╗       ██║   ██║   ██║██║   ██║██║     
██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██╔══╝      ██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║       ██║   ██║   ██║██║   ██║██║     
██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ███████╗    ██║  ██║╚██████╗╚██████╗███████╗███████║███████║       ██║   ╚██████╔╝╚██████╔╝███████╗
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
```

# DISCLAIMER
Created for Practice and Educational Purpouses Only  

## Requirements:
**Attacker PC**
- Linux
- Python3
- SSH
- Email account ( must have LSA Access enabled)

**Target PC**
- Windows 10/11 privileged user

## Instructions:
**Target Installation**
- The installers folder contains all the ways we can install the RAT on to our target

**Attacker Installation**
- install rat by cloning this repository
```bash
git clone RAT.git
```
- install dependencies for OnlyRAT
```bash
chmod +x install.sh
./install.sh
```

**Attacker Console**
- Run `rat` in your terminal for help
```bash
onlyrat
```
- Append configuraiton file to specify target
```bash
onlyrat user.rat
```

## Overview: 
Remote Access Tool that can be used to control target computers.

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


#### Dev Road Map

- staging [Completed]
- remote connection [Completed]
- hide user [Completed]
    - ip addr for ssh [Completed]
    - smtp results [Completed]
- config file builder [Completed]

- attacker console [Completed]
    - console build [Completed]
    - update  [Completed]

Installers:
- USB RuberDucky

Payloads:
- KeyLogger


#### Notes
Powershell wont run automatically because windows is trying to be secure, but we can use command line to run it for us.


