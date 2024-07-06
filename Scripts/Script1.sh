#!/bin/bash
clear;echo
read -p "Digite o tempo em segundos: " segundos
minutos=$(($segundos/60))
segundos=$(($segundos%60))
echo -e "tempo em minutos: $minutos min. $segundos secs"
