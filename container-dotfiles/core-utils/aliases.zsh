# file: core-utils/aliases.zsh
# description: Aliases for core UNIX/Linux utilities (cp, rm, mv, ls, grep, etc.)

# Use nocorrect alias to prevent auto correct from "fixing" these
#  (i.e., send nocorrect before alias name if zsh correction mucks about with them)
#
# Example:
# alias foobar='nocorrect foobar'

# Prevent the accidental clobbering of files when upon copy/move/delete
alias cp='cp -i'            # Make cp interactive
alias rm='rm -i'            # Make rm interactive
alias mv='mv -i'            # Make mv interactive

# cd - Directory Navigation
alias ..='cd ..'            # Navigate up one directory
alias ...='cd ../..'        # Navigate up two directories
alias ....='cd ../../..'    # Navigate up three directories
alias bk='cd $OLDPWD'       # Navigate to last directory

# ls - Directory Listing
#   (see colors.zsh for ls color information)
alias la='ls -a'            # List all files
alias lh='ls -d .*'         # List only hidden files/directories only
alias ll='ls -hl'           # Long listing
alias lla='ls -hal'         # Long list all files
alias llh='ls -dl .*'       # Long list hidden files/directories only

# Directory tricks
alias dus='du -sckx * | sort -nr'           # Directories sorted by size
alias filecount='find . -type f | wc -l'    # Number of files (not directories)
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"    # Create a tree listing

# mkdir create paths
alias mkdir='mkdir -p'