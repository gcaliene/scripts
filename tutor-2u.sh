#!/bin/zsh

echo "updating fullstack live from 2u"
cd ~/Documents/Github/fullstack-live/ || exit
git status
git branch
git stash
git pull
echo "fullstack live updated"

echo " "
echo " "
echo "opening vscode for fullstack live"
code ./
echo " "




