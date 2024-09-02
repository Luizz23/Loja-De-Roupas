create database lojaderoupas;

use  lojaderoupas;


create table clientes (

id_cliente int primary key not null auto_increment,
cpf_cliente varchar(14)  not null, 
nome_cliente varchar(50) not null,
endereco_cliente varchar(100) not null,
telefone_cliente varchar (13) not null



) default charset = utf8mb4;


use lojaderoupas;
insert into clientes values
(default, '964.524.265-70','Thiago Ferreira','Cidade Tiradentes-SP','(11)9569-7329'),
(default, '567.345.123-90','Luiz','Sapopemba-SP','(11)9876-1234'),
(default, '476.945.532-10','Pedro Mendes', 'Belenzinho-SP','(11)9456-2356');




select * from clientes; 
 update clientes
set id_cliente = '2' where cpf_cliente = '964.524.265-70';


delete from clientes
where cpf_cliente = '567.345.123-90';

select * from clientes;

drop table clientes;


desc clientes;

truncate clientes;


use lojaderoupas;

create table pedido(
numero_pedido integer primary key not null,
data_pedido date not null,
status_pedido varchar (50) not null,
id_cliente int not null auto_increment,

CONSTRAINT FK_ClienteProduto FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)

); 
  

alter table pedido
add id_cliente int not null;



ALTER TABLE pedido
add CONSTRAINT cpf_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);








insert into pedido values
('123456789','2023/09/20','Entregue',default),
('234567810', '2023/06/20', 'Analise', default),
('202033158', '2023/03/12', 'Entregue', default);

select * from pedido;
truncate pedido;
desc pedido;
drop table pedido;


 create table venda (
 id_venda integer primary key not null auto_increment,
 data_venda date not null,
 total_venda int (1),
 status_venda varchar(50),
 numero_pedido integer not null,
 id_produto varchar(4) not null,
 
 CONSTRAINT FK_PedidoVenda FOREIGN KEY (numero_pedido)
    REFERENCES pedido(numero_pedido),
    
    CONSTRAINT FK_VendaProduto FOREIGN KEY (id_produto)
    REFERENCES produto(id_produto)
 
 );
 insert into venda values
 ('235678123', '2023/09/10', '1', 'Concluida','123456789' , '010P'),
 ('908076113', '2023/06/15', '2', 'Cancelado', '234567810' , '011P'),
 ('234567103', '2023/03/12', '1', 'Taxado', '202033158' , '012P');
 
 

desc venda;
select * from venda;
drop table venda;
truncate venda;



create table produto(
id_produto varchar(4) primary key not null,
nome_produto varchar (50),
preco decimal (4,2),
descricao_produto text,
categoria_produto text




);
insert into produto values
('010P', 'Camisa de time', '60', 'Gênero: Masculino Clube: Internacional Gola: Redonda Material: Poliéster Reciclado Tipo: Torcedor Tecnologia: Dri-FitManga Manga CurtaEscudo: Bordado Composição: 100% Poliéster Reciclado' , 'Camisa de time Masculina' ),
('011P', 'Cropped da adidas', '40' , 'Cropped da adidas , Nosso queridinho com ótimo preço ,Tecido leve para aquele dia a dia de treino. malha em algodão penteado 30.1 tamanho  P, M, G e GG' , 'Croppeds' ),
('012P' , 'Polo Lacoste', '70', 'Camisa Polo Lacoste Bordado Camisa: Gola Polo Lacoste Indicado para: Dia a DiaManga: Manga Curta Material:PIQUET MEDIDAS DA TAMANHOS : (P: Comprimento: 65cm;   Largura: 50cm; manga 18 cm ) (M: Comprimento: 68cm;  Largura: 52cm; manga 19 cm ) (G: Comprimento: 70cm;   Largura: 54cm; manga 20 cm ) (GG: Comprimento: 72cm; Largura: 56cm; manga 22 cm )', 'Polos');


select * from produto;
desc produto;
drop table produto;
truncate produto;






create table estoque(
id_itemestoque varchar (4) primary key,
quantidade int not null,
data_entrada date not null,
id_produto varchar(4) not null,




CONSTRAINT FK_EstoqueProduto FOREIGN KEY (id_produto)
    REFERENCES produto(id_produto)

);

insert into estoque values 
('12E','100', '2022/10/25' , '010P'),
('13E', '900', '2021/12/30' , '011P'),
('14E', '150', '2023/5/17' , '012P');


desc estoque;
select * from estoque;
truncate estoque;
drop table estoque;






CREATE TABLE fornecedor (
    FornecedorID varchar(4) PRIMARY KEY,
    cpnj_forn varchar (18) not null,
    NomeFornecedor VARCHAR(50) not null,
    email_forn varchar (100),
    telefone_forn varchar (13) not null
 
);

insert into fornecedor values
('020F', '72.232.964/0001-76', 'João', 'joãovitor341@gmail.com', '(11)9574-935'),
('021F', '20.455.761/0001-45', 'Pedro', 'pedro35@gmail.com', '(11)93241-967'),
('022F', '50.015.508/0001-31', 'Maria', 'maria31@gmail.com', '(11)94567-891');


desc fornecedor;
select * from fornecedor;
drop table fornecedor;




CREATE TABLE gerente (
id_gerente varchar (4) primary key not null,
nome_gerente varchar (50) not null,
cpf_gerente varchar (14) not null,
login varchar (40) not null,
senha varchar (10) not null


);

insert into gerente values 
('030G', 'Glauber', '684.354.470-30', 'Glauber', 'gl0607o1'),
('031G', 'Luiza', '506.825.870-95', 'Luiza', 'luiza0130'),
('032G', 'Marlon', '433.117.010-11', 'Marlon01G', 'M01G737');


desc gerente;
select * from gerente;


CREATE TABLE funcionario (
    cpf_funcionario varchar(14) PRIMARY KEY not null,
    Nome_Funcionario VARCHAR(50) not null,
    Cargo varchar(50) not null,
    telefone_func varchar (13) not null
    
);

insert into funcionario values
('698.191.600-22', 'Pepinho', 'Estoquista', '(11)9547-7534'),
('543.435.840-62', 'Kakau', 'Atendente', '(11)9786-5621'),
('268.512.210-98', 'Leo', 'Vendedor', '(11)9786-4359');


desc funcionario;
select * from funcionario;
drop table funcionario;


create table Tfinanceira (
idtransacao varchar(4)  primary key not null,
data_transacao date not null,
descricao_transacao text not null,
valor_transacao varchar(8) not null,
id_cliente int not null auto_increment,

CONSTRAINT FK_financliente FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente)


);


insert into Tfinanceira values
('041T', '2023/02/20', 'Pagamento do Cropped', 'R$ 100', default),
('042T', '2022/12/30', 'Pagamento da Polo', 'R$ 200', default),
('043T', '2023/06/20', 'Pagamento da Camisa de time da frança', ' R$ 300', default);


select * from Tfinanceira;
drop table Tfinanceira;