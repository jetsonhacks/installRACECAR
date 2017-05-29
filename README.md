# installRACECAR
Install the MIT RACECAR ROS software and dependencies
To install the MIT RACECAR ROS pacakages on a Jetson:

$ ./installRACECAR.sh [dirname]

Where dirname is an optional parameter that indicates the top level Catkin Workspace directory in which to install the RACECAR packages. the default is ~/racecar-ws

The script will fetch the RACECAR packages and place them into the workspace src directory and then install the required dependencies. Then the script will run catkin_make
