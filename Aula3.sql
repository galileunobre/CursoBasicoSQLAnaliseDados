/* 
"AS" é uma função que permite nomear variáveis. Isso nos ajuda em dois pontos, dar nome a operações feitas usando os dados buscados, assim conseguimos identificar esses
de maneira mais fácil. A segunda é facilitar o uso dessas variáveis ao longo do script
*/
SELECT  
    MAX(valor_receita) AS Max_Valor,
    MIN(valor_receita) AS Min_Valor,
    SUM(valor_receita) AS Soma_Valor,
    AVG(valor_receita) AS Media_Valor
FROM 
    `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN"AND 
    cargo = "governador";


/*
A função ROUND permite arredondar valores no resultado final da.
Como primeiro argumento colocamos o valor que será arredondado e depois a quantidade de casas decimais.
No caso abaixo irmos pegar a média das receitas dos candidatos e arredondar os valores para duas casas decimais
 */
SELECT 
    ROUND(AVG(valor_receita), 2) AS Media_Valor
FROM 
    `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN";

/* 
Abaixo arredondando os valores pára duas casas decimais de despesas dos candidados do Rio Grande do Norte na eleição de 2022.
Nessa busca pedimos os valores máximo, mínimo, total e média dos gastos nessa eleição
*/
SELECT 
    ROUND(MAX(valor_despesa), 2) AS Max_Valor,
    ROUND(MIN(valor_despesa), 2) AS Min_Valor,
    ROUND(SUM(valor_despesa), 2) AS Soma_Valor,
    ROUND(AVG(valor_despesa), 2) AS Media_Valor
FROM 
    `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN";

/* 
COUNT é uma função que faz a contagem de resultados de acordo com as especificações colocadas na busca.
Abaixo um exemplo de contagem da quantidade de doações feitas na eleição do Rio Grando do Norte em 2022
*/
SELECT 
    COUNT(cpf_cnpj_doador) AS Quant_Doadores
FROM 
    `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN";

/* 
Podemos aplicar o DISCTINCT dentro da função COUNT para fazer uma contagem distinta, puxando somente os valores diferentes.
Dessa forma é possível trazer a contagem de doadores na eleição de 2022 do Rio Grande do Norte
*/
SELECT 
    COUNT(DISTINCT cpf_cnpj_doador) AS Quant_Doadores
FROM 
    `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN";

/* Contagem da quantidade de fornecedores de cada candidato a governador na eleição de 2022 no RN */
SELECT 
    COUNT(DISTINCT cpf_cnpj_fornecedor) AS Fornecedor
FROM 
    `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE 
    ano = 2022 AND 
    sigla_uf = "RN" AND 
    cargo = "governador";


/*
DESAFIO AULA 5:
Elaborar uma consulta que retorna a quantidade de fornecedores e a soma do valor total de despesas por candidato a governador nas eleições de 2018, no estado da Bahia.
*/
SELECT
    COUNT(DISTINCT cpf_cnpj_fornecedor) AS Fornecedor,
    ROUND(SUM(valor_despesa),2) AS Valor,
    nome_candidato AS Candidato
FROM 
    `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE 
    sigla_uf = "BA" AND 
    ano = 2022 AND 
    cargo = "governador"
GROUP BY Candidato
ORDER BY Valor DESC;


/* Aplicando a consulta do desafio para o estado do Rio Grande do Norte*/
SELECT
    COUNT(DISTINCT cpf_cnpj_fornecedor) AS Fornecedor,
    ROUND(SUM(valor_despesa),2) AS Valor,
    nome_candidato AS Candidato
FROM 
    `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE 
    sigla_uf = "RN" AND 
    ano = 2022 AND 
    cargo = "governador"
GROUP BY Candidato
ORDER BY Valor DESC;