#ARG BUILD_FROM
#FROM $BUILD_FROM
FROM homeassistant/aarch64-base:3.16

# Copy root filesystem
COPY rootfs /

# Setup requirements
ARG BUILD_ARCH
RUN set -x && apk add --no-cache openssh
