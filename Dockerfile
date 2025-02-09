FROM oven/bun:1.2.2-alpine

COPY entrypoint.sh /

# Enable entrypoint & Install git
RUN chmod +x /entrypoint.sh && apk add git
# Limit git to low memory
RUN git config --global pack.windowMemory "50m" \
    && git config --global pack.packSizeLimit "50m" \
    && git config --global pack.threads "1"

# Config
EXPOSE 3000
ENV LOG_LEVEL='warn'


WORKDIR /usr/local/src/moe-counter

ENTRYPOINT [ "sh", "/entrypoint.sh" ]