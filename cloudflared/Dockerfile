ARG BUILD_FROM
FROM $BUILD_FROM

COPY rootfs /

ARG BUILD_ARCH

RUN set -x \
 && apk add --no-cache curl \
 && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm64"; fi \
 && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
 && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="386"; fi \
 && curl -Lo /bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH} \
 && chmod +x /bin/cloudflared