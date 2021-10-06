#!/bin/bash
# ARMSTRONG LOHÃNS - 20/09/2021

echo "Frequência da obtenção de dados de CPU do sistema: 10 segundos"
echo 
echo sample usr sys iowait soft idle date hour
echo sample usr sys iowait soft idle date hour > log.txt

cont=1

while [ $cont -le 10 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> log.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done
