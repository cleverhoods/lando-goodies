#!/usr/bin/env bash

# Provide better logging display.
function log() {
  echo -e "\e[94m$(date +'%F %T')\e[39m $1"
}

# Get the project root.
function get_project_root() {
  # If LANDO_MOUNT envvar is not available then use PWD.
  if [ -z "${LANDO_MOUNT}" ];
  then
    echo "${PWD}" || exit 1;
  else
    echo "${LANDO_MOUNT}" || exit 1;
  fi
}
