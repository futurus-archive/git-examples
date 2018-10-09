#!/bin/bash
GIT_DIR="git-pull-scenario"
echo $GIT_DIR

mkdir $GIT_DIR && cd $GIT_DIR

# master
git init
echo "Line 1" >> main_file
git acm "Init project"

echo "First progress in master" >> main_file
git acm "Add a line in main_file"

echo "More progress on master" >> main_file
git acm "More progress"

echo "Bugfix on master" >> main_file
git acm "Important bugfix"

sleep 0.1
git remote add origin ssh://git@stash.es.ad.adp.com:7999/~alex.nguyen/git-pull-scenario.git
git push -u origin master