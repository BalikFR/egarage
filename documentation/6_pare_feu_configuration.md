# Configuration du Pare-feu

## Introduction

La configuration d'un pare-feu est essentielle pour sécuriser votre environnement serveur. Ce document décrit la configuration du pare-feu en utilisant `iptables` pour contrôler le trafic entrant et sortant sur votre serveur.

## Configuration du Pare-feu avec iptables

### Installation

Si `iptables` n'est pas installé, vous pouvez l'installer en utilisant la commande suivante :

```bash
sudo apt-get install iptables
```

### Script de Configuration du Pare-feu

Voici un script bash pour configurer le pare-feu en utilisant iptables :

```bash
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
```
### Exécution du Script de Configuration

1. Créez un fichier nommé configure_firewall.sh et collez-y le script ci-dessus.

2. Rendez le script exécutable :

```bash
sudo chmod +x configure_firewall.sh
```

3. Exécutez le script :

```bash
sudo ./configure_firewall.sh
```

### Vérification des Règles du Pare-feu

Pour vérifier les règles du pare-feu, vous pouvez utiliser la commande suivante :

```bash
sudo iptables -L
```
### Retrait des Règles du Pare-feu

Si vous avez besoin de réinitialiser ou de retirer les règles du pare-feu, utilisez le script suivant :

```bash
#!/bin/bash

# Réinitialiser les règles iptables
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t raw -F
iptables -t raw -X

# Définir les politiques par défaut
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Sauvegarder les règles
iptables-save > /etc/iptables/rules.v4

echo "Pare-feu réinitialisé avec succès"
```

Créez un fichier nommé reset_firewall.sh et collez-y le script ci-dessus.

Rendez le script exécutable :

```bash
sudo chmod +x reset_firewall.sh
```

Exécutez le script :

```bash
sudo ./reset_firewall.sh
```

## Conclusion

La configuration d'un pare-feu avec iptables permet de sécuriser votre serveur en contrôlant le trafic réseau. En suivant les étapes ci-dessus, vous avez configuré un pare-feu de base qui autorise uniquement les connexions nécessaires et bloque tout autre trafic entrant.