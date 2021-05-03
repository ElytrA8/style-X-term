 
#!/usr/bin/env sh

setup() {
     apt-get update -y --silent >> /dev/null
     apt-get install -y git openssh toilet --silent >> /dev/null
}
keys() {
     mkdir -p ~/.termux
     wget https://raw.githubusercontent.com/ElytrA8/style-X-term/main/termux.properties -O ~/.termux/termux.properties >> /dev/null
}
start() {
     cp $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bk
     echo "toilet -F metal -F border -f future style-X-term" >> $PREFIX/etc/bash.bashrc
}

echo "installing style-X-term...."
setup
keys
start
