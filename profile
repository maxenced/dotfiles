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

# If no SSH agent is already running, start one now. Re-use sockets so we never
# have to start more than one session.

#export SSH_AUTH_SOCK=/home/maxence/.ssh-socket

#   # No ssh-agent running
#   rm -rf $SSH_AUTH_SOCK
#   # >| allows output redirection to over-write files if no clobber is set
#   ssh-agent -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
#   source /tmp/.ssh-script
#   echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
ssh-add ~/.ssh/taf/id_rsa &>/dev/null
ssh-add ~/.ssh/id_rsa_claranet &>/dev/null
ssh-add ~/.ssh/id_rsa &>/dev/null
#   rm /tmp/.ssh-script

export PATH=$PATH:$HOME/.vim/bundle/powerline/scripts/
export PASSWORD_STORE_DIR=/home/maxence/repo/password5k
export GNUPGHOME=$PASSWORD_STORE_DIR/g5kadmin_gnupg
alias s="ssh ssh.typhon.net"
#bash /home/maxence/.rvm/scripts/rvm

