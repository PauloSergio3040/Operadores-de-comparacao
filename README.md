# ⚖️ Script SQL - Operadores de Comparação e Lógicos (MySQL)

Este script demonstra o uso dos **principais operadores de comparação e lógicos** em consultas SQL, aplicados sobre uma tabela chamada `senso`.  
Os exemplos simulam cenários reais de análise de dados populacionais, permitindo compreender a sintaxe e a lógica por trás de filtros e condições no MySQL.

---

## 🎯 Objetivo
Ensinar como aplicar **condições e comparações** dentro de comandos `SELECT` utilizando operadores como  
`=`, `>`, `<`, `<>`, `>=`, `<=`, `like`, `in`, `is null`, `is not null`, `and`, `or` e `having`. 

---

## 🧱 Estrutura Base

O script parte de:

use curso;
select * from senso;
A tabela senso contém informações de municípios, populações, estados (cod_uf, estado, nome_mun) e ano do censo.

⚙️ Operadores Demonstrados
🔹 Igual (=)
Filtra registros com valores idênticos:

select * from senso
where cod_uf = '35'
and ano = '2014';
🔹 Maior (>) e Menor (<)
Seleciona cidades acima ou abaixo de determinado número de habitantes:

select * from senso
where populacao > 100000
and ano = '2014';
🔹 Menor ou Igual (<=)

select * from senso
where populacao <= 10000
and ano = '2014';
🔹 Diferente (<>)
Exclui determinados valores:

select * from senso
where cod_uf <> '35'
and cod_uf <> '14';
🔹 Operador OR e IN
Duas formas de combinar condições:

select * from senso
where nome_mun like ('A%')
and (cod_uf = '35' or cod_uf = '15');

-- Jeito mais limpo:
select * from senso
where nome_mun like ('A%')
and cod_uf in ('35', '15');
🔹 Intervalos (combinação de operadores)

select * from senso
where populacao <= 100000
  and populacao >= 50000
  and cod_uf = '35'
  and nome_mun <> 'Vinhedo'
  and ano = '2014';
🧩 Operadores de Nulidade
🔸 is not null
Seleciona registros onde o campo tem valor:

select * from senso
where regiao is not null;
🔸 is null
Seleciona registros com valor nulo:


select * from senso
where regiao is null;
🔸 Cenário de atualização
Demonstra como converter valores vazios em null e vice-versa:

set sql_safe_updates = 0;
update senso set regiao = null where regiao = '';
set sql_safe_updates = 1;

set sql_safe_updates = 0;
update senso set regiao = '' where regiao is null;
set sql_safe_updates = 1;
📊 Operador HAVING
Usado junto ao GROUP BY para aplicar condições em agregações:

select cod_uf, estado, count(*) qtd
from senso
where ano = '2014'
group by cod_uf, estado
having count(cod_mun) > 500;
Outros exemplos:

having count(cod_mun) < 500;

having sum(populacao) > 5000000;

📚 Conceitos Reforçados
Uso correto de comparadores (=, <>, <, >, <=, >=)

Combinação de condições com AND, OR e IN

Filtragem com LIKE e curingas (A%)

Controle de valores nulos e vazios

Agregações com GROUP BY e HAVING
