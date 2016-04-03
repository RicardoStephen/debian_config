# Miscellaneous shortcuts
alias md="mkdir"
alias m="less"
alias g="git"
alias du="du -ch --max-depth=1"
alias treeacl="tree -A -C -L 2"
alias stat="stat -x"

# Trash system
t() { mv "$@" ~/.trash/; }

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Listing
alias l="ls -l --color=auto"
alias ls="ls --color=auto"
alias ll="ls -alhH --color=auto"
alias lsd="ls -l --color=auto | grep --color=never '^d'"

# Safety
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Editor
alias e='emacs'
alias em='emacs -nw'
alias eqq='emacs -nw -Q'
export EDITOR='emacs -nw'
export VISUAL='emacs -nw'

# Always enable colored `grep` output
alias grep='grep --line-number --color=auto'
alias fgrep='fgrep --line-number --color=auto'
alias egrep='egrep --line-number --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'