#!/bin/bash
clear; echo
Principal()
{

senha=""
cont=0

while [ "$senha" != "123456" ]; do
   clear;echo
   read -p "Digite a senha ($cont/5): " -n 6 senha
   historico "$senha" #para o historico

   cont=$((cont + 1))
   if [ "$cont" -eq 5 ]; then
      clear; echo -e "\nMáximo de tentativas atingidas\nTente novamente em 05 segundos"
      sleep 2; tempo; Principal
   fi

   if [ "$senha" != "123456" ]; then
      echo -e "\nSenha incorreta"
      dnv
   fi	 
done

echo -e "\nSenha correta!"; sleep 1.5
menu
}

#===função para colocar a senha novamente===#
dnv()
{
voltar="a"
echo -e "\nAperte ENTER para tentar novamente. ESPAÇO para sair."
IFS= read -n 1 voltar

if [[ "$voltar" == " " ]]; then
  sair
fi

if [[ "$voltar" != "" ]]; then
  clear
  echo -e "\nERRO. Valor inválido!"
  dnv
fi
}

#===função contagem do bloqueio de tentativas===#
tempo()
{
temp=5
clear
while [ "$temp" != 0 ]; do
   echo "$temp"
   sleep 1
   temp=$((temp - 1))
done
clear
}


              #=====[0] função menu geral=====#
menu()
{
opcao=0
clear
echo "===================="
echo "    [MENU GERAl]    "
echo "1. Informações"
echo "2. Dados do sistema"
echo "3. Gerenciar itens"
echo "4. Sair"
echo "===================="

read -p "Digite sua opção: " -n 1 opcao
historico "$opcao"; clear #para o historico

case $opcao in
   1) menu_infos;;
   2) menu_sist;;
   3) menu_arq;;
   4) sair;;
   *) echo -e "ERRO. Opção inválida!\n"; sleep 1; menu;;
esac
}


                   #=====[1] função menu informações=====# 
menu_infos()
{
while true; do
  echo "====================="
  echo "     [INFORMAÇÕES]     "
  echo "0. Voltar"
  echo "1. Data atual"
  echo "2. Informações do usuário"
  echo "3. Histórico"
  echo "4. Sair"

  read -p "Digite sua opção: " -n 1 opcao
  historico "$opcao"; clear #para o historico

  case $opcao in
     0) menu;;
     1) data;;
     2) user;;
     3) echo -e "|Histórico|\n$hist";;
     4) sair;;
     *) echo -e "ERRO. Opção inválida!\n";sleep 1; menu_infos;;
  esac
  tecla
done
}


#===função data===#
data()
{
echo -n "<Data atual>"; echo
date "+%d %B %Y, %A, %H:%I:%m"
}


#===função infos usuário===#
user()
{
user=""; username=""
while [ -z "$username" ]; do #enquanto for vazia, continua no while
  read -p "Digite o nome do usuário: " user
  #só deixa de ficar vazia se esse read der certo       #filtra a linha que começa com o valor do "user"
  IFS=: read -r username _ uid gid coment dirnat shell _ < <(grep "^$user:" /etc/passwd)
        
  if [ -z "$username" ]; then
    echo -e "Usuário não encontrado\n"
    sleep 1
    clear
  fi
done
    
echo "Nome do usuário: $username"; echo "ID do usuário: $uid"; echo "ID do grupo: $gid"
echo "Comentário: $coment"; echo "Diretório nativo: $dirnat"; echo "Shell: $shell" 
}

#===função histórico===#
historico()
{
if [ -z "$hist" ]; then
  hist="\n$1"
else
  hist="$hist\n$1"
fi
}


               #=====[2] função menu dados do sistema=====#
