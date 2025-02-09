#!/usr/bin/sh
mkdir -p /usr/local/src/moe-counter
cd /usr/local/src/moe-counter
# Init repo, then fill from remote
git init
git remote add origin https://github.com/journey-ad/Moe-Counter.git
git pull
git checkout master -f
git branch --set-upstream-to origin/master
# Fix database location to work with mounts & use buns faster sqlite driver
mkdir -p /usr/local/src/moe-counter/data/
sed -i "s|../count.db|../data/count.db|g" /usr/local/src/moe-counter/db/sqlite.js
sed -i "s|('better-sqlite3')|('bun:sqlite').Database|g" /usr/local/src/moe-counter/db/sqlite.js
# Always log the start message
sed -i "s|logger.info(\"Your app|console.log(\"Your app|g" /usr/local/src/moe-counter/index.js
# And remove old sqlite driver
bun remove better-sqlite3
# Install npm packages and start webserver
bun install
bun run ./index.js