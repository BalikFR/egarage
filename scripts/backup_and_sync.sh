#!/bin/bash

# Répertoire de sauvegarde
backupPath="/opt/lampp/htdocs/egarage_project/backup"
dbUser="root"
dbPass=""  # Laissez vide si vous n'avez pas de mot de passe
dbName="egarage"
date=$(date +"%Y%m%d%H%M")
backupFile="$backupPath/$dbName-$date.sql"

# Créer le répertoire de sauvegarde s'il n'existe pas
if [ ! -d "$backupPath" ]; then
  mkdir -p "$backupPath"
fi

# Exécuter la commande mysqldump avec le bon socket
mysqldump --user=$dbUser --password=$dbPass --socket=/opt/lampp/var/mysql/mysql.sock $dbName > $backupFile

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Sauvegarde de la base de données réussie : $backupFile"
else
  echo "Erreur lors de la sauvegarde de la base de données"
  exit 1
fi

# Partie 2 : Synchronisation avec la machine distante

# Informations de la machine distante
remoteUser="kali-server"
remoteHost="192.168.200.128"
remotePath="/home/kali-server/backup"

# Sauvegarder en utilisant rsync
rsync -avz -e "ssh" "$backupPath/" "$remoteUser@$remoteHost:$remotePath"

# Vérifier si la synchronisation a réussi
if [ $? -eq 0 ]; then
  echo "Synchronisation des fichiers réussie : $remoteUser@$remoteHost:$remotePath"
else
  echo "Erreur lors de la synchronisation des fichiers"
  exit 1
fi
