use AgenciaDeViagens

CREATE PROCEDURE cadastra_compra_passagem
	
	--Parâmetros
	@id_pessoa INT = NULL,
	@id_viagem INT = NULL,
	@valor FLOAT = NULL,
	@data_ida DATETIME = NULL,
	@data_volta DATETIME = NULL,
	@data_compra DATETIME = NULL

AS
BEGIN

	INSERT INTO Passagens(id_pessoa, id_viagem, valor, data_ida, data_volta, data_compra)
	VALUES (@id_pessoa, @id_viagem, @valor, GETDATE(), @data_volta, @data_compra)

	--select @@IDENTITY AS passagem
	select * from passagens
END

DROP PROCEDURE cadastra_compra_passagem


--use AgenciaDeViagens

CREATE PROCEDURE buscar_viagem_por_cpf
	
	--Parâmetros
	@cpf VARCHAR(14) = NULL
AS
BEGIN

	select nome,nome_destino from Pessoas,Destinos Where cpf = @cpf
	and Destinos.id_destino = pessoas.id_pessoa
END

--drop procedure buscar_viagem_por_cpf


CREATE PROCEDURE buscar_por_data_de_compra
	
	--Parâmetros
	@data_compra DATETIME = NULL
AS
BEGIN

	select nome from Pessoas,Passagens Where data_compra = @data_compra
	
END