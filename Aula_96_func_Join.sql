create database senai_tech;

use senai_tech;

create table departamentos ( 
id int,
nome varchar(60),
primary key(id)
);

create table funcionarios(
id int,
nome VARCHAR(60),
sobrenome VARCHAR(60),
salario decimal(10,2),
id_departamento int,
primary key(id),
foreign key (id_departamento) references departamentos (id)
);

select * from funcionarios;

#Liste nome, sobrenome e nome do departamento dos funcionários.
select f.nome, f.sobrenome, d.nome as nome_departamento
from funcionarios f
inner join departamentos d 
on f.id_departamento = d.id;

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI
select f.nome, f.sobrenome, d.nome as nome_departamento
from funcionarios f
inner join departamentos d 
on f.id_departamento = d.id
where d.nome = 'TI';

#Liste nome, sobrenome e nome do departamento dos funcionários do departamentos de TI ordenado pelo nome
select f.nome, f.sobrenome, d.nome as nome_departamento
from funcionarios f
inner join departamentos d 
on f.id_departamento = d.id
where d.nome = 'TI'
order by f.nome;

#Liste nome, sobrenome, salario e nome do departamento dos funcionários do departamentos de TI que recebem acima de 5000 ordenado pelo nome
select f.nome, f.sobrenome, f.salario, d.nome as nome_departamento
from funcionarios f
inner join departamentos d 
on f.id_departamento = d.id
where d.nome = 'ti' and f.salario > 5000
order by f.nome;

#Calcular a média salarial dos funcionários em cada departamento
select d.nome, avg(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
group by d.id;

#Mostrar o nome completo (concatenando nome e sobrenome) dos funcionários que pertencem ao departamento "TI"
  select concat(f.nome, ' ', f.sobrenome) as nome_completo
  from funcionarios f 
  inner join departamentos d on f.id_departamento = d.id
  where d.nome = 'TI';
  
  #calcular a soma total de todos os funcionarios no departamento de "recursos humanos"
  select d.nome, sum(f.salario) as folha_salarial
  from funcionarios f 
  inner join departamentos d on f.id_departamento = d.id
  where d.nome = 'recursos humanos';
  
  #contar quantos funcionarios cada departamentos possui
  select d.nome, count(*) as numero_funcionarios
  from funcionarios f
  inner join departamentos d on f.id_departamento = d.id
  group by d.id;
  
  #listar os funcionarios que ganham mais de 700 em ordem alfabética
  select nome, sobrenome, salario
  from funcionarios
  where salario > 7000
  order by nome;
  
#mostrar o nome do departamento e a media de salario dos funcionarios de cada departamento 
select d.nome, avg(f.salario) as media_salarial 
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id
group by d.id;
  
  #mostrar os funcionarios que tem sobrenome "matisse" e seus respectivos departamentos 
  select concat(f.nome, ' ',f.sobrenome) as nome_completo, d.nome
  from funcionarios f 
  inner join departamentos d on f.id_departamento = d.id
  where f.sobrenome =  'matisse';
  
  
  
  
  
  
  
  