#!/bin/bash

# Afficher les règles actuelles du pare-feu
echo "Règles actuelles du pare-feu (iptables):"
sudo iptables -L -v -n

