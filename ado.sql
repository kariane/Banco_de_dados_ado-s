create table filme
(
	Id_filme int identity(1,1),
	Nome_filme varchar(100),
	Duracao nvarchar(100),
	Data_assisti date,
	Genero varchar(20),
	Identificacao varchar(30),
	Diretor varchar(50),
	Cinema varchar(30),
	Ano_lancamento int,
	Produtora varchar(40)
	constraint pk_filme primary key (Id_filme)
)
create table pessoas
(
Id_Pessoa int identity(1,1),
Nome_pessoa varchar(100),
Data_nascimento date,
sexo varchar(1),
email nvarchar(100),
telefone nvarchar(15),
constraint pk_pessoa primary key (Id_Pessoa)
)
create table bilhete
(
Id_bilhete int identity(1,1),
tipo_bilhete varchar(7),
preço money,
constraint pk_bilhete primary key (Id_bilhete)
)
create table filme_pessoa
(
Id_fp int identity(1,1),
Id_pessoa int,
constraint fk_pessoa foreign key (Id_pessoa)
references pessoas (Id_pessoa),
Id_filme int,
constraint fk_filme foreign key (Id_filme)
references filme (Id_filme),
Id_bilhete int,
constraint fk_bilhete foreign key (Id_bilhete)
references bilhete (Id_bilhete)
)
insert into filme ( Nome_filme, Duracao, Data_assisti, Genero, Identificacao, Diretor, Ano_lancamento, Cinema, Produtora)
values ('Donnie Darko','01:30:00','2020-08-13','Suspense', 'Filme legal','João', 2016,'CineMax','Disney'),
('Senhor de Aneis retorno do rei','01:30:00','2020-08-13','Suspense', 'Filme legal','João', 2016,'CineMax','Disney'),
('Senhor de Aneis sociedade do anel e ','01:30:00','2020-08-13','Suspense', 'Filme legal','João', 2016,'CineMax','Disney'),
('Senhor de Aneis duas torres','01:30:00','2020-08-13','Suspense', 'Filme legal','João', 2016,'CineMax','Disney'),
('Auto da compadecida','01:30:00','2020-08-13','Suspense', 'Filme legal','João', 2016,'CineMax','Disney')
GO
insert into pessoas (Nome_pessoa, Data_nascimento, sexo, email,telefone)
values ('Alexandre','1990-01-01','M','alexandre@senac.br',5511956545656),
('Anna','1990-01-01','F','alexandre@senac.br',5511956545656),
('Anna','1990-01-02','F','alexandre@senac.br',5511956545656),
('Anna','1990-01-03','F','alexandre@senac.br',5511956545656),
('Murilo','1990-01-04','M','alexandre@senac.br',5511956545656)
GO
insert into bilhete(tipo_bilhete, preço)
values ('Meia', 14),
('Inteira', 24),
('Meia', 14),
('Inteira', 24),
('Meia', 14)
GO
insert into filme_pessoa (Id_filme, Id_pessoa, Id_bilhete)
values (1,1,1),
	   (2,2,2),
       (3,3,3),
	   (4,4,4),
	   (5,5,5)
GO