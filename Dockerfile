FROM alpine:latest

LABEL maintainer="Izumiko <yosoro@outlook.com>"

ARG TARGETOS TARGETARCH TARGETVARIANT CLASH_META_VERSION

ENV CLASH_META_CONFIG_DIRECTORY=/root/.config/clash

EXPOSE 7890 9090

RUN apk add --update --no-cache ca-certificates \
    && rm -rf /var/cache/apk/*

RUN if [ "${TARGETARCH}" = "amd64" ]; \
then wget -qO clash.meta.gz https://github.com/MetaCubeX/Clash.Meta/releases/download/${CLASH_META_VERSION}/clash.meta-${TARGETOS}-amd64-compatible-${CLASH_META_VERSION}.gz \
    && gzip -d clash.meta.gz && chmod +x clash.meta \
    && mv clash.meta /usr/local/bin/clash.meta; \
else wget -qO clash.meta.gz https://github.com/MetaCubeX/Clash.Meta/releases/download/${CLASH_META_VERSION}/clash.meta-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}-${CLASH_META_VERSION}.gz \
    && gzip -d clash.meta.gz && chmod +x clash.meta \
    && mv clash.meta /usr/local/bin/clash.meta; \
fi

ENTRYPOINT /usr/local/bin/clash.meta -d $CLASH_META_CONFIG_DIRECTORY
