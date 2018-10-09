#!/bin/bash
GIT_DIR="scenario-rebase-on-top-of-master"
echo $GIT_DIR

mkdir $GIT_DIR && cd $GIT_DIR

# master
git init
echo "Line 1" >> main_file
git acm "Init project"

# feature
git checkout -b featureA
echo "This is a new feature" >> featureA
git acm "Implement featureA"

sleep 1

# master progress
git master
echo "This is added before featureA is merged into master" >> main_file
git acm "Add a line in main_file"

echo "Some more progress" >> main_file
git acm "More progress"

echo "Release time" >> main_file
git acm "Release 1.0.0"

git lg
