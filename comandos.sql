-- aula 1

-- aula 2

create temporary table a (
	coluna1 varchar(255) not null check(coluna1 <> ''),
);

insert into a values (''); 

drop table a;


create temporary table a (
	coluna1 varchar(255) not null check(coluna1 <> ''),
	coluna2 varchar(255) not null,
	unique (coluna1, coluna2)
);

insert into a values ('a', 'b'); 

insert into a values ('a', 'c'); 


alter table a rename to teste;

select * from teste;

alter table teste rename coluna1 to pimeira_coluna;
alter table teste rename coluna2 to segunda_coluna;

-- aula 3

-- revisão sobre o comando INSERT 

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);


INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
    'Vinicius', 'Dias', '1997-10-15'
), (
    'Patrícia', 'Freitas', '1996-10-25'
), (
    'Diogo', 'Oliveira', '1994-08-27'
), (
    'Maria', 'Rosa', '1985-01-01'
);


INSERT INTO categoria (nome) VALUES ('Front-End'), ('Programação'), ('Banco de dados'), ('Data Science');


INSERT INTO curso (nome, categoria_id) VALUES
    ('HTML',1),
    ('CSS',1),
    ('JS',1),
    ('PHP',2),
    ('Java',2),
    ('C++',2),
    ('PostgreSQL',3),
    ('MySQL',3),
    ('Oracle',3),
    ('SQL Server',3),
    ('SQLite',3),
    ('Pandas',4),
    ('Machine Learning',4),
    ('Power BI',4);


INSERT INTO aluno_curso VALUES (1,4), (1,11), (2,1), (2,2), (3,4), (3,3),(4,4), (4,6),(4,5);


create temporary table cursos_programacao(
	id_curso integer primary key,
	nome_curso varchar(255) not null
);

-- insert into cursos_programacao values (4, 'PHP'), (5, 'Java'), (6, 'C++'); 
-- funciona mas pode ser mais facil

insert into cursos_programacao
select curso.id, curso.nome from curso where categoria_id = 2;

select * from cursos_programacao;



create schema teste;


create table teste.cursos_programacao(
	id_curso integer primary key,
	nome_curso varchar(255) not null
);

insert into teste.cursos_programacao
select curso.id, curso.nome from curso where categoria_id = 2;