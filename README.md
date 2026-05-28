# HA Mosquitto Broker Add-on

Eclipse Mosquitto MQTT Broker as Home Assistant add-on.
Supports armv7 (iHost), aarch64, amd64.

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**
2. Click the **⋮** menu (top right) → **Repositories**
3. Add: `https://github.com/seoeaa/ha-mosquitto-addon`
4. Find **Mosquitto Broker** → Install → Start

## Configuration

Default config:
- Port: 1883
- `allow_anonymous: true`
- Persistence enabled

Config is stored in `/config/mosquitto/` and persists across restarts.
