#!/bin/bash

# Variables de configuration
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
