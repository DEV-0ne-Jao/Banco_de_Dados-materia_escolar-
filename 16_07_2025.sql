/*Soli Deo Gloria*/

/*Foreign key*/

DROP DATABASE bancoDados;

CREATE DATABASE bancoDados;
USE bancoDados;

CREATE TABLE table1 (
nome VARCHAR(42),
dia INT
);

ALTER TABLE table1
ADD COLUMN id_table1 INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY(id_table1);

CREATE TABLE table2 (
nome VARCHAR(42),
clima VARCHAR(20)
);

ALTER TABLE table2
ADD COLUMN id_table2 INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY(id_table2);

INSERT INTO table1(nome, dia)
VALUES
("Domingo", 1),
("Segunda-feira", 2),
("Terça-feira", 3),
("Quarta-feira", 4),
("Quinta-feira", 5),
("Sexta-feira", 6),
("Sábado", 7);

INSERT INTO table2(nome, clima)
VALUES
("Domingo", ""),
("Segunda-feira", ""),
("Terça-feira", ""),
("Quarta-feira", 4),
("Quinta-feira", 5),
("Sexta-feira", 6),
("Sábado", 7);