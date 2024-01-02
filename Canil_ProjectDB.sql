-- CRIANDO DATABASE
CREATE DATABASE ASS_Canil

-- ATIVAR A DATABASE PARA SER USADA
USE ASS_Canil

-- DELETAR AS TABELAS CASO JAH EXISTA
/*
DROP TABLE Cao
DROP TABLE Raca
DROP TABLE Treinador
DROP TABLE Vacina
DROP TABLE Competicao
DROP TABLE Cliente
DROP TABLE Cao_Treinador
DROP TABLE Mencao
DROP TABLE Cao_Vacina
DROP TABLE Cao_Competicao
*/

-----------------------------------------------------------------------------------------------------------------------------------------------

-- CRIANDO A TABELA CAO
CREATE TABLE Cao 
(
	NumPedigre int identity NOT NULL primary key,
	NomeCao varchar(50) NOT NULL,
	Sobrenome varchar(50) NOT NULL,
	Cor_Conjunto_Cores varchar(50) NOT NULL,
	DataNascimento varchar(50) NOT NULL,
	CodRaca int NOT NULL,
	CodCliente int NOT NULL,
	CodPai int,
	CodMae int
)
-- CRIANDO A TABELA RACA
CREATE TABLE Raca 
(
	CodRaca int identity NOT NULL primary key,
	NomeRaca varchar(50) NOT NULL,
	Tamanho int NOT NULL,
	PesoMedio decimal(5,2) NOT NULL,
	ValorVenda int NOT NULL,
	ObsGerais varchar(50) NOT NULL
)
-- CRIANDO A TABELA TREINADOR
CREATE TABLE Treinador 
(
	CodTreinador int identity NOT NULL primary key,
	NomeTreinador varchar(50) NOT NULL,
	EnderecoTreinador varchar(50) NOT NULL,
	TelefoneTreinador varchar(25) NOT NULL
)
-- CRIANDO A TABELA VACINA
CREATE TABLE Vacina 
(
	CodVacina int identity NOT NULL primary key,
	TipoVacina varchar(50) NOT NULL,
	DescVacina varchar(50) NOT NULL
)
-- CRIANDO A TABELA COMPETICAO
CREATE TABLE Competicao 
(
	CodCompeticao int identity NOT NULL primary key,
	DescCompeticao varchar(50) NOT NULL,
	DataCompeticao datetime NOT NULL default (getdate())
)
-- CRIANDO A TABELA CLIENTE
CREATE TABLE Cliente 
(
	CodCliente int identity NOT NULL primary key,
	TipoDocumento varchar(25) NOT NULL,
	NumDocumento char(11) NOT NULL,
	NomeCliente varchar(50) NOT NULL,
	EnderecoCliente varchar(50) NOT NULL,
	TelefoneCliente varchar(25) NOT NULL
)
-- Criando tabela Mencao
CREATE TABLE Mencao
(
	CodMencao int identity NOT NULL primary key,
	DescMencao varchar(25) NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Adicionando Chaves Extrangeiras a tabela 
ALTER TABLE Cao
	add
		foreign key (CodRaca) references Raca(CodRaca),
		foreign key (CodCliente) references Cliente(CodCliente),
		foreign key (CodPai) references Cao(NumPedigre),
		foreign key (CodMae) references Cao(NumPedigre)

-- Criando tabela Relacionamento Cao Treinador
CREATE TABLE Cao_Treinador
(
	NumPedigre int NOT NULL,
	CodTreinador int NOT NULL,
	CodMencao int NOT NULL,
	Data_treino datetime NOT NULL default (getdate()),
	Primary Key(NumPedigre,CodTreinador, CodMencao, Data_treino)
)
-- Adicionando Chaves Extrangeiras a tabela Cao_Treinador
ALTER TABLE Cao_Treinador
	add
		foreign key (NumPedigre) references Cao(NumPedigre),
		foreign key (CodTreinador) references Treinador(CodTreinador),
		foreign key (CodMencao) references Mencao(CodMencao)

-- Criando tabela Relacionamento Cao X Vacina
CREATE TABLE Cao_Vacina
(
	NumPedigre int NOT NULL,
	CodVacina int NOT NULL,
	DataAplicacao varchar(50) NOT NULL,
	Primary Key(NumPedigre,CodVacina,DataAplicacao)
)
-- Adicionando Chaves Extrangeiras a tabela Cao_Treinador
ALTER TABLE Cao_Vacina
	add
		foreign key (NumPedigre) references Cao(NumPedigre),
		foreign key (CodVacina) references Vacina(CodVacina)
		
-- Criando tabela Relacionamento Cao X Competicao
CREATE TABLE Cao_Competicao
(
	NumPedigre int NOT NULL,
	CodCompeticao int NOT NULL,
	Colocacao int NOT NULL,
	Primary Key(NumPedigre,CodCompeticao)
)
-- Adicionando Chaves Extrangeiras a tabela Cao_Competicao
ALTER TABLE Cao_Competicao
	add
		foreign key (NumPedigre) references Cao(NumPedigre),
		foreign key (CodCompeticao) references Competicao(CodCompeticao)


-- COMECANDO OS INSERTS NA TABELA RACA
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Rottweiler',119,20.45,778,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pastor Alemсo',46,21.21,1315,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pastor Belgaа',41,20.63,541,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('PequinЖs',35,23.09,1447,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pitbullа',37,18.26,706,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Boxerа',128,22.79,1498,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Bulldogа',36,18.44,1161,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Labrador Retriever',50,15.33,716,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Chihuahua',16,19.62,843,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dрlmataа',93,16.02,761,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Sсo Bernardo',96,23.05,1479,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Husky Siberiano',83,17.43,836,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dobermannа',129,17.15,1245,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dogue Alemсo',32,17.34,534,'Nenhuma')
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Cocker Spaniel',68,17.77,888,'Nenhuma')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Raca
 
-- COMECANDO OS INSERTS NA TABELA CLIENTE
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','67086283715','Ana','Rua do Pau Bandeira','3631-7127')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','90096496644','Isabela','Rua Tapaxanas','3632-2815')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','51100256383','Larissa','Rua Rock Estrela','3631-8673')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','16478181066','Carolina','Rua Somos Todos Iguais','3632-8750')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','10385619148','Letьcia','Rua das Variaушes Musicais','3631-9827')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','49590155452','Valentina','Rua Neve da Bahia','3631-7741')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','66154314052','Yasmin','Rua Maravilha Tristeza','3631-9281')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','94513198066','Guilherme','Rua dos Pensamentos Poжticos','3632-5420')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','75654959387','Gustavo','Rua Borboletas Psicodжlicas','3632-2004')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','11087520369','Lucas','Rua na Paz do seu Sorriso','3632-4562')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','80510590352','Joсo','Rua Viola Enluarada','3632-5014')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','21685526788','Enzo','Rua Minie','3632-9674')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','80644900140','Gabriel','Rua Reinado do Cavalo Marinho','3631-9875')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','34318832418','Vinьcius','Rua Final Feliz','3632-8263')
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','23125165907','Rodrigo','Rua da MЩsica Aquрtica','3631-3163')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Cliente
 
