#!/bin/sh
set -e

echo "=== Mosquitto Broker starting ==="

mkdir -p /mosquitto/data
mkdir -p /mosquitto/log

if [ ! -f /mosquitto/config/mosquitto.conf ]; then
    cat > /mosquitto/config/mosquitto.conf << 'CONF'
listener 1883
allow_anonymous true
persistence true
persistence_location /mosquitto/data/
log_dest stdout
CONF
fi

exec /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
