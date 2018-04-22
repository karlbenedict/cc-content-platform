#!/usr/bin/env bash 

# copy the utility notebook for calculating a new password hash into the top
# level of the platform
cd /home/jovyan
cp /home/root/SHA1PasswordCalculator.ipynb .

# remove any previously pulled copy of a workshop repository and perform a
# fresh pull from GitHub
rm -rf workshops-pm
git clone https://github.com/karlbenedict/workshops-pm.git
# change the initial location in the platform to the workshop folder
cd /home/jovyan/workshops-pm
cp /home/root/setGitOptions.sh .
