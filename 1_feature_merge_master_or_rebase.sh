#!/bin/bash
GIT_DIR="scenario-you-should-rebase-than-merge"
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

sleep 0.1
rm featureA
echo "This is a new feature;" >> featureA
echo "This experiment actually works" >> featureA
git acm "Working version"

sleep 0.25

# master progress
git master
echo "This is added before featureA is merged into master" >> main_file
git acm "Add a line in main_file"

echo "Release time" >> main_file
git acm "Release 1.0.0"

git checkout featureA
git lgp


# What happens next

# git merge master
# echo "more progress on A" >> new_stuff
# git acm "more progress on A"
# git master
# git merge featureA

# vs.

# git rebase master
# echo "more progress on A" >> new_stuff
# git acm "more progress on A"
# git master
# git merge featureA
