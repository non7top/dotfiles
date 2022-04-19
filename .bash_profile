# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export HISTSIZE=999999
export HISTFILESIZE=999999

PATH=$HOME/.local/bin:$HOME/bin:$PATH:$HOME/.bin

export PATH
export PATH="$HOME/.tfenv/bin:$PATH"

script /dev/null
