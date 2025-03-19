#!/bin/bash
# installer for RAT

# staging
echo [*] Staging process...
cd ..
mv RAT .RAT
rm -rf RAT
cd .RAT
echo [+] Completed

#  get tools
echo [*] Installing tools...
sudo apt update
sudo apt-get install sshpass
echo [+] Completed

# set up alias workflow
echo [*] Setting up alias...
echo "alias onlyrat=\"python3 $(pwd)/main.py\"" >> ~/.bash_aliases
echo [+] Completed

# clean up
echo [+] Installation Completed
echo "- delete this directory and restart your terminal"
echo "- type 'rat' into your terminal to launch RAT"