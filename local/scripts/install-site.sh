#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"

log "\e[36m--------- Installing website ---------\e[39m"

log "Go to the website root."
PROJECT_ROOT="$(get_project_root)"
cd "${PROJECT_ROOT}/web" || exit 1;

log "Installing site from existing configuration."
DRUSH="${PROJECT_ROOT}/vendor/bin/drush"
${DRUSH} site:install minimal --existing-config install_configure_form.enable_update_status_emails=NULL --yes || exit 1;
log "Site is installed from existing configuration."

log "\e[36m--------- Finished installing website ---------\e[39m"
