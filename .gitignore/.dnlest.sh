#!/bin/bash

green="\033[1;32m"
red="\033[1;31m"
echo
#echo "=================================================="
echo                                                TESTE DO DNS                     
#echo "=================================================="
echo
#teste de ping do dominio
echo 
echo "Digite seu dominio :" 
read dominio
echo "=================================================="
echo "=                     Ping                       ="
echo "==================================================" 
if 
ping -c 3 www.$dominio > /dev/null;
then
echo -e "\033[1;32m UP \033[0m <-- Status"
else
echo -e "\033[1;31m Down \033[0m <-- Status"
fi
echo "=================================================="
echo "=                    NMAP                        ="
echo "=================================================="
echo $nmap = www.$dominio

nmap $dominio | grep "PORT" > /dev/null;
if [ $? -eq 0 ];  
then
echo -e "\033[1;32m UP \033[0m <-- Status"
else
echo -e "\033[1;31m Down \033[0m <-- Status"
fi
echo "=================================================="
echo "=                    Host                        ="
echo "=================================================="
if 
host $dominio > /dev/null;
then
echo -e "\033[1;32m UP \033[0m <-- Status"
else
echo -e "\033[1;31m Down \033[0m <-- Status"
fi
echo "=================================================="
echo "=                    DIG                         ="
echo "=================================================="
dig $dominio | grep "NOERROR" > /dev/null;
if [ $? -eq 0 ];
then
echo -e "\033[1;32m UP \033[0m <-- Status"
else
echo -e "\033[1;31m Down \033[0m <-- Status"
fi
echo
sleep 1500
clear
done
