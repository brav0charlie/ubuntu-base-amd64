# file: system/grc.zsh
# description: GRC colorizes nifty unix tools all over the place
#              (from: https://github.com/holman/dotfiles/blob/master/system/grc.zsh)

# GRC colorizes nifty unix tools all over the place
# Remember to remove ls from supported commands on /etc/gc.zsh
if [[ "$OS" = "macos" ]] ; then
    if (( $+commands[grc] )) && (( $+commands[brew] )) ; then
        source `brew --prefix`/etc/grc.zsh
    fi
elif [[ "$OS" = "linux" ]] ; then
    if (( $+commands[grc] )) ; then
        source /etc/grc.zsh
    fi
fi

# Original macOS only script
#if (( $+commands[grc] )) && (( $+commands[brew] ))
#then
#  source `brew --prefix`/etc/grc.zsh
#fi