#!/usr/bin/env bash 

sudo rm /usr/local/bin/cexe
sudo rm /usr/local/bin/matt
sudo rm ~/.tmux.conf
sudo rm ~/.vimrc
sudo rm ~/.bash_dirstack_plus

sudo apt-get remove tmux
sudo -K
echo "remove alias from .bashrc manually" 
echo "remove dirstack_plus from .bashrc manually"
