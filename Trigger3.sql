CREATE DATABASE triggerAtv3;

USE triggerAtv3;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    estoque int not null,
    produtoVendido int not null
);

DELIMITER // 

CREATE TRIGGER tg_atualizar_estoque
BEFORE UPDATE ON Produto
FOR EACH ROW
BEGIN
	SET NEW.estoque = OLD.estoque - NEW.produtoVendido;
END;
//
DELIMITER ;

INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Pão Frânces',100, 20);
INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Bolacha',120, 100);
INSERT INTO Produto(nomeProduto,estoque ,produtoVendido)
VALUES('Salgado',10, 5);

UPDATE Produto 
set estoque = estoque * 1
WHERE idProduto = 2 ;

SELECT * FROM Produto;

DROP DATABASE triggerAtv3;



