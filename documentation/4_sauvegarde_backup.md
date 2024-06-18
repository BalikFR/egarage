# Sauvegarde et Backup du Projet eGarage

## 1. Introduction

La sauvegarde régulière des données est essentielle pour assurer la continuité des opérations et la protection contre la perte de données. Le projet eGarage implémente des scripts automatisés pour sauvegarder la base de données et transférer ces sauvegardes vers une machine distante.

## 2. Script de Sauvegarde de la Base de Données

Un script de sauvegarde automatique de la base de données est utilisé pour créer des fichiers de sauvegarde à intervalles réguliers.

### 2.1 Contenu du Script de Sauvegarde

Le script `backup_mysql.sh` crée un fichier de sauvegarde de la base de données MySQL.

```bash
#!/bin/bash

# Variables de configuration
backupPath="/opt/lampp/htdocs/egarage_project/backup"
dbUser="root"
dbPass=""
dbName="egarage"
date=$(date +"%Y%m%d%H%M")
backupFile="$backupPath/$dbName-$date.sql"

# Créer le répertoire de sauvegarde s'il n'existe pas
if [ ! -d "$backupPath" ]; then
  mkdir -p "$backupPath"
fi

# Exécuter la commande mysqldump
mysqldump --user=$dbUser --password=$dbPass $dbName > $backupFile

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Sauvegarde de la base de données réussie : $backupFile"
else
  echo "Erreur lors de la sauvegarde de la base de données"
  exit 1
fi
```

### 2.2 Automatisation avec cron

Un cron job est configuré pour exécuter le script de sauvegarde toutes les minutes :

```bash
* * * * * /opt/lampp/htdocs/egarage_project/scripts/backup_mysql.sh
```

## 3. Transfert des Sauvegardes vers une Machine Distante

Un second script utilise rsync pour transférer les fichiers de sauvegarde vers une machine distante pour une protection supplémentaire.

## 3.1 Contenu du Script de Transfert

Le script transfer_backup.sh transfère les fichiers de sauvegarde vers une machine distante.

```bash
#!/bin/bash

# Répertoire de sauvegarde
backupPath="/opt/lampp/htdocs/egarage_project"
remoteUser="kali-server"
remoteHost="192.168.200.128"
remotePath="/home/kali-server/backup"

# Sauvegarder en utilisant rsync
rsync -avz -e "ssh" "$backupPath/" "$remoteUser@$remoteHost:$remotePath"

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Sauvegarde des fichiers réussie : $remoteUser@$remoteHost:$remotePath"
else
  echo "Erreur lors de la sauvegarde des fichiers"
  exit 1
fi
```

## 4. Combinaison des Scripts de Sauvegarde et de Transfert

Un script combiné backup_and_transfer.sh exécute à la fois la sauvegarde de la base de données et le transfert des fichiers de sauvegarde vers la machine distante.

### 4.1 Contenu du Script Combiné

```bash
#!/bin/bash

# Variables de configuration
backupPath="/opt/lampp/htdocs/egarage_project/backup"
dbUser="root"
dbPass=""
dbName="egarage"
date=$(date +"%Y%m%d%H%M")
backupFile="$backupPath/$dbName-$date.sql"
remoteUser="kali-server"
remoteHost="192.168.200.128"
remotePath="/home/kali-server/backup"

# Créer le répertoire de sauvegarde s'il n'existe pas
if [ ! -d "$backupPath" ]; then
  mkdir -p "$backupPath"
fi

# Exécuter la commande mysqldump
mysqldump --user=$dbUser --password=$dbPass $dbName > $backupFile

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; alors
  echo "Sauvegarde de la base de données réussie : $backupFile"
else
  echo "Erreur lors de la sauvegarde de la base de données"
  exit 1
fi

# Sauvegarder en utilisant rsync
rsync -avz -e "ssh" "$backupPath/" "$remoteUser@$remoteHost:$remotePath"

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Transfert des fichiers réussie : $remoteUser@$remoteHost:$remotePath"
else
  echo "Erreur lors du transfert des fichiers"
  exit 1
fi
```

## 5. Conclusion

Les scripts de sauvegarde et de transfert permettent de garantir la disponibilité des données en cas de problème. Les sauvegardes régulières et leur transfert vers une machine distante offrent une protection supplémentaire contre la perte de données.

