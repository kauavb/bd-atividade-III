CREATE DATABASE triggerAtv1;

USE triggerAtv1;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    dataValidade varchar(10) not null
);

DELIMITER //

CREATE trigger tg_validade_produto
before insert on 
Produto 
for each row
begin
	if new.dataValidade < '2023-11-08' then
		signal sqlstate '45000' set message_text = 'O Produto está vencido';
    end if;
END //

INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Pão Frânces','2023-11-09');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Bolacha','2023-11-07');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Salgado','2023-11-11');
INSERT INTO Produto(nomeProduto,dataValidade)
VALUES('Suco','2023-10-06');

SELECT * FROM Produto;

DROP DATABASE triggerAtv1;