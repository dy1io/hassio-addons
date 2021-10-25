ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Setup requirements
ARG BUILD_ARCH
RUN set -x \
 && apk add --no-cache curl \
 && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm64"; fi \
 && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
 && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="386"; fi \
 && curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-${ARCH}.zip \
 && unzip -o /ngrok.zip -d /bin \
 && rm -f /ngrok.zip

# Initialize ngrok
RUN  ngrok --version
