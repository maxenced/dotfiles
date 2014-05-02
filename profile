# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

TZ='Europe/Paris'; export TZ

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export HISTSIZE=30000


export PATH=$PATH:$HOME/.vim/bundle/powerline/scripts/
export PASSWORD_STORE_DIR=/home/maxence/repo/password5k
alias s="ssh ssh.typhon.net"
#alias p="pwgen 12 1"
#bash /home/maxence/.rvm/scripts/rvm

if [ -n "$GNOME_KEYRING_PID" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
    export GNOME_KEYRING_CONTROL
    export GPG_AGENT_INFO
fi

alias tmux="tmux -2"
