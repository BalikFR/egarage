# Configuration DNS

## Installation de Dnsmasq

Dnsmasq est utilisé pour gérer les enregistrements DNS de manière simple et efficace. Il est léger et facile à configurer, ce qui en fait un excellent choix pour les environnements de test et de petite production.

### Installation

Pour installer Dnsmasq, exécutez les commandes suivantes :

```markdown
sudo apt update
sudo apt install dnsmasq -y
```

## Configuration de Dnsmasq

Une fois Dnsmasq installé, il est nécessaire de modifier le fichier de configuration pour définir les enregistrements DNS nécessaires.

### Modification du fichier de configuration

Ouvrez le fichier de configuration principal de Dnsmasq :

```bash
sudo nano /etc/dnsmasq.conf
```

Ajoutez les lignes suivantes pour définir les enregistrements DNS :

```bash
address=/egarage.local/192.168.200.129
```

Cela mappe le domaine egarage.local à l'adresse IP 192.168.200.129.

### Configuration du Résolveur DNS

Il est également nécessaire de mettre à jour le fichier /etc/hosts pour s'assurer que le système utilise Dnsmasq pour la résolution DNS locale.

Ouvrez le fichier /etc/hosts :

```bash
sudo nano /etc/hosts
```

Ajoutez la ligne suivante :

```bash
192.168.200.129  egarage.local
```

## Redémarrage de Dnsmasq

Après avoir modifié les fichiers de configuration, redémarrez le service Dnsmasq pour appliquer les changements :

```bash
sudo systemctl restart dnsmasq
```

### Vérification de la Configuration DNS

Pour vérifier que la configuration DNS est correcte, utilisez les commandes nslookup ou dig :

```bash
nslookup egarage.local
```

ou

```bash
dig egarage.local
```

Ces commandes doivent retourner l'adresse IP 192.168.200.129 associée à egarage.local.


## Conclusion

La configuration de Dnsmasq permet de gérer facilement les enregistrements DNS pour votre réseau local. En suivant les étapes ci-dessus, vous avez configuré un serveur DNS local pour le domaine egarage.local, rendant ainsi l'accès à votre application web plus simple et convivial.
