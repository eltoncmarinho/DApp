#!/bin/bash

clear 

echo " "
echo ">>>>> Início de Serviço - Instalar Módulos"

pushd /home/DApp/provchain/apiserver
    # sudo npm audit fix --force
    sudo npm init 
    echo " "
    echo ">>> express"
    sudo npm install   express --save 
    echo " "
    echo ">>> handlebars"
    sudo npm install   handlebars --save 
    echo " "
    echo ">>> express-handlebars"
    sudo npm install   express-handlebars --save 
    echo " "
    echo ">>> express-session"
    sudo npm install   express-session --save 
    echo " "
    echo ">>> jquery"
    sudo npm install   jquery --save 

    echo " "
    echo ">>> connect-flash"
    sudo npm install   connect-flash --save 
    echo " "
    echo ">>> ipware"
    sudo npm install   ipware --save 
    echo " "
    echo ">>> geoip-lite"
    sudo npm install   geoip-lite --save 
    echo " "
    echo ">>> uuid"
    sudo npm install   uuid --save

    echo " "
    echo ">>> navigator"
    sudo npm install   navigator --save 
    echo " "
    echo ">>> ip"
    sudo npm install   ip --save 

    echo " "
    echo ">>> fabric-ca-client"
    sudo npm install   fabric-ca-client --save
    echo " "
    echo ">>> fabric-network"
    sudo npm install   fabric-network --save

    #npm install -g nodemon

    echo " "
    echo ">>> @popperjs/core"
    sudo npm install   @popperjs/core --save

    echo " "
    echo ">>> bootstrap"
    sudo npm install   bootstrap --save
popd 

pushd /home/DApp/provchain/apiserver/public/
    echo " "
    echo ">>> @popperjs/core"
    sudo npm install   @popperjs/core --save

    echo " "
    echo ">>> bootstrap"
    sudo npm install   bootstrap --save
popd

apt update 
apt upgrade

echo ">>>>> Fim de Serviço - Instalar Módulos"
