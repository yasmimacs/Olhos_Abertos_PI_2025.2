
## Criação do banco de dados
create database olhosabertos;
use olhosabertos;

## Criação de tabela com as opções de gênero disponíveis para seleção na hora do cadastro de usuário
create table genero (
id_genero int auto_increment primary key,
genero varchar(100)
);

## Criação de tabela com as informações dos cadastros dos usuários
create table usuario (
	id_usuario int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(15) unique not null,
    idade int not null,
    fk_genero_id_genero int,
    telefone_usuario varchar(20) not null,
    email varchar(100) not null
);

## Inserção da chave estrangeira relacionada ao gênero na tabela usuário
alter table usuario
add foreign key (fk_genero_id_genero)
references genero (id_genero);

## Inserção dos dados dos gêneros disponíveis para seleção no cadastro dos usuários
insert into genero (genero)
values
	("Mulher cis"),
    ("Mulher trans"),
    ("Homem cis"),
    ("Homem trans"),
    ("Não-binário"),
    ("Gênero fluido"),
    ("Outro");
   
## Inserção dos dados de cadastros dos usuários     
insert into usuario (nome, cpf, idade, fk_genero_id_genero, telefone_usuario, email)
 values
	("Maria Silva", "152.173.204-80",29, 1, "(83)997460-3632", "mariasilva@email.com"),
	("Tiago Novato", "386.794.123-00", 32, 5, "(81)98290-3632", "tiagonovato@email.com"),
    ("Bruna Costa", "123.456.789-12", 19, 2, "(81)98760-2217", "brunacosta@email.com"),
    ("Alexandre Oliveira", "987.654.321-32", 40, 4, "(81)98632-1313", "alexandreoliveira@email.com"),
    ("Mariana Leivas", "951.357.852-64", 54, 1, "(85)99266-9999", "marianaleivas@email.com");


## Criação da tabela com as informações das delegacias
create table delegacia (
id_delegacia int auto_increment primary key,
nome_delegacia varchar(200) not null,
delegado varchar(100) not null,
rua varchar(100) not null,
numero int,
bairro varchar(100) not null,
latitude_delegacia decimal(9,6) not null,
longitude_delegacia decimal(9,6) not null,
telefone_delegacia varchar(20) not null
);

## Inserção dos dados das delegacias
insert into delegacia (nome_delegacia, delegado, rua, numero, bairro, latitude_delegacia, longitude_delegacia, telefone_delegacia)
values
	("Delegacia da Mulher", "Dra. Mariana Santos", "Praça do Campo Santos", null, "Santo Amaro", -8.04955, -34.88275, "(81)3184-3352"),
    ("02º Delegacia de Polícia - Boa Viagem", "Dr. Francisco Ferraz", "Av. Engenheiro Domingos Ferreira", 4420, "Boa Viagem", -8.12551, -34.90095, "(81)3184-3325"),
    ("Delegacia de Polícia Ipsep", "Dr. João Souza", "R. Jean Emile Favre", null, "Ipsep", -8.11179, -34.92219, "(81)3184-3478"),
    ("Delegacia de Polícia da 1ª Circunscrição", "Dra. Eduarda Gomes", "Av. Rio Branco", 155, "Recife", -8.06119, -34.87289, "(81)3184-3455"),
    ("06º Delegacia de Polícia - Casa Amarela", "Dr. Rodrigo Santos", "R. Paula Batista", 616, "Casa Amarela", -8.02580, -34.91717, "(81)3184-3426");
    
    
## Criação de tabela com as opções de *empresa* de ônibus disponíveis para seleção na hora do cadastro da denúncia
create table empresa_onibus (
id_empresa int auto_increment primary key,
empresa varchar(100) not null
);

## Inserção dos dados das empresas de ônibus disponíveis para seleção no cadastro das denúncias
insert into empresa_onibus (empresa)
values
	("Metropolitana"),
    ("Borborema");


## Criação de tabela com as opções de *linha* de ônibus disponíveis para seleção na hora do cadastro da denúncia
create table linha_onibus (
id_linha int auto_increment primary key,
linha varchar(100) not null
);

