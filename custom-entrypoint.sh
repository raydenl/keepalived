#!/bin/sh
set -eu

echo "  [i] Starting Keepalived"
/usr/sbin/keepalived --dont-fork --log-console &
KEEPALIVED_PID=$!

# Background watcher that kills container if keepalived dies
(
    wait "$KEEPALIVED_PID"
    echo "  [!] ERROR: Keepalived exited unexpectedly."
    kill 1   # kill container
) &

echo "  [i] Keepalived started with PID $KEEPALIVED_PID"

exec /usr/bin/start.sh
