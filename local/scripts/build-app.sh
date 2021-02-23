#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"

log "\e[36m--------- Download and build site resources ---------\e[39m"

log "Go to the project root."
PROJECT_ROOT="$(get_project_root)"
cd "${PROJECT_ROOT}" || exit 1;

log "Installing composer dependencies (with development dependencies)."
composer install --no-interaction --no-progress --apcu-autoloader || exit 1;
log "Composer packages are installed"

log "\e[36m--------- Application resources are downloaded and built. ---------\e[39m"
