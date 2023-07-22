#!/bin/bash
figlet DNSRECON
echo "Autor: Eduardo Amaral - eduardo4maral@protonmail.com"
echo "You Tube : https://www.youtube.com/faciltech"
echo "github   : https://github.com/Amaroca"
echo "Facebook : https://www.facebook.com/faciltech123"
echo "Linkedin : https://www.linkedin.com/in/eduardo-a-02194451/"

if [ "$1" == "" ];
then
	echo "Use da seguinte forma: ./dnsRes.sh dominio.com.br <wordlist>"
	echo "Use da seguinte forma: ./dnsRes 37.59.174 1 100"
	echo " 1 100 ==> é o range dos ips"
elif [ $# -eq 2 ];then
	echo -e "################ \e[1;33;40mEndereço IP\e[0m ####################"
	echo -n "IP: "; host $1 | cut -d" " -f4 | grep -v handled
	ip=$(host $1 | cut -d" " -f4 | grep -v handled)
	echo " "
	echo -e "################# \e[1;33;40mEndereços de DNS \e[0m  ################"
	host -t ns $1 | cut -d" " -f1,4 | sed 's/.$//g'
	echo
	echo -e "################ \e[1;33;40mTransferencia de Zona \e[0m ############"
	for resp in $(host -t ns $1 | cut -d" " -f1,4 | sed 's/.$//g');do
		host -la $1 $resp | grep -v "REFUSED" | grep -v "Trying" | grep -v "Transfer failed" 2>/dev/null
	done 
	echo " "
	echo -e "############### \e[1;33;40mOutros Endereços \e[0m ##############"
	echo -n " DNS A =>"; host -t A $1
        echo -n " DNS SRV =>"; host -t SRV $1
        echo -n " DNS CNAME =>"; host -t CNAME $1
        echo -n " DNS TXT =>"; host -t txt $1
        echo -n " DNS SPF =>"; host -t SPF $1
        echo -n " DNS HINFO =>"; host -t HINFO $1
        echo -n " DNS AAAA =>"; host -t AAAA $1
        echo -n " DNS SOA =>"; host -t SOA $1
        echo -n " DNS MX =>"; host -t MX $1
        echo -n " DNS PTR =>"; host -t PTR $1
	echo " "
	echo -e "####### \e[1;33;40mBusca de Subdominios Takeover \e[0m #########"
	for palavra in $(cat $2);do
                host -t CNAME $palavra.$1 | grep "alias for" | cut -d" " -f1,6
	done
	echo -e "\e[1;33;40m...FIM DA BUSCA...\e[0m"

elif [ $# -eq 4 ];then
	echo -e "############### \e[1;33;40mRESULTADOS \e[0m ####################"
	for ip in $(seq  $2 $3);do
	host $1.$ip | grep -v $1 | grep -v NXDOMAIN | cut -d" " -f1,5 | sed 's/.$//g';
	done
	echo ""
	echo -e "\e[1;33;40m..FIM DA BUSCA...\e[0m"
else
	echo "Use da seguinte forma: ./dnsRes.sh dominio.com.br <wordlist>"
        echo "Use da seguinte forma: ./dnsRes 37.59.174 1 100"
        echo " 1 100 ==> é o range dos ips"

fi
