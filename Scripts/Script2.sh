#!/bin/bash
#Faça um script que promova a autenticação no ambiente Linux
clear; echo

echo "Identificação do usuário LINUX";  echo
echo "O usuário tem 10 segundos para informar o seu nome"
read -p "Usuário: " -t 10 nome; echo
read -sp "Digite sua senha: " senha; echo; echo #s não mostra input 
read -p "Digite o código de segurança com até 5 dígitos: " -n 5 codigo #n lê exatamente N caracteres
echo; echo
echo "-----------------------"
echo "CONFIRMAÇÃO DOS DADOS"; echo
echo -e "Nome: $nome \nSenha: $senha \nCod.Seg: $codigo"; echo
echo "-----------------------"