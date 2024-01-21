To modify any option of unattended-upgrades, please have a look to `/etc/apt/apt.conf.d/50unattended-upgrades` and `/etc/apt/apt.conf.d/02periodic`.
Unattended-upgrades will be executed every day at midnight.

To modify the configuration of apticron, please have a look to `/etc/apticron/apticron.conf`.
Apticron will be executed, depending of the requested configuration at 8 p.m. and 2 a.m. If you want to change this schedule, please have a look to the cron file /etc/cron.d/apticron.

You can configure this app easily by using the experimental [config-panel feature](__ADMIN_PANEL__/config-panel).
You can also find some specific actions for this app by using the experimental [action feature](__ADMIN_PANEL__/actions).

If you're facing an issue or want to improve this app, please open a new issue in this [project](https://github.com/YunoHost-Apps/unattended_upgrades_ynh).
