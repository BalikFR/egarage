# Annexes

## Introduction

Cette section contient des informations supplémentaires et des ressources qui complètent la documentation principale de votre projet. Vous y trouverez des annexes sur divers sujets liés à l'infrastructure, la sécurité, et les scripts utilisés dans le projet.

## Liste des Scripts Utilisés

### Script de Sauvegarde de la Base de Données

Ce script effectue une sauvegarde de la base de données MySQL et enregistre le fichier de sauvegarde dans un répertoire spécifié.

```bash
#!/bin/bash

# Variables de configuration
backupPath="/opt/lampp/htdocs/egarage_project/backup"
dbUser="root"
dbPass="votre_mot_de_passe"
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
### Script de Synchronisation de la Sauvegarde

Ce script utilise rsync pour transférer les fichiers de sauvegarde vers une machine distante.

```bash
#!/bin/bash

# Répertoire de sauvegarde
backupPath="/opt/lampp/htdocs/egarage_project/backup"
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

### Script Combiné

Ce script combine la sauvegarde de la base de données et la synchronisation avec la machine distante.

```bash
#!/bin/bash

# Variables de configuration
backupPath="/opt/lampp/htdocs/egarage_project/backup"
dbUser="root"
dbPass="votre_mot_de_passe"
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
if [ $? -eq 0 ]; then
  echo "Sauvegarde de la base de données réussie : $backupFile"
else
  echo "Erreur lors de la sauvegarde de la base de données"
  exit 1
fi

# Sauvegarder en utilisant rsync
rsync -avz -e "ssh" "$backupPath/" "$remoteUser@$remoteHost:$remotePath"

# Vérifier si la synchronisation a réussi
if [ $? -eq 0 ]; then
  echo "Synchronisation des fichiers réussie : $remoteUser@$remoteHost:$remotePath"
else
  echo "Erreur lors de la synchronisation des fichiers"
  exit 1
fi
```

## Configuration de Cron

Pour automatiser les sauvegardes et les synchronisations, vous pouvez utiliser cron. Voici un exemple de configuration pour exécuter le script combiné toutes les 5 minutes.

### Créer une Tâche Cron

1. Ouvrez le fichier crontab :

```bash
crontab -e
```

2. Ajoutez la ligne suivante pour exécuter le script toutes les minutes :

```bash
* * * * * /path/to/backup_and_sync.sh
```

Remplacez /path/to/backup_and_sync.sh par le chemin vers votre script combiné.

## Conclusion

Les annexes fournissent des informations supplémentaires et des ressources utiles pour comprendre et maintenir votre projet. En suivant les scripts et les configurations décrits dans cette section, vous pouvez automatiser les tâches critiques et garantir la sécurité et la fiabilité de votre infrastructure.