CREATE DATABASE triggerAtv2;

USE triggerAtv2;

CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(100) not null,
    valor double not null
);

DELIMITER //
CREATE TRIGGER tg_aumento_valor
BEFORE UPDATE ON Produto
FOR EACH ROW
BEGIN
  SET NEW.valor = NEW.valor * 10 / 100 + OLD.valor;
END;
//
DELIMITER ;

INSERT INTO Produto(nomeProduto,valor)
VALUES('Pão Frânces',12);
INSERT INTO Produto(nomeProduto,valor)
VALUES('Bolacha',13);
INSERT INTO Produto(nomeProduto,valor)
VALUES('Salgado',20);

UPDATE Produto 
set valor = valor * 1
WHERE idProduto = 1 ;

SHOW TRIGGERS;

DROP DATABASE triggerAtv2;
SELECT * FROM Produto;
