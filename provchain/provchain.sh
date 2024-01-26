#!/bin/bash

clear 

echo ">>>>> Início de Serviço - Criar canal e instalar nele o Contrato Inteligente"

export MSYS_NO_PATHCONV=1

set -e
starttime=$(date +%s)

# Remover as identidades das carteiras
rm -rf apiserver/wallet/*

#echo "Liberando porta"
if lsof -t -i:8080; then
    kill -9 $(lsof -t -i:8080)
    echo ">> Porta 8080 liberada"    
else 
    if lsof -t -i:80; then
        kill -9 $(lsof -t -i:80)
        echo ">> Porta 80 liberada"    
    fi    
fi  

#sudo $RAIZ/provchain/fabric-samples/test-network/network.sh prereq


export RAIZ=/home/dapp
echo " "
echo ">>>>>  Remover bloco genesis caso exista"
if $RAIZ/provchain/fabric-samples/test-network/mychannel.block; then 
    pushd $RAIZ/provchain/fabric-samples/test-network/channel-artifacts/
        sudo rm mychannel.block
    popd    
fi   

echo " "
echo ">>>>>  Remover package da chaincode caso exista"
if $RAIZ/provchain/fabric-samples/test-network/provchain.tar.gz; then 
    pushd $RAIZ/provchain/fabric-samples/test-network/
        sudo rm provchain.tar.gz
    popd
fi

echo " "
echo ">>>>>  Iniciar Rede e Blockchain"
echo ">>>>>  lançamento da rede; criação de um canal e junção do nó ao canal"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Tira a rede do ar, se estiver no ar..."
$RAIZ/provchain/fabric-samples/test-network/network.sh down
echo " "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Cria o canal com banco de estado CouchDB"
$RAIZ/provchain/fabric-samples/test-network/network.sh up createChannel -ca -s couchdb
echo " "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Instala a chaincode em todos os nós do canal mychannel. Aqui é o foco da PROVChain" 
export RAIZ=/home/dapp
CC_SRC_LANGUAGE=${1:-"javascript"}
CC_SRC_LANGUAGE=`echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:]`
CC_SRC_PATH="/home/dapp/chaincode/provchain/javascript/lib/"
$RAIZ/provchain/fabric-samples/test-network/network.sh deployCC -ccn provchain -ccl ${CC_SRC_LANGUAGE} -ccv 1 -ccs auto -ccp ${CC_SRC_PATH} -cci inicializarLivroRazao  -r -d -verbose


export RAIZ=/home/provchain
echo " "
echo ">>>>> Habilitar usuarios "
pushd $RAIZ/provchain/apiserver
    node enrollAdmin.js
    node registerUser.js
popd

echo " "
echo ">>>>> Subir aplicativo"
pushd $RAIZ/provchain/apiserver
    #node apiserver.js 
    nohup node apiserver.js &
popd     

cat <<EOF
=====================================================================

Total setup execution time : $(($(date +%s) - starttime)) secs ...

=====================================================================

echo ">>>>> Fim de Serviço - Criar canal e instalar nele o Contrato Inteligente"
EOF
