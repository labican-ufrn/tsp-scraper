# TSP SCRAPER (tsp-scraper)
Ferramenta para coleta de distâncias entre cidades usando a API do Google Maps para o Problema do Caxeiro Viajante (TSP).

## Base de Dados (MySQL)

Inicialmente criamos um modelo relacional para a base de dados do TSP para as distância de cidades do Brasil. Definimos as seguintes entidades:

* País
* Unidade Federativa
* Região Geográfica Intermediárias (antiga Mesorregião)
* Regiões Geográficas Imediatas (antiga Microrregião)
* Cidade
* Vizinhança

Organização de acordo com a nova *Divisão Regional do Brasil em Regiões Geográficas Imediatas e Regiões Geográficas Intermediárias 2017*.

# Links Interessantes

* https://ww2.ibge.gov.br/home/geociencias/geografia/default_div_int.shtm
* https://www.ime.usp.br/~cris/aulas/08_1_338/slides/aula27-2.pdf
* Municípios Limítrofes 
  * http://www.consultaesic.cgu.gov.br/busca/dados/Lists/Pedido/Item/displayifs.aspx?List=0c839f31%2D47d7%2D4485%2Dab65%2Dab0cee9cf8fe&ID=503796&Web=88cc5f44%2D8cfe%2D4964%2D8ff4%2D376b5ebb3bef
