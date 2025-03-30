ARG PIHOLE_VERSION
ARG PIHOLE_IMAGE=pihole/pihole:$PIHOLE_VERSION
FROM $PIHOLE_IMAGE

RUN apk add --no-cache keepalived

ADD keepalived_master.conf /etc/keepalived/keepalived.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

COPY custom-entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

ENTRYPOINT ["/custom-entrypoint.sh"]
