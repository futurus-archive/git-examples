#!/bin/bash
GIT_DIR="scenario-revert"
echo $GIT_DIR

mkdir $GIT_DIR && cd $GIT_DIR

git init

echo 'alice' > alpha.html
git acm "1"

echo 'bob' > beta.html
git acm "2"

echo 'callie' > charlie.html
git acm "3"

echo 'diana' > delta.html
git acm "4"

echo 'ellen' > edison.html
git acm "5"
