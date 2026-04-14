ARG PIHOLE_VERSION
ARG KEEPALIVED_VERSION
ARG PIHOLE_IMAGE=pihole/pihole:$PIHOLE_VERSION
FROM $PIHOLE_IMAGE

ARG CONFIG_FILENAME=keepalived

RUN apk add --no-cache keepalived=${KEEPALIVED_VERSION}

ADD ${CONFIG_FILENAME}.conf /etc/keepalived/keepalived.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

COPY custom-entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

ENTRYPOINT ["/custom-entrypoint.sh"]
