<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Unattended-upgrades para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Instalar Unattended-upgrades con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarUnattended-upgrades rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Versión actual:** 1.1~ynh1
## Documentaciones y recursos

- Sitio web oficial: <https://wiki.debian.org/UnattendedUpgrades>
- Documentación usuario oficial: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Documentación administrador oficial: <https://wiki.debian.org/UnattendedUpgrades>
- Catálogo YunoHost: <https://apps.yunohost.org/app/unattended_upgrades>
- Reportar un error: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
o
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
