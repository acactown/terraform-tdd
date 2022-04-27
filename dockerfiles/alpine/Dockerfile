# Arguments
# ---------------
ARG ALPINE_VERSION=3.15.0

# Pull Base Image
# ---------------
FROM alpine:${ALPINE_VERSION}

# OS ENV Variables
# ----------------
ENV LANG=en_US.UTF-8 \
    CHARSET=UTF-8 \
    TZ=America/Bogota

# Install Dependencies
# --------------------
RUN apk update \
    && apk add --no-cache --update-cache tzdata bash ca-certificates findutils diffutils \
    && update-ca-certificates \
    && cp /usr/share/zoneinfo/America/Bogota /etc/localtime \
    && rm -rf /tmp/* /var/cache/apk/*