-- COMECANDO OS INSERTS NA TABELA CAO
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Nina','Afrodite','Tigrado','07/09/2015',1,12)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Mel','Baixinha','Dourado','27/07/2000',1,15)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Susi','Boneca','Despigmentado','04/01/2001',2,2)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Princesa','Cacau','Tigrado','26/02/2003',2,5)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Belinha','Baronesa','Preto','24/02/2008',3,10)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Lola','Afrodite','Tricolor','12/10/2011',3,9)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Pandora','Tigresa','Dourado','14/07/2013',4,13)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Billy','Vilсo','Dourado','12/09/2008',4,1)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Thor','Rex','Tricolor','18/07/2010',1,7,1,2)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Max','Falcсo','Cinzento','06/10/2012',1,6,1,2)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Bob','Byron','Albino','22/09/2015',2,7,3,4)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Rex','Rabugento','Albino','21/09/2010',2,4,3,4)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Marley','Duke','Chocolate','04/05/2003',3,5,5,6)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Toby','Zeus','Albino','14/12/2016',3,10,5,6)
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Sansсo','Monstro','Tricolor','23/10/2015',4,7,7,8)
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Cao
 
-- COMECANDO OS INSERTS NA TABELA Treinador
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('┴quila','Phoc1','40028922')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Witanauanh','Phoc2','40028923')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lucas','Phoc3','40028924')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Leo','Phoc4','40028925')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Marcelo','Phoc5','40028926')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Deborah','Phoc6','40028927')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Dynart','Phoc7','40028928')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Felipe','Phoc8','40028929')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Rainan','Phoc9','40028930')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Abimael','Phoc10','40028931')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Katarina','Phoc11','40028932')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Darius','Phoc12','40028933')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lucio','Phoc13','40028934')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lulu','Phoc14','40028935')
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Annie','Phoc15','40028936')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Treinador
 
-- COMECANDO OS INSERTS NA TABELA Vacina
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hcv','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hiv','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Htlv','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Chagas','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite Z','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite Y','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite x','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite b','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite a','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite m','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite v','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite F','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite S','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite P','seila')
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite H','seila')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Vacina
 
