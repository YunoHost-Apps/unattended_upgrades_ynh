# Unattended-upgrades for YunoHost

[![Integration level](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://dash.yunohost.org/appci/app/unattended_upgrades)  
[![Install Unattended-upgrades with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Unattended-upgrades and Apticron quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

Unattended-upgrades can download and install security upgrades automatically and unattended, taking care to only install packages from the configured APT source, and checking for dpkg prompts about configuration file changes.

Apticron is a simple script which sends emails about pending package updates such as security updates, properly handling packages on hold both by dselect and aptitude.

## Screenshots

## Demo

No demo available.

## Configuration

Have a look to the following config files for Unattended-upgrades
 * /etc/apt/apt.conf.d/50unattended-upgrades
 * /etc/apt/apt.conf.d/02periodic

And this one for Apticron
 * /etc/apticron/apticron.conf
With its cron file
 * /etc/cron.d/apticron

## Documentation

 * Official Unattended-upgrades documentation: https://wiki.debian.org/UnattendedUpgrades
 * Official Apticron documentation: https://manpages.debian.org/stretch/apticron/apticron.1.en.html
 * YunoHost documentation: There no other documentations, feel free to contribute.

## YunoHost specific features

#### Multi-users support

#### Supported architectures

* x86-64b - [![](https://ci-apps.yunohost.org/ci/logs/unattended_upgrades%20%28Community%29.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/)
* ARMv8-A - [![](https://ci-apps-arm.yunohost.org/ci/logs/unattended_upgrades%20%28Community%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/unattended_upgrades/)
* Jessie x86-64b - [![](https://ci-stretch.nohost.me/ci/logs/unattended_upgrades%20%28Community%29.svg)](https://ci-stretch.nohost.me/ci/apps/unattended_upgrades/)

## Limitations

## Additionnal informations

## Links

 * Report a bug: https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues
 * YunoHost website: https://yunohost.org/

---

Developers infos
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --verbose
or
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --verbose
```
