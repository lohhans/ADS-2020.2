#!/bin/bash
# ARMSTRONG LOHÃNS - 20/09/2021

echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Extração de dados: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > sysbench_log.txt

# Testes de estresse para 5min:
sysbench --threads=8 --time=300 --test=cpu run &
# stress-ng --cpu 8 --timeout 300s --metrics

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> sysbench_log.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done



# 2º BENCHMARK
echo
echo
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Extração de dados: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > stress-ng_log.txt

# Testes de estresse para 5min:
# sysbench --threads=8 --time=300 --test=cpu run
stress-ng --cpu 8 --timeout 300s --metrics &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> stress-ng_log.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done
