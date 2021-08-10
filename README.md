<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Unattended-upgrades for YunoHost

[![Integration level](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://dash.yunohost.org/appci/app/unattended_upgrades) ![](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)  
[![Install Unattended-upgrades with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Unattended-upgrades quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

Daily automatic upgrades

**Shipped version:** 1.0~ynh5



## Disclaimers / important information

## Configuration

Have a look to the following config files for Unattended-upgrades
 * /etc/apt/apt.conf.d/50unattended-upgrades
 * /etc/apt/apt.conf.d/02periodic

And this one for Apticron
 * /etc/apticron/apticron.conf
With its cron file
 * /etc/cron.d/apticron

## Documentation and resources

* Official app website: https://wiki.debian.org/UnattendedUpgrades
* Official user documentation: https://manpages.debian.org/stretch/apticron/apticron.1.en.html
* Official admin documentation: https://wiki.debian.org/UnattendedUpgrades
* YunoHost documentation for this app: https://yunohost.org/app_unattended_upgrades
* Report a bug: https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
or
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**More info regarding app packaging:** https://yunohost.org/packaging_apps