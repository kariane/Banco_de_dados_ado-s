create table endereco
  (
   id_endereco int identity(1,1),
   constraint pk_endereco primary key (id_endereco),
   pais varchar(50),
   estado varchar(50),
   cidade varchar(100),
   bairro varchar(100),
   logradouro varchar(100),
   numero int,
   complemento varchar(50),
   cep int
  )

  create table tipo_chamado
  (
  id_tipo int identity(1,1),
  constraint pk_tipo primary key (id_tipo),
  tipo_chamado varchar(70)
  )
create table chamado
 (
  id_chamado int identity(1,1),
  constraint pk_chamado primary key (id_chamado),
  data_chamado date,
  texto_chamado varchar(500),
  id_endereco int,
  constraint fk_endereco foreign key (id_endereco)
  references endereco (id_endereco),
  id_tipo int,
  constraint fk_tipo foreign key (id_tipo)
  references tipo_chamado (id_tipo)
  )
   create table mensagem
  (
   id_mensagem int identity(1,1),
   data_mensagem date,
   texto_mensagem varchar(1000),
    constraint pk_mensagem primary key (id_mensagem)
  )
  GO
insert into mensagem (data_mensagem,texto_mensagem)
values('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')

GO
  create table relato
  (
   id_relato int identity(1,1),
   data_relato date,
   texto_relato varchar(1000),
    constraint pk_relato primary key (id_relato)
  )
GO
insert into relato (data_relato,texto_relato)
values('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
('2020-04-04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')

GO
  create table telefone_usu
  (
   id_telefone int identity(1,1),
   constraint pk_telefone primary key (id_telefone),
   codigo_pais varchar(50),
   ddd varchar(5),
   numero varchar(10)
  )
create table usuario
 (
 id_usuario int identity(1,1),
 nome_usuario varchar(100),
 email_usuario nvarchar (100),
 senha_usuario nvarchar(10),
 id_telefone int,
 constraint fk_telefone foreign key (id_telefone)
 references telefone_usu (id_telefone),
 id_chamado int
 constraint fk_chamado foreign key (id_chamado)
 references chamado (id_chamado),
 id_mensagem int,
 constraint fk_mensagem foreign key (id_mensagem)
 references mensagem (id_mensagem),
 id_relato int,
 constraint fk_relato foreign key (id_relato)
 references relato (id_relato),
 constraint pk_usuario primary key (id_usuario)
 )
 GO
 insert into usuario(nome_usuario,email_usuario,senha_usuario,id_mensagem, id_relato)
 values    ('usuario1', 'usuario1123@usuario1.com','usuario1',2,2),
				  ('usuario2', 'usuario1123@usuario2.com','usuario2', 3,3),
				  ('usuario3', 'usuario1123@usuario1.com','usuario2',1,1)
GO
 create table produto
 (
  Id_produto int identity(1,1),
  nome_produto varchar(30),
  preco_produto money,
  descricao_produto varchar(200),
  constraint pk_produto primary key (id_produto)
 )
  GO
 insert into produto(nome_produto,preco_produto, descricao_produto)
 values    ('produto1','4.5','AGENDAROXA'),
				  ('produto2','4.5','AGENDAROSA'),
				  ('produto3','4.5','AGENDAVERMELHA')
GO
 create table vendaproduto
 (
  id_vendaproduto int identity(1,1),
  data_vendaproduto date,
  id_produto int,
  constraint fk_produto foreign key (id_produto)
  references produto (id_produto),
  id_usuario int,
  constraint fk_usuario foreign key (id_usuario)
  references usuario (id_usuario),
  constraint pk_vendaproduto primary key (id_vendaproduto)
  )
  GO
insert into vendaproduto(data_vendaproduto,id_produto, id_usuario)
values('2020-04-04', 1,2),
('2020-04-04',3,3),
('2020-04-04', 2,1)

GO
Select*from mensagem
inner join usuario
ON mensagem.id_mensagem=usuario.id_mensagem
Select * from produto
inner join vendaproduto
ON produto.id_produto=vendaproduto.id_produto
