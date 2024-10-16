CREATE TRIGGER tgMulta
ON tbMultas AFTER INSERT
AS
	DECLARE @pontos INT;
	DECLARE @idMulta INT;
	DECLARE @idMotorista INT;
	DECLARE @pontuacaoAcumulada INT; 

		SET @idMulta = (SELECT idMulta FROM INSERTED)
		SET @pontos = (SELECT pontosMulta FROM INSERTED)
		SET @idMotorista = (SELECT tbMotorista.idMotorista FROM tbMotorista 
		
			INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista 
			INNER JOIN tbMultas ON tbVeiculo.idVeiculo = tbMultas.idVeiculo WHERE idMulta = @idMulta)
			
	UPDATE tbMotorista 
	SET pontuacaoAcumulada = pontuacaoAcumulada + @pontos
	WHERE idMotorista = @idMotorista

	IF @pontuacaoAcumulada >= 20 
		BEGIN
			PRINT ('voce atigiu o limite de pontos (20 pontos)')
		END
	ELSE
		BEGIN
			PRINT('voce tem '+@pontuacaoAcumulada+'pontos na sua cartera')
		END
GO