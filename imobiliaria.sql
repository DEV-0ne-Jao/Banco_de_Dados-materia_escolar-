/*Soli Deo Gloria*/

DROP DATABASE imobiliaria;

CREATE DATABASE imobiliaria;
USE imobiliaria;

CREATE TABLE cidade (
nome_cidade VARCHAR(20),
uf CHAR(2)
);
ALTER TABLE cidade
ADD COLUMN cod_cidade INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (cod_cidade);

CREATE TABLE imovel (
descricao VARCHAR(45),
endereco VARCHAR(45),
cep VARCHAR(45),
tipo VARCHAR(45),
situacao VARCHAR(45)
/*cod_cidade /*FK*/
);
ALTER TABLE imovel
ADD COLUMN cod_imovel INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (cod_imovel);

CREATE TABLE pessoa (
nome VARCHAR(45),
endereco VARCHAR(45),
cep VARCHAR(45),
tipo_pessoa VARCHAR(45),
telefone VARCHAR(45)
/*cod_cidade /*FK*/
);
ALTER TABLE pessoa
CHANGE COLUMN nome cod_pessoa INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (cod_pessoa),
ADD COLUMN nome VARCHAR(25) AFTER cod_pessoa;


ALTER TABLE pessoa
ADD COLUMN cod_cidade INT NOT NULL AFTER telefone,
ADD CONSTRAINT cidade_cod_cidade
FOREIGN KEY (cod_cidade)
REFERENCES cidade(cod_cidade);

/* OU */

/*
ALTER TABLE pessoa
CHANGE COLUMN endereco cod_cidade INT NOT NULL,
ADD CONSTRAINT cidade_cod_cidade_FK
FOREIGN KEY (cod_cidade)
REFERENCES cidade(cod_cidade),
ADD COLUMN endereco VARCHAR(45);
*/

ALTER TABLE imovel
ADD COLUMN cod_cidade INT NOT NULL AFTER situacao,
ADD CONSTRAINT cidade_cod_cidade
FOREIGN KEY (cod_cidade)
REFERENCES cidade(cod_cidade);


CREATE TABLE contrato(
cod_contrato INT NOT NULL /*PRIMARY KEY*/ AUTO_INCREMENT, PRIMARY KEY(cod_contrato),
cod_imovel INT NOT NULL, CONSTRAINT imovel_cod_imovel FOREIGN KEY (cod_imovel) REFERENCES imovel(cod_imovel),
cod_inquilino INT NOT NULL, CONSTRAINT pessoa_cod_inquilino FOREIGN KEY (cod_inquilino) REFERENCES pessoa(cod_pessoa),
cod_fiador INT NOT NULL, CONSTRAINT pessoa_cod_fiador FOREIGN KEY (cod_fiador) REFERENCES pessoa(cod_pessoa),
data_contrato DATE,
valor_aluguel DOUBLE,
dia_vencimento DATE,
periodo_aluguel int
);

INSERT INTO contrato(cod_imovel, cod_inquilino, cod_fiador, data_contrato, valor_aluguel, dia_vencimento, periodo_aluguel)
VALUES
(1,  3, 10,  "2024-03-16", 445.20, "2020-05-01", 12),
(2,  6,  5,  "2021-01-12", 400.00, "2003-10-05", 42),
(3,  2,  7,  "2006-09-21", 325.50, "2012-09-03", 14),
(4,  5,  9,  "2012-12-27", 200.00, "2001-04-11", 12),
(5,  8,  8,  "2018-02-31", 699.99, "2016-09-16", 27),
(6,  1,  3,  "2016-08-14", 240.00, "2017-01-15", 18),
(7,  7,  4,  "2029-03-03", 380.00, "2015-05-23", 24),
(8,  4,  2,  "2001-04-15", 530.00, "2003-07-24", 47),
(9, 10,  4,  "2015-07-13", 560.00, "2041-02-13", 32),
(13, 9,  3,  "2016-11-12", 730.00, "2031-12-24", 21),
(15, 5,  8,  "2012-09-14", 320.00, "2021-04-24", 36),
(11, 2,  6,  "2005-01-18", 280.00, "2081-07-14", 21),
(14, 1,  4,  "2014-02-23", 220.00, "2041-01-04", 25),
(10, 9,  6,  "2004-11-12", 570.00, "2001-09-11", 22);

