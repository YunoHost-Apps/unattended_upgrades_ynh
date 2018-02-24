# APP pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/APP.svg)](https://ci-apps.yunohost.org/jenkins/job/APP%20%28Community%29/lastBuild/consoleFull)  
[![Installer APP avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=APP)

*[Read this readme in english.](./README.md)*

> *Ce package vous permet d'installer APP rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, merci de regarder [ici](https://yunohost.org/#/install_fr) pour savoir comment l'installer et en profiter.*

## Résumé
Description rapide...

**Version embarquée:** version

## Captures d'écran

![](screenshot.png)

## Configuration

Comment configurer

## Documentation

 * Documentation YunoHost: Il n'y a pas d'autre documentation, n'hésitez pas à contribuer.

## Fonctionnalités spécifiques à YunoHost

#### Support multi-utilisateurs

Supportée, avec LDAP et SSO.

#### Architectures supportées.

* Testé sur x86_64

## Limitations

* Limitations connues

## Informations additionnelles

* Autres informations

## Liens

 * Reporter un bug: https://github.com/YunoHost-Apps/APP_ynh/issues
 * Site de APP: http://APP.org/
 * Site de YunoHost: https://yunohost.org/

---

Informations à l'intention des développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/APP_ynh/tree/testing).

Pour tester la branche testing, merci de procéder ainsi.
```
sudo yunohost app install https://github.com/YunoHost-Apps/APP_ynh/tree/testing --verbose
ou
sudo yunohost app upgrade APP -u https://github.com/YunoHost-Apps/APP_ynh/tree/testing --verbose
```
