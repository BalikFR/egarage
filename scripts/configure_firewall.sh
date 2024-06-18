#!/bin/bash

# Autoriser les connexions localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Autoriser HTTP et HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Autoriser MySQL
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Autoriser le trafic sortant HTTP et HTTPS
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

# Bloquer tout autre trafic entrant
iptables -P INPUT DROP

# Autoriser le trafic sortant
iptables -P OUTPUT ACCEPT

# Sauvegarder les règles
iptables-save > /etc/iptables/rules.v4

echo "Pare-feu configuré avec succès"

