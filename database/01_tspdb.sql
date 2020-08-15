# Criando o Banco de Dados
CREATE DATABASE tspdb CHARACTER SET utf8;

USE tspdb;

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

CREATE TABLE rg_intermediaria (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	uf int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (uf) REFERENCES unidade_federativa(codigo) on delete set null on update cascade
);

CREATE TABLE rg_imediata (
	codigo int AUTO_INCREMENT,
	nome varchar(50),
	intermediaria int,
	PRIMARY KEY (codigo),
	FOREIGN KEY (intermediaria) REFERENCES rg_intermediaria(codigo) on delete set null on update cascade
);

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