# MY SCRIPTS

This repository contains a collection of scripts that I use in my MacOS environment.

## Installing environment

Run `setup.sh` to run through the install process used to create my environment.

NOTE: If you are using an M1 mac and want to run some apps through Rosetta and others natively, you may need to execute
the `brew install` commands in a terminal running on the desired architecture to have cask install the package with the desired architecture.
TODO: Make the architecture problem seamless for M1 macs going forward.

## Updating configs

Run `update-configs.sh` in the root directory of this repo to pull copies configs from their respective locations into this repo.  NOTE: The source of truth for is NOT this repo, but the original location in which the configs reside. For example, to edit your `.zshrc`.

For example, if you want to edit your `.zshrc`, you should edit it in `~/.zshrc` (in the home directory)--then run the `update-configs.sh` to pull those changes to this repo.


