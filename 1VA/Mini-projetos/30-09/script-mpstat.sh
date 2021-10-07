#!/bin/bash
# ARMSTRONG LOHÃNS - 07/10/2021

# 1º BENCHMARK
echo " -- Sysbench Benchmark -- "

# 1 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Primeira extração de dados do Sysbench: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > sysbench_log1.txt

# Testes de estresse para 5min:
sysbench --threads=8 --time=300 --test=cpu run &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> sysbench_log1.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done

# 2 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Segunda extração de dados do Sysbench: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > sysbench_log2.txt

# Testes de estresse para 5min:
sysbench --threads=8 --time=300 --test=cpu run &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> sysbench_log2.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done

# 3 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Terceira extração de dados do Sysbench: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > sysbench_log3.txt

# Testes de estresse para 5min:
sysbench --threads=8 --time=300 --test=cpu run &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> sysbench_log3.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done


# INTERVALO DE 5 MINUTOS PARA O PRÓXIMO BENCHMARK SER INICIADO
echo "Próximo Benchmark (stress-ng) iniciará em 5 minutos, aguarde."
sleep 300


# 2º BENCHMARK
echo
echo
echo " -- Stress-ng Benchmark -- "

# 1 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Primeira extração de dados do Stress-ng: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > stress-ng_log1.txt

# Testes de estresse para 5min:
stress-ng --cpu 8 --timeout 300s --metrics &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> stress-ng_log1.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done

# 2 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Segunda extração de dados do Stress-ng: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > stress-ng_log2.txt

# Testes de estresse para 5min:
stress-ng --cpu 8 --timeout 300s --metrics &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> stress-ng_log2.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done

# 3 - sysbench
echo "MPSTAT - Obtenção de dados de Benchmarks de CPU"
echo "Terceira extração de dados do Stress-ng: de 10 em 10 segundos dentro de 5 minutos"

echo 
echo sample usr sys iowait soft steal idle date hour
echo sample usr sys iowait soft steal idle date hour > stress-ng_log3.txt

# Testes de estresse para 5min:
stress-ng --cpu 8 --timeout 300s --metrics &

cont=1

while [ $cont -le 30 ]
do

cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`

date=$(date +"%d-%m-%Y")
time=$(date +"%T")


echo $cont $cpu $date $time 
echo $cont $cpu $date $time >> stress-ng_log3.txt

# Frequencia de amostragem: 10 segundos 
sleep 10

cont=`expr $cont + 1`

done