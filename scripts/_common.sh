#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

apticron_config="/etc/apticron/apticron.conf"
apticron_cron="/etc/cron.d/apticron"

_apticron_set_config() {
    # If the config file doesn't exist, copy the model
    if [ ! -e "$apticron_config" ]; then
        cp "/usr/lib/apticron/apticron.conf" "$apticron_config"
    fi

    # Create a backup of the config file for the reset action
    cp "$apticron_config" "/etc/yunohost/apps/$app/conf/apticron.conf.backup"

    ynh_replace_string --match_string="# CUSTOM_SUBJECT=.*" \
        --replace_string="&\nCUSTOM_SUBJECT=\'[apticron] \$SYSTEM: \$NUM_PACKAGES package update(s)\'" --target_file="$apticron_config"
    ynh_replace_string --match_string="# CUSTOM_NO_UPDATES_SUBJECT=.*" \
        --replace_string="&\nCUSTOM_NO_UPDATES_SUBJECT=\'[apticron] \$SYSTEM: Up to date \\\\o/\'" --target_file="$apticron_config"

    # Create a backup of the cron file for the reset action
    cp "$apticron_cron" "/etc/yunohost/apps/$app/conf/apticron.crond.backup"

    # Copy and comment the current cron
    ynh_replace_string --match_string="^.* root if.*" --replace_string="#&\n&" --target_file="$apticron_cron"
    # Modify the time to set at 20:00 every day
    ynh_replace_string --match_string="^[[:digit:]].*\( root if.*\)" --replace_string="0 20 * * *\1" --target_file="$apticron_cron"
    # Copy the new cron and set the time to 2:00 every night
    ynh_replace_string --match_string="^0 20\(.*\)" --replace_string="&\n0 2\1" --target_file="$apticron_cron"

    if [ "$previous_apticron" -eq 0 ]; then
        # Comment the first cron
        ynh_replace_string --match_string="^0 20 .*" --replace_string="#&" --target_file="$apticron_cron"
    fi

    if [ "$after_apticron" -eq 0 ]; then
        # Comment the second cron
        ynh_replace_string --match_string="^0 2 .*" --replace_string="#&" --target_file="$apticron_cron"
    fi
}

_apticron_restore_config() {
    mv "/etc/yunohost/apps/$app/conf/apticron.conf.backup" "$apticron_config"
    mv "/etc/yunohost/apps/$app/conf/apticron.crond.backup" "$apticron_cron"
}


unattended_upgrades_config="/etc/apt/apt.conf.d/50unattended-upgrades"

_unattended_upgrades_set_config() {
    # Make a backup of 50unattended-upgrades
    cp "$unattended_upgrades_config" "/etc/yunohost/apps/$app/conf/50unattended-upgrades.backup"

    # Configure upgrade sources
    # Allow other updates
    if [ "$upgrade_level" = "security_and_updates" ]; then
        ynh_replace_string --match_string="//\(.*\"o=Debian,a=stable\)" --replace_string="\1" --target_file="$unattended_upgrades_config"
        ynh_replace_string --match_string="//\(.*\"o=Debian,a=stable-updates\)" --replace_string="\1" --target_file="$unattended_upgrades_config"
    fi

    # Add YunoHost upgrade source
    if [ $ynh_update -eq 1 ]; then
        ynh_replace_string --match_string="origin=Debian,codename=\${distro_codename},label=Debian-Security\";" \
            --replace_string="&\n\n        //YunoHost upgrade\n        \"o=YunoHost,a=stable\";" --target_file="$unattended_upgrades_config"
    fi

    # Allow MinimalSteps upgrading to reduce risk in case of reboot
    ynh_replace_string --match_string="//\(Unattended-Upgrade::MinimalSteps\).*" --replace_string="\1 \"true\";" --target_file="$unattended_upgrades_config"

    # Configure Unattended Upgrades mailing
    if [ "$unattended_mail" = "on_upgrade" ]; then
        # Allow mail to root
        ynh_replace_string --match_string="//\(Unattended-Upgrade::Mail \)" --replace_string="\1" --target_file="$unattended_upgrades_config"

        # Send mail even if there's no errors
        ynh_replace_string --match_string="//\(Unattended-Upgrade::MailOnlyOnError \).*" --replace_string="\1\"false\";" --target_file="$unattended_upgrades_config"

    elif [ "$unattended_mail" = "on_error" ]; then
        # Allow mail to root
        ynh_replace_string --match_string="//\(Unattended-Upgrade::Mail \)" --replace_string="\1" --target_file="$unattended_upgrades_config"

        # Send mail only if there's an error
        ynh_replace_string --match_string="//\(Unattended-Upgrade::MailOnlyOnError \).*" --replace_string="\1\"true\";" --target_file="$unattended_upgrades_config"

    else	# "Never"
        # Comment "Unattended-Upgrade::Mail" if it isn't already commented
        ynh_replace_string --match_string="^\(Unattended-Upgrade::Mail \)" --replace_string="//\1" --target_file="$unattended_upgrades_config"
    fi

}

