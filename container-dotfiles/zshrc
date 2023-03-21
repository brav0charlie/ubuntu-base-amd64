# file: .zshrc
# description: .zshrc: .dotfiles loader
#              (inspired by: https://github.com/holman/dotfiles/blob/master/zsh/zshrc.symlink)

# Detect OS (used in various functions. Uses export so can be used
#   in other sub-scripts. Should this move to .zshenv?)
UNAME=$(uname -s)
if [[ "$UNAME" = "Linux" ]] ; then
	export OS=linux
elif [[ "$UNAME" = "Darwin" ]] ; then
	export OS=macos
fi

# Path to .dotfiles repository
export ZSH=$HOME/.dotfiles

# If $HOME/.zsh doesn't exist, create it
if [[ ! -d "$HOME/.zsh" ]] ; then
    mkdir -p $HOME/.zsh
fi

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh-theme files
typeset -U theme_files
theme_files=($ZSH/zsh-theme/*.zsh-theme)

# load the theme files
for file in ${theme_files}
do
  source $file
done

# Clean up
unset theme_files

# all of our zsh files
typeset -U config_files
config_files=($ZSH/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path, completion, and ssh-agent files
for file in ${${${config_files:#*/path.zsh}:#*/completion.zsh}:#*/ssh-agent.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
# if we remove these, remember to uncomment the lines in completion.zsh
autoload -U compinit
if [[ ! -d "$HOME/.cache/zsh" ]] ; then
    mkdir -p $HOME/.cache/zsh
fi
compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

# Clean up
unset config_files

# Enable iTerm2 Shell Integration if on macOS
if [[ $OS = 'macos' ]] ; then
  source $ZSH/macos/iterm2_shell_integration.zsh
fi

# Load ssh configuration last so 'exit' alias takes precedence
# *DISABLED FOR NOW*: This conflicts with/is superceded by 
# "ForwardAgent Yes" in .ssh/config
#source $ZSH/ssh/ssh-agent.zsh

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
# upstream commit: a89a9dcd6a386a50857ed2b3fe7fc835c00b8076
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down