FROM node:20-alpine3.21

COPY entrypoint.sh /

RUN chmod +x entrypoint.sh && apk add git
RUN git config --global pack.windowMemory "50m" \
    && git config --global pack.packSizeLimit "50m" \
    && git config --global pack.threads "1"

EXPOSE 3000

WORKDIR /usr/local/src/moe-counter

ENTRYPOINT [ "sh", "/entrypoint.sh" ]