Installation
=============

Documentation de Behat Drupal Extension 3.0: http://behat-drupal-extension.readthedocs.org/en/3.0/.

En particulier, se référer à la page suivante pour plus d'informations sur l'installation: http://behat-drupal-extension.readthedocs.org/en/3.0/localinstall.html.


* Installer Composer si nécessaire:

```bash
curl -s https://getcomposer.org/installer | php
```

* Installer Drupal Extension et toutes les dépendances nécessaires

```bash
php composer.phar install
```
    
* Copier le fichier exemple.behat.yml

```bash
cp exemple.behat.yml behat.yml
```  

Éditer ce fichier pour mettre votre propre configuration (dans le profil *default*), entre autre:

```yml
base_url: 'http://votre.adresse.local'
root: '/votre/dossier/drupal'
drupal_root: '/votre/dossier/drupal'
```

* Exécuter les tests, où @nom est le nom d'un test, et ~@nom dans les tags sert à ignorer @nom

```bash    
bin/behat --tags "~@wip&&~@disabled"
```