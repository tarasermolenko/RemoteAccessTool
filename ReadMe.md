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
- Email account ( must have LSA Access enabled or use Secure App Password if using gmail)

**Target PC**
- Windows 10/11 privileged user

## Instructions:
**Target Installation**
- The installers folder contains the script that needs to be ran on the target
- The credentials are sent over email

**Attacker Installation**
- Install dependencies for RAT
```bash
chmod +x install.sh
./install.sh
```
**Attacker Console**
- Run `rat` in your terminal for help
```bash
rat
```
![Project Screenshot](https://github.com/tarasermolenko/RemoteAccessTool/blob/main/rat%20tool.png)



