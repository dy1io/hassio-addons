ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Setup requirements
ARG BUILD_ARCH
RUN set -x \
  && apk add --no-cache python3 py3-pip \
  && pip install b2
