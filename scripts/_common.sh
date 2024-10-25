#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

apticron_config="/etc/apticron/apticron.conf"
apticron_config_backup="/etc/yunohost/apps/$app/conf/apticron.conf.backup"

apticron_cron="/etc/cron.d/apticron"
apticron_cron_backup="/etc/yunohost/apps/$app/conf/apticron.crond.backup"

_apticron_set_config() {
    # If the config file doesn't exist, copy the model
    if [ ! -e "$apticron_config" ]; then
        cp "/usr/lib/apticron/apticron.conf" "$apticron_config"
    fi

    # Create a backup of the config file for the reset action
    cp "$apticron_config" "$apticron_config_backup"

    ynh_replace --match="# CUSTOM_SUBJECT=.*" \
        --replace="&\nCUSTOM_SUBJECT=\'[apticron] \$SYSTEM: \$NUM_PACKAGES package update(s)\'" --file="$apticron_config"
    ynh_replace --match="# CUSTOM_NO_UPDATES_SUBJECT=.*" \
        --replace="&\nCUSTOM_NO_UPDATES_SUBJECT=\'[apticron] \$SYSTEM: Up to date \\\\o/\'" --file="$apticron_config"

    # Create a backup of the cron file for the reset action
    cp "$apticron_cron" "$apticron_cron_backup"

    # Clear everything, keep only the first (official) one. Uncomment.
    origin_line=$(grep -m 1 "apticron --cron" "$apticron_cron" | sed 's/^#* *//')

    # Remove all lines matching
    ynh_replace --match=".*apticron --cron.*" --replace="" --file="$apticron_cron"
    # Remove empty lines
    sed -i '/^\s*$/d' "$apticron_cron"
    (
        echo "# $origin_line"
        if [ "$previous_apticron" -eq 1 ]; then
            echo "$origin_line" | sed 's|^.*\( root if.*\)|0 20 * * *\1|'
        fi
        if [ "$after_apticron" -eq 1 ]; then
            echo "$origin_line" | sed 's|^.*\( root if.*\)|0 2 * * *\1|'
        fi
    ) >> "$apticron_cron"
}

_apticron_restore_config() {
    mv "$apticron_config_backup" "$apticron_config"
    mv "$apticron_cron_backup" "$apticron_cron"
}

unattended_upgrades_config="/etc/apt/apt.conf.d/50unattended-upgrades"
unattended_upgrades_config_backup="/etc/yunohost/apps/$app/conf/50unattended-upgrades.backup"

_unattended_upgrades_set_config() {
    # Make a backup of 50unattended-upgrades
    cp "$unattended_upgrades_config" "$unattended_upgrades_config_backup"

    # Configure upgrade sources
    # Allow other updates
    if [ "$upgrade_level" = "security_and_updates" ]; then
        ynh_replace --match="//\(.*\"o=Debian,a=stable\)" --replace="\1" --file="$unattended_upgrades_config"
        ynh_replace --match="//\(.*\"o=Debian,a=stable-updates\)" --replace="\1" --file="$unattended_upgrades_config"
    fi

    # Add YunoHost upgrade source
    if [ $ynh_update -eq 1 ]; then
        ynh_replace --match="origin=Debian,codename=\${distro_codename},label=Debian-Security\";" \
            --replace="&\n\n        //YunoHost upgrade\n        \"o=YunoHost,a=stable\";" --file="$unattended_upgrades_config"
    fi

    # Allow MinimalSteps upgrading to reduce risk in case of reboot
    ynh_replace --match="//\(Unattended-Upgrade::MinimalSteps\).*" --replace="\1 \"true\";" --file="$unattended_upgrades_config"

    # Configure Unattended Upgrades mailing
    if [ "$unattended_mail" = "on_upgrade" ]; then
        # Allow mail to root
        ynh_replace --match="//\(Unattended-Upgrade::Mail \)" --replace="\1" --file="$unattended_upgrades_config"

        # Send mail even if there's no errors
        ynh_replace --match="//\(Unattended-Upgrade::MailOnlyOnError \).*" --replace="\1\"false\";" --file="$unattended_upgrades_config"

    elif [ "$unattended_mail" = "on_error" ]; then
        # Allow mail to root
        ynh_replace --match="//\(Unattended-Upgrade::Mail \)" --replace="\1" --file="$unattended_upgrades_config"

        # Send mail only if there's an error
        ynh_replace --match="//\(Unattended-Upgrade::MailOnlyOnError \).*" --replace="\1\"true\";" --file="$unattended_upgrades_config"

    else # "Never"
        # Comment "Unattended-Upgrade::Mail" if it isn't already commented
        ynh_replace --match="^\(Unattended-Upgrade::Mail \)" --replace="//\1" --file="$unattended_upgrades_config"
    fi
}

_unattended_upgrades_restore_config() {
    mv "$unattended_upgrades_config_backup" "$unattended_upgrades_config"
}

_02periodic_config="/etc/apt/apt.conf.d/02periodic"

_02periodic_set_config() {
    unattended_verbosity_number="${unattended_verbosity#v}"
    ynh_config_add --template="02periodic" --destination="$_02periodic_config"
}

_02periodic_remove() {
    ynh_safe_rm "$_02periodic_config"
}
