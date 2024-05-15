CREATE DATABASE dbLivraria
GO
USE dbLivraria

CREATE TABLE tbAutor(
codAutor int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nomeAutor varchar (100) NOT NULL
)

CREATE TABLE tbLivro(
codLivro int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nomeLivro varchar (100) NOT NULL,
numPaginas int NOT NULL,
codGenero int FOREIGN KEY REFERENCES tbGenero(codGenero) NOT NULL,
codAutor int FOREIGN KEY REFERENCES tbAutor(codAutor)NOT NULL,
codEditora int FOREIGN KEY REFERENCES tbEditora(codEditora) NOT NULL
)

CREATE TABLE tbGenero(
codGenero int PRIMARY KEY IDENTITY(1,1)NOT NULL,
nomeGenero varchar (100) NOT NULL
)

CREATE TABLE tbEditora(
codEditora int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nomeEditora varchar (100) NOT NULL
)  

DROP  TABLE tbLivro
DROP  TABLE tbEditora
DROP  TABLE tbAutor
DROP  TABLE tbGenero