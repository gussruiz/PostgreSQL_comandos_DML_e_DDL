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
