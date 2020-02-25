#!/bin/bash
echo "    _________   ____________  ____________________  __";
echo "   / ____/   | / ____/  _/ / /_  __/ ____/ ____/ / / /";
echo "  / /_  / /| |/ /    / // /   / / / __/ / /   / /_/ / ";
echo " / __/ / ___ / /____/ // /___/ / / /___/ /___/ __  /  ";
echo "/_/   /_/  |_\____/___/_____/_/ /_____/\____/_/ /_/   ";
echo "                                                      ";
echo "Autor: Eduardo Amaral"
echo "youtube.com.br/faciltech"
if [ "$1" == "" ];
then
	echo "Use da seguinte forma: ./dnsRes.sh dominio.com.br"
	echo "Use da seguinte forma: ./dnsRes 37.59.174 1 100"
	echo " 1 100 ==> é o range dos ips"
elif [ $# -lt 2 ];then
	echo "################ Endereço IP ####################"
	echo -n "IP: "; host $1 | cut -d" " -f4 | grep -v handled
	ip=$(host $1 | cut -d" " -f4 | grep -v handled)
	echo " "
	echo "################# Endereço de DNS ################"
	host -t ns $1 | cut -d" " -f1,4 | sed 's/.$//g'
	echo
	echo "################ Transferencia de Zona ############"
	for resp in $(host -t ns $1 | cut -d" " -f1,4 | sed 's/.$//g');do
		host -la $1 $resp | grep -v "REFUSED" | grep -v "Trying" | grep -v "Transfer failed" 2>/dev/null
	done 
	echo " "
	echo "############### Outros Endereços ##############"
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
	echo "############## Range dos IPs #################"
	resultado=$(whois $ip | egrep "NetRange|inetnum")
        echo "O Range da Rede é: ====>  "$resultado
	echo "**** Você pode usar agora o Range para fazer uma busca mais elaborada. ****"
	echo "**** Ex: ./dnsRes.sh 192.168.0 1 254 OBS: use o range encontrado ****"
	echo " "
	echo "...FIM DA BUSCA..."

else
	echo "############### RESULTADOS ####################"
	for ip in $(seq  $2 $3);do
	host $1.$ip | grep -v $1 | grep -v NXDOMAIN | cut -d" " -f1,5 | sed 's/.$//g';
	done
	echo "...FIM DA BUSCA..."
fi
