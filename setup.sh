#!/bin/zsh

cd ~


# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
  source ~/.zshrc
fi

# Install doom emacs & deps
brew install git ripgrep
brew install coreutils fd
xcode-select --install
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
rm -rf ~/.emacs.d
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install



mkdir ~/my-repos
mkdir ~/other-repos

brew install exa
brew install slack
brew install neovim
brew install obsidian
brew install alfred
brew install git
brew install git-credential-manager
brew install gitkraken
brew install spotify
brew install --cask zoom
brew install amethyst
brew install alt-tab
brew install --cask iterm2
brew install --cask anaconda
brew install --cask racket
brew install ghc
brew install haskell-stack
brew tap homebrew/cask-fonts
brew install font-hasklig
brew tap zegervdv/zathura
arch -arm64 brew install zathura
brew install --cask basictex # DO I NEED THIS?
arch -arm64 brew install imagemagick
arch -arm64 brew install graphviz

arch -arm64 brew install stripe/stripe-cli/stripe

git config --global user.name "HaydenLeBaron"
git config --global user.email "me@haydenlebaron.com"

git clone https://github.com/HaydenLeBaron/zettelkasten.git ~/my-repos/zettelkasten
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# TODO: install OCaml stuff
opam install rtop # Install reason utop (OCaml)


# Install powerline fonts https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts


#TODO: clone and place .zshrc
#TODO: clone and place .emacs.d and .doom config files
#TODO: clone and place iterm config file

# List of things to manually download/install from browser/app store:
# - https://www.nvidia.com/en-us/geforce-now/download/
# - https://apps.apple.com/us/app/flow-focus-pomodoro-timer/id1423210932

