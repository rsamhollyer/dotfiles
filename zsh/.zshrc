
# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.config/oh-my-zsh"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto # update automatically without asking


# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(git wd ng fzf ripgrep docker docker-compose zsh-autosuggestions zsh-syntax-highlighting zsh-nvm zsh-pyenv fuzzy-sys fuzzy-kill sudo pip rust ripgrep gcloud colored-man-pages)

export HISTFILE="$XDG_STATE_HOME/zsh/zsh-history"
export SHELL_SESSION_DIR="$XDG_STATE_HOME/zsh/sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID"
export LESSHISTFILE=/dev/null

HISTSIZE=15000
SAVEHIST=10000


ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
setopt globdots

# remove dups
setopt histignorealldups
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP


export NVM_COMPLETION=true
export NVM_AUTO_USE=true




(cat $HOME/.config/wpg/sequences &) # WPG terminal colors
fpath=($HOME/.config/zsh/completions $fpath)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8


eval "$(starship init zsh)"

# FZF
[ -f $HOME/.config/.fzf.zsh ] && source $HOME/.config/.fzf.zsh

DISABLE_FZF_AUTO_COMPLETION="false"
export FZF_BASE=$XDG_CONFIG_HOME/fzf
export FZF_COMPLETION_TRIGGER="~~"
export FZF_DEFAULT_OPS="--extended"



if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# PATH
# Prepend Path\
path+=($HOME/.config/rofi/bin "$CARGO_HOME/bin" "$XDG_DATA_HOME/bin" /usr/local/go/bin "$GOPATH/bin")
export PATH

# Place completion dump file (zcompdump) in cache directory using the OMZ varialbe ZSH_COMPDUMP
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST-$ZSH_VERSION"
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$HOST-$ZSH_VERSION"

source $HOME/.config/oh-my-zsh/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"
typeset -aU path

# Ctrl+Space to accept suggestion from zsh-autosuggestions (MUST come after sourcing oh my zsh stuff see https://github.com/zsh-users/zsh-autosuggestions/issues/471#issuecomment-573500890)
bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word  # Ctrl + backspace
bindkey '^[[3;5~' backward-kill-word  # Ctrl + delete
bindkey -r '^T' # Remove Ctrl + T for fzf
bindkey '^Z' fzf-file-widget # Rebind to Ctlr + A


# FORGIT
[ -f $HOME/.local/forgit/forgit.plugin.zsh ] && source $HOME/.local/forgit/forgit.plugin.zsh

# do not suggest . and .. when doing cd <TAB>
zstyle ':completion:*' special-dirs false

