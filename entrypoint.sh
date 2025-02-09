#!/usr/bin/sh
git clone https://github.com/journey-ad/Moe-Counter.git /usr/local/src/moe-counter \
    && cd /usr/local/src/moe-counter \
    && npm install \
    && npm run start
