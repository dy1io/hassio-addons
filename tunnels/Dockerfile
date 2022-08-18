ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY entrypoint.sh /entrypoint.sh

# Setup requirements
RUN set -x && apk add --no-cache openssh tree

CMD [ "/entrypoint.sh" ]
