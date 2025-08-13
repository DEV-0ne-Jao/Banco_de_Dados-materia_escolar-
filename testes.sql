create database baseDeDadus;
drop database a;



use baseDeDadus;
create table tabelinhaaa (
nome int,
sadada int
);

ALTER TABLE `baseDeDadus`.`tabelinhaaa`
CHANGE COLUMN `nome` `nome` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`nome`);
;

ALTER TABLE `baseDeDadus`.`tabelinhaaa`
CHANGE COLUMN `nome` `nome` INT NOT NULL ,
DROP PRIMARY KEY;
;
