#!/bin/bash
# install-mosquitto
# wget -O - https://raw.githubusercontent.com/JimJinn/Linux-public/refs/heads/main/install-mosquitto.sh | bash

# Check if mosquitto is installed
if ! dpkg -l | grep -q mosquitto; then
    echo "Mosquitto is not installed. Installing..."
    sudo apt install -y mosquitto mosquitto-clients
else
    echo "Mosquitto is already installed."
fi


# Save the server address to a file for future use
echo "MQTT_SERVER_IP=192.168.9.20" > ~/.notificator_config
echo "NOTIFY_TOPIC=telegram/alex" >> ~/.notificator_config
echo "Default MQTT server IP address and topic are written to ~/.notificator_config, modify as required"

# Publish a test message
#mosquitto_pub -h <MQTT_SERVER_IP> -t "homeassistant/sensor/disk_health" -m "Disk: Healthy"