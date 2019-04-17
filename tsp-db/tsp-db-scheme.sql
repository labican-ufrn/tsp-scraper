# Criando o Banco de Dados
CREATE DATABASE tspdb CHARACTER SET utf8;
CREATE USER 'tsp-scraper'@'localhost' IDENTIFIED BY 'scraper';
GRANT ALL PRIVILEGES ON tspdb.* TO 'tsp-scraper'@'localhost';

SET FOREIGN_KEY_CHECKS=0; -- Desabilitar Foreign Keys

drop table if exists pais cascade;
drop table if exists unidade_federativa cascade;
drop table if exists mesorregiao cascade;
drop table if exists microrregiao cascade;
drop table if exists cidade cascade;
drop table if exists vizinhanca cascade;

SET FOREIGN_KEY_CHECKS=1; -- Habilitando Foreign Keys

# Criação das Tabelas

CREATE TABLE pais (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	PRIMARY KEY (codigo)
);

CREATE TABLE unidade_federativa (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	sigla varchar(10),
	pais int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (pais) REFERENCES pais(codigo) on delete set null on update cascade
);

CREATE TABLE mesorregiao (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	uf int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (uf) REFERENCES unidade_federativa(codigo) on delete set null on update cascade
);

CREATE TABLE microrregiao (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	meso int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (meso) REFERENCES mesorregiao(codigo) on delete set null on update cascade
);

CREATE TABLE cidade (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	populacao int,
	latitude decimal,
	longitude decimal,
	micro int,
	uf int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (micro) REFERENCES microrregiao(codigo) on delete set null on update cascade,
	FOREIGN KEY (uf) REFERENCES unidade_federativa(codigo) on delete set null on update cascade
);

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
