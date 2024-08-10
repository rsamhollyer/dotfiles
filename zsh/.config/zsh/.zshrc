export ZSH="$ZDOTDIR/ohmyzsh"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto # update automatically without asking

COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    wd
    ng
    docker
    docker-compose
    zsh-autosuggestions
    zsh-syntax-highlighting
    sudo
    pip
    rust
    gcloud
    colored-man-pages
    pyenv
)

export HISTFILE="$XDG_STATE_HOME/zsh/zsh-history"
export SHELL_SESSION_DIR="$XDG_STATE_HOME/zsh/sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID"
export LESSHISTFILE=/dev/null

HISTSIZE=8000
SAVEHIST=5000

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
setopt globdots

# remove dups
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt histignorealldups

fpath=($HOME/.config/zsh/completions $fpath)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER='lvim +Man!'
export LANG=en_US.UTF-8

eval "$(starship init zsh)"

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

path+=("$HOME"/.local/bin "$CARGO_HOME/bin" "$XDG_DATA_HOME/bin" /usr/local/go/bin "$GOPATH/bin" "$HOME/.local/programs/VSCode-linux-x64/bin")
export PATH

# Place completion dump file (zcompdump) in cache directory using the OMZ variable ZSH_COMPDUMP
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-$HOST-$ZSH_VERSION"
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$HOST-$ZSH_VERSION"

source "$ZSH"/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"
typeset -aU path

# Ctrl+Space to accept suggestion from zsh-autosuggestions (MUST come after sourcing oh my zsh stuff see https://github.com/zsh-users/zsh-autosuggestions/issues/471#issuecomment-573500890)
bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word # Ctrl + backspace
bindkey '^[[3;5~' kill-word     # Ctrl + delete

# do not suggest . and .. when doing cd <TAB>
zstyle ':completion:*' special-dirs false

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

extract() {
    if [ -f "$1" ]; then
        case $1 in
        *.tar.bz2) tar xvjf "$1" ;;
        *.tar.gz) tar xvzf "$1" ;;
        *.tar.xz) tar xf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xvf "$1" ;;
        *.tbz2) tar xvjf "$1" ;;
        *.tgz) tar xvzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

fastfetch
