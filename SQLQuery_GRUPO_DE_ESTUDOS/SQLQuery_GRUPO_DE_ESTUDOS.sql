USE GrupoDeEstudos

CREATE TABLE Professor (

	id_professor INT IDENTITY,
	nome VARCHAR(30) NOT NULL,
	matricula VARCHAR(15) NOT NULL,
	CONSTRAINT professor_PK PRIMARY KEY(id_professor),
);

CREATE TABLE Aluno(

	id_aluno INT IDENTITY,
	nome VARCHAR(30) NOT NULL,
	parecerResp VARCHAR(100) NOT NULL,
	ehResponsavel CHAR(1) NOT NULL,
	CONSTRAINT aluno_PK PRIMARY KEY(id_aluno)
);

CREATE TABLE AlunoResponsavel(

	id_alunoResp INT IDENTITY,
	id_aluno INT NOT NULL,
	CONSTRAINT alunoResp_PK PRIMARY KEY(id_alunoResp),
	CONSTRAINT aluno_Resp_FK FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno)
);

CREATE TABLE CasoDeEstudo (

	id_casoDeEstudo INT IDENTITY,
	id_alunoResp INT NOT NULL,
	id_professor INT NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	area VARCHAR(100) NOT NULL,
	dataInicio VARCHAR(100) NOT NULL,
	assunto VARCHAR(100) NOT NULL,
	resposta VARCHAR(100) NOT NULL,
	CONSTRAINT casoDeEstudo_PK PRIMARY KEY(id_casoDeEstudo),
	CONSTRAINT casoDeEstudo_AlunoResp_FK FOREIGN KEY(id_alunoResp) REFERENCES AlunoResponsavel(id_alunoResp),
	CONSTRAINT casoDeEstudo_Professor_FK FOREIGN KEY(id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Parecer (

	id_parecer INT IDENTITY,
	ehColetivo CHAR(1) NOT NULL,
	CONSTRAINT parecer_PK PRIMARY KEY(id_parecer)
);

CREATE TABLE CasoDeEstudo_Aluno (

	id_aluno INT,
	id_casoDeEstudo INT,
	opiniao VARCHAR(100) NOT NULL,
	CONSTRAINT CasoDeEstudo_Aluno_FK FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno),
	CONSTRAINT casoDeEstudo_FK FOREIGN KEY(id_casoDeEstudo) REFERENCES CasoDeEstudo(id_casoDeEstudo)
);

INSERT INTO Professor(nome, matricula)
VALUES('Adriano Santos', '124655579')

INSERT INTO Aluno(nome, parecerResp, ehResponsavel)
VALUES('Felipe Malheiros','Estudo Concluido', 'S')

INSERT INTO AlunoResponsavel(id_aluno)
VALUES(1)

INSERT INTO CasoDeEstudo(id_alunoResp, id_professor,titulo, area, dataInicio, assunto, resposta)
VALUES(1,1,'Sistemas de Informação', 'Ciência de dados','2018-08-10','Algoritmos','Relátorio do aluno')

INSERT INTO Parecer(ehColetivo)
VALUES('S')

INSERT INTO CasoDeEstudo_Aluno(opiniao)
VALUES('A turma concorda com o parecer')


select * from professor
select * from Aluno
select * from CasoDeEstudo
select * from Parecer


