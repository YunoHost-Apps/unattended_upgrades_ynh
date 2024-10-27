<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Unattended-upgrades для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![Установите Unattended-upgrades с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Unattended-upgrades быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**Поставляемая версия:** 1.3~ynh1
## Документация и ресурсы

- Официальный веб-сайт приложения: <https://wiki.debian.org/UnattendedUpgrades>
- Официальная документация пользователя: <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- Официальная документация администратора: <https://wiki.debian.org/UnattendedUpgrades>
- Магазин YunoHost: <https://apps.yunohost.org/app/unattended_upgrades>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
или
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
