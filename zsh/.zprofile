DISABLE_FZF_AUTO_COMPLETION="false"
export FZF_BASE=$XDG_CONFIG_HOME/fzf
export FZF_COMPLETION_TRIGGER="~~"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPS="--extended"

FZF_DEFAULT_COMMAND='ps -ef' \
    fzf --bind 'ctrl-r:reload($FZF_DEFAULT_COMMAND)' \
    --header 'Press CTRL-R to reload' --header-lines=1 \
    --height=50% --layout=reverse

FZF_DEFAULT_COMMAND='find . -type f' \
    fzf --bind 'ctrl-d:reload(find . -type d),ctrl-f:reload($FZF_DEFAULT_COMMAND)' \
    --height=50% --layout=reverse

INITIAL_QUERY=""
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
    fzf --bind "change:reload:$RG_PREFIX {q} || true" \
    --ansi --disabled --query "$INITIAL_QUERY" \
    --height=50% --layout=reverse

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
    export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh) fzf "$@" --preview 'dig {}' ;;
    *) fzf "$@" ;;
    esac
}
