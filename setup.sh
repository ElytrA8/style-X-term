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
	
else
	printf "git setup skipped"
