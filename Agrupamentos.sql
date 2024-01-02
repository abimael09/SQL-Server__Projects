use LOCADORA_FILMES1

SELECT * FROM CLIENTE
SELECT * FROM ALOCACAO
SELECT * FROM FILME
SELECT * FROM FITA

--FUN��O DE UNICIDADE

--DISTINCT
SELECT DISTINCT NUM_FITA FROM ALOCACAO

--SABER O N�MERO DISTINTO DE FILMES QUE FORAM LOCADOS AT� HOJE
SELECT  DISTINCT FILME.NOME_FILME
FROM FILME, FITA, ALOCACAO
WHERE (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)

--FUN��ES DE GRUPO E AGRUPAMENTOS

--COUNT
--Quantos filmes existem de cada g�nero
SELECT GENERO.DESCRICAO_GENERO, COUNT(FILME.COD_FILME)
FROM GENERO, FILME
WHERE GENERO.COD_GENERO = FILME.COD_GENERO
GROUP BY GENERO.DESCRICAO_GENERO

--Quantas fitas de cada g�nero foi locado
SELECT GENERO.DESCRICAO_GENERO, COUNT(FITA.NUM_FITA)
FROM ALOCACAO, FITA, CLIENTE, FILME, GENERO
WHERE (CLIENTE.CPF_CLIENTE = ALOCACAO.CPF_CLIENTE)
AND (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)
AND (FILME.COD_GENERO = GENERO.COD_GENERO)
GROUP BY GENERO.DESCRICAO_GENERO

--Quantas fitas de cada g�nero foi locado, por cada cliente 
SELECT GENERO.DESCRICAO_GENERO, CLIENTE.NOME_CLIENTE, COUNT(FITA.NUM_FITA)
FROM ALOCACAO, FITA, CLIENTE, FILME, GENERO
WHERE (CLIENTE.CPF_CLIENTE = ALOCACAO.CPF_CLIENTE)
AND (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)
AND (FILME.COD_GENERO = GENERO.COD_GENERO)
GROUP BY GENERO.DESCRICAO_GENERO, CLIENTE.NOME_CLIENTE
ORDER BY GENERO.DESCRICAO_GENERO


--SABER QUANTOS FILMES CADA CLIENTE LOCOU
SELECT CLIENTE.NOME_CLIENTE, COUNT(FILME.NOME_FILME)
FROM ALOCACAO, FITA, CLIENTE, FILME
WHERE (CLIENTE.CPF_CLIENTE = ALOCACAO.CPF_CLIENTE)
AND (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)
GROUP BY CLIENTE.NOME_CLIENTE


--A M�XIMA DURA��O DO FILME DE CADA CLIENTE
SELECT CLIENTE.NOME_CLIENTE, MAX(FILME.DURACAO_FILME)
FROM ALOCACAO, FITA, CLIENTE, FILME
WHERE (CLIENTE.CPF_CLIENTE = ALOCACAO.CPF_CLIENTE)
AND (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)
GROUP BY CLIENTE.NOME_CLIENTE

--A M�NIMA DURA��O DO FILME DE CADA CLIENTE
SELECT CLIENTE.NOME_CLIENTE, MIN(FILME.DURACAO_FILME)
FROM ALOCACAO, FITA, CLIENTE, FILME
WHERE (CLIENTE.CPF_CLIENTE = ALOCACAO.CPF_CLIENTE)
AND (ALOCACAO.NUM_FITA = FITA.NUM_FITA)
AND (FITA.COD_FILME = FILME.COD_FILME)
GROUP BY CLIENTE.NOME_CLIENTE



--SUM
SELECT SUM(DURACAO_FILME) FROM FILME

--AVG
SELECT AVG(DURACAO_FILME) FROM FILME

--MIN
SELECT MIN(CPF_CLIENTE) FROM CLIENTE
SELECT MIN(DURACAO_FILME) FROM FILME

--MAX
SELECT MAX(CPF_CLIENTE) FROM CLIENTE
SELECT MAX(DURACAO_FILME) FROM FILME
