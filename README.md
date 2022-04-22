# MY CONFIGS

This repository contains a collection of configuration files and scripts to setup and maintain my environment (MacOS M1).

I DO NOT RECOMMEND ANYONE RUN THESE SCRIPTS BLINDLY AS THEY ARE YET UNTESTED. Config files, on the other hand, should working.

## Installing environment

Run `setup.sh` to run the setup script that I use to install everything I want on my machine. 

NOTE: This script as it currently exists is yet untested as I have not yet had to nuke my machine. I have tried to build this script incrementally over time. I expect there to architecture-related errors with `brew` install commands as this script was created during the adoption period of M1.

NOTE: If you are using an M1 mac and want to run some apps through Rosetta and others natively, you may need to execute
the `brew install` commands in a terminal running on the desired architecture to have cask install the package with the desired architecture.
TODO: Make the architecture problem seamless for M1 macs going forward.

## Updating configs

Run `update-configs.sh` in the root directory of this repo to pull copies configs from their respective locations into this repo.  NOTE: The source of truth for is NOT this repo, but the original location in which the configs reside. For example, to edit your `.zshrc`.

For example, if you want to edit your `.zshrc`, you should edit it in `~/.zshrc` (in the home directory)--then run the `update-configs.sh` to pull those changes to this repo.


