# Installation et Configuration du Projet eGarage

## Prérequis

Avant de commencer l'installation, assurez-vous d'avoir les éléments suivants :

- Un système Kali Linux installé.
- XAMPP pour Linux installé pour fournir Apache, MySQL, et PHP.
- Accès root ou des privilèges sudo.

## Installation de XAMPP

1. Téléchargez la dernière version de XAMPP pour Linux depuis [Apache Friends](https://www.apachefriends.org/index.html).

2. Ouvrez un terminal et accédez au répertoire de téléchargement. Rendre le fichier d'installation exécutable et lancez l'installation :

    ```bash
    chmod +x xampp-linux-x64-7.4.25-0-installer.run
    sudo ./xampp-linux-x64-7.4.25-0-installer.run
    ```

3. Suivez les instructions à l'écran pour terminer l'installation.

## Configuration de XAMPP

1. Démarrez XAMPP :

    ```bash
    sudo /opt/lampp/lampp start
    ```

2. Assurez-vous que les services Apache et MySQL sont en cours d'exécution. Vous pouvez vérifier cela en accédant à `http://localhost` dans votre navigateur.

## Installation du Projet eGarage

1. Téléchargez le projet eGarage et extrayez-le dans le répertoire `htdocs` de XAMPP :

    ```bash
    sudo cp -r egarage_project /opt/lampp/htdocs/
    ```

2. Accédez au répertoire du projet :

    ```bash
    cd /opt/lampp/htdocs/egarage_project
    ```

## Configuration de la Base de Données

1. Démarrez MySQL et connectez-vous en tant que root :

    ```bash
    sudo /opt/lampp/lampp startmysql
    mysql -u root -p --socket=/opt/lampp/var/mysql/mysql.sock
    ```

2. Créez la base de données et les tables nécessaires :

    ```sql
    CREATE DATABASE egarage;
    USE egarage;
    SOURCE /opt/lampp/htdocs/egarage_project/sql/egarage.sql;
    ```

3. Modifiez le fichier de configuration de la base de données pour refléter vos paramètres. Ouvrez `config.php` et mettez à jour les informations suivantes :

    ```php
    $db_host = 'localhost';
    $db_user = 'root';
    $db_pass = 'your_password';
    $db_name = 'egarage';
    ```

## Configuration des Scripts de Sauvegarde

1. Créez un répertoire pour les sauvegardes :

    ```bash
    mkdir -p /opt/lampp/htdocs/egarage_project/backup
    ```

2. Créez le script de sauvegarde de la base de données (`backup_mysql.sh`) :

    ```bash
    #!/bin/bash

    backupPath="/opt/lampp/htdocs/egarage_project/backup"
    dbUser="root"
    dbPass="your_password"
    dbName="egarage"
    date=$(date +"%Y%m%d%H%M")
    backupFile="$backupPath/$dbName-$date.sql"

    if [ ! -d "$backupPath" ]; then
      mkdir -p "$backupPath"
    fi

    mysqldump --user=$dbUser --password=$dbPass $dbName > $backupFile

    if [ $? -eq 0 ]; then
      echo "Sauvegarde de la base de données réussie : $backupFile"
    else
      echo "Erreur lors de la sauvegarde de la base de données"
      exit 1
    fi
    ```

3. Rendez le script exécutable :

    ```bash
    chmod +x /opt/lampp/htdocs/egarage_project/scripts/backup_mysql.sh
    ```

4. Configurez un cron job pour automatiser la sauvegarde (exécuter toutes les 5 minutes par exemple) :

    ```bash
    crontab -e
    ```

    Ajoutez la ligne suivante :

    ```plaintext
    */5 * * * * /opt/lampp/htdocs/egarage_project/scripts/backup_mysql.sh
    ```

## Configuration du Pare-feu

1. Créez un script de configuration du pare-feu (`configure_firewall.sh`) :

    ```bash
    #!/bin/bash

    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
    iptables -P INPUT DROP
    iptables -P OUTPUT ACCEPT

    iptables-save > /etc/iptables/rules.v4

    echo "Pare-feu configuré avec succès"
    ```

2. Rendez le script exécutable et exécutez-le :

    ```bash
    chmod +x /opt/lampp/htdocs/egarage_project/scripts/configure_firewall.sh
    sudo /opt/lampp/htdocs/egarage_project/scripts/configure_firewall.sh
    ```

## Configuration DNS et DHCP

### DNS

1. Installez et configurez un serveur DNS (comme BIND) sur votre serveur pour gérer les noms de domaine internes.
2. Ajoutez les entrées nécessaires dans le fichier de configuration du DNS pour pointer vers votre serveur eGarage.

### DHCP

1. Configurez le serveur DHCP pour attribuer des adresses IP à vos machines clientes et assurez-vous qu'elles peuvent résoudre le nom de domaine du serveur eGarage.

### Configuration DHCP avec VMware

Pour configurer un serveur DHCP sur VMware et attribuer des adresses IP aux machines virtuelles sur le même réseau, suivez les étapes ci-dessous :

1. **Préparation de l'Environnement** :

    - Assurez-vous que VMware est installé et configuré correctement sur votre machine hôte.
    - Créez les machines virtuelles nécessaires pour votre projet, par exemple `kali-client` et `kali-server`.

2. **Configuration du Réseau** :

    - Ouvrez VMware et accédez aux paramètres de chaque machine virtuelle.
    - Dans la section réseau, sélectionnez `NAT` ou `Bridged` pour les adapter réseau. Cela permet à vos machines virtuelles d'obtenir des adresses IP dynamiques à partir du serveur DHCP configuré sur le réseau hôte ou du routeur.

3. **Configuration du DHCP dans VMware** :

    - Si vous utilisez le mode `NAT` :
        - VMware dispose d'un serveur DHCP intégré pour le réseau NAT. Vérifiez que le service DHCP est activé dans les paramètres réseau NAT de VMware.
        - Vous pouvez configurer la plage d'adresses IP attribuées par le DHCP dans les paramètres réseau NAT.
    - Si vous utilisez le mode `Bridged` :
        - Les machines virtuelles recevront des adresses IP du serveur DHCP du réseau physique auquel l'hôte est connecté.

4. **Attribution des Adresses IP** :

    - Démarrez vos machines virtuelles `kali-client` et `kali-server`.
    - Vérifiez que chaque machine a reçu une adresse IP correcte en utilisant la commande `ifconfig` ou `ip a` sur les systèmes Linux.
    - Assurez-vous que les adresses IP attribuées sont sur le même sous-réseau, ce qui permettra une communication fluide entre les machines virtuelles.

5. **Résolution de Noms de Domaine** :

    - Configurez vos machines virtuelles pour utiliser le serveur DNS approprié afin de résoudre le nom de domaine du serveur eGarage.
    - Modifiez le fichier `/etc/resolv.conf` pour ajouter le serveur DNS si nécessaire :

    ```bash
    sudo nano /etc/resolv.conf
    ```

    Ajoutez les lignes suivantes :

    ```plaintext
    nameserver <adresse_IP_du_serveur_DNS>
    ```

En suivant ces étapes, vous vous assurez que vos machines virtuelles obtiennent des adresses IP dynamiques via DHCP et peuvent communiquer efficacement sur le même réseau. Cette configuration est essentielle pour garantir que vos tests et vos démonstrations fonctionnent correctement dans un environnement de virtualisation comme VMware.

## Conclusion

La configuration du DHCP avec VMware permet une gestion simplifiée des adresses IP pour vos machines virtuelles, assurant qu'elles sont toutes sur le même réseau et peuvent se communiquer sans problème. Cela est crucial pour la mise en place d'une infrastructure réseau cohérente et fiable.