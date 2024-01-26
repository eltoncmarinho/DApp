#!/bin/bash

#https://hyperledger-fabric.readthedocs.io/en/release-2.5/install.html
#ssh-keygen -f "/home/elton/.ssh/known_hosts" -R "89.117.33.155"


sudo rm -rf fabric-samples
sudo rm go1.21.6.linux-amd64.tar.gz
sudo apt purge nodejs 
sudo apt purge node
sudo apt purge nvm
sudo apt purge npm
sudo apt purge jq

sudo apt-get install git
sudo apt-get install curl

#sudo npm install nvm@latest
sudo apt install nodejs -y

#instalando jq
sudo apt-get install jq

#Removendo docker
dpkg -l | grep -I docker
sudo apt purge docker docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose docker-compose-plugin python3-docker python3-dockerpty wmdocker 
dpkg -l | grep -I docker
#sudo apt purge <cada item da lista acima>
# docker images
# docker rmi -f $(docker images -q)
# docker ps -a
# docker rm $(docker ps -aq)
# docker volume ls
# docker volume prune 
# #docker volume rm <volume-name>
# docker network ls
# docker network prune
# sudo apt-get purge -y docker.io
sudo rm -rf /var/lib/docker/ /etc/docker/

sudo groupdel docker
#sudo rm -rf /var/lib/docker.sock
sudo apt update && sudo apt upgrade && sudo apt autoremove



#Instalando docker
sudo groups
sudo groupadd docker
sudo usermod -a -G docker root
sudo groups root

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt -y install docker-compose
sudo apt -y install docker
sudo apt install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker root


#instalando go
wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
tar -C /usr/local/ -xzf ./go1.21.6.linux-amd64.tar.gz
#Colocar o comando abaixo no arquivo /et/profile
export GOPATH=/usr/local/go/bin
export PATH=$PATH:$GOPATH

sudo apt update 
sudo apt upgrade
sudo apt autoremove

#Instalando fabric-samples
# sudo curl -sSLO https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh && chmod +x install-fabric.sh
# sudo ./install-fabric.sh docker samples binary
# sudo curl -sSL https://bit.ly/2ysbOFE | bash -s
sudo curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.4.0 1.5.2
# sudo curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.14 1.5.7



echo ">>>>> Ajustando variáveis de ambiente"
export RAIZ=/home/dapp/
# export GOPATH=$(which go)   
export PATH=$PATH:$GOPATH
export PATH=$RAIZ/bin:$PATH
export FABRIC_CFG_PATH=$RAIZ/config/

sudo apt update && sudo apt upgrade

clear
echo ">>>>>>>> Verificando pré-requisitos >>>>>>>>>>>>>>>>>>"
echo ">> git --version" && git --version
echo ">> curl --version" && curl --version
echo ">> nodejs --version" && nodejs --version
echo ">> node --version" && node --version
echo ">> npm --version" && npm --version
echo ">> nvm --version" && nvm --version
echo ">> docker --version: " && docker --version
echo ">> docker-compose --version: " && docker-compose --version
echo ">> go version" && go version
echo ">> jq --version" && jq --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

echo ">>>>> Fim de Serviço - Instalar Pré-requisitos"
