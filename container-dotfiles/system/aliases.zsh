# file: system/aliases.sh
# description: Aliases for system

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
#   from: https://raw.githubusercontent.com/holman/dotfiles/master/system/aliases.zsh
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Reload .zshrc
alias reload!='. ~/.zshrc'

# Yes, I used DOS growing up.
alias cls='clear'

# Screw you for making them rename bat to batcat.
#  Only applies to Linux (Ubuntu/Debian. Not tested on RedHat distros.)
if [[ $OS = 'linux' ]] ; then
  alias bat='batcat'
fi
