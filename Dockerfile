ARG PIHOLE_VERSION=latest
ARG PIHOLE_IMAGE=pihole/pihole:${PIHOLE_VERSION}

FROM ${PIHOLE_IMAGE}

# Install keepalived with minimal layers
ARG KEEPALIVED_VERSION
RUN apk add --no-cache keepalived=~${KEEPALIVED_VERSION}

# Add config
ARG CONFIG_FILENAME
COPY ${CONFIG_FILENAME}.conf /etc/keepalived/keepalived.conf

# Copy entrypoint in same layer
COPY custom-entrypoint.sh /custom-entrypoint.sh

# Make entrypoint executable
RUN chmod +x /custom-entrypoint.sh

EXPOSE 53 53/udp 80 443

ENTRYPOINT ["/custom-entrypoint.sh"]
