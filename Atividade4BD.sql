create database ATV4BD;

use ATV4BD;

CREATE TABLE Produtos(
	id int auto_increment primary key,
    nomeProduto varchar(150) not null,
	valor double not null
);

INSERT INTO Produtos(nomeProduto,valor)
VALUES('Bola de Handeboll',90),
('Raquete de Tênis',120),
('Taco de Baseball Kr',115),
('Bola de Futebol ',92),
('Bola de Volêi',110);

CREATE VIEW vw_produtos_caros AS
SELECT id as 'ID', nomeProduto as 'Nome do Produto', valor as 'Valor'
FROM Produtos
WHERE valor > 100;

SELECT * FROM vw_produtos_caros;
DROP VIEW IF EXISTS vw_produtos_caros;