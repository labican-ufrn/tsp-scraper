# Base de Dados

Arquivos `SQL` incluindo a criação da base de dados e inserção dos dados contendo informações sobre o país, unidades federativas, regiões geográficas intermediárias e imediatas, cidade e vizinhança dos municípios brasileiros. 

### Exemplo SQL da criação e inserção dos dados

#### País 

```sql
CREATE TABLE pais (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	PRIMARY KEY (codigo)
);

INSERT INTO pais (codigo, nome) VALUES
(1, 'Brasil');
```


#### Unidade Federativa

```sql
CREATE TABLE unidade_federativa (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	sigla varchar(10),
	pais int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (pais) REFERENCES pais(codigo) on delete set null on update cascade
);

INSERT INTO unidade_federativa (codigo, nome, sigla, pais) VALUES
(11, 'Rondônia', 'RO', 1),
(12, 'Acre', 'AC', 1),
(13, 'Amazonas', 'AM', 1),
...
```
#### Região geográfica intermediária

```sql
CREATE TABLE rg_intermediaria (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	uf int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (uf) REFERENCES unidade_federativa(codigo) on delete set null on update cascade
);

INSERT INTO rg_intermediaria (codigo, nome, uf) VALUES
(1101, 'Porto Velho', 11),
(1102, 'Ji-Paraná', 11),
(1201, 'Rio Branco', 12),
...
```
#### Região geográfica imediata

```sql
CREATE TABLE rg_imediata (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	intermediaria int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (intermediaria) REFERENCES rg_intermediaria(codigo) on delete set null on update cascade
);

INSERT INTO rg_imediata (codigo, nome, intermediaria) VALUES
(110001, 'Porto Velho', 1101),
(110002, 'Ariquemes', 1101),
(110003, 'Jaru', 1101),
...
```
####  Municípios

```sql
CREATE TABLE cidade (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	populacao int,
	latitude decimal(7,4),
	longitude decimal(7,4),
	imediata int,
	uf int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (imediata) REFERENCES rg_imediata(codigo) on delete set null on update cascade,
	FOREIGN KEY (uf) REFERENCES unidade_federativa(codigo) on delete set null on update cascade
);

INSERT INTO cidade (codigo, nome, populacao, latitude, longitude, imediata, uf) VALUES
(1100015, "Alta Floresta D'Oeste", 22945, -11.9342, -62.0041, 110005, 11),
(1100023, 'Ariquemes', 107863, -9.912, -63.0338, 110002, 11),
(1100031, 'Cabixi', 5312, -13.4945, -60.5429, 110006, 11),
...
```

####  Vizinhança 

```sql
CREATE TABLE vizinhanca (
	codigo int AUTO_INCREMENT,
	cidade_origem int,
	cidade_destino int,
	distancia decimal,
	descricao varchar(250),
	PRIMARY KEY (codigo),
	FOREIGN KEY (cidade_origem) REFERENCES cidade(codigo) on delete set null on update cascade,
	FOREIGN KEY (cidade_destino) REFERENCES cidade(codigo) on delete set null on update cascade
);

```





