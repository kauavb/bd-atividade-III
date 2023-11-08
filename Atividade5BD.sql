CREATE DATABASE ATV5BD;

USE ATV5BD;

CREATE TABLE Pedidos(
	idPedido int auto_increment primary key,
    nomeProduto varchar(155) not null,
    DataPedido varchar(10) not null,
    descricao varchar(255) not null,
    statusEntrega varchar(10) not null
);

INSERT INTO Pedidos(nomeProduto,DataPedido,descricao,statusEntrega)
VALUES('Pistola Nerf','06/07/2020','Meu produto ainda não chegou aff','Pendente'),
('Legolandia','19/11/2021','Entregou antes do prazo amei','Entregue'),
('Max Steel','25/03/2022','Foi entregue no lugar errado','Pendente'),
('Boneca Barbie','30/06/2023','Faz mais de 2 meses e meu produto não chegou','Pendente'),
('Cidade da Polly','05/11/2023','Obrigado, ta tudo certo massa','Entregue');

Create view vw_pedidos_pendentes AS
SELECT idPedido as 'ID',
		nomeProduto as 'Nome do Produto',
		statusEntrega as 'Status'
FROM Pedidos 
WHERE statusEntrega = 'Pendente'
order by id;

SELECT * FROM vw_pedidos_pendentes;
