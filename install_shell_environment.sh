#!/usr/bin/env bash 
# egrep -o "-qo" for quiet things
# learn egrp "-q" mean quiet, for see dollar from grep //$ check dollar '[$1]̈́' check dollar1  

## TO DO NEXT remove script with removing or backup bash "remove text is the better option". 

# !script start here!

## FUNCTIONS

installcexe ()
{
echo ""
echo "cexe is not installed, do you want install it ? (quiet and detached exec from shell)" 
read -p "[ 1=yes/2=no ] :  " ask
if [[ $ask -eq "1" ]] 
then 
echo ""
touch cexe
echo "exec \$1 \$2 >/dev/null &" >cexe
chmod 755 cexe
sudo mv cexe /usr/local/bin
echo "cexe is installed." >>install.log
else 
echo ""
echo "!! cexe is on /usr/local/bin." >>install.log
fi
}



dirstack ()
{
echo ""
echo "persistente dirstack is not installed, do you want install it ?" 
read -p "[ 1=yes/2=no ] :  " ask2
if [[ $ask2 -eq "1" ]]
then 
echo ""
cp files/bash_dirstack_plus ~/.bash_dirstack_plus  ## final add to ~/
echo "" >>~/.bashrc
echo "" >>~/.bashrc
echo "# bash persistent directory stack" >>~/.bashrc
echo "export PUSHD_SILENT=1" >>~/.bashrc
echo "source ~/.bash_dirstack_plus" >>~/.bashrc
echo "" >>~/.bashrc
echo "" >>~/.bashrc
echo "persistent directory stack is installed." >>install.log
else 
echo ""
echo "persistent directory stack is present on home directory." >>install.log
fi 
}


tmuxinstall ()
{
echo ""
echo "tmux is not installed, I will install it !"
echo ""
echo ""
sudo apt install tmux
echo ""
echo "tmux is installed." >>install.log
} 




##  SCRIPT REALLY LAUNCH AT THIS POINT  

echo "Password=sudo, sudo access is removed at end of script."
touch install.log

## install cexe "exec with prompt back and error message from stdoutput go on /dev/null. 
echo ""
ls /usr/local/bin/ | grep -qo cexe && echo "cexe is already installed." >>install.log || installcexe

# install dirstack_plus bash dirstack with persistent mode, not removed when you log out from terminal. 
echo ""
ls -a ~/ | grep -qo ".bash_dirstack_plus" && echo "persistent dirstackplus is already installed." >>install.log || dirstack ## !!! BUG !!! ici en ligne de commande parfait, mais pas en script 

echo ""
echo ""
echo "I will check if tmux is installed"
sleep 2 

# check if tmux is installed, install if not or tell if installed. 
apt list --installed | egrep -qo tmux && echo "tmux is already installed." >>install.log || tmuxinstall

# update or create .tmux.conf. 
echo ""
echo "create or update user .tmux.conf" 
cat files/tmux.conf >>~/.tmux.conf  
echo ""
echo "The file .tmux.conf from user directory, been created or updated see comments \"delete if needed."\" >>install.log

# update or create .vimrc. 
echo ""
echo "create or update user .vimrc" 
cat files/vimrc >>~/.vimrc  
echo ""
echo "The file .vimrc from user directory, been created or updated see comments \"delete if needed."\" >>install.log

# check and make alias 
echo "" >>~/.bashrc
echo "" >>~/.bashrc
echo ""
echo "alias installation"
egrep -qo "# personal alias" 	~/.bashrc && echo "alias comment already set" >>install.log || echo "# personal alias" >>~/.bashrc
egrep -qo "hi\=history"		~/.bashrc && echo "alias hi=history already set" >>install.log || echo "alias hi=history" >>~/.bashrc
egrep -qo "h=\"history 20\""   	~/.bashrc && echo "alias h=history already set" >>install.log || echo "alias h=\"history 20\""  >>~/.bashrc
egrep -qo "hig=\"history" 	~/.bashrc && echo "alias hig=history already set" >>install.log || echo "alias hig=\"history | grep \$1\"" >>~/.bashrc
egrep -qo "lh=\"ls -lh\""         ~/.bashrc && echo "alias lh=ls  already set" >>install.log || echo "alias lh=\"ls -lh\"" >>~/.bashrc
egrep -qo "d=dirs"	  	~/.bashrc && echo "alias d=dirs already set" >>install.log || echo "alias d=dirs" >>~/.bashrc
egrep -qo "j=jobs"	  	~/.bashrc && echo "alias j=jobs already set" >>install.log || echo "alias j=jobs" >>~/.bashrc
egrep -qo "more\=\"less \-X \-m\"" ~/.bashrc && echo "alias less for mor already set" >>install.log || echo "alias more=\"less -X -m\"" >>~/.bashrc
egrep -qo "calc\=\"bc \-l\""     ~/.bashrc && echo "alias bc for clac already set" >>install.log || echo "alias calc=\"bc -l\"" >>~/.bashrc
egrep -qo "\-x nano"	  	~/.bashrc && echo "alias mnano already set" >>install.log || echo "alias mnano=\"mate-terminal --zoom=1.2 --full-screen --hide-menubar -x nano \$1\"" >>~/.bashrc
egrep -qo "\-x vi"        	~/.bashrc && echo "alias mvim already set" >>install.log || echo "alias mvim=\"mate-terminal --zoom=1.2 --full-screen --hide-menubar -x vi \$1\"" >>~/.bashrc
egrep -qo "w3mnc\=\"w3m \-no\-cookie" ~/.bashrc && echo "alias w3mnc already set" >>install.log || echo "alias w3mnc=\"w3m -no-cookie \$1\"" >>~/.bashrc
egrep -qo "firefoxp\=\"firefox \--private-window \\$" ~/.bashrc && echo "alias firefoxp already set" >>install.log || echo "alias firefoxp=\"exec firefox --private-window \$1\"" >>~/.bashrc
egrep -qo "say\=spd\-say"        ~/.bashrc && echo "alias say is spd-say already set" >>install.log || echo "alias say=spd-say" >>~/.bashrc
egrep -qo "cajan\=\"caja \--no-desktop >>\/dev\/null \&\"" ~/.bashrc && echo "alias cajan already set" >>install.log || echo "alias cajan=\"caja --no-desktop >>/dev/null &\"" >>~/.bashrc 
egrep -qo "deroff\=\"groff \-man \-Tascii \\$" ~/.bashrc && echo "alias deroff already set" >>install.log || echo "alias deroff=\"groff -man -Tascii \$1\"" >>~/.bashrc
egrep -qo "sendmail\=\"caja-sendto \\$" ~/.bashrc && echo "alias sendmail already set" >>install.log || echo "alias sendmail=\"caja-sendto \$1\""  >>~/.bashrc
egrep -qo "exec\=cexe"	  	~/.bashrc && echo "alias exec is cexe already set" >>install.log || echo "alias exec=cexe" >>~/.bashrc

# make space 
echo "" >>~/.bashrc
echo "" >>~/.bashrc

# make stdoutput last space
# give information about alias. 
sudo -K # remove sudo right

echo "see also .bashrc modification \"# bash persistent directory stack\" and \"# personal alias\"" >>install.log
echo ""
echo "read install.log file, then delete or keep and change name."
echo ""
echo "sudo right if given, is now removed"
echo ""
