create table biblioteca
(
	Id_Biblioteca int identity(1,1),
	Nome_biblioteca varchar(100),
	Diretor varchar(50),
	constraint pk_biblioteca primary key (Id_Biblioteca)
)
create table livro
(
Id_Livro int identity(1,1),
Nome_livro varchar(100),
data_lancamento date,
autor_livro varchar(15),
genero varchar(30)
constraint pk_livro primary key (Id_Livro)
)
create table volume
(
	Id_Volume int identity(1,1),
	Quantidade_livro int,
	Quantidade_disponivel int,
	constraint pk_volume primary key (Id_Volume)
)
create table filial
(
Id_Filial int identity(1,1),
Nome_filial varchar(100),
Endereço nvarchar(100),
Telefone nvarchar(15),
Id_Volume int,
constraint fk_volume foreign key (Id_Volume)
references volume (Id_Volume),
constraint pk_pessoa primary key (Id_Filial)
)
create table cliente
(
Id_Cliente int identity(1,1),
Nome_cliente varchar(40),
Id_Livro int,
constraint fk_livro foreign key (Id_Livro)
references livro (Id_Livro),
Data_recebimento date,
Data_devolução date,
Id_Filial int,
constraint fk_filial foreign key (Id_Filial)
references filial (Id_Filial)
)
insert into biblioteca (Nome_biblioteca, Diretor)
values ('Senac', 'Bruno'),
('Saraiva', 'Gerson'),
('Sebo','Alexandre'),
('Cultura', 'Danilo'),
('Nobel', 'Simone')
GO
insert into livro (Nome_livro, data_lancamento, autor_livro, genero)
values('Diario de um Banana 1', '2010-01-01', 'Jeff Kinney', 'comedia'),
('Diario de um Banana 2', '2011-01-01', 'Jeff Kinney', 'comedia'),
('Diario de um Banana 3', '2012-01-01', 'Jeff Kinney', 'comedia'),
('Diario de um Banana 4', '2013-01-01', 'Jeff Kinney', 'comedia'),
('Diario de um Banana 5', '2014-01-01', 'Jeff Kinney', 'comedia')
GO
insert into volume(Quantidade_livro, Quantidade_disponivel)
values(4,3),
(5,4),
(6,5),
(7,6),
(8,7)
GO
insert into filial (Nome_filial, Endereço, Telefone, Id_Volume)
values('adf', 'SP',5511956545656, 3),
('afd', 'MG',5511956545656, 4),
('daf', 'RJ',5511956545656, 2),
('fad', 'AC',5511956545656, 5),
('dfa', 'ES',5511956545656, 1)
GO
insert into cliente (Nome_cliente, Id_Livro, Data_recebimento, Data_devolução, Id_Filial)
values('João', 1, '2020-04-04', '2020-05-05', 3),
('Maria', 4, '2020-04-04', '2020-05-05', 5),
('Pedro', 1, '2020-04-04', '2020-05-05', 4),
('Murilo', 3, '2020-04-04', '2020-05-05', 1),
('Carla', 2, '2020-04-04', '2020-05-05', 2)
GO
Select * from livro
inner join cliente
ON livro.Id_Livro=cliente.Id_Livro
Select*from filial
inner join cliente
ON filial.Id_Filial=cliente.Id_Filial
Select*from volume
inner join filial
ON volume.Id_Volume=filial.Id_Volume