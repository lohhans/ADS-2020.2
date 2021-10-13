#!/bin/bash
# ARMSTRONG LOHÃNS / BRUNO DINIZ / ANDERSON GONÇALVES - 13/10/2021

echo " -- Sysbench Benchmark / Stress-ng Bnchmark -- "

echo "Extração de dados dos Benchmarks: de 10 em 10 segundos dentro de 40 minutos"

echo 
echo sample usr sys iowait soft steal idle temp date hour
echo sample usr sys iowait soft steal idle temp date hour > sysbench_log.txt # ARQUIVO PARA SYSBENCH
echo sample usr sys iowait soft steal idle temp date hour > stress-ng_log.txt # ARQUIVO PARA STRESS-NG
    
echo "O Benchmark (sysbench) iniciará agora, aguarde."

for i in 1 2 3 4 5 6 7 8 9 10; do
    echo 
    echo "\/ SYSBENCH \/"
    echo 

    # Testes de estresse para 2 min:
    sysbench --threads=8 --time=120 --test=cpu run &

    cont=1

    while [ $cont -le 12 ]
    do

    cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`
    temp=`sensors | grep 'Package id 0' | awk '{print $4}' | sed 's/+//' | sed 's/°C//'`
    date=$(date +"%d-%m-%Y")
    time=$(date +"%T")

    echo $cont $cpu $temp $date $time 
    echo $cont $cpu $temp $date $time >> sysbench_log.txt

    # Frequencia de amostragem: 10 segundos 
    sleep 10

    cont=`expr $cont + 1`

    done

    echo "Próximo Benchmark (stress-ng) iniciará em 20 segundos, aguarde."
    sleep 20

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  

    echo 
    echo "\/ STRESS-NG \/"
    echo 

    # Testes de estresse para 2min:
    stress-ng --cpu 8 --timeout 120s --metrics &

    cont=1

    while [ $cont -le 12 ]
    do

    cpu=`mpstat | grep all | awk '{print $3, $5, $6, $8, $9, $12}'`
    temp=`sensors | grep 'Package id 0' | awk '{print $4}' | sed 's/+//' | sed 's/°C//'`
    date=$(date +"%d-%m-%Y")
    time=$(date +"%T")

    echo $cont $cpu $temp $date $time 
    echo $cont $cpu $temp $date $time >> stress-ng_log.txt

    # Frequencia de amostragem: 10 segundos 
    sleep 10

    cont=`expr $cont + 1`

    done

    echo "Próximo Benchmark (Sysbench) iniciará em 20 segundos, aguarde."
    sleep 20
done