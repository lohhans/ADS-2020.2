#!/bin/bash
# ARMSTRONG LOHÃNS - 20/09/2021

echo "Frequência da obtenção de dados do sistema: 10 segundos"
echo 
echo sample used_memory shared buff/cache disk_kb used_disk disk_perc usr sys iowait soft idle date hour
echo sample used_memory shared buff/cache disk_kb used_disk disk_perc usr sys iowait soft idle date hour > log.txt

cont=1

while [ $cont -le 10 ]
do

memory=`free | grep Mem | awk '{print $3, $5, $6}'`
disk=`df | grep nvme0n1p5 | awk '{print $2, $3, $5}' | cut -d % -f 1`
cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $memory $disk $cpu $date $time 
echo $cont $memory $disk $cpu $date $time >> log.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done
