create database delegacia;	
drop database delegacia;
use delegacia;

create table vitima(
idVitima int primary key auto_increment,
nome varchar(50),
dataNasc date,
genero varchar(10),
causaMorte varchar(50),
cep char(9),
numeroCasa int,
celular char(11),
telefone char(8)
) auto_increment= 10;

create table suspeito(
idSuspeito int primary key auto_increment,
nome varchar(50),
dataNasc date,
genero varchar(10),
antecedenteCriminal varchar(60),
cep char(9),
numero int,
celular char(12),
telefone char(9)
)auto_increment=1000;

create table unidade(
idUnidade int primary key auto_increment,
zona char(10)
)auto_increment=500; 

create table detetive(
idDetetive int primary key auto_increment,
nome varchar(50),
fkAssistente int,
fkUnidade int,
constraint detetiveFkUnidade foreign key(fkUnidade) references unidade(idUnidade)
);

 -- associativa --
 create table crime(
idCrime int auto_increment,
localizacao varchar(50),
zona char(10),
dtData date,
tipoCrime varchar(50),
armaCrime varchar(50),
fkVitima int,
fkSuspeito int,
fkDetetive int,
constraint fksuspeito foreign key(fkSuspeito) references suspeito(idSuspeito),
constraint fkdetetive foreign key(fkDetetive) references detetive(idDetetive),
constraint fkvitima foreign key(fkVitima) references vitima(idVitima),
constraint pktripla primary key (idCrime, fkDetetive, fkVitima, fkSuspeito)
) auto_increment =100;

insert into vitima values
(null, 'Daniel Zapatta', '2000-02-01', 'Homem', 'asfixia', '00000-001', 13, '94002-8922', null),
(null, 'Diego Hessel', '1999-10-01', 'Homem', 'facada', '00000-002', 34, '94002-0000', null),
(null, 'Michael Jackson', '2002-02-01', 'Homem', 'envenenamento', '00000-003', 55, '94002-8900', null),
(null, 'Davi Maciel', '2003-02-01', 'Homem', 'eletrocutado', '00000-004', 666, '94002-8922', null);

insert into suspeito values
(null, 'Guilherme Nascimento', '1998-03-20', 'Homem', 'homicidio', '00000-004', 500, '94102-8922', null),
(null, 'Kauã de Queiroz Telles', '1994-03-20', 'Homem', null , '00000-089', 123, '94102-8000', null),
(null, 'Poliana Michelini', '1992-03-20', 'Mulher', 'agressão', '00000-224', 567, '94102-002', null);

insert into unidade values
(null, 'Sul'),
(null, 'Leste'),
(null, 'ABC');

insert into detetive values
(null,'Barbara Souza',null, 500),
(null,'Felipe Venture',1, 501),
(null,'Cherlock Holmes',2, 502);

insert into crime values
(null, 'são paulo', 'sul', '2023-05-20', 'homicidio', 'corda', 10, 1001, 2),
(null, 'são paulo', 'zona', '2023-05-24', 'latrocinio', 'faca',11, 1002, 3),
(null, 'são paulo', 'sul', '2023-05-1', 'homicidio', 'veneno',12, 1000, 1);


select * from vitima;	
select * from detetive;
select * from crime;
select * from suspeito;
select * from unidade;

-- Mostar a quantidade de Vitimas 
select count(vitima.idVitima) as Quantidade_Vitimas from vitima;

SELECT * FROM vitima WHERE idVitima = 10;

-- SELECT * FROM vitima JOIN suspeito ON idVitima = fkVitima
-- JOIN crime ON idSuspeito = fk;
