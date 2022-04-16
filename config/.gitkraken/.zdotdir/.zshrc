source $USER_ZDOTDIR/.zshrc 2>/dev/null
ELECTRON_RUN_AS_NODE=1 sh -c "$GITKRAKEN_BINARY_PATH $GK_CLI_CLIENT_PATH showWelcomeMessage"
source $GKRC_PATH 2>/dev/null

if [[ $PATH != *"$GK_CLI_RESOURCES_PATH"* ]]; then
  export PATH=$PATH:$GK_CLI_RESOURCES_PATH
fi

(( ${+aliases[gk]} )) && unalias gk 2>/dev/null
