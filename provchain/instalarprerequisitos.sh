#!/bin/bash

#https://hyperledger-fabric.readthedocs.io/en/release-2.5/install.html
#ssh-keygen -f "/home/elton/.ssh/known_hosts" -R "89.117.33.155"

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
sudo rm -rf /var/lib/docker/ /etc/docker/


#Instalando docker
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
rm go1.21.6.linux-amd64.tar.gz

sudo apt update 
sudo apt upgrade
sudo apt autoremove

#Instalando fabric-samples
sudo curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.4.0 1.5.2

echo ">>>>> Ajustando variáveis de ambiente"
export RAIZ=/home/DApp
export GOPATH=/usr/local/go/bin
export PATH=$RAIZ/bin:$PATH:$GOPATH
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
