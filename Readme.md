# PROVChain - Prova de conceito da arquitetura

<b>Procedimentos de instalação</b><p>

Para executar este modelo siga os seguintes passos para instalação local ou VPS Linux:<br>

1 - Entrar na VPS<br>
	ssh \<\<conta\>\>@\<\<ip vps\>\>
	
2 - Instalat o GIT ( sudo apt update && sudo apt install git )

3 - Ir para o diretório /home e entrar em modo root (sudo -su) <br>
  
4 - Baixar do gitHub, em diretório a sua escolha, <br>
  git clone https://github.com/eltoncmarinho/DApp.git <br>
    
5 - Dentro desse diretório vá para Dapp/provchain/apiserver e ajuste o endereço da url ( <<ip vps>> ) em <i>apiserver.js</i> e a porta de acesso ( <<porta>> ).<br>

6 - Suba um nível para se posicionar em <b>DApp/provchain/</b><br>
  
7 - executar os scripts abaixo na seguinte ordem<br>
<ul>
<li> <b>./instalarprerequisitos.sh</b>: somente na primeira execução - como o próprio nome diz, instala os arquivos e softwares necessários para instalação da rede.
<li> <b>./instalarmodulos.sh</b>: somente na primeira execução - instala a base da rede da prova de conceito e os módulos de apoio.
<li> <b>./provchain.sh</b>: inicializa a rede provchain e a coloca disponível para acesso.
</ul>

8 - Acesse no browser a página http://<b>endereco da url em apiserver.js</b><br>
  http://\<\<ip vps\>\>:\<\<porta\>\>


 