## Inserção dos dados das linhas de ônibus disponíveis para seleção no cadastro das denúncias
insert into linha_onibus (linha)
values
	("110 - Ibura/TI Prazeres"),
    ("115 - TI Aeroporto/TI Afogados"),
    ("315 - Bongi"),
    ("014 - Brasília (Conde da Boa Vista)"),
    ("018 - Brasília Teimosa"),
    ("050 - TI PE-15 / Boa Viagem");
    

## Criação de tabela com as opções de *número de ordem de veículo* dos ônibus disponíveis para seleção na hora do cadastro da denúncia
create table num_ordem_onibus (
id_num_ordem int auto_increment primary key,
num_ordem int not null
);

## Inserção dos dados dos números de ordem do veículo dos ônibus disponíveis para seleção no cadastro das denúncias 
insert into num_ordem_onibus (num_ordem)
values
	(001),
    (857),
    (521),
    (292),
    (321),
    (659);


## Criação da tabela com as informações das denúncias
create table denuncia (
id_denuncia int auto_increment primary key,
data_ocorrido date not null,
hora time not null,
latitude_ocorrido decimal(9,6),
longitude_ocorrido decimal(9,6),
relato varchar(500),
fk_empresa_onibus int,
fk_linha_onibus int,
fk_num_ordem_onibus int,
fk_usuario_id_usuario int,
fk_delegacia_id_delegacia int
);

## Inserção das chaves estrangeiras na tabela de cadastro da denúncia
alter table denuncia
add foreign key (fk_empresa_onibus)
references empresa_onibus (id_empresa);

alter table denuncia
add foreign key (fk_linha_onibus)
references linha_onibus (id_linha);

alter table denuncia
add foreign key (fk_num_ordem_onibus)
references num_ordem_onibus (id_num_ordem);

alter table denuncia
add foreign key (fk_usuario_id_usuario)
references usuario (id_usuario);

alter table denuncia
add foreign key (fk_delegacia_id_delegacia)
references delegacia (id_delegacia);


## Inserção dos dados dos cadastros das denúncias     
insert into denuncia (data_ocorrido, hora, latitude_ocorrido, longitude_ocorrido, relato, fk_empresa_onibus, fk_linha_onibus, fk_num_ordem_onibus, fk_usuario_id_usuario, fk_delegacia_id_delegacia)
values
	("2025-12-01", "12:32:20", -8.04970, -34.88260, null, 2, 3, 6, 1, 1),
	("2026-02-15", "15:29:25", -8.12540, -34.90110, "Indivíduo tocou no meu corpo sem autorização", 1, 5, 3, 2, 2),
    ("2026-03-21", "19:42:06", -8.11170, -34.92205, null, 1, 6, 2, 3, 3),
    ("2026-06-28", "09:15:57", -8.06110, -34.87275, null, 2, 4, 1, 4, 4),
    ("2026-10-28", "17:04:26", -8.02570, -34.91705, "Homem estava mexendo nas partes íntimas", 2, 1, 5, 5, 5);


## Criação da tabela com as categorias das mídias
create table categoria_midia (
id_categoria int auto_increment primary key,
categoria_midia varchar(20)
);

## Inserção dos dados para as categorias de mídias disponíveis
insert into categoria_midia (categoria_midia)
values
	("Imagem"),
    ("Vídeo"),
    ("Áudio");


## Criação da tabela com as mídias capturadas vinculadas as denúncias realizadas
create table midia_capturada (
num_midia int auto_increment primary key,
nome_arquivo varchar(100) not null,
fk_categoria_midia int,
fk_denuncia_id_denuncia int
);

## Inserção da chave estrangeira relacionada a categoria da mídia
alter table midia_capturada
add foreign key (fk_categoria_midia)
references categoria_midia (id_categoria);

## Inserção da chave estrangeira relacionada ao número identificador da denúncia
alter table midia_capturada
add foreign key (fk_denuncia_id_denuncia)
references denuncia (id_denuncia);


## Inserção dos dados das mídias capturadas vinculadas aos cadastros das denúncias
insert into midia_capturada (nome_arquivo, fk_categoria_midia, fk_denuncia_id_denuncia)
values
	("video001.mp4", 2, 1),
    ("imagem001.png", 1, 2),
    ("audio001.mp3", 3, 3),
    ("imagem002.png", 1, 3),
    ("video002.mp4", 2, 5);
    
    
select nome, idade from usuario;

select data_ocorrido, nome
from denuncia
inner join usuario
on denuncia.fk_usuario_id_usuario = usuario.id_usuario;

