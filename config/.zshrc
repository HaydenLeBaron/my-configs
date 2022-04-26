# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="jonathan"
#ZSH_THEME="fino"
#ZSH_THEME="apple"
#ZSH_THEME="xiong-chiamiov-plus"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	vi-mode
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




#=====================================================================
# Rest of file: (lots of Qwick env stuff)
#=====================================================================

export PATH=/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
[[ ! -r /Users/haydenlebaron/.opam/opam-init/init.zsh ]] || source /Users/haydenlebaron/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# set default directory
export START="/Users/haydenlebaron/gitlab/qwick"
if [[ /Users/haydenlebaron/other-repos/qwick == /Users/haydenlebaron ]]; then
    cd 
fi

# VSCode
code () { VSCODE_CWD="/Users/haydenlebaron/other-repos/qwick" open -n -b "com.microsoft.VSCode" --args  ;}

export PATH="/opt/homebrew/opt/libpq/bin:/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
eval export PATH="/Users/haydenlebaron/Library/Caches/fnm_multishells/20208_1644952895563/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/haydenlebaron/Library/Caches/fnm_multishells/20208_1644952895563"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/haydenlebaron/Library/Application Support/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_ARCH="arm64"
export LSP_USE_PLISTS=true # Optimizes emacs LSP extensions. See https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization


export PATH=/opt/homebrew/bin:/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Android path vars
export ANDROID_HOME=~/Library/Android/sdk
export PATH=/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/emulator
export PATH=/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/tools
export PATH=/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/tools/bin
export PATH=/Users/haydenlebaron/.opam/4.06.1/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/42108_1644949900073/bin:/opt/homebrew/bin:/Users/haydenlebaron/Library/Caches/fnm_multishells/20731_1644948604461/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.0.2.jdk/Contents/Home




alias c="docker-compose"
alias d="docker"
alias k="kubectl"
alias y="yarn"
alias doom="~/.emacs.d/bin/doom"
alias sn="~/my-repos/my-scripts/nsafari.sh" # Safari New
alias vim="nvim"
alias macs="emacs -nw"
alias myrtop="/Users/haydenlebaron/my-repos/my-configs/node_modules/reason-cli/bin/rtop"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



#export PATH="/Library/TeX/texbin/latex:$PATH"
#export PATH="/Library/TeX/texbin:$PATH"

#export PATH="/:$PATH"
ln -s /usr/local/texLive/2022basic/bin/universal-darwin/latex /usr/local/bin/latex
ln -s /usr/local/texLive/2022basic/bin/universal-darwin/dvipng /usr/local/bin/dvipng
export PATH="/usr/local/bin/latex:$PATH"
export PATH="/usr/local/bin/dvipng:$PATH"
