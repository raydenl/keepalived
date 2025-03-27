FROM pihole/pihole:2025.03.0

RUN apk add --no-cache keepalived

ADD keepalived_master.conf /etc/keepalived/keepalived.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["start.sh"]

CMD /usr/sbin/keepalived -n -l
