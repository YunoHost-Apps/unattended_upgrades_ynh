<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Unattended-upgrades pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Installer Unattended-upgrades avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Unattended-upgrades rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Version incluse :** 1.1~ynh2
## Documentations et ressources

- Site officiel de l’app : <https://wiki.debian.org/UnattendedUpgrades>
- Documentation officielle utilisateur : <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Documentation officielle de l’admin : <https://wiki.debian.org/UnattendedUpgrades>
- YunoHost Store : <https://apps.yunohost.org/app/unattended_upgrades>
- Signaler un bug : <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
ou
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
