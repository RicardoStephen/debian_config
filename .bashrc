# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case $TERM in
    xtem-color|*-256color) color_prompt=yes;;
esac

# Set umask
# Test if currently local or server:
if [ "`id -gn`" == "`id -un`" -a `id -u` -gt 99 ]; then
		# local machine
		umask 002
else
		# server
		umask 022
fi

# Bash prompt and bash eternal history
if [ "$PS1" ]; then
		# Bash prompt
    if [ -x /usr/bin/tput ]; then
				if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
						stty erase `tput kbs`
				elif [ -x /usr/bin/wc ]; then
						if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
								stty erase `tput kbs`
						fi
				fi
    fi
    case $TERM in
				xterm*)
						if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
								PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
						else
	    					PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
						fi
						;;
				screen)
						if [ -e /etc/sysconfig/bash-prompt-screen ]; then
								PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
						else
								PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
						fi
						;;
				*)
						[ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
						;;
    esac

    # Bash eternal history
    # http://www.debian-administration.org/articles/543.
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'
    # Turn on checkwinsize
    shopt -s checkwinsize
    #Prompt edited from default
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u \w]\\$ "
    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
						if [ -r "$i" ]; then
								. $i
						fi
				done
    fi
fi

# Append to history
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
shopt -s histappend

# Enable globbing
shopt -s extglob

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Make prompt informative
# http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1="\[\e[36m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\] \[\e[35m\]\w\[\e[m\] "

# Setup color settings Generate colors in 
# http://geoff.greer.fm/lscolors/
export LS_COLORS="di=1;35;40:ln=36;40:so=32;40:pi=33;40:ex=1;31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# Ensures cross-platform sorting behavior of GNU sort. 
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX

# Bash aliases
if [ -f ~/.bash_aliases ]; then
	  source ~/.bash_aliases
fi
