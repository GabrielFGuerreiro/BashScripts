#!/bin/bash
clear; echo

Principal()
{
read -p "Digite um diret�rio v�lido: " dir

if [ -d $dir ]; then
  cd $dir; contar_qnt
else
  echo "Diret�rio inv�lido"; Principal
fi
}

contar_qnt()
{
cont=0
for item in `ls $dir`; do
  cont=$((cont+1))
done

echo "O total de itens dentro do diret�rio �: $cont"
}

Principal
