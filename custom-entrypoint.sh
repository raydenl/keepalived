#!/bin/sh

# Ensure Keepalived log directory exists
mkdir -p /var/log/keepalived
chown pihole:pihole /var/log/keepalived

# Start Keepalived with error checking
echo "  [i] Starting Keepalived"
/usr/sbin/keepalived -n -l -G -g /var/log/keepalived.log &
KEEPALIVED_PID=$!

# Wait briefly and check if Keepalived started successfully
sleep 1
if ps -p "$KEEPALIVED_PID" > /dev/null 2>&1; then
    echo "  [i] Keepalived started successfully with PID $KEEPALIVED_PID"
else
    echo "  [i] ERROR: Keepalived failed to start. Check /var/log/keepalived.log for details."
    
    exit 1
fi

# Call the original start.sh
exec /usr/bin/start.sh
