CREATE DATABASE triggerAtv4;

use triggerAtv4;

CREATE TABLE Funcionarios(
	idFuncionarios int auto_increment primary key,
    nome varchar(150) NOT NULL,
    Cargo varchar(50) NOT NULL
);

CREATE TABLE Funcionarios_Demitidos(
	idFuncionarioDemi int auto_increment primary key,
    nome varchar(150) NOT NULL,
    Cargo varchar(50) NOT NULL
);

DELIMITER //

CREATE TRIGGER tg_funcionarios_demitidos
AFTER DELETE ON Funcionarios
FOR EACH ROW
BEGIN 
	INSERT INTO Funcionarios_Demitidos (idFuncionarioDemi, nome, Cargo)
    VALUES (OLD.idFuncionarios, OLD.nome, OLD.Cargo);
END;
//

DELIMITER ;


INSERT INTO Funcionarios(nome,Cargo)
VALUES('Rodrigo Farra','Finanças'),
('Jorge Amado','Desenvolvedor Sênior'),
('Mariluce Pereira','Engenheira');

DELETE FROM Funcionarios 
WHERE idFuncionarios = 1;

select * from Funcionarios;
select * from Funcionarios_Demitidos;

DROP DATABASE triggerAtv4;