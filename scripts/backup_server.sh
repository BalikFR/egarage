#!/bin/bash

# Répertoire de sauvegarde local
backupPath="/opt/lampp/htdocs/egarage_project/backup"

# Informations de la machine distante
remoteUser="kali-server"
remoteHost="192.168.200.128"
remotePath="/home/kali-server/backup"

# Sauvegarder en utilisant rsync
rsync -avz -e "ssh" "$backupPath/" "$remoteUser@$remoteHost:$remotePath"

# Vérifier si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Synchronisation des fichiers réussie : $remoteUser@$remoteHost:$remotePath"
else
  echo "Erreur lors de la synchronisation des fichiers"
  exit 1
fi

