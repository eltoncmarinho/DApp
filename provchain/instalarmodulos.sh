#!/bin/bash

clear 

echo " "
echo ">>>>> Início de Serviço - Instalar Módulos"

pushd /home/DApp/provchain/apiserver
    # npm audit fix --force
    npm init 
    echo " "
    echo ">>> express"
    npm install   express --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> handlebars"
    npm install   handlebars --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> express-handlebars"
    npm install   express-handlebars --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> express-session"
    npm install   express-session --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> jquery"
    npm install   jquery --save 

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> connect-flash"
    npm install   connect-flash --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> ipware"
    npm install   ipware --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> geoip-lite"
    npm install   geoip-lite --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> uuid"
    npm install   uuid --save

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> navigator"
    npm install   navigator --save 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> ip"
    npm install   ip --save 

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> fabric-ca-client"
    npm install   fabric-ca-client --save
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> fabric-network"
    npm install   fabric-network --save

    #npm install -g nodemon

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> @popperjs/core"
    npm install   @popperjs/core --save

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> bootstrap"
    npm install   bootstrap --save
popd 

pushd /home/DApp/provchain/apiserver/public/
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> @popperjs/core"
    npm install   @popperjs/core --save

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo " "
    echo ">>> bootstrap"
    npm install   bootstrap --save
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
popd

apt update 
apt upgrade

echo ">>>>> Fim de Serviço - Instalar Módulos"
