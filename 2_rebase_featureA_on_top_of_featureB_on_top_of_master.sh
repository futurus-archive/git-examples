#!/bin/bash
GIT_DIR="scenario-rebase-based-off-feature-branch"
echo $GIT_DIR

mkdir $GIT_DIR && cd $GIT_DIR

# Init
git init
echo "Line 1" >> main_file
git acm "Init project"

# Progress made on master concurrently
echo "First progress in master" >> main_file
git acm "Add a line in main_file"

sleep 0.1

# Feature A branches off master
git checkout -b featureA
echo "This is a new feature" >> featureA
git acm "Implement featureA"

echo "One more line" >> featureA
git acm "Some progress"

sleep 0.1

# Feature B branches off Feature A
git checkout -b featureB
echo "Adding to featureA from featureB branch" >> featureB
git acm "Implement featureB on top of featureA"

# Progress made on master concurrently
git master
echo "More progress on master" >> main_file
git acm "More progress"

echo "Bugfix on master" >> main_file
git acm "Important bugfix"

sleep 0.1

# More progress on Feature A
git checkout featureA
echo "More progress on featureA" >> featureA
git acm "Checkpoint"

sleep 0.5

# More progress on master
git master
# echo "Random addition" >> main_file
# git acm "Add new thing"

echo "Another thing" >> main_file
git acm "Checkpoint on master"

echo "Finally" >> main_file
git acm "Release"

git lgp


# either take (B - A) to master or (B + B ^ A) to master