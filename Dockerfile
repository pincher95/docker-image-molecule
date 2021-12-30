FROM docker:stable-dind
LABEL maintainer="Yuri Tsuprun" \
      architecture="amd64/x86_64" \
      org.opencontainers.image.title="docker:stable-dind" \
      org.opencontainers.image.authors="Yuri Tsuprun <yuri.tsuprun@gmail.com>" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE

RUN set -ex && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
    python3 python3-dev py3-pip gcc git curl build-base autoconf automake \
    py3-cryptography linux-headers musl-dev libffi-dev openssl-dev openssh && \
    python3 -m pip install ansible molecule 'molecule[docker]' --no-cache-dir && \
    rm -rf /var/cache/apk/* /root/.cache