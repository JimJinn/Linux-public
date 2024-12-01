#!/bin/bash
# install-mosquitto

# Check if mosquitto is installed
if ! dpkg -l | grep -q mosquitto; then
    echo "Mosquitto is not installed. Installing..."
    sudo apt install -y mosquitto mosquitto-clients
else
    echo "Mosquitto is already installed."
fi

# Publish a test message
#mosquitto_pub -h <MQTT_SERVER_IP> -t "homeassistant/sensor/disk_health" -m "Disk: Healthy"