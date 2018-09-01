USE AgenciaDeViagens

CREATE TABLE Pessoas(
	id_pessoa INT IDENTITY,
	nome VARCHAR(100),
	cpf VARCHAR(14) UNIQUE,
	CONSTRAINT pessoa_pk PRIMARY KEY(id_pessoa)
);

CREATE TABLE EnderecoHospedagem(
	id_endereco INT IDENTITY,
	uf CHAR(2),
	cidade VARCHAR(120),
	rua VARCHAR(100),
	CONSTRAINT endereco_pk PRIMARY KEY(id_endereco)
);

CREATE TABLE Hospedagem(
	id_hospedagem INT IDENTITY,
	id_endereco INT,
	tipo CHAR(10),
	CONSTRAINT hospedagem_pk PRIMARY KEY(id_hospedagem),
	CONSTRAINT endereco_hospedagem_fk
	FOREIGN KEY (id_endereco) REFERENCES EnderecoHospedagem(id_endereco)
);

CREATE TABLE Destinos(
	id_destino INT IDENTITY,
	id_hospedagem INT,
	nome_destino VARCHAR(50),
	CONSTRAINT destino_pk PRIMARY KEY(id_destino),
	CONSTRAINT hospedagem_destino_fk
	FOREIGN KEY(id_hospedagem) REFERENCES Hospedagem(id_hospedagem)
);

CREATE TABLE Viagens(
	id_viagem INT IDENTITY,
	id_destino INT,
	CONSTRAINT viagem_pk PRIMARY KEY(id_viagem),
	CONSTRAINT destino_viagem_fk FOREIGN KEY(id_destino) REFERENCES Destinos(id_destino)
);

CREATE TABLE Passagens(
	id_passagem INT IDENTITY,
	id_pessoa INT,
	id_viagem INT,
	valor FLOAT,
	data_ida DATETIME,
	data_volta DATETIME,
	data_compra DATETIME,
	CONSTRAINT passagem_pk PRIMARY KEY(id_passagem),
	CONSTRAINT pessoa_passagem_fk FOREIGN KEY(id_pessoa) REFERENCES Pessoas(id_pessoa),
	CONSTRAINT viagem_passagem_fk FOREIGN KEY(id_viagem) REFERENCES Viagens(id_viagem) 
);
-- INSERTS
INSERT INTO Pessoas(nome, cpf) VALUES('Felipe',  '1111111111111')
INSERT INTO Pessoas(nome, cpf) VALUES('Bitão',   '2222222222222')
INSERT INTO Pessoas(nome, cpf) VALUES('Lucas',   '3333333333333')
INSERT INTO Pessoas(nome, cpf) VALUES('Joel',    '4444444444444')
INSERT INTO Pessoas(nome, cpf) VALUES('Samuka',  '5555555555555')
INSERT INTO Pessoas(nome, cpf) VALUES('Patolino','6666666666666')

select * from pessoas
delete pessoas

INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('MC','Minecraft','Rua Minecraft')
INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('BC','Hot Island','Rua da Encruzilhada')
INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('RO','Gordocity','Rua Cacaushow')
INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('SE','Serrotao','Avenida Main')
INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('RS','Pato Branco','Rua dos Palmitos')
INSERT INTO EnderecoHospedagem(uf, cidade, rua) VALUES('US','Looneytunes','Rua Teletubies')

select * from EnderecoHospedagem
delete EnderecoHospedagem

INSERT INTO Hospedagem (id_endereco, tipo) VALUES(1, 'Hotel')
INSERT INTO Hospedagem (id_endereco, tipo) VALUES(2, 'Casa')
INSERT INTO Hospedagem (id_endereco, tipo) VALUES(3, 'Trailer')
INSERT INTO Hospedagem (id_endereco, tipo) VALUES(4, 'Navio')
INSERT INTO Hospedagem (id_endereco, tipo) VALUES(5, 'Loft')
INSERT INTO Hospedagem (id_endereco, tipo) VALUES(6, 'Flat')

select * from Hospedagem
delete Hospedagem

INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(1,'Caribe')
INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(2,'Bitao City')
INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(3,'Gordocity')
INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(4,'Serrotao')
INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(5,'Pato Branco')
INSERT INTO Destinos (id_hospedagem, nome_destino) VALUES(6,'Loonettunes')

select * from Destinos
delete Destinos

INSERT INTO Viagens(id_destino) VALUES(1)
INSERT INTO Viagens(id_destino) VALUES(2)
INSERT INTO Viagens(id_destino) VALUES(3)
INSERT INTO Viagens(id_destino) VALUES(4)
INSERT INTO Viagens(id_destino) VALUES(5)
INSERT INTO Viagens(id_destino) VALUES(6)

select * from Viagens
delete Viagens

EXEC cadastra_compra_passagem 1, 1, 500, NULL, NULL, 'Janeiro 1, 1753'
EXEC cadastra_compra_passagem 2, 2, 500, NULL, NULL, 'Janeiro 1, 1753'
EXEC cadastra_compra_passagem 3, 3, 500, NULL, NULL, NULL
EXEC cadastra_compra_passagem 4, 4, 500, NULL, NULL, NULL

EXEC buscar_viagem_por_cpf '6666666666666'
EXEC buscar_viagem_por_cpf '1111111111111'
EXEC buscar_viagem_por_cpf '2222222222222'
EXEC buscar_viagem_por_cpf '3333333333333'

EXEC buscar_por_data_de_compra 'Janeiro 1, 1753'

EXEC buscar_por_data_de_compra 'Janeiro 2, 2018'


