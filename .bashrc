# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
export ECHANGELOG_USER="Vladimir Berezhnoy <non7top@gmail.com>"
export PATH=~/bin:$PATH
export HISTIGNORE="&:ls:[bf]g:exit: cd \"\`*: PROMPT_COMMAND=?*?"

# Default prompt, borrowed from gentoo

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi


[ -f ~/.aliases ] && source ~/.aliases # Source the aliases
[ -f ~/.functions ] && source ~/.functions # Source the functions
[ -f ~/.bash_prompt ] && source ~/.bash_prompt # Source the prompt
