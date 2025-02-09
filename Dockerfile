FROM node:20-alpine3.21

COPY entrypoint.sh /

RUN chmod +x entrypoint.sh && apk add git

EXPOSE 3000

WORKDIR /usr/local/src/moe_counter

ENTRYPOINT [ "sh", "/entrypoint.sh" ]