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

/* A função IN permite filtrar valores especificos sejam eles strings ou numéricos*/

SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano IN (2014, 2020) /* Selecionando especificamente os anos de 2014 e 2020 */
ORDER BY sigla_partido DESC;

SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_uf IN ('RN', 'CE', 'PB') /* Um exemplo com string, selecionando 3 estados do nordeste */
ORDER BY sigla_partido DESC;

/* 
LIKE serve para filtrar valores aproximados em string. 
Podendo ser selecionado a partir de como começa, termina ou mesmo de acordo com algum caractere contido na string.
Aqui pode ser usado o % para indicar uma parte restante na variável na qual não importa o padrão.
Se utiliza 'abc%' irá buscar informações que começam com "abc", mas o restante não importa. 
Se esse simbolo é usado no inicio e final do fitro, "%abc%" significa então buscar por strings que contém essa sequência abc não importando onde se localiza.
*/

/* Selecionando partidos que começam com a letra P */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_partido LIKE 'P%'
ORDER BY sigla_partido DESC;

/* Selecionando partidos que terminam com a letra B */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_partido LIKE '%B'
ORDER BY sigla_partido DESC;

/* Selecionando partidos que contem a letra B */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_partido LIKE '%B%'
ORDER BY sigla_partido DESC;

/* É possivel, também, usar o traço _ para indicar a quantidade de caracteres que devem conter na string que será filtrada */

/* Selecionando partidos que tem duas letras */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_partido LIKE '__'
ORDER BY sigla_partido DESC;

/* Selecionando partidos de duas letras que começam com P */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE sigla_partido LIKE 'P_'
ORDER BY sigla_partido DESC;

/* 
DESAFIO:
Quais as pesquisas para o cargo de presidente que foram realizadas no ano de 2018, ordenadas por turno.
*/

SELECT DISTINCT id_pesquisa, data_referencia, instituto, turno
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano IN (2018) AND cargo IN ('presidente')
ORDER BY turno;
