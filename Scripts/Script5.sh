#!/bin/bash

Principal()
{
    clear; echo

    while IFS=: read -r username _ uid gid coment dirnat shell _; do
      if [ "$uid" -ge 500 ]; then
        menu; sleep 6; echo
      fi
    done < /etc/passwd
}

menu()
{
    echo "Nome do usuário: $username"
    echo "ID do usuário: $uid"
    echo "ID do grupo: $gid"
    echo "Comentário: $coment"
    echo "Diretório nativo: $dirnat"
    echo "Shell: $shell" 
}

Principal