# DEFAULT PROGRAMS
export EDITOR='nvim'
export BROWSER='vivaldi-stable'
export FILE_MANAGER='thunar'
export STARSHIP_CONFIG=~/.config/starship.toml

# XDG PATHS
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# ZDOTS
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"

# PROGRAMMING
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GOPATH="$XDG_DATA_HOME/go"
export GOROOT='/usr/local/go'
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"

# JAVA
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# OTHER CONFIGS
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export GIT_CONFIG_PATH="$XDG_CONFIG_HOME/git/config"
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export GDK_BACKEND=x11
