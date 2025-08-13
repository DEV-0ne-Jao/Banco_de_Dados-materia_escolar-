/*Soli Deo Gloria*/
/*
DELETE apaga dados da tabela
UPDATE muda os dados da tabela (substitui)
DROP apaga a tabela
*/
USE aula;
DROP DATABASE aula;

CREATE DATABASE aula;
USE aula;

CREATE TABLE tabela1(
id INT,
nome VARCHAR(45)
);

INSERT INTO tabela1(id, nome)
VALUES
(1, "Joao"),
(2, "Lucas"),
(3, "Rian"),
(4, "Bernardo"),
(5, "Joao");

UPDATE tabela1
SET nome="Douglas"
WHERE nome="Joao";

UPDATE tabela1
SET id=1
WHERE id=5;

UPDATE tabela1
SET id=8
WHERE nome="Douglas";

UPDATE tabela1
SET nome="Joao"
WHERE nome="Douglas";

UPDATE tabela1
SET id=1
WHERE nome="Joao";

UPDATE tabela1
SET id=1
WHERE nome="Joao";

SELECT * FROM tabela1;

DELETE tabela1 FROM id;
SELECT * FROM tabela1;

/*Se você não especifica com WHERE você seleciona todos*/