/*
ALTER TABLE contrato
ADD COLUMN cod_contrato INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (cod_contrato),
ADD COLUMN cod_imovel INT NOT NULL AFTER cod_contrato,
ADD COLUMN cod_pessoa INT NOT NULL AFTER cod_imovel,
ADD CONSTRAINT imovel_cod_imovel FOREIGN KEY (cod_imovel) REFERENCES imovel(cod_imovel),
ADD CONSTRAINT pessoa_cod_pessoa FOREIGN KEY (cod_pessoa) REFERENCES pessoa(cod_pessoa);
*/

INSERT INTO cidade(nome_cidade, uf)
VALUES
("Aratiba", "ar"),
("Erechim", "er"),
("Canela", "cn"),
("Gramado", "gr"),
("Campinas", "ca");

INSERT INTO imovel(descricao, endereco, cep, tipo, situacao)
VALUES
("Uma bela moradia", "163 Três vendas", 99770000, "apartamento", "ótimo estado"),
("Uma bela moradia", "157 RJ", 12903485, "casa", "Estado bom"),
("Uma moradia aconchegante", "131 Atlantico", 192837456, "casa", "apresentável"),
("Uma moradia assustadora", "001", 010101010, "casa", "abanadonada");

INSERT INTO pessoa(nome, endereco, cep, tipo_pessoa, telefone, cod_cidade)
VALUES
("Joao", "167", "99770000", "física", "99922-2397", 1),
("Bernardo", "243", "99770000", "física", "99221-1798", 2),
("Nathan", "093", "99770000", "física", "99567-1379", 4),
("Ricierry", "401", "99770000", "física", "99131-2907", 3),
("Lucas Both", "732", "99770000", "jurídica", "99893-7257", 5);


/*
Explicação da sintaxe de SELECT com FROM e WHERE:
SELECT (linha/atributo)[é o nome da linha/atributo]
FROM (tabela)[é uma string com o nome da tabela]
WHERE (nome da linha/atributo da tabela)[é uma string com o nome da linha/atributo] = (valor que está neste atributo/linha)[pode ser int, boolean, string, qualquer valor que tu tenha colocado]

Mais uma coisa, se quiser colocar mais "parametros" em cada coisa, você separa eles com vírgula
*/


 /*Isso dá um bug sinistro kkkkkkkk*/
/*SELECT * FROM pessoa, imovel, cidade;*/


UPDATE pessoa SET nome="Joao Paulo Filipini" WHERE nome="Joao";
UPDATE pessoa SET nome="Lucas André Both" WHERE nome="Lucas Both";
UPDATE pessoa SET endereco="Casa em Aratiba perto da creche, logo de cima do clube aliança" WHERE nome="Joao Paulo Filipini";
UPDATE imovel SET tipo="Casa Própria" WHERE tipo="casa";
UPDATE imovel SET situacao="Assombrada" WHERE endereco="001";

DELETE FROM pessoa WHERE tipo_pessoa = "jurídica";
DELETE FROM pessoa WHERE nome = "Bernardo";

INSERT INTO cidade(nome_cidade, uf)
VALUES
("Itatiba", "It"),
("Três Arroios", "Ta"),
("Porto Alegre", "Pa");

INSERT INTO imovel(descricao, endereco, cep, tipo, situacao)
VALUES
("moradia colorida", "633 Três vendas", 99770000, "apartamento", "ótimo estado"),
("casa moderna", "1734 Atlantico", 12903485, "casa", "Estado bom"),
("minimalista", "274 Atlantico", 192837456, "casa", "Estado bom"),
("tecnologica", "234 Rua Coronel Pedro de Souza", 01752351, "apartamento", "ótimo estado");

INSERT INTO pessoa(nome, endereco, cep, tipo_pessoa, telefone, cod_cidade)
VALUES
("André", "201", "99770000", "física", "93922-2367", 7),
("Guilherme", "943", "00881100", "jurídica", "91221-1298", 3),
("Nicolas", "238", "99770000", "física", "99507-1319", 4),
("Matheus", "172", "99770000", "física", "90131-2937", 1),
("Sara", "615", "99770000", "jurídica", "99890-7237", 3);