_unattended_upgrades_restore_config() {
    mv "/etc/yunohost/apps/$app/conf/50unattended-upgrades.backup" "$unattended_upgrades_config"
}

#=================================================
# BACKUP
#=================================================

#=================================================
# PACKAGE CHECK BYPASSING...
#=================================================

#=================================================
# FUTUR OFFICIAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Create a changelog for an app after an upgrade from the file CHANGELOG.md.
#
# usage: ynh_app_changelog [--format=markdown/html/plain] [--output=changelog_file] --changelog=changelog_source]
# | arg: -f --format= - Format in which the changelog will be printed
#       markdown: Default format.
#       html:     Turn urls into html format.
#       plain:    Plain text changelog
# | arg: -o --output= - Output file for the changelog file (Default ./changelog)
# | arg: -c --changelog= - CHANGELOG.md source (Default ../CHANGELOG.md)
#
# The changelog is printed into the file ./changelog and ./changelog_lite
ynh_app_changelog () {
    # Declare an array to define the options of this helper.
    local legacy_args=foc
    declare -Ar args_array=( [f]=format= [o]=output= [c]=changelog= )
    local format
    local output
    local changelog
    # Manage arguments with getopts
    ynh_handle_getopts_args "$@"
    format=${format:-markdown}
    output=${output:-changelog}
    changelog=${changelog:-../CHANGELOG.md}

    local original_changelog="$changelog"
    local temp_changelog="changelog_temp"
    local final_changelog="$output"

    if [ ! -n "$original_changelog" ]
    then
        echo "No changelog available..." > "$final_changelog"
        echo "No changelog available..." > "${final_changelog}_lite"
        return 0
    fi

#REMOVEME?     local current_version=$(ynh_read_manifest --manifest="/etc/yunohost/apps/$YNH_APP_INSTANCE_NAME/manifest.json" --manifest_key="version")
    local update_version=$(ynh_read_manifest --manifest="../manifest.json" --manifest_key="version")

    # Get the line of the version to update to into the changelog
    local update_version_line=$(grep --max-count=1 --line-number "^## \[$update_version" "$original_changelog" | cut -d':' -f1)
    # If there's no entry for this version yet into the changelog
    # Get the first available version
    if [ -z "$update_version_line" ]
    then
        update_version_line=$(grep --max-count=1 --line-number "^##" "$original_changelog" | cut -d':' -f1)
    fi

    # Get the length of the complete changelog.
    local changelog_length=$(wc --lines "$original_changelog" | awk '{print $1}')
    # Cut the file before the version to update to.
    tail --lines=$(( $changelog_length - $update_version_line + 1 )) "$original_changelog" > "$temp_changelog"

    # Get the length of the troncated changelog.
    changelog_length=$(wc --lines "$temp_changelog" | awk '{print $1}')
    # Get the line of the current version into the changelog
    # Keep only the last line found
    local current_version_line=$(grep --line-number "^## \[$current_version" "$temp_changelog" | cut -d':' -f1 | tail --lines=1)
    # If there's no entry for this version into the changelog
    # Get the last available version
    if [ -z "$current_version_line" ]
    then
        current_version_line=$(grep --line-number "^##" "$original_changelog" | cut -d':' -f1 | tail --lines=1)
    fi
    # Cut the file before the current version.
    # Then grep the previous version into the changelog to get the line number of the previous version
    local previous_version_line=$(tail --lines=$(( $changelog_length - $current_version_line )) \
        "$temp_changelog" | grep --max-count=1 --line-number "^## " | cut -d':' -f1)
    # If there's no previous version into the changelog
    # Go until the end of the changelog
    if [ -z "$previous_version_line" ]
    then
        previous_version_line=$changelog_length
    fi

    # Cut the file after the previous version to keep only the changelog between the current version and the version to update to.
    head --lines=$(( $current_version_line + $previous_version_line - 1 )) "$temp_changelog" | tee "$final_changelog"

    if [ "$format" = "html" ]
    then
        # Replace markdown links by html links
        ynh_replace_string --match_string="\[\(.*\)\](\(.*\)))" --replace_string="<a href=\"\2\">\1</a>)" --target_file="$final_changelog"
        ynh_replace_string --match_string="\[\(.*\)\](\(.*\))" --replace_string="<a href=\"\2\">\1</a>" --target_file="$final_changelog"
    elif [ "$format" = "plain" ]
    then
        # Change title format.
        ynh_replace_string --match_string="^##.*\[\(.*\)\](\(.*\)) - \(.*\)$" --replace_string="## \1 (\3) - \2" --target_file="$final_changelog"
        # Change modifications lines format.
        ynh_replace_string --match_string="^\([-*]\).*\[\(.*\)\]\(.*\)" --replace_string="\1 \2 \3" --target_file="$final_changelog"
    fi
    # else markdown. As the file is already in markdown, nothing to do.

    # Keep only important changes into the changelog
    # Remove all minor changes
    sed '/^-/d' "$final_changelog" > "${final_changelog}_lite"
    # Remove all blank lines (to keep a clear workspace)
    sed --in-place '/^$/d' "${final_changelog}_lite"
    # Add a blank line at the end
    echo "" >> "${final_changelog}_lite"

    # Clean titles if there's no significative changes
    local line
    local previous_line=""
    while read line <&3
    do
        if [ -n "$previous_line" ]
        then
            # Remove the line if it's a title or a blank line, and the previous one was a title as well.
            if ( [ "${line:0:1}" = "#" ] || [ ${#line} -eq 0 ] ) && [ "${previous_line:0:1}" = "#" ]
            then
                ynh_replace_special_string --match_string="${previous_line//[/.}" --replace_string="" --target_file="${final_changelog}_lite"
            fi
        fi
        previous_line="$line"
    done 3< "${final_changelog}_lite"

    # Remove all blank lines again
    sed --in-place '/^$/d' "${final_changelog}_lite"

    # Restore changelog format with blank lines
    ynh_replace_string --match_string="^##.*" --replace_string="\n\n&\n" --target_file="${final_changelog}_lite"
    # Remove the 2 first blank lines
    sed --in-place '1,2d' "${final_changelog}_lite"
    # Add a blank line at the end
    echo "" >> "${final_changelog}_lite"

    # If changelog are empty, add an info
    if [ $(wc --words "$final_changelog" | awk '{print $1}') -eq 0 ]
    then
        echo "No changes from the changelog..." > "$final_changelog"
    fi
    if [ $(wc --words "${final_changelog}_lite" | awk '{print $1}') -eq 0 ]
    then
        echo "No significative changes from the changelog..." > "${final_changelog}_lite"
    fi
}