menu_sist()
{
clear
while true; do
  echo "================================"
  echo "       [DADOS DO SISTEMA]       "
  echo "0. Voltar"
  echo "1. Nome da rede do terminal"
  echo "2. Tipo do processador"
  echo "3. Nome do sistema operacional"
  echo "4. Versão do sistema operacional"
  echo "5. Sair"
  echo "================================"

  read -p "Digite sua opção: " -n 1 opcao
  historico "$opcao"; clear #para o historico

  case $opcao in
     0) menu;;
     1) echo -e "<Nome da rede do terminal>\n`uname -m`";;
     2) echo -e "<Tipo do processador\n`uname -n`";;
     3) echo -e "<Nome do S.O.>\n`uname -s`";;
     4) echo -e "<Versão do sistema operacional>\n`uname -r`";;
     5) sair;;
     *) echo -e "ERRO. Opção inválida!\n";sleep 1; menu_sist;;
  esac
  tecla
done
}

                     #=====[3] Função arquivos=====#
menu_arq()
{
clear
while true; do
  echo "================"
  echo "   [ARQUIVOS]   "
  echo "0. Voltar"
  echo "1. Criar itens"
  echo "2. Listar itens"
  echo "3. Excluir itens"
  echo "4. Sair"
  echo "================"

  read -p "Digite sua opção: " -n 1 opcao
  historico "$opcao"; clear #para o historico

  case $opcao in
     0) menu;;
     1) criar;;
     2) listar;;
     3) excluir;;
     4) sair;;
     *) echo -e "ERRO. Opção inválida!\n";sleep 1; menu_sist;;
  esac
  tecla
done
}

#função para criar itens (diretórios, arquivos, links, etc)
criar()
{
  item=""
  echo -e "<Digite o caracter para criar o item correspondente>\nd. Diretório\na. Arquivo vazio\nl. Link"
  read -n 1 item; clear
  if [ "$item" == "d" ]; then
    read -p "Digite o nome do diretório: " item; mkdir "$item"
  elif [ "$item" == "a" ]; then
    read -p "Digite o nome do arquivo: " item; touch "$item" 
  elif [ "$item" == "l" ]; then
    while [ ! -e "$item" ]; do
      read -p "Digite o caminho/para/link_destino e o nome do link em si: " item item2;  ln "$item"  "$item2"
      if [ ! -e "$item" ]; then
        echo "link destino inválido!"; sleep 1; clear
      fi
    done
  else
    echo "Caracter inválido! Digite novamente"; sleep 1; clear; criar
  fi
}

#função para listar itens (diretórios, arquivos, links, etc)
listar()
{
  item=""
  echo -e "<Digite o caracter para listar o item correspondente>\na. Todos os itens\nd. Diretórios\na. Arquivos\nl. Links"
  read -n 1 item; clear
  if [ "$item" == "a" ]; then
    echo "Listando tudo no diretório"; ls -l
  elif [ "$item" == "d" ]; then
    echo "Listando apenas os diretórios"; ls -l | grep "^d"   #filtra as linhas que começam com "d"
  elif [ "$item" == "a" ]; then
    echo "Listando apenas os arquivos"; ls -l | grep "^-"  #filtra as linhas que começam com "-"
  elif [ "$item" == "l" ]; then
    echo "Listando apenas os links"; ls -l | grep "^l"  #filtra as linhas que começam com "l"
  else
    echo "Caracter inválido! Digite novamente"; sleep 1; clear; criar
  fi
}


#função para excluir itens (diretórios, arquivos, links, etc)
excluir()
{
  item=""
  while [ ! -e "$item" ]; do
  echo -e "Digite o nome do item para ser apagado.\n(CUIDADO: O item será apagado sem pedido de confirmação.)"
  read item
    if [ ! -e "$item" ]; then
      echo "Nome inválido!"; sleep 1; clear
    fi
  done
  rm -rf "$item"; echo "Item excluído com êxito!"
}

#====//===#
tecla() 
{
  #bobagem que pede um input do user para voltar p/ o menu dps de fazer oq queria
   echo -e "\n<Pressione qualquer tecla para continuar>"; read -n 1 qualquer_teclar
   clear
}

sair()
{
  clear
  echo -e "\nFechando o script."; sleep 1; clear #bobagem pra ficar bonito
  echo -e "\nFechando o script.."; sleep 1; clear
  echo -e "\nFechando o script..."; sleep 1; clear
  exit
}
Principal


