# [IN PROGRESS]

```
  ____                      _            _                           _____           _ 
 |  _ \ ___ _ __ ___   ___ | |_ ___     / \   ___ ___ ___  ___ ___  |_   _|__   ___ | |
 | |_) / _ \ '_ ` _ \ / _ \| __/ _ \   / _ \ / __/ __/ _ \/ __/ __|   | |/ _ \ / _ \| |
 |  _ <  __/ | | | | | (_) | ||  __/  / ___ \ (_| (_|  __/\__ \__ \   | | (_) | (_) | |
 |_| \_\___|_| |_| |_|\___/ \__\___| /_/   \_\___\___\___||___/___/   |_|\___/ \___/|_|
                                                                                                                        
```

# DISCLAIMER
Created for practice, please use ethically.

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
- The installers folder contains the script that needs to be ran on our target

**Attacker Installation**
- install dependencies for RAT
```bash
chmod +x install.sh
./install.sh
```

**Attacker Console**
- Run `rat` in your terminal for help
```bash
rat
```
- Append configuraiton file to specify target
```bash
rat user.rat
```
