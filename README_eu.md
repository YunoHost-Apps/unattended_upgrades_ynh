<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Unattended-upgrades YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Instalatu Unattended-upgrades YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Unattended-upgrades YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Paketatutako bertsioa:** 1.1~ynh2
## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://wiki.debian.org/UnattendedUpgrades>
- Erabiltzaileen dokumentazio ofiziala: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Administratzaileen dokumentazio ofiziala: <https://wiki.debian.org/UnattendedUpgrades>
- YunoHost Denda: <https://apps.yunohost.org/app/unattended_upgrades>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
edo
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
