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
VALUES ('Informatica');
INSERT INTO ATVBD.Departamento(NomeDoDepartamento)
VALUES ('Engenharia e Construcao');
INSERT INTO ATVBD.Departamento(NomeDoDepartamento)
VALUES ('Administração');

INSERT INTO ATVBD.Funcionarios(nome, dataNascimento, Cargo, DepartID)
VALUES('Julio Neto','18/01/2000' ,'RH', 3),
('Julia Braga','05/02/2001' , 'HELPDESK', 1),
('Mourice Chagas','26/09/1980' , 'Engenheira Civil', 2),
('Bragas Cargo','11/01/2000' , 'Desenvolvedor Junior', 1),
('Carla Flora','05/01/1999' , 'Logística', 3),
('Maria Lu','20/10/1988' , 'Coordenadora', 3);

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
