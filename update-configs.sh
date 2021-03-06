#!/bin/zsh
# This script copies .config files from various directories and updates the copies in this file.
# For example, the ~/.zshrc will be copied into a directory in this repo.
# Consider the file in the original location to be the source of truth. Ex: ~/.zshrc is truth, not my-scripts/*/.zshrc.
#
# Run in root of my scripts directory.

echo "Removing old configs..."
rm config/.zshrc
rm -rf config/.doom.d
rm -rf config/.vim
rm -rf config/.gitkraken
rm config/nvim/init.vim

echo "Copying current configs to my-scripts repo..."
cp    ~/.zshrc             config/.zshrc
cp -r ~/.doom.d            config/.doom.d
cp -r ~/.vim               config/.vim
cp -r ~/.gitkraken         config/.gitkraken
cp ~/.config/nvim/init.vim config/nvim/init.vim
