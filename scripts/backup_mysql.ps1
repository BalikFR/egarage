# Variables de configuration
$backupPath = "C:\xampp\htdocs\egarage_project\backup"  # Répertoire de sauvegarde dans votre projet
$dbUser = "root"  # Utilisateur MySQL
$dbPass = ""  # Mot de passe MySQL défini (remplacez par votre mot de passe)
$dbName = "egarage"  # Nom de la base de données
$date = Get-Date -Format "yyyyMMddHHmm"
$backupFile = "$backupPath\$dbName-$date.sql"

# Créer le répertoire de sauvegarde s'il n'existe pas
if (!(Test-Path -Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath
}

# Exécuter la commande mysqldump avec le mot de passe correctement passé
& "C:\xampp\mysql\bin\mysqldump.exe" --user=$dbUser --password=$dbPass $dbName > $backupFile

# Vérifier si la sauvegarde a réussi
if ($?) {
    Write-Output "Sauvegarde de la base de données réussie : $backupFile"
} else {
    Write-Output "Erreur lors de la sauvegarde de la base de données"
    exit 1
}
