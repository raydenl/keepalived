#!/bin/sh

# Start Keepalived with error checking
echo "  [i] Starting Keepalived"
/usr/sbin/keepalived &
KEEPALIVED_PID=$!

# Wait briefly and check if Keepalived started successfully
sleep 5
if ps --pid "$KEEPALIVED_PID" > /dev/null; then
    echo "  [i] Keepalived started successfully with PID $KEEPALIVED_PID"
else
    echo "  [i] ERROR: Keepalived failed to start."
    
    exit 1
fi

# Call the original start.sh
exec /usr/bin/start.sh
