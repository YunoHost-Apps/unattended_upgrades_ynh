# Unattended-upgrades pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://dash.yunohost.org/appci/app/unattended_upgrades) ![](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)  
[![Installer Unattended-upgrades avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Unattended-upgrades rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Mise à jour automatique quotidienne

**Version incluse :** 1.0~ynh5



## Avertissements / informations importantes

## Configuration

Regardez les fichiers de configuration suivant pour Unattended-upgrades
 * /etc/apt/apt.conf.d/50unattended-upgrades
 * /etc/apt/apt.conf.d/02periodic

Et celui-ci pour Apticron
 * /etc/apticron/apticron.conf
Avec son cron
 * /etc/cron.d/apticron

## Documentations et ressources

* Site officiel de l'app : https://wiki.debian.org/UnattendedUpgrades
* Documentation officielle utilisateur : https://manpages.debian.org/stretch/apticron/apticron.1.en.html
* Documentation officielle de l'admin : https://wiki.debian.org/UnattendedUpgrades
* Documentation YunoHost pour cette app : https://yunohost.org/app_unattended_upgrades
* Signaler un bug : https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
ou
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps