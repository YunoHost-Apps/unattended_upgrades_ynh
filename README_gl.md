<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Unattended-upgrades para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Instalar Unattended-upgrades con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Unattended-upgrades de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Versión proporcionada:** 1.1~ynh2
## Documentación e recursos

- Web oficial da app: <https://wiki.debian.org/UnattendedUpgrades>
- Documentación oficial para usuarias: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Documentación oficial para admin: <https://wiki.debian.org/UnattendedUpgrades>
- Tenda YunoHost: <https://apps.yunohost.org/app/unattended_upgrades>
- Informar dun problema: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
ou
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
