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
      echo -e "Máximo de tentativas atingidas\nTente novamente em 30 segundos"; cont=$((0))
      sleep 2
      espera
   fi

   if [ "$senha" != "123456" ] && [ $cont -lt 5 ]; then
     # cont=$((cont + 1))
      echo -e "\nSenha incorreta!"
      dnv
   fi	 
done

echo "oiii"
}


dnv()
{
echo -e "\nAperte ENTER para tentar novamente. ESPACO para sair."
read -sn 1 voltar

if [ "$voltar" == " " ]; then
  echo -e "\nFechando o script..." 
  exit
fi

if [ "$voltar" != "" ]; then
  clear
  echo -e "\nERRO. Valor inválido!"
  dnv
fi
}

espera()
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
Principal


