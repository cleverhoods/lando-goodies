#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"

log "\e[36m--------- Rock & Roll! ---------\e[39m"

PROJECT_ROOT="$(get_project_root)"

log "Add settings.lando.php"
cp "${PROJECT_ROOT}"/web/sites/default/example.settings.lando.php "${PROJECT_ROOT}"/web/sites/default/settings.lando.php || exit 1;
log "settings.lando.php is added"

log "Add .lando.local.yml"
cp "${PROJECT_ROOT}"/example.lando.local.yml "${PROJECT_ROOT}"/.lando.local.yml || exit 1;
log ".lando.local.yml is added"

cd "${PROJECT_ROOT}" || exit 1;

log "Run lando start"
lando start || exit 1;
log "Lando start is finished"

log "Run lando build-app"
lando build-app || exit 1;
log "Lando build-app is finished"

log "Run lando install-app"
lando install-app || exit 1;
log "Lando install-app is finished"

log "Create one time login link"
lando drush uli || exit 1;
log "One time log in link is created"
