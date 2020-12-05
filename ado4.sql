create database ado4;
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
  );
   go 

 insert into endereco( pais, estado, cidade, bairro, logradouro, numero, complemento, cep)
		values    ('Brasil','são paulo','são paulo', 'vila mariana','rua y', 541, 'casa 3', 773737373),
				  ('Brasil','são paulo','são paulo', 'vila mariana','rua y', 541, 'casa 3', 773737373),
				  ('Brasil','são paulo','são paulo', 'vila mariana','rua y', 541, 'casa 3', 773737373);
go
  create table tipo_chamado
  (
  id_tipo int identity(1,1),
  constraint pk_tipo primary key (id_tipo),
  tipo_chamado varchar(70)
  );
   go 

 insert into tipo_chamado(tipo_chamado)
		values    ('fisica'),
				  ('moral'),
				  ('verbal');
go
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
  );
   go 

 insert into chamado (data_chamado,texto_chamado, id_endereco,id_tipo)
		values    (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 1,2),
				  (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 2,3),
				  (2020-09-11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 3,1);
go
   create table mensagem
  (
   id_mensagem int identity(1,1),
   data_mensagem date,
   texto_mensagem varchar(1000),
    constraint pk_mensagem primary key (id_mensagem)
  );
     go 

 insert into mensagem(data_mensagem,texto_mensagem)
		values    (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
				  (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' ),
				  (2020-09-11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' );
go
  create table relato
  (
   id_relato int identity(1,1),
   data_relato date,
   texto_relato varchar(1000),
    constraint pk_relato primary key (id_relato)

  );
  go

  insert into relato(data_relato,texto_relato)
		values    (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
				  (2020-09-11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' ),
				  (2020-09-11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' );
go
create table usuario
 (
 id_usuario int identity(1,1),
 nome_usuario varchar(100),
 email_usuario nvarchar (100),
 senha_usuario nvarchar(10),
 id_chamado int,
 constraint fk_chamado foreign key (id_chamado)
 references chamado (id_chamado),
 id_mensagem int,
 constraint fk_mensagem foreign key (id_mensagem)
 references mensagem (id_mensagem),
 id_relato int,
 constraint fk_relato foreign key (id_relato)
 references relato (id_relato),
 constraint pk_usuario primary key (id_usuario)
 );
 go 

 insert into usuario ( nome_usuario, email_usuario, senha_usuario, id_chamado,id_mensagem)
		values    ('teste123', 'teste123@teste.com','teste26626Ta', 1,2),
				  ('teste123', 'teste123@teste.com','teste26626Ta', 2,3),
				  ('teste123', 'teste123@teste.com','teste26626Ta', 3,1);
go
 create table produto
  (
   Id_produto int identity(1,1),
   nome_produto varchar(30),
   preco_produto smallmoney,
   descricao_produto varchar(200),
   constraint pk_produto primary key (id_produto)
  );
   go 

 insert into produto ( nome_produto, preco_produto, descricao_produto)
		values    ('produto1', 4.56,'agendaROSA'),
				  ('produto2', 4.56,'agendaROXA'),
				  ('produto3',  4.56,'agendaVERMELHA');
go
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
  );
  go 

 insert into produto (data_vendaproduto, Id_produto,id_usuario)
		values    (2020-09-11, 1,2),
				  (2020-09-11, 2,3),
				  (2020-09-11, 3,1);
go