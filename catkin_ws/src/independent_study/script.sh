#!/bin/bash
 STRING="cd ~/catkin_ws/src/Firmware"
 eval $STRING
 source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/posix_sitl_default
 export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd):$(pwd)/Tools/sitl_gazebo
 source setup.bash
 source ~/catkin_ws/devel/setup.bash
