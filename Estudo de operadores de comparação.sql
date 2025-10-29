use curso;

select * from senso;

-- usando operador de comparação igual

select * from senso
where cod_uf = '35'
and ano='2014';

-- usando operador de comparação

select * from senso
where nome_mun = 'Dourado'
and cod_uf = '35'
and ano = '2014';

-- usando operador maior

select * from senso
where populacao > 100000
and ano = '2014';

-- usando operador maior

select * from senso
where populacao > 1000000
and cod_uf = '35'
and ano = '2014';

-- usando operador menor

select * from senso
where populacao < 10000
and ano = '2014'
limit 0, 10000;

-- usando operador menor

select * from senso
where populacao < 50000
and ano = '2014'
limit 0, 10000;

-- usando operador menor igual

select * from senso
where populacao <= 10000
and ano = '2014'
limit 0, 10000;

-- usando operador diferente

select * from senso
where cod_uf <> '35'
and cod_uf <> '14'
limit 0, 1000000;

-- usando operador diferente

select * from senso
where (cod_uf = '35' or cod_uf = '14')
and ano = '2014'
limit 0, 1000000;

-- combinação de operadores

select * from  senso
where populacao <= 100000
	and populacao >= 50000
    and cod_uf = '35'
    and nome_mun <> 'Vinhedo'
		and ano = '2014'
        limit 0, 1000000;
        
-- Operador OR

select * from senso
where nome_mun like ('A%')
and (cod_uf = '35' or cod_uf = '15');

/*A lógica está certa (buscar municípios que comecem com "A" e estejam no estado 35 ou 15),
mas o uso de AND exige que o mesmo registro tenha cod_uf = 35 e 15 ao mesmo tempo,
o que é impossível. Por isso a consulta não retorna resultados.*/

select * from senso
where nome_mun like ('A%')
and cod_uf = '35' 
and cod_uf = '15';

-- Jeito certo:

select * from senso
where nome_mun like ('A%')
and cod_uf in ('35', '15');

-- Operador is not null

select * from senso
where regiao is not null;

-- Operador is null

select * from senso
where regiao is null;

-- Cenário is null

select * from senso
where regiao = '';

set SQL_SAFE_UPDATES = 0;
update senso set regiao = null
where regiao = '';
set SQL_SAFE_UPDATES = 1;

set SQL_SAFE_UPDATES = 0;
update senso set regiao = ''
where regiao is null;
set SQL_SAFE_UPDATES = 1;

-- Operador having

select cod_uf, estado, count(*)qtd
from senso
where ano = '2014'
group by cod_uf, estado having count(cod_mun) > 500;

-- Operador having

select cod_uf, estado, count(*)qtd
from senso
where ano = '2014'
group by cod_uf, estado having count(cod_mun) < 500;

-- Operador having

select cod_uf, estado, count(cod_mun)qtd,
				sum(populacao)
from senso
where ano = '2014'
group by cod_uf, estado having sum(populacao) > 5000000;