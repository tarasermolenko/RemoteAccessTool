## Project [IN PROGRESS]

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



## PayLoads:
key logger


the only thing you have to download is initial.cmd 
can be put on a ruber ducky or whatever