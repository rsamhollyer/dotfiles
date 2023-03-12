# QUICK CLEAR
alias c='clear'

# CHANGE GREP
alias grep='grep --color=auto'

# CODE INSIDERS
alias cdi='code-insiders'

# EXA
alias l='exa -1la --group-directories-first --color=always --color-scale --icons'
alias ll='exa -1l --group-directories-first --color=always --color-scale --icons'
alias la='exa -Gla --group-directories-first --color=always --color-scale --icons'
alias ls='exa -Gl --group-directories-first --color=always --color-scale --icons'
alias ld='exa -TD --color=always --color-scale --icons' # Show only directory tree --this is recursive

# OTHER
alias nodemon='./node_modules/.bin/nodemon'

# ZSH
alias zz='source $ZDOTDIR/.zshrc && source $ZDOTDIR/.zshenv'

# DOCKER
alias dpsa='docker ps -a'
alias dockerrma='docker rm $(docker ps --filter status=exited -q)'
alias dockervpf='docker volume prune -f'
alias dockervl='docker volume ls'
alias dockeripa='docker image prune -af'
alias dockercp='docker container prune -f'
alias dockerkillall='docker system prune --volumes -f'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcf='docker-compose -f'

# SYSTEMCTL
alias running='systemctl list-units --type=service --state=running'
