#!/bin/sh

# Start Keepalived with error checking
echo "  [i] Starting Keepalived"
/usr/sbin/keepalived &
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
