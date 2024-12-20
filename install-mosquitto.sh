#!/bin/bash
# install-mosquitto
# wget -O - https://raw.githubusercontent.com/JimJinn/Linux-public/refs/heads/main/install-mosquitto.sh | bash

# Check if mosquitto is installed
echo "Version 0.2"
if ! dpkg -l | grep -q mosquitto; then
    echo "Mosquitto is not installed. Installing..."
    sudo apt install -y mosquitto mosquitto-clients

    config="/etc/notificator/notificator.conf"
    mqtt_server="192.168.9.20"
    notify_topic="telegram/alex"
    max_messages=6

    if [ ! -d "$(dirname "$config")" ]; then
        echo "Creating config directory [$config]"
        # sudo mkdir -p "/etc/notificator/notificator.conf"
        sudo mkdir -p "$(dirname "$config")"
    fi

    echo "MQTT_SERVER_IP=$mqtt_server" | sudo tee $config > /dev/null
    echo "NOTIFY_TOPIC=$notify_topic" | sudo tee -a $config > /dev/null
    echo "MAX_MESSAGES=$max_messages" | sudo tee -a $config > /dev/null
    echo "Default MQTT server IP address and topic are written to $config, modify as required"

    # Publish a test message
    mosquitto_pub -h $mqtt_server -t "$notify_topic" -m "Mosquitto is installed on $(hostname)"
else
    echo "Mosquitto is already installed."
fi

