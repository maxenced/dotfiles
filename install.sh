#!/usr/bin/env bash
function link_file {
source="${PWD}/$1"
target="${HOME}/.${1}"

if [ -e "${target}" ]
then
    if [ "_$(readlink ${target})" == "_${source}" ]
    then
        echo "[SKIP] Existing target ${target}, skipping file $1"
        return
    else
        backup=$target.backup$(date +%s)
        echo "[BCKP] Saving backup of exising file ${target} as ${backup}"
        mv $target $backup
    fi
fi
echo "[ OK ] Creating link to ${source}"
ln -sf ${source} ${target}
}

sudo apt-get install git vim zsh curl python-pip htop rxvt-unicode
link_file vim
link_file vimrc
link_file profile
link_file bashrc
link_file zshrc
link_file screenrc
link_file pylintrc
link_file gitconfig
link_file gitignore_global
link_file hgrc
link_file ackrc
link_file tmux.conf
link_file Xdefaults

if [ ! -e "$HOME/.oh-my-zsh" ]
then
    echo "[INST] Installing oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash -x
else
    echo "[SKIP] oh-my-zsh is already installed"
fi

if [ ! -d "$HOME/.vim/bundle/vundle" ];then
    echo "[INST] Installing vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
    echo "[SKIP] vundle already installed"
fi

if [ ! -d "$HOME/.gdb" ];then
    echo "[INST] Installing gdbinit"
    git clone https://github.com/gdbinit/Gdbinit.git ~/.gdb
else
    echo "[SKIP] gdbinit already installed"
fi

ln -sf ~/.gdb/gdbinit ~/.gdbinit

echo "[INST] Installing vim plugins"
vim +PluginInstall +qall

mkdir -p ~/.config/terminator
if [ ! -e ~/.config/terminator/config ]; then
    ln -s $(pwd)/terminator/config ~/.config/terminator/config
fi
