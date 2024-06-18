#!/bin/bash

# Afficher le contenu du fichier resolv.conf
echo "Configurations DNS (resolv.conf):"
cat /etc/resolv.conf

# Afficher la configuration de dnsmasq si installé
if command -v dnsmasq &> /dev/null; then
    echo "Configurations dnsmasq:"
    cat /etc/dnsmasq.conf
fi

# Afficher la configuration de systemd-resolved si utilisé
if systemctl is-active --quiet systemd-resolved; then
    echo "Configurations systemd-resolved:"
    resolvectl status
fi

