# Navegação
alias ..='cd ..'
alias c='clear'
alias q='exit'
alias home='cd $HOME'
alias .script='cd $HOME/.script'

# Listagem de arquivos
alias grep='grep --color=auto' # Destaca resultados do grep
alias ls='ls --color=auto'
alias la='ls -A' # Mostra todos os arquivos, incluindo os ocultos
alias ll='ls -la' # Mostra todos os arquivos, incluindo os ocultos e permissões, como ler, alterar e executar

# Git
alias g='git clone'
alias giti='git init'
alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias gitp='git push'
alias gitl='git log --oneline --graph --decorate --all'
alias gitb='git branch'
alias gitd='git diff'