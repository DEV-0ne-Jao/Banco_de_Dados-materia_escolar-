/*Soli Deo Gloria*/
/*Novos comandos*/


use DadosComandosNovos;
DROP TABLE tabelaUm;
DROP DATABASE DadosComandosNovos;

create database DadosComandosNovos;
use DadosComandosNovos;

create table tabelaUm (
nome int,
atributo int
);

/*comando já antigo mas útil, DROP:*/
DROP TABLE tabelaUm;
DROP DATABASE DadosComandosNovos;

create database DadosComandosNovos;
use DadosComandosNovos;

create table tabelaUm (
cod_personagem int,
nome varchar(45),
atributo varchar(45),
vida int,
dano int
);

/*primeiro comando novo, o DESC:*/
DESC tabelaUm;

/*Segundo novo comando, o INSERT INTO, e, junto a ele, o VALUE*/
INSERT INTO tabelaUm(cod_personagem, nome, atributo, vida, dano) VALUES(1, "cavaleiro", "forte", 100, 23);
/*Strings e datas precisam estar entre aspas, enquanto numeros e tals sem aspas*/

/*Curiosidade: Você pode mudar a ordem dos negócios da tabel, por exemplo:*/
INSERT INTO tabelaUm(dano, vida, atributo, cod_personagem, nome) VALUES(23, 100, "forte", 1, "cavaleiro");

/*Outra curiosidade, é que se você quiser adicionar vários valores, vocÊ pode fazer isso:*/
INSERT INTO tabelaUm(cod_personagem, nome, atributo, vida, dano)
VALUES
	(1, "Cavaleiro", "forte", 100, 25),
	(2, "Goblin", "rápido", 40, 7),
    (3, "esqueleto", "longa distância", 25, 13);

/*Terceiro novo comando, SELECT, junto ao from, ele mostra o que há registrado em uma ou mais colunas(não linhas) de uma tabela*/
SELECT * from tabelaUm;

/*Para colocar quantas colunas você quer mostrar, você pode colocar um nome de atributo em vez de um asterisco*/
SELECT vida from tabelaUm;
