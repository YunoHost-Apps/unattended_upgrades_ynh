<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Unattended-upgrades

[![集成程度](https://dash.yunohost.org/integration/unattended_upgrades.svg)](https://ci-apps.yunohost.org/ci/apps/unattended_upgrades/) ![工作状态](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/unattended_upgrades.maintain.svg)

[![使用 YunoHost 安装 Unattended-upgrades](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=unattended_upgrades)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Unattended-upgrades。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

This package installs `unattended-upgrades` and `apticron` to:

* automatically install security updates (or all updates if selected)
* send automatic messages about available and done updates


**分发版本：** 1.3~ynh1
## 文档与资源

- 官方应用网站： <https://wiki.debian.org/UnattendedUpgrades>
- 官方用户文档： <https://manpages.debian.org/stretch/apticron/apticron.1.en.html>
- 官方管理文档： <https://wiki.debian.org/UnattendedUpgrades>
- YunoHost 商店： <https://apps.yunohost.org/app/unattended_upgrades>
- 报告 bug： <https://github.com/YunoHost-Apps/unattended_upgrades_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
或
sudo yunohost app upgrade unattended_upgrades -u https://github.com/YunoHost-Apps/unattended_upgrades_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
