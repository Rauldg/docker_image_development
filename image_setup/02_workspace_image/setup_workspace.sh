#!/bin/bash

# In this file you can add a script that intitializes your workspace

# add /opt/startscritps to path, you need to do it here, becaude /home/devel is a mounted folder
echo 'export PATH=${PATH}:/opt/startscripts' | sudo tee -a /home/devel/.bashrc > /dev/null

    
    # echo "first start: setting up mare-it-workspace"

    # mkdir -p /opt/workspace/src
    # cd /opt/workspace/

    # #source /opt/setup_env.sh
    # source /opt/ros/melodic/setup.bash 
    # catkin init && catkin build


    # echo 
    # echo "workspace initialized, please"
    # echo "source devel/setup.bash"
    # echo "catkin build"
    # echo
