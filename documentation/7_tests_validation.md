# Tests et Validation

## Introduction

Les tests et la validation sont essentiels pour garantir que votre application fonctionne comme prévu et qu'elle est exempte de bogues. Ce document décrit les étapes pour mettre en place et exécuter des tests unitaires et de validation pour votre projet.

## Mise en Place des Tests Unitaires

### Installation de PHPUnit

PHPUnit est un cadre de test pour PHP qui permet d'écrire et d'exécuter des tests unitaires. Suivez les étapes ci-dessous pour installer PHPUnit dans votre projet.

1. **Installer Composer** : Si ce n'est pas déjà fait, installez Composer, le gestionnaire de dépendances pour PHP.

    ```bash
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    ```

2. **Ajouter PHPUnit à votre projet** : Utilisez Composer pour ajouter PHPUnit comme dépendance de développement.

    ```bash
    composer require --dev phpunit/phpunit
    ```

3. **Vérifier l'installation** : Assurez-vous que PHPUnit est correctement installé en vérifiant la version.

    ```bash
    vendor/bin/phpunit --version
    ```

### Écriture de Tests Unitaires

Créez des tests unitaires pour les différentes fonctionnalités de votre application. Voici un exemple de test unitaire pour une classe `Patient`.

1. **Créer un répertoire pour les tests** : Créez un répertoire `tests` à la racine de votre projet.

    ```bash
    mkdir tests
    ```

2. **Créer un fichier de test** : Créez un fichier nommé `PatientTest.php` dans le répertoire `tests`.

    ```php
    <?php

    use PHPUnit\Framework\TestCase;
    require 'path/to/Patient.php';

    class PatientTest extends TestCase
    {
        public function testPatientCreation()
        {
            $patient = new Patient("John Doe", "john@example.com", "123456789");
            $this->assertEquals("John Doe", $patient->getName());
            $this->assertEquals("john@example.com", $patient->getEmail());
            $this->assertEquals("123456789", $patient->getPhone());
        }

        // Ajoutez d'autres tests ici
    }
    ?>
    ```

### Exécution des Tests

Pour exécuter les tests, utilisez la commande suivante :

```bash
vendor/bin/phpunit --bootstrap vendor/autoload.php tests/PatientTest.php
```

## Validation des Entrées Utilisateur

Il est crucial de valider et de nettoyer les entrées utilisateur pour prévenir les injections SQL et autres attaques. Voici comment nous avons implémenté la validation et le nettoyage des données dans notre projet.

### Validation et Nettoyage des Données

1. Fonction de validation : Nous avons créé une fonction validateInput pour valider et nettoyer les données.

```php
function validateInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
```

2. **Utilisation de la fonction de validation** : Nous avons utilisé cette fonction pour valider les entrées utilisateur dans les fichiers suivants :

admin/client.php
admin/mechanical.php
admin/admin.php
client/booking.php
Exemple d'utilisation :

```php
if ($_POST) {
    $keyword = validateInput($_POST["search"]);
    // Suite du code
}
```

### Utilisation de Requêtes Préparées

Nous avons remplacé les requêtes SQL directes par des requêtes préparées pour prévenir les injections SQL.

```php
$sqlmain = "SELECT * FROM client WHERE pemail=? OR pname=? OR pname LIKE ? OR pname LIKE ? OR pname LIKE ?";
$stmt = $database->prepare($sqlmain);
$likeKeyword1 = "$keyword%";
$likeKeyword2 = "%$keyword";
$likeKeyword3 = "%$keyword%";
$stmt->bind_param("sssss", $keyword, $keyword, $likeKeyword1, $likeKeyword2, $likeKeyword3);
$stmt->execute();
$result = $stmt->get_result();
```

## Conclusion

La mise en place de tests unitaires et la validation des entrées utilisateur sont des étapes cruciales pour assurer la qualité et la sécurité de votre application. En suivant les pratiques décrites dans ce document, vous pouvez vous assurer que votre application fonctionne comme prévu et qu'elle est protégée contre les attaques courantes.