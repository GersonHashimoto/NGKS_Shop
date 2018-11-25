create database ngks
use ngks
drop table pedido

create table cliente(
id int primary key not null auto_increment
,nome varchar(50)
,datanascimento date not null
,cpf varchar(15) unique not null 
,endereco varchar(100) not null
,telefone varchar(15) not null
,email varchar(50) not null
)

create table pedido(
id int primary key not null auto_increment
,idcliente int not null
,datapedido date not null
,frete decimal(10,2) not null 
,valortotal decimal(10,2) not null
,constraint fkpedido foreign key(idcliente) references cliente(id) 
)

create table categoria(
id int primary key not null auto_increment
,slug varchar(50) not null
,nome varchar(50) not null
,modificado datetime not null
,criado datetime not null
)

create table produto(
id int primary key not null auto_increment
,idcategoria int not null
,slug varchar(50)
,tipo varchar(30) not null
,descricao varchar(100) not null
,valor decimal(10,2) not null
,constraint fkproduto foreign key(idcategoria) references categoria(id) 
)

create table materiaprima(
id int primary key not null auto_increment
,idproduto int not null
,tipo varchar(30) not null
,descricao varchar(100) not null
,quantidade int not null
,valor decimal(10,2) not null
,constraint fkmateriaprima foreign key(idproduto) references produto(id)
)

create table fornecedor(
id int primary key not null auto_increment
,idmateriaprima int not null
,nome varchar(50) not null
,cnpj varchar(18) unique not null
,endereco varchar(100) not null
,telefone varchar(15) not null
,constraint fkfornecedor foreign key(idmateriaprima) references materiaprima(id)
)

create table caixa(
id int primary key not null auto_increment
,idpedido int not null
,credito decimal(10,2) not null
,debito decimal(10,2) not null
,saldo decimal(10,2) not null
,constraint fkcaixa foreign key(idpedido) references pedido(id)
)

create table catalogo(
id int primary key not null auto_increment
,idcategoria int not null
,constraint fkcatalogo foreign key(idcategoria) references categoria(id)
)

create table estoque(
id int primary key not null auto_increment
,idproduto int not null
,constraint fkestoque foreign key(idproduto) references produto(id)
)

create table devolucao(
id int primary key not null auto_increment
,idpedido int not null
,constraint fkdevolucao foreign key(idpedido) references pedido(id)
)

create table troca(
id int primary key not null auto_increment
,idpedido int not null
,constraint fktroca foreign key(idpedido) references pedido(id)
)

create table estoquematprima(
id int primary key not null auto_increment
,idmateriaprima int not null
,constraint fkestoquematprima foreign key(idmateriaprima) references materiaprima(id)
)

create table fornecedor_materiaprima(
idfornecedor int not null
,idmateriaprima int not null
,constraint pkfornecedor_materiaprima primary key(idfornecedor, idmateriaprima)
,constraint fkfornecedor_materiaprima foreign key(idfornecedor) references fornecedor(id)
,constraint fkfornecedor_materiaprima2 foreign key(idmateriaprima) references materiaprima(id)
)

create table pedido_produto(
idpedido int not null 
,idproduto int not null
,quantidade int not null
,constraint pkidpedido_produto primary key(idpedido, idproduto)
,constraint fkpedido_produto foreign key(idpedido) references pedido(id)
,constraint fkped_produto foreign key(idproduto) references produto(id)
)


create table carrinho(
id int primary key not null auto_increment
,idproduto int not null
,quantidade int not null
,constraint fkcarrinho foreign key(idproduto) references produto(id)
)

select * from produto