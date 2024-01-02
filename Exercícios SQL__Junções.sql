USE ASS_Canil2

select * from Cliente2
select * from Cao2

--Exercícios SQL - Junções
--Questão 1
select Cl.NomeCliente, count(C.NumPedigre)
from Cliente2 Cl, Cao2 C
where Cl.CodCliente = C.CodCliente
group by Cl.NomeCliente
having count(C.NumPedigre) > 1

--Questão 2
select P.NomeCao, count(C.NumPedigre)
from Cao2 C, Cao2 P
where C.CodPai = P.NumPedigre
group by P.NomeCao
having count(P.NumPedigre) > 1

--Questão 3
select R.NomeRaca, count(C.NumPedigre)
from Raca2 R, Cao2 C
where R.CodRaca = C.CodRaca
group by R.NomeRaca
having count(C.NumPedigre) > 3
 




