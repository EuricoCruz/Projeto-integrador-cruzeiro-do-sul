-- Exercício 2

-- Passo 1: neste mesmo arquivo, após a queries, é possível encontrar o script para criação e inserção dos dados nas tabelas. 
-- Passo 2: basta executar as queries para obter as informações solicitadas 

-- Criar uma query apresentanto os pilotos por equipe

select tp.nm_piloto as piloto, te.nm_equipe as equipe 
from 
	TB_PILOTO tp 
join 
	TB_EQUIPE te 
on 
	tp.id_equipe = te.id_equipe;

-- Criar uma query que exibe a quantidade de pilotos por ano de nascimento, ordenando-os por este 
-- aspecto de forma ascendente – do ano mais antigo ao mais recente;

Select 
	YEAR(dt_nascimento) as Ano, count(*) as Pilotos 
from 
	TB_PILOTO
group by Year(dt_nascimento)
order by YEAR(dt_nascimento) asc;

-- Criar uma query que exibe o nome do piloto, o país de nascimento, nome da equipe, país da equipe, 
-- colocação final, nome do circuito e a data da realização da prova – lembre-se de utilizar o mesmo DER.

Select tp.nm_piloto as Piloto, tbp.nm_pais as Nacionalidade, 
	te.nm_equipe as equipe, tbpe.nm_pais as Nacionalidade_equipe, 
	tr.nr_coloc_final as colocacao, tc.nm_circuito as circuito,
	DATE_FORMAT(tbpr.dt_prova, '%d-%m-%Y') as 'Data' from TB_RESULTADO tr
join 
	TB_PILOTO tp
on
	tr.id_piloto = tp.id_piloto
join 
	TB_PAIS tbp
on 
	tp.id_pais = tbp.id_pais
join 
	TB_EQUIPE te 
on 
	tp.id_equipe = te.id_equipe 
join 
	TB_PROVA tbpr
on 
	tbpr.id_prova = tr.id_prova
join
	TB_CIRCUITO tc 
on tc.id_circuito = tbpr.id_circuito
left join 
	TB_PAIS tbpe
on 
	tbpe.id_pais = te.id_pais;


drop table if exists TB_RESULTADO;
drop table if exists TB_PILOTO; 
drop table if exists TB_PROVA;
drop table if exists TB_CIRCUITO;
drop table if exists TB_EQUIPE;
drop table if exists TB_PAIS;

-- Criar tabela - 
create table TB_PAIS (  
  id_pais int auto_increment primary key,
  nm_pais varchar (50) not null,  
  nr_populacao int
);

-- Inserir dados na tabela
insert into TB_PAIS (nm_pais, nr_populacao) values ('Brasil', 212600);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Italia', 59550);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Alemanha', 83240);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Grã-Bretanha', 64550);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Canadá', 38010);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Mexico', 128900);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Japão', 125800);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Holanda', 17440);
insert into TB_PAIS (nm_pais, nr_populacao) values ('França', 67390);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Hungria', 9750);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Suiça', 8637);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Espanha', 47350);
insert into TB_PAIS (nm_pais, nr_populacao) values ('EUA', 329500);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Austrália', 25690);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Bélgica', 11560);
insert into TB_PAIS (nm_pais, nr_populacao) values ('Irlanda', 49995);


--  Consultar dados na tabela
select * from TB_PAIS;

create table TB_EQUIPE (  
 id_equipe int not null auto_increment primary key,
 nm_equipe varchar (50) not null,  
 id_pais int not null,
 constraint FK_id_pais_eq foreign key (id_pais) references TB_PAIS(id_pais)
);

insert into TB_EQUIPE (nm_equipe, id_pais) values ('Ferrari', 2);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Mercedes-Benz', 4);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('McLaren', 4);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Williams', 4);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Red Bull/Honda', 4);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Alfa Romeo', 11);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Alpine', 4);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('AlphaTauri', 1);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Haas', 13);
insert into TB_EQUIPE (nm_equipe, id_pais) values ('Aston Martins', 4);

select * from TB_EQUIPE;

create table TB_CIRCUITO (
	id_circuito int not null auto_increment primary key,
    nm_circuito varchar(100) not null, 
    nr_extensao varchar(50) not null,
    id_pais int not null,
    constraint FK_id_pais_circ foreign key (id_pais) references TB_PAIS(id_pais)
);

insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Interlagos', '4.309', 1);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Monaco', '3.337', 2);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Gilles Villeneuve', '4.361', 5);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Miami', '5412', 13);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Catalunha', '4655', 12);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Silverstone', '5891', 4);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Suzuka', '5821', 7);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Zandvoort', '4252', 8);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Hungaroring', '4381', 11);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Monza', '5793', 1);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Albert Park', '5303', 14);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Paul Ricard', '5842', 9);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Hermanos Rodríguez', '4304', 6);
insert into TB_CIRCUITO (nm_circuito, nr_extensao, id_pais) values ('Spa-Francorchamps', '7004', 15);


