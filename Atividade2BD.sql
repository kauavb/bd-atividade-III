CREATE DATABASE ATV2BD;

USE ATV2BD;

CREATE TABLE Produtos(
	id int auto_increment primary key,
    nomeProduto varchar(100) NOT NULL,
    descricao varchar(255) NOT NULL,
	quantEstoque int NOT NULL
);

INSERT INTO Produtos(nomeProduto,descricao,quantEstoque)
VALUES('Smarthphone Samsung s22','Smarthphone última geração s22 pro',120),
('Tablet Samsung XE','Tablet Samsung XE Processador ótimo',3),
('Notebook Samsung Kr','Notebook Samsungpro',2),
('Televisão Samsung ','Televisão Samsung 52 polegadas curvada',200),
('Smarthphone iPhone X','Smarthphone iPhone geração X flopado',1);

CREATE VIEW vw_estoque_insuficiente AS
SELECT id, nomeProduto, quantEstoque
FROM Produtos
WHERE quantEstoque < 5;

SELECT * FROM vw_estoque_insuficiente;
