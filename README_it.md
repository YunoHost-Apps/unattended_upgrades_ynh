<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Unattended-upgrades per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://dash.yunohost.org/appci/app/unattended_upgrades) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Installa Unattended-upgrades con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Unattended-upgrades su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Versione pubblicata:** 1.1~ynh1
## Documentazione e risorse

- Sito web ufficiale dell’app: <https://wiki.debian.org/UnattendedUpgrades>
- Documentazione ufficiale per gli utenti: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Documentazione ufficiale per gli amministratori: <https://wiki.debian.org/UnattendedUpgrades>
- Store di YunoHost: <https://apps.yunohost.org/app/unattended_upgrades>
- Segnala un problema: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
o
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
