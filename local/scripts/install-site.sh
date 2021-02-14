#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"

log "\e[36m--------- Installing website ---------\e[39m"

log "Go to the website root."
PROJECT_ROOT="$(get_project_root)"
cd "${PROJECT_ROOT}/web" || exit 1;

log "Installing site from existing configuration."
drush drush site:install --existing-config --yes || exit 1;
log "Site is installed from existing configuration."

log "\e[36m--------- Finished installing website ---------\e[39m"
