#!/usr/bin/sh
mkdir -p /usr/local/src/moe-counter
cd /usr/local/src/moe-counter
# Init repo, then fill from remote
git init
git remote add origin https://github.com/journey-ad/Moe-Counter.git
git pull
git checkout master -f
git branch --set-upstream-to origin/master
# Fix database location to work with mounts
mkdir -p /usr/local/src/moe-counter/data/
sed -i "s|../count.db|../data/count.db|g" /usr/local/src/moe-counter/db/sqlite.js
# Install npm packages and start webserver
npm install
npm run start