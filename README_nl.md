<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Unattended-upgrades voor Yunohost

[![Integratieniveau](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Mate van functioneren](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Onderhoudsstatus](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Unattended-upgrades met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Unattended-upgrades snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Geleverde versie:** 1.3~ynh1
## Documentatie en bronnen

- Officiele website van de app: <https://wiki.debian.org/UnattendedUpgrades>
- Officiele gebruikersdocumentatie: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Officiele beheerdersdocumentatie: <https://wiki.debian.org/UnattendedUpgrades>
- YunoHost-store: <https://apps.yunohost.org/app/unattended_upgrades>
- Meld een bug: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
of
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
