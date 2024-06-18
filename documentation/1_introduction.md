# Introduction au Projet eGarage

## Objectif du Projet

Le projet eGarage vise à développer une plateforme de gestion électronique des rendez-vous pour un garage automobile. Cette plateforme permet aux clients de prendre des rendez-vous en ligne, aux administrateurs de gérer les informations des clients et des rendez-vous, et aux mécaniciens de consulter leur emploi du temps.

## Description Générale

eGarage est une application web qui utilise un serveur web Apache et une base de données MySQL pour gérer les informations des utilisateurs et des rendez-vous. L'application est développée en PHP et déployée sur un serveur local utilisant XAMPP sous Kali Linux. La plateforme est sécurisée avec des mesures telles que le chiffrement des mots de passe, la validation des entrées utilisateur et l'utilisation de connexions HTTPS.

## Contexte et Justification du Projet

Avec l'évolution rapide des technologies et la digitalisation croissante des services, il est essentiel pour les garages automobiles de s'adapter aux nouvelles attentes des clients en matière de prise de rendez-vous et de gestion des services. Le projet eGarage répond à cette nécessité en offrant une solution moderne et efficace pour la gestion des rendez-vous, améliorant ainsi l'expérience client et optimisant les opérations internes du garage.

### Fonctions Principales

1. **Prise de Rendez-vous en Ligne** : Les clients peuvent réserver des rendez-vous en ligne via une interface conviviale.
2. **Gestion des Utilisateurs** : Les administrateurs peuvent ajouter, modifier et supprimer les informations des clients et des mécaniciens.
3. **Calendrier des Rendez-vous** : Les mécaniciens peuvent consulter leur emploi du temps et les rendez-vous programmés.
4. **Notifications** : Envoi de notifications par email pour confirmer les réservations et rappeler les rendez-vous.

### Technologies Utilisées

- **Front-End** : HTML, CSS, JavaScript
- **Back-End** : PHP
- **Base de Données** : MySQL
- **Serveur Web** : Apache (XAMPP)
- **Système d'Exploitation** : Kali Linux, Windows, Ubuntu

## Structure du Projet

Le projet est structuré en plusieurs modules pour faciliter la gestion et la maintenance :

1. **Interface Client** : Permet aux clients de prendre des rendez-vous.
2. **Interface Administrateur** : Permet aux administrateurs de gérer les utilisateurs et les rendez-vous.
3. **Interface Mécanicien** : Permet aux mécaniciens de consulter leur emploi du temps.
4. **Module de Sécurité** : Gère le chiffrement des mots de passe, la validation des entrées et les connexions HTTPS.
5. **Module de Sauvegarde** : Gère la sauvegarde et le transfert des données.

## Objectifs de Sécurité

L'un des aspects clés du projet eGarage est de garantir la sécurité des données des utilisateurs et la fiabilité du système. Les mesures de sécurité mises en place incluent :

- **Chiffrement des Mots de Passe** : Utilisation de `password_hash` et `password_verify` pour stocker les mots de passe de manière sécurisée.
- **Validation des Entrées** : Utilisation de fonctions de validation pour prévenir les injections SQL et autres attaques.
- **Connexions HTTPS** : Mise en place de certificats SSL pour sécuriser les communications entre le client et le serveur.
- **Pare-feu** : Configuration de `iptables` pour restreindre les accès au serveur.

## Conclusion

Le projet eGarage offre une solution complète et sécurisée pour la gestion des rendez-vous dans un garage automobile. En utilisant des technologies modernes et en mettant en œuvre des mesures de sécurité robustes, cette plateforme vise à améliorer l'efficacité des opérations et la satisfaction des clients. La documentation qui suit détaillera les étapes d'installation, de configuration, de sécurité, de sauvegarde, et de tests pour assurer une mise en œuvre réussie du projet.

