#!/bin/bash
clear; echo

Principal()
{
read -p "Digite um diretório v�lido: " dir

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
  if [[ "$item" == *.txt ]]; then
    echo -n "A extens�o .txt do item $item foi retirada"
    mv "$item" "${item%.txt}" # % est� tirando o .txt
  fi
done
echo
echo "H� um total de [$cont] itens dentro do diret�rio"
}

Principal
