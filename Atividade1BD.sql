CREATE DATABASE ATVBD;

USE ATVBD;

CREATE TABLE Departamento(
	IdDepartamento int auto_increment primary key,
    NomeDoDepartamento varchar(50) not null
);

CREATE TABLE Funcionarios(
	id int auto_increment primary key,
    nome varchar(150) NOT NULL,
    dataNascimento varchar(11) NOT NULL,
    Cargo varchar(50) NOT NULL,
    DepartID int,
    
    foreign key (DepartID) references Departamento(IdDepartamento)
);

INSERT INTO ATVBD.Departamento(NomeDoDepartamento)
VALUES ('Tecnologia da Informação');
INSERT INTO ATVBD.Departamento(NomeDoDepartamento)
VALUES ('Engenharia');
INSERT INTO ATVBD.Departamento(NomeDoDepartamento)
VALUES ('Administração');

INSERT INTO ATVBD.Funcionarios(nome, dataNascimento, Cargo, DepartID)
VALUES('Rodrigo Farra','12/11/2000' ,'Finanças', 3),
('Jorge Amado','05/02/1989' , 'Desenvolvedor Sênior', 1),
('Mariluce Pereira','26/07/1999' , 'Engenheira', 2),
('Mercedes Junior','18/01/2002' , 'Desenvolvedor Junior', 1),
('Carlos Araujo','10/06/2000' , 'Logística', 3),
('Amyy Maravilhosa','20/10/1987' , 'Gerente', 3);

CREATE VIEW vw_funcionarios_departamento AS 
SELECT  F.nome AS 'Nome do Funcionario', 
		F.Cargo AS 'Cargo', 
		D.NomeDoDepartamento AS 'Departamento'
FROM Funcionarios  F
INNER JOIN Departamento  D
ON F.DepartID = D.IdDepartamento
WHERE D.NomeDoDepartamento = 'Administração'
GROUP BY F.id;

SELECT * FROM vw_funcionarios_departamento;

DROP VIEW IF EXISTS vw_funcionarios_departamento;
