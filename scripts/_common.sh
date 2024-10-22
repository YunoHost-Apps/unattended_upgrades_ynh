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


_unattended_upgrades_set_config() {
    # Allow other updates
    case "$upgrade_level" in
        security_only)          comment_security_and_updates="//" ;;
        security_and_updates)   comment_security_and_updates="" ;;
    esac

    # Add YunoHost upgrade source
    case "$ynh_update" in
        0)  comment_yunohost_upgrades="//" ;;
        1)  comment_yunohost_upgrades="" ;;
    esac

    # Configure Unattended Upgrades mailing
    case "$unattended_mail" in
        on_upgrade)
            comment_all_mail=""
            mail_level="on-change"
            ;;
        on_error)
            comment_all_mail=""
            mail_level="only-on-error"
            ;;
        never)
            comment_all_mail="//"
            mail_level="on-change"
            ;;
    esac

    ynh_config_add --template="51unattended-upgrades-override" "/etc/apt/apt.conf.d/51unattended-upgrades-override"
}


_02periodic_config="/etc/apt/apt.conf.d/02periodic"

_02periodic_set_config() {
    unattended_verbosity_number="${unattended_verbosity#v}"
    ynh_config_add --template="02periodic" --destination="$_02periodic_config"
}

_02periodic_remove() {
    ynh_safe_rm "$_02periodic_config"
}
