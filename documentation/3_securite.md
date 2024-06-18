# Sécurité du Projet eGarage

## 1. Introduction

La sécurité est un aspect crucial de tout projet web. Le projet eGarage a mis en place plusieurs mesures de sécurité pour protéger les données des utilisateurs et garantir l'intégrité du système.

## 2. Sécurisation de la Base de Données

### 2.1 Validation et Nettoyage des Entrées Utilisateur

Toutes les entrées utilisateur sont validées et nettoyées pour éviter les injections SQL et autres attaques. Par exemple, la fonction `validateInput` est utilisée pour nettoyer les entrées :

```php
function validateInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
```

### 2.2 Utilisation de requêtes préparées

Les requêtes préparées avec des instructions SQL paramétrées sont utilisées pour empêcher les injections SQL :

```php
$stmt = $database->prepare("SELECT * FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
```

## 3. Hachage des Mots de Passe

Les mots de passe des utilisateurs sont hachés avant d'être stockés dans la base de données. La fonction password_hash est utilisée pour générer un hachage sécurisé :

```php
$passwordHash = password_hash($password, PASSWORD_BCRYPT);
```
Pour vérifier les mots de passe, password_verify est utilisé :

```php
if (password_verify($password, $storedHash)) {
    // Mot de passe correct
} else {
    // Mot de passe incorrect
}
```

## 4. Configuration du Pare-feu

Un pare-feu a été configuré pour limiter l'accès aux services nécessaires uniquement. Les règles iptables suivantes sont utilisées :

```bash
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
```

## 5. Sauvegarde de la Base de Données

Des scripts de sauvegarde automatique de la base de données sont mis en place pour garantir la récupération des données en cas de problème.

### 5.1 Script de sauvegarde

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

### 5.2 Automatisation avec cron

Un cron job est configuré pour exécuter le script de sauvegarde toutes les minutes :

```bash
* * * * * /opt/lampp/htdocs/egarage_project/scripts/backup_mysql.sh
```

## 6. Sécurisation des Sessions

Les sessions sont sécurisées en suivant les meilleures pratiques :

- Utilisation de cookies sécurisés (session.cookie_secure).
- Utilisation de cookies HttpOnly (session.cookie_httponly).
- Renouvellement régulier des ID de session (session_regenerate_id).

## 7. Désactivation des Erreurs en Production

Les messages d'erreur sont désactivés en production pour éviter de divulguer des informations sensibles :

```php
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(E_ALL);
```

## 8. Permissions des Fichiers et Répertoires

Les permissions des fichiers et répertoires sont configurées pour limiter l'accès :

```bash
chown -R www-data:www-data /opt/lampp/htdocs/egarage_project
chmod -R 755 /opt/lampp/htdocs/egarage_project
```

## 9. Conclusion

Ces mesures de sécurité permettent de protéger efficacement le projet eGarage contre de nombreuses menaces. Il est essentiel de continuer à surveiller et à mettre à jour les pratiques de sécurité pour garantir la protection continue du système.

