<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Unattended-upgrades untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Pasang Unattended-upgrades dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Unattended-upgrades secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Versi terkirim:** 1.3~ynh1
## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://wiki.debian.org/UnattendedUpgrades>
- Dokumentasi pengguna resmi: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Dokumentasi admin resmi: <https://wiki.debian.org/UnattendedUpgrades>
- Gudang YunoHost: <https://apps.yunohost.org/app/unattended_upgrades>
- Laporkan bug: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
atau
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
