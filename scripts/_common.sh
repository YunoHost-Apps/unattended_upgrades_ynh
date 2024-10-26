#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

apticron_config="/etc/apticron/apticron.conf"
apticron_daily_override="/etc/systemd/system/apt-daily-upgrade.timer.d/override.conf"

_apticron_set_config() {
    # If the config file doesn't exist, copy the model
    if [ ! -e "$apticron_config" ]; then
        cp "/usr/lib/apticron/apticron.conf" "$apticron_config"
    fi

    # Create a backup of the config file for the reset action
    if [ ! -f "${apticron_config}.backup" ]; then
        cp "$apticron_config" "${apticron_config}.backup"
    fi

    subject="&\nCUSTOM_SUBJECT=\'[apticron] \$SYSTEM: \$NUM_PACKAGES package update(s)\'"
    subject_noupdate="&\nCUSTOM_NO_UPDATES_SUBJECT=\'[apticron] \$SYSTEM: Up to date \\\\o/\'"
    ynh_replace --file="$apticron_config" --match="# CUSTOM_SUBJECT=.*" --replace="$subject"
    ynh_replace --file="$apticron_config" --match="# CUSTOM_NO_UPDATES_SUBJECT=.*" --replace="$subject_noupdate"

    # Disable cron
    sed -i 's/^\([^#]\)/# Commented because yunohost package unattended_upgrades use systemd config \1/g' /etc/cron.d/apticron

    # Run apticron via systemd ExecStartPre / ExecStopPost
    case "$previous_apticron" in
        0) comment_apticron_pre="# " ;;
        1) comment_apticron_pre="" ;;
    esac
    case "$after_apticron" in
        0) comment_apticron_post="# " ;;
        1) comment_apticron_post="" ;;
    esac

    mkdir -p "$(dirname "$apticron_daily_override")"
    ynh_config_add --template="apt-daily-upgrade.override.conf" \
        --destination="$apticron_daily_override"
    systemctl daemon-reload
}

_apticron_restore_config() {
    mv "${apticron_config}.backup" "$apticron_config"
}

unattended_upgrades_config="/etc/apt/apt.conf.d/51unattended-upgrades-override"

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
        never|*)
            comment_all_mail="//"
            mail_level="on-change"
            ;;
    esac

    ynh_config_add --template="51unattended-upgrades-override" --destination="$unattended_upgrades_config"
}


_02periodic_config="/etc/apt/apt.conf.d/02periodic"

_02periodic_set_config() {
    unattended_verbosity_number="${unattended_verbosity#v}"
    ynh_config_add --template="02periodic" --destination="$_02periodic_config"
}
