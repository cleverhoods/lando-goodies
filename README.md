# Lando goodies
Advanced Lando tooling to improve day to day work.

This project is created as a demonstration for https://cleverhoods.medium.com/4-lando-goodies-for-productivity-d5101962a3cd.

## Installation guide
1. [Install Lando](https://docs.lando.dev/basics/installation.html) [(v3.0.26)](https://github.com/lando/lando/releases/tag/v3.0.26)
2. Run `git submodule update --init` from the repository root.
3. Run `bash local/scripts/init.sh` from the repository root.
4. Run `bash local/scripts/fireup.sh` from the repository root.
5. Use the generated one-time login link to access the newly built local site.

## Goodies
### `lando build-app`
Download and build application resources

### `lando clean`
Delete downloaded and built resources

### `lando install-app`
Install the application

### `lando xdebug`
Loading Xdebug in a user defined mode.

