#!/bin/bash

Principal()
{
clear; echo 
while true; do
  cont=$(( $cont + 1 ))
#  echo "Soma: $soma"
 # echo "M�dia: $((soma / (--cont ))"    
  read -p "Digite o [$cont�] n�mero de 1 a 100 (-1 para encerrar): " num  
  if [ $num -eq -1 ]; then
    break
  elif [ $num -lt 1 ] || [ $num -gt 100 ]; then
    echo "Valor inv�lido! Digite um n�mero de 1 a 100"
    cont=$(( $cont - 1 )) #arrumar o $cont do read
    sleep 3; Principal
  else
    soma=$[ $soma + $num ]; clear
    echo "�ltimo num: $num"
    echo "Quantidade de nums: $cont"
    echo "Soma: $soma"
    echo "M�dia:$soma/$cont=$((soma / $cont))"; echo
  fi
done
}
Principal
