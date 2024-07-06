#!/bin/bash
clear; echo

Principal()
{
read -p "Digite um diretório válido: " dir

if [ -d $dir ]; then
  cd $dir; contar_qnt
else
  echo "Diretório inválido"; Principal
fi
}

contar_qnt()
{
cont=0
for item in `ls $dir`; do
  cont=$((cont+1))
done

echo "O total de itens dentro do diretório é: $cont"
}

Principal
