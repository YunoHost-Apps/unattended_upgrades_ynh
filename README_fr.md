# Unattended-upgrades pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://dash.yunohost.org/appci/app/unattended_upgrades)  
[![Installer Unattended-upgrades avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Read this readme in english.](./README.md)*

> *Ce package vous permet d'installer Unattended-upgrades et Apticron rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, merci de regarder [ici](https://yunohost.org/#/install_fr) pour savoir comment l'installer et en profiter.*

## Résumé

Unattended-upgrades peut télécharger et installer des mises à niveau de sécurité automatiquement et sans surveillance, en prenant soin de n'installer que des paquets depuis la source APT configurée, et en vérifiant les invites dpkg sur les changements de fichier de configuration.

Apticron est un script simple qui envoie des mails sur les mises à jour de paquets en attente telles que les mises à jour de sécurité, la gestion correcte des paquets en attente par dselect et aptitude.

## Captures d'écran

## Démo

Aucune démo pour cette application.

## Configuration

Regardez les fichiers de configuration suivant pour Unattended-upgrades
 * /etc/apt/apt.conf.d/50unattended-upgrades
 * /etc/apt/apt.conf.d/02periodic

Et celui-ci pour Apticron
 * /etc/apticron/apticron.conf
Avec son cron
 * /etc/cron.d/apticron

## Documentation

 * Documentation officielle de Unattended-upgrades: https://wiki.debian.org/UnattendedUpgrades
 * Documentation officielle de Apticron: https://manpages.debian.org/stretch/apticron/apticron.1.en.html
 * Documentation YunoHost: Il n'y a pas d'autre documentation, n'hésitez pas à contribuer.

## Fonctionnalités spécifiques à YunoHost

#### Support multi-utilisateurs

#### Architectures supportées.

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/jenkins/job/unattended_upgrades%20(Community)/badge/icon)](https://ci-apps.yunohost.org/jenkins/job/unattended_upgrades%20(Community)/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/jenkins/job/unattended_upgrades%20(Community)%20(%7EARM%7E)/badge/icon)](https://ci-apps-arm.yunohost.org/jenkins/job/unattended_upgrades%20(Community)%20(%7EARM%7E)/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/jenkins/job/unattended_upgrades%20(Community)/badge/icon)](https://ci-stretch.nohost.me/jenkins/job/unattended_upgrades%20(Community)/)

## Limitations

## Informations additionnelles

## Liens

 * Reporter un bug: https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues
 * Site de YunoHost: https://yunohost.org/

---

Informations à l'intention des développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Pour tester la branche testing, merci de procéder ainsi.
```
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --verbose
ou
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --verbose
```
