#!/bin/bash
source "$(dirname "$0")/common.sh"

MODE="$1"

# Handle empty as 'off'.
if [ -z "$MODE" ]; then
  MODE="off"
fi

# Only accept valid xdebug modes. See https://xdebug.org/docs/all_settings#mode for further information.
ACCEPTED_MODES=("off" "develop" "coverage" "debug" "gcstats" "profile" "trace")

# Validating.
IFS=',' read -r -a FORVALIDATION <<< "$MODE"
for i in "${FORVALIDATION[@]}"
  do
    if [[ ! "${ACCEPTED_MODES[*]}" =~ ${i} ]]; then
      log "$i mode is not in the list of the accepted modes."
      log "Check https://xdebug.org/docs/all_settings#mode for accepted modes."
      exit 1;
    fi
done

log "Setting Xdebug mode to '$MODE'"
echo xdebug.mode = "$MODE" > /usr/local/etc/php/conf.d/zzz-lando-xdebug.ini || exit 1;

log "Reload webserver."
if [[ $(ps -acx | grep -c apache) -gt 0 ]]; then
    /etc/init.d/apache2 reload || exit 1;
fi
if [[ $(ps -acx | grep -c nginx) -gt 0 ]]; then
    /etc/init.d/nginx reload || exit 1;
fi

log "Xdebug has been set to '$MODE' mode."
