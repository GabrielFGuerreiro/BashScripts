#!/bin/bash
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
      echo -e "\nMáximo de tentativas atingidas\nTente novamente em 05 segundos"
      sleep 2
      tempo
      Principal
   fi

   if [ "$senha" != "123456" ]; then
      echo -e "\nSenha incorreta"
      dnv
   fi	 
done

echo -e "\nSenha correta!"; sleep 2
menu
}

#função para colocar a senha novamente
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


#função contagem do bloqueio de tentativas
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


#========== 2º parte ==========#

#===função menu geral===#
menu()
{
opcao=0
clear
echo "===================="
echo "     MENU GERAl     "
echo "1. Informações"
echo "5. Sair"

read -p "Digite sua opção: " -n 1 opcao
historico "$opcao" #para o historico

case $opcao in
   1) clear; menu_infos;;
   5) sair;;
   *) clear; echo -e "ERRO. Opção inválida!\n";sleep 2; menu;;
esac
}


#===função menu 1 para informações===# 
menu_infos()
{
while true; do
  echo "====================="
  echo "     INFORMAÇÕES     "
  echo "0. Voltar"
  echo "1. Data atual"
  echo "3. Histórico"
  echo "5. Sair"

  read -p "Digite sua opção: " -n 1 opcao
  historico "$opcao"; clear #para o historico

  case $opcao in
     0) menu;;
     1) data;;
     3) echo -e "|Histórico|$historico";;
     5) sair;;
     *) echo -e "ERRO. Opção inválida!\n"; menu_infos;;
  esac
done
}


#===função data===#
data()
{
echo -n "Data atual: "
date "+%d %B %Y, %A, %H:%I:%m"
}

#===função histórico===#
historico()
{
if [ -z "$historico" ]; then
  historico="\n$1"
else
  historico="$historico\n$1"
fi
}

#===função pra encerrar o script===#
sair()
{
  clear
  echo -e "\nFechando o script."; sleep 1; clear #bobagem pra ficar bonito
  echo -e "\nFechando o script.."; sleep 1; clear
  echo -e "\nFechando o script..."; sleep 1; clear
  exit
}
Principal


