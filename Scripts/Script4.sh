#!/bin/bash

Principal()
{
    clear; echo

    read -p "Digite um caminho de um diretório a partir da raiz: " path
    if [ -d "$path" ]; then
      cd "$path"
      arquivo
      printar
    else
      echo "Não existe!"; sleep 1
      Principal
    fi    
}

arquivo()
{
    read -p "Digite o nome de um arquivo: " arq
    if [ -e "$arq" ]; then
     echo "Existe"
    else
      echo "Não existe"; sleep 2; clear
      arquivo
    fi

    if [ "$arq" != *.txt ]; then
      echo "Não é .txt"; sleep 2; clear
      arquivo
    fi
}

printar()
{
    texto=$(cat "$arq")
    echo "O conteúdo é: $texto"

    for word in $texto; do
      frase="${frase}x${word}x "
    done
    
    echo "$frase"
}

Principal