#!/bin/bash
GIT_DIR="scenario-rebase-interactive"
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
git acm "Missing semi-colon"

sleep 0.1
echo "Crazy experiment" >> featureA
git acm "Crazy experiment that might not work"

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

echo "Some more progress" >> main_file
git acm "More progress"

echo "Release time" >> main_file
git acm "Release 1.0.0"

git checkout featureA
git lg


# scenario-rebase-interactive

# git checkout featureA
# git rebase -i HEAD~4

# resolve conflict

# git add .
# git rebase --continue