#!/usr/bin/env sh

setup() {
     apt-get update -y --silent
     apt-get install -y git openssh toilet --silent
}
keys() {
     mkdir -p ~/.termux
     wget https://raw.githubusercontent.com/ElytrA8/style-X-term/main/termux.properties -O ~/.termux/termux.properties
}
start() {
     cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bk
     rm -r $PREFIX/etc/motd
     echo "toilet -F metal -F border -f future style-X-term" >> $PREFIX/etc/bash.bashrc
}

toilet -F metal -F border -f future style-X-term
echo "installing style-X-term...."
setup
keys
start
echo "wanna setup git (y/n)"
read git_setup
if [[ "$git_setup" == "y" ]]; then
	printf "setting up git"
	echo "Enter Username: "
        read username
        git config --global user.name "$username"
        echo "Enter Git Mail: "
        read mail
        git config --global user.email "$mail"
        echo "wanna setup git ssh (y/n)"
        read ssh_setup
        if [[ "$ssh_setup" == "y" ]]; then
               echo "setting up ssh for git"
               echo "don't change name of key in above step"
               ssh-keygen -t ed25519 -C "$mail"
               echo "#############"
               echo "printing key"
               cat ~/.ssh/id_ed25519.pub
               echo "#############"
        else
	printf "git ssh setup skipped"       

else
	printf "git setup skipped"

printf "setup done"
