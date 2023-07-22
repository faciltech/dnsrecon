<h1>DnsRecon</h1>
<p>Um programa para verificar endereços DNS de um domínio, tentar a transferência e coletar algumas informações, como IP, RANGE, e diversos tipos de endereços DNS.</p>
<p>O <b>DnsRecon</b> é utilitário para extrair informações de um dns</p>

![image](https://github.com/faciltech/resdns/assets/3409713/25f6bbb0-8422-466f-8ed8-1c6d3c9ce9fd)

<p>A ideia é ao final do scaneamento, termos um relatório com as portas abertas, com os diretórios e tbm as seguintes informações sobre o site:</p>
<ul>
<li>Status do Site;</li>
<li>IP do site;</li>
<li>Endereços de DNS;</li>
<li>Um breve sumário sobre;</li>
<li>Subdominios Takeover</li>

</ul>
<h2>Forma de uso</h2>
<h3>Baixar o utilitário</h3>

```
git clone https://github.com/faciltech/dnsrecon.git
```

![image](https://github.com/faciltech/dnsrecon/assets/3409713/2ac7571e-a7d1-4b51-a65c-53c8b49f8a94)
<h3>Como usar?</h3>
<h4>Primeira forma: Utilizando o Dominio do site e uma wordlist.</h4>

```
./dnsRes.sh faciltech.info /usr/share/seclists/Discovery/DNS/fierce-hostlist.txt
```

<h4>Segunda forma: Utilizando o ip e um range de portas</h4>

```
./dnsRes.sh 127.0.0.1 10 254
```

<p><b>Autor: Eduardo Amaral - eduardo4maral@protonmail.com</b></p>



