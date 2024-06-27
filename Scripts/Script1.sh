#!/bin/bash
#faça um script que converta o tempo em minutos e segundos.
clear;echo
read -p "Digite o tempo em segundos: " segundos
minutos=$(($segundos/60))
segundos=$(($segundos%60))
echo -e "tempo em minutos: $minutos min. $segundos secs"
