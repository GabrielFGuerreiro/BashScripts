#!/bin/bash
Principal()
{
senha=""
cont=0

while [ "$senha" != "123456" ]; do
   clear;echo
   read -p "Digite a senha ($cont/5): " -n 6 senha
   
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

echo -e "\nSenha correta!"
menu
}


dnv()
{
voltar="a"
echo -e "\nAperte ENTER para tentar novamente. ESPAÇO para sair."
IFS= read -n 1 voltar

if [[ "$voltar" == " " ]]; then
  clear
  echo -e "\nFechando o script."; sleep 1; clear #bobagem pra ficar bonito
  echo -e "\nFechando o script.."; sleep 1; clear
  echo -e "\nFechando o script..."; sleep 1; clear
  exit
fi

if [[ "$voltar" != "" ]]; then
  clear
  echo -e "\nERRO. Valor inválido!"
  dnv
fi
}


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


#=================#

#menu geral
menu()
{
echo "===================="
echo "        MENU        "
echo "1. Informações"


read -p "Digite sua opção" opcao
case $opcao in
   1) menu_infos;;
   *) echo -e "ERRO. Opção inválida!\n"; menu;;
esac
}


#menu 1 para informações 
menu_infos()
{
echo "====================="
echo "     Informações     "
echo "1. Data atual"

read -p "Digite sua opção" opcao
case $opcao in
   1) data;;
   *) echo -e "ERRO. Opção inválida!\n"; menu;;
esac
}

Principal


