#!/bin/bash

clear 

echo " "
echo ">>>>> Início de Serviço - Instalar Módulos"

pushd /home/provchain/app/apiserver
    # sudo npm audit fix --force
    sudo npm init 
    echo " "
    echo ">>> express"
    sudo npm install --no-fund  express --save 
    echo " "
    echo ">>> handlebars"
    sudo npm install --no-fund   handlebars --save 
    echo " "
    echo ">>> express-handlebars"
    sudo npm install --no-fund   express-handlebars --save 
    echo " "
    echo ">>> express-session"
    sudo npm install --no-fund   express-session --save 
    echo " "
    echo ">>> jquery"
    sudo npm install --no-fund   jquery --save 

    echo " "
    echo ">>> connect-flash"
    sudo npm install --no-fund   connect-flash --save 
    echo " "
    echo ">>> ipware"
    sudo npm install --no-fund   ipware --save 
    echo " "
    echo ">>> geoip-lite"
    sudo npm install --no-fund   geoip-lite --save 
    echo " "
    echo ">>> uuid"
    sudo npm install --no-fund   uuid --save

    echo " "
    echo ">>> navigator"
    sudo npm install --no-fund   navigator --save 
    echo " "
    echo ">>> ip"
    sudo npm install --no-fund   ip --save 

    echo " "
    echo ">>> fabric-ca-client"
    sudo npm install --no-fund   fabric-ca-client --save
    echo " "
    echo ">>> fabric-network"
    sudo npm install --no-fund   fabric-network --save

    #npm install -g nodemon

    echo " "
    echo ">>> @popperjs/core"
    sudo npm install --no-fund   @popperjs/core --save

    echo " "
    echo ">>> bootstrap"
    sudo npm install --no-fund   bootstrap --save
popd 

pushd /home/provchain/app/apiserver/public/
    echo " "
    echo ">>> @popperjs/core"
    sudo npm install --no-fund   @popperjs/core --save

    echo " "
    echo ">>> bootstrap"
    sudo npm install --no-fund   bootstrap --save
popd

apt update 
apt upgrade

echo ">>>>> Fim de Serviço - Instalar Módulos"
