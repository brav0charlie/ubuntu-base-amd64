# file: aliases.zsh
# description: Aliases for git

if [[ -a /usr/bin/git ]] ; then
    alias g='git'
    alias gp='git pull'
    alias gps='git push'
    alias gs='git status'
    alias ga='git add'
    alias gcm='git commit -m'
    alias gcs='git commit -s -m'
fi