-- COMECANDO OS INSERTS NA TABELA Competicao
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Agility','11/07/2015')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Flyball','10/11/2016')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Canicross','4/02/2003')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Dog Frisbee','11/10/2003')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Correr','03/07/2002')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Patinar','05/01/2015')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Caminhar','03/03/2016')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Pegar a bola','09/01/2004')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Exposiусo de beleza','10/3/2012')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Nataусo','10/11/2015')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Canine Freestyle','01/05/2007')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Game Dog','11/11/2004')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Schutzhund','08/06/2002')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Surf','04/06/2009')
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Skateboarding Dog','03/08/2000')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Competicao
 
-- COMECANDO OS INSERTS NA TABELA Mencao
INSERT INTO Mencao (DescMencao) VALUES ('Fraco')
INSERT INTO Mencao (DescMencao) VALUES ('Regular')
INSERT INTO Mencao (DescMencao) VALUES ('Bom')
INSERT INTO Mencao (DescMencao) VALUES ('Мtimo')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Mencao
 
-- COMECANDO OS INSERTS NA TABELA Cao_Treinador
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (10,11,3,'03/08/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (7,4,1,'04/07/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (6,2,1,'04/08/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (14,13,2,'03/10/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (7,9,3,'12/08/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (9,7,4,'01/03/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (15,13,1,'04/05/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (6,5,4,'09/02/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (13,12,3,'07/07/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (12,13,2,'02/03/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (2,13,2,'03/08/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (3,9,2,'05/08/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (1,7,4,'04/04/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (11,3,1,'05/03/2016')
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (12,8,1,'06/07/2016')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Cao_Treinador
 
-- COMECANDO OS INSERTS NA TABELA Cao_Vacina
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,6,'05/04/2004')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,11,'06/06/2009')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (1,13,'06/09/2010')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (8,4,'11/01/2015')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (7,14,'12/06/2009')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (15,2,'10/04/2014')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (8,3,'12/06/2001')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (2,4,'11/07/2002')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (14,6,'06/08/2011')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (11,13,'10/08/2008')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,10,'01/10/2001')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (7,14,'12/09/2016')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (9,7,'01/06/2000')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (14,15,'04/04/2002')
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (2,14,'12/06/2014')
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Cao_Vacina
 
-- COMECANDO OS INSERTS NA TABELA Cao_Competicao
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (15,1,4)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (12,1,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (13,3,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (6,2,4)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,2,1)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (1,3,1)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (2,9,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,8,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (3,2,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (2,5,1)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (9,8,1)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (1,6,2)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,7,1)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (13,5,4)
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (6,3,3)
-- MOSTRANDO OS VALORES INSERIDOS
SELECT * FROM Cao_Competicao


-- Lista_questão 1

	select T.NomeTreinador, T.EnderecoTreinador,T.TelefoneTreinador, C.NomeCao,
	M.DescMencao, CT.Data_treino

	from Treinador T, Cao C, Mencao M, Cao_Treinador CT

	where (CT.NumPedigre = C.NumPedigre)
	and (CT.CodTreinador = T.CodTreinador)
	and (CT.CodMencao = M.CodMencao)

-- Lista_questão 2

	select * from Mencao
	
	select T.NomeTreinador, C.NomeCao, CT.CodMencao

	from Treinador T, Cao , Cao_Treinador CT
	
	where (CT.NumPedigre = C.NumPedigre)
	and (CT.CodTreinador = T.CodTreinador)
	and (CT.CodMencao = 4)

-- Lista_questão 3

	select * from Raca

	select C.NomeCao, R.CodRaca, R.NomeRaca

	from Cao C, Raca R

	where (C.CodRaca = R.CodRaca)
	and (R.CodRaca = 1)

-- Lista_questão 4

	SELECT * FROM Cliente

	select C.NomeCliente, C.EnderecoCliente, C.TelefoneCliente, R.NomeRaca

	from Cliente C, Raca R 

	----------------------------------------------------------------------------------------------------------

-- Lista de exercicios de Agrupamentos
-- Questão 1

	select p.NomeCao, count (C.NumPedigre)
	from Cao C, Cao p 
	where (c.CodPai = p.NumPedigre)
	group by p.NomeCao

	select * from cao

-- Questão 2

	select m.NomeCao, count (C.NumPedigre)
	from Cao C, Cao m 
	where (c.CodMae = m.NumPedigre)
	group by m.NomeCao
	
	select * from Cao

-- Questão 3

	select cd.CodCliente, count (c.NumPedigre)
	from Cao c, Cliente cd  
	where (cd.CodCliente = c.NumPedigre)
	group by cd.CodCliente
	
	select * from Cao















	



