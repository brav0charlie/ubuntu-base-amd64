# file: colors.zsh
# description: configure colors for 'ls' and 'grep' (this is muddy due to differences
#              in how macOS and Linux handle it)

autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
	eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
	eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS



##
## Setting LSCOLORS / LS_COLORS
## 

# Main change, you can see directories on a dark background
export CLICOLOR=1

# Set LSCOLORS if host is Mac OS X
if [[ $IS_MAC -eq 1 ]]; then
	export LSCOLORS=exfxcxdxcxegedabagacad
	# Mac way of setting colored ls output (-h makes "human readable file sizes")
	alias ls='ls -Gh'
fi

# Set LS_COLORS and use 'ls --color=auto' if host is Linux
if [[ $IS_LINUX -eq 1 ]]; then
	export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
	# Linux way of setting colored ls output (-h makes "human readable file sizes")
	alias ls='ls -h --color=auto'
fi



##
## Grep configuration
##
alias grep='grep --color=auto'