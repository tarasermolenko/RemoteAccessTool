## Project [IN PROGRESS]
Taras Ermolenko

## Overview: 
Remote Access Tool that can be used to control target computers.

## Stages
1. initial payload creates files in start up directory
    - cmd to run administrative commands
        -set exec bypass
    - vbs file to hold `alt` + `y` for UAC bypass
    - self delete
2. new malware initializes remote connection
    - any additional tools can be installed remoteley
    - keps a low profile on the payload
3. modularity
    - having a direcotry to store resources

## Dev Roadmap
- add exception to temp folder
- advanced staging for remote connection
    - persistant ssh
    - admin account and registry
    - reconnaisssance scan
        - ip addr for ssh
        - smtp results
    - vm detection
- establish attacker console
    - python
    - send commands back and forth [ssh]
    - modular interface

- vbs special folders
- keylooger
- screenshots



## PayLoads:
key logger

the only thing you have to download is initial.cmd 
can be put on a ruber ducky or whatever


## notes

in rat_installer
random function creates random string of text for obfuscation
create account func creatse a local admin
then tries to download registery and save it as a random name