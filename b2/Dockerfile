ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Setup requirements
ARG BUILD_ARCH
RUN set -x \
 && curl -Lo /usr/bin/b2 https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux \
 && chmod +x /usr/bin/b2
