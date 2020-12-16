# Shell environment 

## Intoduction 
For install my shell environement you need to run "install_environement.sh"

Tested on : 
* Ubuntu 18.04 
* Ubuntu 20.04 
* Raspberry Pi OS (august 2020)


## What this script do : 
* install cexe "/usr/local/bin/cexe" cexe is a script put on /usr/local/bin, replace exec with an alias from .bashrc, the goal is execute gui software detached and quietly. 
* install bash stackplus, persistent directory stack, for easily go on directories you work on, look at bash commands : pushd, dirs, popd, for see how it's work, alias set pu=pushd d=dirs po=popd 
* install my personal aliases, look at .bashrc for see them and see what they do.
* make or change .vimrc, check the modification.
* install .tmux.conf "check the modification.
* install matt "mate-terminal title set" 

see install.log for check result of installation.

IMPORTANT !! >  don't remove the directory nammed files, this is needed by install_environement.sh (files data from dirstackplus, tmux, vim). 

run remove.sh for remove, bashrc need manually updated at the moment. 

Original dirstack plus on github :
https://github.com/Boruch-Baum/bash_dirstack_plus

