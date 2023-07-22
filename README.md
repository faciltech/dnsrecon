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

<code>
./dnsRes.sh faciltech.info /usr/share/seclists/Discovery/DNS/fierce-hostlist.txt
</code>

<p><b>Autor: Eduardo Amaral - eduardo4maral@protonmail.com</b></p>



