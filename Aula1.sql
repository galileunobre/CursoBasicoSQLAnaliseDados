/* Para os exemplos e exercícios dessa aula foi utilizada a base de dados de pesquisas eleitorais do Poder360 disponível no Base de Dados
Primeira busca: 3 colunas e limite de 100 linhas */
SELECT ano, cargo, sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
LIMIT 100;

/* Todas as colunas da base de dados */
SELECT *
FROM basedosdados.br_poder360_pesquisas.microdados
LIMIT 100;

/* Identificando quais os institutos que tem pesquisa registrada na base de dados */
SELECT DISTINCT instituto
FROM `basedosdados.br_poder360_pesquisas.microdados`;er360_pesquisas.microdados`;

/* Buscando os cargos que dos quais o instituto DataFolha fez pesquisa desde 2014 */
SELECT ano, cargo
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE instituto = 'Datafolha' AND ano > 2013;

/* Buscando as informações de pesquisas feitas pelo Datafolha e Ibope em 2018 para o estado de São Paulo
Limitei a busca a 500 linhas para melhorar o processamento */
SELECT *
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE (instituto = 'Datafolha' OR instituto = 'Ibope') AND ano = 2018 AND sigla_uf = 'SP'
LIMIT 500;

/* Na busca anterior só aparentou só ter informaçõe do Datafolha então fez-se a busca de institutos de pesquisa que realizaram pesquisa no ano de 2018 em São Paulo */
SELECT DISTINCT instituto
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano = 2018 AND sigla_uf = 'SP';
/* No caso acima foi identificado que o Ibope não fez pesquisa no estado de São Paulo no ano de 2018 */


/* Exercício: Quais as siglas de partidos que aparecem nas pesquisas eleitorais desde 2014? */
SELECT DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano > 2013;
/* No caso do filtro do ano poderia ser também >= 2014 */
