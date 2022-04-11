# CHANGE CODE INSIDERS
alias code='code-insiders'

# NVIM
alias v='/usr/bin/nvim'

# QUICK CLEAR
alias c='clear && clear'

# CHANGE GREP
alias grep='grep --color=auto'

# EXA
alias ls='exa -1la --group-directories-first --color=always --color-scale --icons'
alias ll='exa -1l --group-directories-first --color=always --color-scale --icons'
alias la='exa -Gla --group-directories-first --color=always --color-scale --icons'
alias l='exa -Gl --group-directories-first --color=always --color-scale --icons'
alias ld='exa -TD --color=always --color-scale --icons' # Show only directory tree --this is recursive

# OTHER
alias nodemon='./node_modules/.bin/nodemon'

# SSH
alias static='ssh -i ~/.ssh/statickey.pem ubuntu@ec2-3-134-112-153.us-east-2.compute.amazonaws.com'
alias awsec2='ssh -i ~/.ssh/example1.pem ec2-user@ec2-3-143-22-29.us-east-2.compute.amazonaws.com'

# ZSH
alias zz='source $ZDOTDIR/.zshrc && source ~/.zshenv'

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

# UPDATE ALL
alias updates='nvm upgrade && pyenv update && rustup update && rustup install nightly'
