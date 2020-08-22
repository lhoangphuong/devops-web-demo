#!/usr/bin/env bash
# for quick commit
#
#

git add .
echo "Give commit Name:"
read $commit
git commit -m '$commit'
git push
git status
