#!/usr/bin/sh
mkdir -p /usr/local/src/moe-counter
cd /usr/local/src/moe-counter

git init
git remote add origin https://github.com/journey-ad/Moe-Counter.git
git pull
git checkout master -f
git branch --set-upstream-to origin/master

npm install
npm run start