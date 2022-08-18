ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Setup requirements
RUN set -x && apk add --no-cache openssh