ALTER TABLE pessoa
ADD COLUMN cpf VARCHAR(45) AFTER cep,
ADD COLUMN gênero VARCHAR(45) NOT NULL AFTER cpf;

ALTER TABLE imovel ADD COLUMN cor VARCHAR(45) AFTER tipo;

UPDATE pessoa SET cpf = "000.000.000-00" WHERE cod_pessoa BETWEEN 3 AND 7;
UPDATE pessoa SET cpf = "044.235.820-23" WHERE nome= "Joao Paulo Filipini";
UPDATE pessoa SET cpf = "341.432.216-90" WHERE nome= "André";
UPDATE imovel SET cor = "branca" WHERE tipo="casa";
UPDATE imovel SET cor = "branca" WHERE tipo="apartamento";



ALTER TABLE pessoa
CHANGE COLUMN nome Nome_da_pessoa VARCHAR(45) NOT NULL;

/*
DESC imovel;
DESC pessoa;
DESC cidade;
DESC contrato;

SELECT * FROM imovel;
SELECT * FROM cidade;
SELECT * FROM pessoa;
SELECT * FROM contrato;
*/

/*sintaxe do SELECT com WHERE*/
/*
SELECT (linha/atributo)[é o nome da linha/atributo]
FROM (tabela)[é uma string com o nome da tabela]
WHERE (nome da linha/atributo da tabela)[é uma string com o nome da linha/atributo] = (valor que está neste atributo/linha)[pode ser int, boolean, string, qualquer valor que tu tenha colocado]

Isso vai printar a linha que você escolheu no SELECT
da tabela que você colocou no FROM
que atendem as condições que você colocou no WHERE
*/

/*
SELECT Nome_da_pessoa FROM pessoa WHERE cod_pessoa = 3;
SELECT Nome_da_pessoa, cod_cidade FROM pessoa WHERE cod_pessoa = 4;
SELECT Nome_da_pessoa, cep FROM pessoa WHERE cod_pessoa = 5;
SELECT Nome_da_pessoa, cpf FROM pessoa WHERE cod_pessoa = 6;
SELECT cpf, situacao FROM pessoa, imovel WHERE cpf = "044.235.820-23";
*/

/*
Agora dificultamos um pouco.
Comandos
IN
BETWEEN
AND
OR
LIKE
NOT LIKE
*/
/*
SELECT * FROM cidade;
SELECT cpf FROM pessoa WHERE cod_pessoa = 1;
SELECT nome_cidade FROM cidade WHERE uf = "ar";
SELECT * FROM cidade WHERE uf = "ar" OR uf = "er" AND uf="er" OR uf="Pa";

SELECT Nome_da_pessoa, cpf, telefone FROM pessoa WHERE cod_pessoa = 1 AND cpf = "044.235.820-23";
SELECT cep FROM imovel WHERE cor = "branca" OR descricao = "Uma bela moradia";
SELECT Nome_da_pessoa FROM pessoa WHERE cod_cidade = 0 AND tipo_pessoa = "física";

SELECT cpf FROM pessoa WHERE cod_pessoa BETWEEN 1 AND 5;
SELECT descricao FROM imovel WHERE cod_imovel BETWEEN 1 AND 5;
SELECT cpf, Nome_da_pessoa FROM pessoa WHERE cod_cidade BETWEEN 0 AND 5 AND cep = "99770000";
SELECT data_contrato, valor_aluguel, cod_fiador FROM contrato WHERE cod_fiador >= 3  AND cod_fiador < 10;

SELECT * FROM pessoa WHERE cpf IN("044.235.820-23", "341.432.216-90", "000.000.000-00");
SELECT * FROM pessoa WHERE endereco IN("201", "093", "943");
SELECT * FROM imovel WHERE situacao IN("ótimo estado", "Estado bom");

SELECT * FROM imovel WHERE situacao LIKE "ótimo%"; /*o "%" indica que contém aquilo, mas não está limitado àquilo*/
/*SELECT uf FROM cidade WHERE nome_cidade LIKE "%a"; /*Existe diferença entre "%a" e "a%". o "a%" é só quando começa com "a" , o "%a" é se acaba com "a" */
/*SELECT * FROM pessoa WHERE Nome_da_pessoa NOT LIKE "%n%"; /*Aqui é se tiver "n" em qualquer lugar*/


