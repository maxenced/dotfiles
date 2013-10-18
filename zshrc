
# == Default programs
export EDITOR='vim'      # Default text editor
export BROWSER='firefox' # Default web browser

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python pip django command-not-found rails ruby git zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
# Disable autocorrect
unsetopt correct_all




# Customize to your needs...
PATH=$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

if [ -e "$(which ls++)" ]; then
    alias ls=ls++
fi

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


#ubuntu_venvwrapper="/etc/bash_completion.d/virtualenvwrapper"
#if [ -f $ubuntu_venvwrapper ]; then
#    source $ubuntu_venvwrapper
#else
#    virtualenv=$(which virtualenvwrapper.sh)
#    if [ "$virtualenv" != "" ]; then
#        source $virtualenv
#    fi
#fi

# RVM Configuration: Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# Force a reload of completion system if nothing matched; this fixes installing
# a program and then trying to tab-complete its name
_force_rehash() {
    (( CURRENT == 1 )) && rehash
    return 1    # Because we didn't really complete anything
}
# Always use menu completion, and make the colors pretty!
zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''

# Completers to use: rehash, general completion, then various magic stuff and
# spell-checking.  Only allow two errors when correcting
zstyle ':completion:*' completer _force_rehash _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 2

# When looking for matches, first try exact matches, then case-insensiive, then
# partial word completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**'

# Turn on caching, which helps with e.g. apt
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Show titles for completion types and group by type
zstyle ':completion:*:descriptions' format "$fg_bold[black]» %d$reset_color"
zstyle ':completion:*' group-name ''

# Ignore some common useless files
zstyle ':completion:*' ignored-patterns '*?.pyc' '__pycache__'
zstyle ':completion:*:*:rm:*:*' ignored-patterns

bindkey '^i' complete-word              # tab to do menu
bindkey "\e[Z" reverse-menu-complete    # shift-tab to reverse menu

# Up/down arrow.
# I want shared history for ^R, but I don't want another shell's activity to
# mess with up/down.  This does that.
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history
up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history


bindkey "\e0A" up-line-or-local-history
bindkey "\e0B" down-line-or-local-history]

export LC_ALL=fr_FR.UTF-8
source ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh
source ~/.profile

