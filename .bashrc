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
[ -f /usr/local/bin/cgrouprc ] && source /usr/local/bin/cgrouprc
#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

# Prompt for debugging
#export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
export 'PS4=-[${BASH_SOURCE}] : ${LINENO} : ${FUNCNAME[0]:+${FUNCNAME[0]}() > }'

parse_git_branch() {
      :
      #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  }
   
#PS1='\[\033[01;37m\]\w\[\033[00;35m\]$(parse_git_branch)\[\033[00m\] \$ '
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[00;35m\]$(parse_git_branch)\[\033[00m\] \[\033[01;34m\]\$\[\033[00m\] '

if [ -d "/mnt/large/overlays/arcon-hg" ]; then
    export a="/mnt/large/overlays/arcon-hg"
elif [ -d "/mnt/storage/user/arcon" ]; then
    export a="/mnt/storage/user/arcon"
fi

alias mc='mc -a --skin=darkfar'
alias digt='dig +trace +nodnssec'
alias digg='dig @8.8.8.8'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#!/usr/bin/env bash

# via @paul_irish | fixed by @vigobronx
function server() {
    if [[ $1 == "-h" || $1 == "--help" ]]; then
        echo "usage:"
        echo -e "\tserver PORT"
        echo -e "\tserver # default port is 8000"
        echo
        echo "-h, --help: help"
        echo
        return 0
    fi
    local port="${1:-8000}"
    # open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
    python -c $'import SimpleHTTPServer;\n
                map = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\n
                map[""] = "text/plain";\n
                for key, value in map.items():\n\t
                map[key] = value + ";charset=UTF-8";\n
                SimpleHTTPServer.test();' "$port"
}
_server()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="8000 -h --help"

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}
complete -F _server server
