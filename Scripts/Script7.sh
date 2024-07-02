#!/bin/bash

Principal()
{
    clear; echo
    if [ $# -ne 1 ]; then
      echo "ERRO: DIGITE APENAS UM ARGUMENTO!"
      echo "Execute novamente fornecendo o caminho"
      echo -e "Exemplo: ./exemplo.sh /home/diretorio\nSaindo..."; exit
    fi

    if [[ -d $1 ]]; then
      cd $1
      menu
    else
      echo -e "Diretório não existe!\nSaindo..."; exit
    fi
}

menu()
{
    echo "Menu"
    echo "1. Listagem completa"
    echo "2. Listagem somente dos diretórios"
    echo "3. Listagem somente dos arquivos"
    echo "4. Listagem somente dos links"
    echo "5. Sair"
    read -p "Digite a opção: " op; echo

    case $op in
      1) completa;;
      2) dir;;
      3) arq;;
      4) link;;
      5) echo "Saindo..."; sleep 2; clear; exit;;
      *) erro;
    esac
}

completa()
{
    clear; echo "Listando tudo no diretório"
    ls -l; sleep 4; clear; menu
}

dir()
{
    clear; echo "Listando apenas os diretórios"
    ls -l | grep "^d"; sleep 4; clear; menu
}

arq()
{
    clear; echo "Listando apenas os arquivos"
    ls -l | grep "^-"; sleep 4; clear; menu
}

link()
{
    clear; echo "Listando apenas os links"
    ls -l | grep "^l"; sleep 4; clear; menu
}

erro()
{
    echo "Valor inválido"; sleep 2; clear; menu
}

Principal $1