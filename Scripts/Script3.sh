#!/bin/bash

Principal()
{
    clear; echo
    while [ -z "$dnv" ] && [ "$senha" != "123" ]; do #dnv e senha por padrão são vazias (!123)
      read -p "Digite a senha: " senha
      if [ "$senha" != "123" ]; then
        echo -e "\nSenha incorreta\nAperte ENTER para tentar novamente"; read -n 1 dnv
        sleep 1; clear
      else
        echo -e "\nSenha correta!"
        sleep 1; clear; menu
      fi
    done

    #Só sai do while se -n "$dnv" + exit no "menu" = não precisa de if pro dnv
    #Encerrar o programa quando "$dnv" não for ENTER
    echo -e "\nERRO. Finalizando script..."; sleep 1; clear
}


menu()
{
    while true; do 
      echo "        MENU        "
      echo "--------------------------"
      echo "1- Identificar usuário"
      echo "2- Criar um usuário"
      echo "3- Apagar usuário"
      echo "4- Sair"
      echo "--------------------------"
      
      read -p "Escolha uma opção: " menu

      clear
      case $menu in 
        1) identificar;;
        2) criar;;
        3) apagar;;
        4) sair;;
        *) echo -e "ERRO\n"; menu;;
      esac
    done
}

identificar()
{
    existe_user
    if [ $existe -eq 1 ]; then
      echo -e "\nUsuário cadastrado!\n\nInformações: "; id $user; echo
    else
      echo -e "\nUsuário não cadastrado"; echo
    fi
}

criar()
{
    existe_user
    if [ $existe -eq 1 ]; then
      echo -e "\nUsuário cadastrado!\n"
    else
      echo -e "\nUsuário não cadastrado!\n\nCadastrando usuário"
      read -p "Nome: " nome; adduser $nome; passwd $nome
      echo -e "\nUsuário cadastrado com sucesso!\n"
    fi
}

apagar()
{
    existe_user
    if [ $existe -eq 1 ]; then
      echo -e "\nUsuário cadastrado!\n\nApagando usuário"
      read -p "Nome: " nome; userdel $nome; rm -rf $nome
      echo -e "\nUsuário apagado com sucesso!\n"
    else
      echo -e "\nUsuário não cadastrado!\n"
    fi
}

existe_user()
{
    existe=0
    read -p "Digite o usuário: " user
    if id "$user" &>/dev/null; then
      existe=1
    fi
}

sair()
{
    read -p "Deseja sair? (S/N) " adeus
    if [ "$adeus" = "S" ] || [ "$adeus" = "s" ]; then
      echo "Finalizando o programa..."; sleep 2; clear
      exit
    elif [ "$adeus" = "N" ] || [ "$adeus" = "n" ]; then
      echo; menu
    else
      echo "Valor inválido"; echo; sair
    fi
}

Principal 

