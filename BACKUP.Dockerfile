FROM pihole/pihole:2025.03.0

RUN apk add --no-cache keepalived

ADD keepalived_backup.conf /etc/keepalived/keepalived.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

CMD /usr/sbin/keepalived -n -l

ENTRYPOINT ["start.sh"]
