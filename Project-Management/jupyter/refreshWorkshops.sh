#!/usr/bin/env bash 

cd /home/jovyan
cp /home/root/SHA1PasswordCalculator.ipynb .

rm -rf workshops-pm
git clone https://github.com/karlbenedict/workshops-pm.git

cd /home/jovyan/workshops-pm
cp /home/root/setGitOptions.sh .
cp /home/root/setGitOptions.sh .
