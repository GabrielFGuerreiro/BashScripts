#!/bin/bash

Principal()
{
    clear; echo
    if [ -z "$1" ] || [ -z "$2" ]; then
      echo "É necessário fornecer dois dados: "; echo
      echo "Primeiro o nome do diretório"; echo
      echo "Depois a extensão, separados por espaço"; echo
    fi

    dir $1
    troca $1 $2
}

dir()
{
    if [ -d "$1" ]; then
      cd "$1"
    else
      echo "Diretório inválido ou não existe"; echo
      exit
    fi
}

troca()
{
    for arquivo in *."$2"; do
      if [ "$arquivo" == *-* ]; then
        novo=$(echo "$arquivo" | tr '-' '_')
        mv "$arquivo" "$novo"
        echo "Mudando $arquivo para $novo"
      fi
    done
}

Principal $1 $2