#!/bin/bash
# Setup the github/mit-racecar/ ROS structure
# Usage installRACECAR.sh <dirName>
# dirName defaults to racecar-ws
# Fetches RACECAR ROS components, installs dependencies, and then catkin_make the workspace

source /opt/ros/kinetic/setup.bash
DEFAULTDIR=~/racecar-ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
if [ -e "$DEFAULTDIR" ] ; then
  echo "$DEFAULTDIR already exists; no action taken"
  echo "Placing RACECAR code into $DEFAULTDIR" 
else 
  echo "$DEFAULTDIR does not exist; no action taken."
  echo "This script only uses an existing initialized Catkin Workspace for the RACECAR code."
  exit 1
fi
cd "$DEFAULTDIR"

wget -q https://raw.githubusercontent.com/mit-racecar/racecar/master/racecar.rosinstall -O ~/"$DEFAULTDIR"/.rosinstall

wstool update

# Install prerequisite packages
echo "Installing prerequisites"
# jstest-gtk is added for testing the joystick
sudo apt-get -y install \
    libyaml-cpp-dev \
    jstest-gtk \
    ros-kinetic-razor_imu_9dof \
    ros-kinetic-tf \
    ros-kinetic-tf2_ros \
    ros-kinetic-urg_node \
    ros-kinetic-joy \
    ros-kinetic-joy_teleop \
    ros-kinetic-rosbag \
    ros-kinetic-rostopic \
    ros-kinetic-rviz \
    ros-kinetic-gmapping \
    ros-kinetic-hector_mapping \
    ros-kinetic-robot_pose_ekf

echo "Catkin Make"
catkin_make

