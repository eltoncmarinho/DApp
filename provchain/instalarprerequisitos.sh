#!/bin/bash

#https://hyperledger-fabric.readthedocs.io/en/release-2.5/install.html

sudo apt-get install git
echo ">>>>>>>> git version >>>>>>>>>>>>>>>>>>"
git --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

sudo apt-get install curl
echo ">>>>>>>> curl version >>>>>>>>>>>>>>>>>"
curl --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#sudo npm install nvm@latest
sudo apt install nodejs -y
echo ">>>>>>>> nodejs version >>>>>>>>>>>>>>>"
nodejs --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#instalando jq
sudo apt-get install jq
echo ">>>>>>>> jq version >>>>>>>>>>>>>>>>>>>"
jq --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#Removendo docker
dpkg -l | grep -I docker
sudo apt purge docker docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose docker-compose-plugin python3-docker python3-dockerpty wmdocker 
dpkg -l | grep -I docker
sudo rm -rf /var/lib/docker/ /etc/docker/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

sudo apt -y install docker-compose
echo ">>>>>>>> docker-compose version >>>>>>>"
docker-compose --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker root

echo ">>>>>>>> docker version >>>>>>>>>>>>>>>"
docker --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#instalando go
wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
tar -C /usr/local/ -xzf ./go1.21.6.linux-amd64.tar.gz
rm go1.21.6.linux-amd64.tar.gz
echo ">>>>>>>> go version >>>>>>>>>>>>>>>>>>>"
go version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

sudo apt update && sudo apt upgrade && sudo apt autoremove

#Instalando fabric-samples
sudo curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.4.0 1.5.2

echo ">>>>> Ajustando variáveis de ambiente"
export RAIZ=/home/DApp
export GOPATH=/usr/local/go/bin
export PATH=$RAIZ/bin:$PATH:$GOPATH
export FABRIC_CFG_PATH=$RAIZ/config/

sudo apt update && sudo apt upgrade && sudo apt autoremove

echo ">>>>>>>> Verificando pré-requisitos >>>>>>>>>>>>>>>>>>"
git --version
curl --version
nodejs --version
node --version
npm --version
nvm --version
docker --version
docker-compose --version
go version
jq --version
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

echo ">>>>> Fim de Serviço - Instalar Pré-requisitos"