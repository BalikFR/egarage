#!/bin/bash

# Réinitialiser toutes les règles iptables
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

# Mettre en place des politiques par défaut
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo "Les règles du pare-feu ont été réinitialisées aux valeurs par défaut."