/*
SELECT * FROM pessoa WHERE Nome_da_pessoa
NOT LIKE "%n%"
AND Nome_da_pessoa LIKE "%e%"
OR cod_pessoa BETWEEN 1 AND 3
AND cpf="000.000.000-00"
OR Nome_da_pessoa IN("Sara", "Matheus");
*/

/*ALTER TABLE cidade DROP COLUMN regiao;*/
ALTER TABLE cidade ADD COLUMN regiao VARCHAR(20) AFTER uf;
UPDATE cidade SET regiao="Rio Grande do Sul" WHERE regiao != "Rio Grande do Sul";


UPDATE cidade SET regiao= CASE
WHEN nome_cidade="Erechim" THEN "norte"
WHEN nome_cidade="Aratiba" THEN "sul"
WHEN nome_cidade="praia" THEN "litoral"
WHEN nome_cidade="Gramado" THEN "longe"
ELSE "Invitavelmente substitui"
END;

UPDATE cidade SET regiao= CASE
WHEN nome_cidade="Erechim" THEN "norte"
when nome_cidade= ("Gramado") or nome_cidade= ("Canela") then "Centro"
ELSE "não é norte" /*Isso vai deixar todo mundo assim invetiavelmente*/
END;

SELECT * FROM cidade;
DESC cidade;


/*Novo conteúdo :) ORDER BY, ASC e DESC*/
/*Explicação de sintaxe*/
SELECT /*Mostra Dados(não as colunas, os dados que nelas estão) de determinada tabela*/
nome_cidade /*É o nome da coluna de dados que vai mostrar*/
FROM /*indica a tabela onde está este atributo*/
cidade /*O nome da tabela*/
ORDER BY /*Ordena*/
nome_cidade /*O nome do atributo que vai checar os dados para verificar para fazer a ordenação*/
ASC; /*Organiza de forma ascendente*/

SELECT 
*
FROM
contrato
ORDER BY 
valor_aluguel
DESC;


SELECT p.cpf, p.Nome_da_pessoa, c.nome_cidade
FROM pessoa p
INNER JOIN cidade c
ON p.cod_cidade=c.cod_cidade
WHERE p.cod_cidade BETWEEN 1 AND 5;


SELECT c.nome_cidade 'Cidade', COUNT(p.Nome_da_pessoa) 'Total de Pessoas'
FROM pessoa p
INNER JOIN cidade c
ON p.cod_cidade=c.cod_cidade
GROUP BY c.nome_cidade
HAVING COUNT(p.Nome_da_pessoa)>1;

/*delete from pessoa;*/
/*SELECT * FROM pessoa;*/

SELECT c.nome_cidade 'Cidade', COUNT(p.Nome_da_pessoa) 'Total de Pessoas'
FROM cidade c
LEFT JOIN pessoa p
ON p.cod_cidade=c.cod_cidade
GROUP BY c.nome_cidade;

SELECT c.valor_aluguel "Valor do aluguel", p.Nome_da_pessoa "Nome do inquilino", i.descricao "Descrição do imóvel"
FROM contrato c
INNER JOIN pessoa p
ON c.cod_inquilino = p.cod_pessoa
INNER JOIN imovel i
ON c.cod_imovel = i.cod_imovel;

SELECT i.descricao "Descrição do imóvel", SUM(c.valor_aluguel) "Soma do valor do aluguel"
FROM contrato c
INNER JOIN imovel i
ON c.cod_imovel = i.cod_imovel
GROUP BY i.descricao;
























/*
CREATE TABLE PROPRIETARIO_IMOVEL(
percentual_propriedade INT
/*cod_imovel INT,*/
/*cod_pessoa INT,*/
/*);*/

/*Associativas:*/
/*CREATE TABLE RECEBIMENTO_ALUGUEL (*/
/*cod_contrato INT,*/
/*data_recebimento DATE*/
/*valor DOUBLE,*/
/*juro DOUBLE,*/
/*multa DOUBLE*/
/*);*/
/*CREATE TABLE PAGAMENTO_PROPRIETARIO(*/
/*cod_contrato,*/
/*cod_pessoa /*(proprietário)*/
/*data_pagamento DATE,*/
/*valor DOUBLE*/
/*);*/