select * from TB_CIRCUITO;

create table TB_PROVA(
	id_prova int not null auto_increment primary key,
    dt_prova date not null,
    nm_situacao varchar(50) not null,
    nm_prova varchar(50) not null,
    id_circuito int not null,
    constraint FK_id_circuito foreign key (id_circuito) references TB_CIRCUITO(id_circuito)
);

insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('29-05-2022', '%d-%m-%Y'), 'Em aberto', 'GP de Mônaco', 2);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('22-05-2022', '%d-%m-%Y'), 'Em aberto', 'GP da Espanha', 5);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('08-05-2022', '%d-%m-%Y'), 'Finalizada', 'GP de Miami', 4);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('14-11-2021', '%d-%m-%Y'), 'Finalizado', 'GP do Brasil', 1);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('10-04-2022', '%d-%m-%Y'), 'Finalizada', 'GP da Austrália', 11);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('20-06-2021', '%d-%m-%Y'), 'Finalizada', 'GP da França', 9);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('07-11-2021', '%d-%m-%Y'), 'Finalizada', 'GP do México', 13);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('04-06-2021', '%d-%m-%Y'), 'Finalizada', 'GP da Austrália', 11);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('09-05-2021', '%d-%m-%Y'), 'Finalizada', 'GP da Espanha', 5);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('01-08-2021', '%d-%m-%Y'), 'Finalizada', 'GP do Húngria', 9);
insert into TB_PROVA (dt_prova, nm_situacao, nm_prova, id_circuito) values (STR_TO_DATE('05-09-2021', '%d-%m-%Y'), 'Finalizada', 'GP da Holanda', 8);



select * from TB_PROVA;

create table TB_PILOTO(
	id_piloto int not null auto_increment primary key, 
    nm_piloto varchar(255) not null,
    dt_nascimento date not null, 
    id_pais int not null, 
    id_equipe int not null,
    constraint FK_id_pais_piloto foreign key (id_pais) references TB_PAIS(id_pais),
    constraint FK_id_equipe_piloto foreign key (id_equipe) references TB_EQUIPE(id_equipe)
);

insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Lewis Hamilton', STR_TO_DATE('07-01-1985', '%d-%m-%Y'), 4, 2);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Charles Lecrerc', STR_TO_DATE('16-10-1997', '%d-%m-%Y'), 2, 1);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Ayrton Senna', STR_TO_DATE('21-03-1960', '%d-%m-%Y'), 1, 3);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Max Verstappen', STR_TO_DATE('30-09-1997', '%d-%m-%Y'), 15, 5);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Daniel Ricciardo', STR_TO_DATE('01-07-1989', '%d-%m-%Y'), 14, 3);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Michael Schumacher', STR_TO_DATE('03-01-1969', '%d-%m-%Y'), 3, 2);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Valtteri Bottas', STR_TO_DATE('28-08-1989', '%d-%m-%Y'), 15, 6);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Fernando Alonso', STR_TO_DATE('29-07-1981', '%d-%m-%Y'), 12, 7);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Sebastian Vettel', STR_TO_DATE('03-07-1987', '%d-%m-%Y'),3, 10);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Sergio Pérez', STR_TO_DATE('26-01-1990', '%d-%m-%Y'), 6, 5);
insert into TB_PILOTO(nm_piloto, dt_nascimento, id_pais, id_equipe) values ('Esteban Oco', STR_TO_DATE('17-09-1996', '%d-%m-%Y'), 9, 7);
select * from TB_PILOTO;

create table TB_RESULTADO(
	id_prova int not null, 
    id_piloto int not null, 
    nr_tempo_prova time not null, 
    nr_posicao_grid int not null, 
    nr_coloc_final int not null,
    nr_melhor_volta time not null, 
    constraint FK_id_prova_resultado foreign key (id_prova) references TB_PROVA(id_prova),
    constraint FK_id_piloto_resultado foreign key (id_piloto) references TB_PILOTO(id_piloto) 
);

insert into TB_RESULTADO values (3, 4, 013733, 3, 1, 000134);
insert into TB_RESULTADO values (4, 1, 013222, 1, 1, 000111);
insert into TB_RESULTADO values (5, 2, 012746, 1, 1, 000120);
insert into TB_RESULTADO values (6, 4, 012725, 1, 1, 000136);
insert into TB_RESULTADO values (7, 4, 013839, 3, 1, 000118);
insert into TB_RESULTADO values (8, 4, 012354, 2, 1, 000106);
insert into TB_RESULTADO values (9, 1, 015823, 1, 1, 000120);
insert into TB_RESULTADO values (10, 11, 020433, 8, 1, 000121);
insert into TB_RESULTADO values (11, 4, 013005, 1, 1, 000113);


select * from TB_RESULTADO;



