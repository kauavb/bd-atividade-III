CREATE DATABASE ATV3BD;

USE ATV3BD;

CREATE TABLE Vendedor(
	IdVendedor int auto_increment primary key,
    nomeV varchar(150) not null,
    ctps varchar(16) not null,
    Empresa varchar(100) not null
);

CREATE TABLE Clientes(
	IdCliente int auto_increment primary key,
    nomeC varchar(150) not null,
    cpf varchar(15) not null unique,
    feedback varchar(255) not null,
	Vendedor_ID int,
	
	foreign key (Vendedor_ID) references Vendedor(IdVendedor)
);

INSERT INTO Vendedor(nomeV,ctps,Empresa)
VALUES('Júlio', '111.111' ,'JhonsoneJhonson'),
('Karine', '222.222' ,'Calabrezas Seara'),
('Bosanara', '333.333' ,'Zuvidos FONES');

INSERT INTO Clientes(nomeC,cpf,feedback,Vendedor_ID)
VALUES('Marilene','123.123.123','Achei o atendimento favorável',1),
('Jorge','456.456.456','Não gostei muito do atendimento ele foi muito grosso',2),
('Creuza','789.789.789','Gostei do atendimento dele',1),
('Morticia','147.147.147','O atendimento não foi tão objetivo então não esclareci minhas dúvidas',3),
('Gregório','258.258.258','Que atendimento péssimo, o cara não fala nada com nada',3);

CREATE VIEW vw_relacionamento_cliente_vendedor AS 
SELECT  C.nomeC as 'Nome Cliente', 
		C.feedback as 'Feedback', 
        V.nomeV as 'Nome do Vendendor'
FROM Vendedor AS V
INNER JOIN Clientes AS C
ON  C.Vendedor_ID = V.IdVendedor;

select * from vw_relacionamento_cliente_vendedor;

DROP VIEW IF EXISTS vw_relacionamento_cliente_vendedor;
