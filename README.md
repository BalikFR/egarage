# eGarage Project

## Introduction

eGarage est une application web de gestion de garage automobile permettant de gérer les rendez-vous, les clients et les informations des véhicules de manière efficace et sécurisée.

## Auteurs

- **Balik**
- **Bonk**

## Prérequis

- XAMPP (Apache, MySQL, PHP)
- VMware pour la virtualisation
- Kali Linux pour les tests de sécurité et l'infrastructure
- Composer pour la gestion des dépendances PHP

## Langages Utilisés

- **PHP** : Langage principal pour le backend.
- **HTML/CSS** : Pour la structure et le style de l'interface utilisateur.
- **JavaScript** : Pour les fonctionnalités interactives côté client.
- **SQL** : Pour la gestion de la base de données.
- **Bash** : Pour les scripts d'automatisation.

## Installation

1. **Cloner le dépôt** :

    ```bash
    git clone https://github.com/balikfr/egarage_project.git
    cd egarage_project
    ```

2. **Configuration de XAMPP** :

    - Téléchargez et installez XAMPP.
    - Démarrez Apache et MySQL à partir du panneau de contrôle XAMPP.

3. **Configuration de la Base de Données** :

    - Importez le fichier `database.sql` dans MySQL via phpMyAdmin.
    - Configurez le fichier `config.php` avec les informations de connexion à la base de données.

4. **Installation des Dépendances PHP** :

    ```bash
    cd scripts
    ./setup.ps1
    ```

## Fonctionnalités

- **Gestion des rendez-vous** : Réservation, annulation et rappel de rendez-vous.
- **Gestion des clients** : Ajout, modification et suppression de clients.
- **Gestion des véhicules** : Ajout, modification et suppression d'informations sur les véhicules.

## Sécurité

- **Validation et nettoyage des entrées** : Toutes les entrées utilisateur sont validées et nettoyées pour prévenir les attaques.
- **Hachage des mots de passe** : Les mots de passe sont hachés avant d'être stockés.
- **Configuration du pare-feu** : Scripts pour configurer automatiquement les règles de sécurité.

## Sauvegarde et Restauration

- **Sauvegarde automatique** : Script pour sauvegarder la base de données automatiquement.
- **Transfert des sauvegardes** : Transfert des sauvegardes vers une machine serveur via `rsync`.

## DNS

- **Configuration DNS** : Utilisation de `dnsmasq` pour gérer les noms de domaine et les adresses IP.

## DHCP

- **Configuration DHCP** : Le serveur DHCP est configuré pour attribuer des adresses IP aux machines clientes et s'assurer qu'elles peuvent résoudre le nom de domaine du serveur eGarage. Ceci est réalisé en utilisant VMware pour s'assurer que toutes les machines virtuelles sont sur le même réseau.

## Tests

- **Tests unitaires** : Utilisation de PHPUnit pour les tests unitaires.

## Utilisation

### Démarrer l'application

1. **Démarrer XAMPP** :

    - Lancez XAMPP et démarrez Apache et MySQL.

2. **Accéder à l'application** :

    - Ouvrez votre navigateur et accédez à `http://localhost/egarage_project`.

### Sauvegarde de la Base de Données

1. **Exécuter le script de sauvegarde** :

    ```bash
    ./backup_mysql.sh
    ```

2. **Transfert des sauvegardes** :

    ```bash
    ./rsync_backup.sh
    ```

