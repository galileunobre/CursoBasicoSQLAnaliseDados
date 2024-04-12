/* ORDER BY serve para ordenar as informações da busca conforme uma das variáveis. Com isso os dados serão colocados em ordem crescente, 
para obter como resultado a ordem descrescente deve-se usar no final o comando DESC */ 

SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados` 
WHERE ano = 2018 
    AND sigla_partido != 'N/A' 
    AND sigla_partido != 'sem partido'
    AND sigla_uf = 'RN'
ORDER BY sigla_partido DESC;

/* A função NOT serve como uma forma prática de informar algo que você não visualizar nos dados */

SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano = 2018 
    AND NOT sigla_partido = 'N/A' 
    AND NOT sigla_partido = 'sem partido' /* Esses dois fiultros na sigla_partido funcionam da mesma forma que na busca acima*/
    AND sigla_uf = 'RN'
ORDER BY sigla_partido;

/* O BETWEEN ajuda a filtrar informações em um espaço numerico (esse tipo de variável funciona com dados numéricos e datas) */

SELECT DISTINCT sigla_partido 
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano >= 2018 AND ano <= 2020 /* Filtro sem o BETWEEN*/
ORDER BY sigla_partido DESC;


SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano BETWEEN 2018 AND 2020 /* O mesmo filtro com o BETWEEN*/
ORDER BY sigla_partido DESC;