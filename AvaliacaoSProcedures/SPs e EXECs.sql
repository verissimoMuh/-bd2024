USE dbEncomendas
GO

--a)
CREATE PROCEDURE spInsertCategorias
    @categoria NVARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tbCategoriaProduto WHERE nomeCategoriaProduto = @categoria)
    BEGIN
        INSERT INTO tbCategoriaProduto(nomeCategoriaProduto) VALUES (@categoria);
    END
    ELSE
    BEGIN
        PRINT 'Categoria j� existe.';
    END
END;
GO


EXEC spInsertCategorias @categoria = 'Bolo Festa';
EXEC spInsertCategorias @categoria = 'Bolo Simples';
EXEC spInsertCategorias @categoria = 'Torta';
EXEC spInsertCategorias @categoria = 'Salgado';

--b)
CREATE PROCEDURE spInsertNomeVerifica
    @nomeProduto VARCHAR(100),
    @precokiloProduto DECIMAL(10, 2),
    @codCategoriaProduto INT
AS
BEGIN
    -- Verifica se a categoria existe
    IF NOT EXISTS (SELECT 1 FROM tbCategoriaProduto WHERE codCategoriaProduto = @codCategoriaProduto)
    BEGIN
        PRINT ('Categoria n�o existe.');
    END
    -- Verifica se o produto j� existe
    ELSE IF EXISTS (SELECT 1 FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
    BEGIN
        PRINT ('Produto j� existe no estoque.');
    END
    -- Insere o produto se tudo estiver correto
    ELSE
    BEGIN
        INSERT INTO tbProduto (nomeProduto, precokiloProduto, codCategoriaProduto)
        VALUES (@nomeProduto, @precokiloProduto, @codCategoriaProduto);
        
        PRINT ('Produto inserido com sucesso.');
    END
END;


EXEC spInsertNomeVerifica 'Bolo Floresta Negra', 42.00, 1;
EXEC spInsertNomeVerifica 'Bolo Prest�gio', 43.00, 1;
EXEC spInsertNomeVerifica 'Bolo Nutella', 44.00, 1;
EXEC spInsertNomeVerifica 'Bolo Formigueiro', 17.00, 2;
EXEC spInsertNomeVerifica 'Bolo de cenoura', 19.00, 2;
EXEC spInsertNomeVerifica 'Torta de palmito', 45.00, 3;
EXEC spInsertNomeVerifica 'Torta de frango e catupiry', 47.00, 3;
EXEC spInsertNomeVerifica 'Torta de escarola', 44.00, 3;
EXEC spInsertNomeVerifica 'Coxinha frango', 25.00, 4;
EXEC spInsertNomeVerifica 'Esfiha carne', 27.00, 4;
EXEC spInsertNomeVerifica 'Folhado queijo', 31.00, 4;

GO

--c)
SELECT * FROM tbCliente

CREATE PROCEDURE spCadastroCliente
    @nomeCliente VARCHAR(100),
    @dataNascimentoCliente DATE,
    @ruaCliente VARCHAR(100),
    @numCasaCliente INT,
    @cepCliente VARCHAR(10),
    @bairroCliente VARCHAR(50),
    @cidadeCliente VARCHAR(50),
    @estadoCliente CHAR(2),
    @cpfCliente VARCHAR(11),
    @sexoCliente CHAR(1)
AS
BEGIN
    -- Verifica se o CPF do cliente j� est� cadastrado
    IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
    BEGIN
        PRINT ('Cliente cpf ' + @cpfCliente + ' j� cadastrado');
    END
    -- Verifica se o bairro � 'Guaianases' ou 'Itaquera'
    ELSE IF @bairroCliente = 'Guaianases' OR @bairroCliente = 'Itaquera'
    BEGIN
        INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
        VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente);

        PRINT ('Cliente ' + @nomeCliente + ' inserido com sucesso');
    END
    -- Caso o bairro n�o seja atendido pela confeitaria
    ELSE
    BEGIN
        PRINT ('N�o foi poss�vel cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' n�o � atendido pela confeitaria');
    END
END;


-- Samira Fatah
EXEC spCadastroCliente 
    @nomeCliente = 'Samira Fatah',
    @dataNascimentoCliente = '1990-05-05',
    @ruaCliente = 'Rua Aguape�',
    @numCasaCliente = 1000,
    @cepCliente = '08.090-000',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'S�o Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '123.456.789-01',
    @sexoCliente = 'F';

-- Celia Nogueira
EXEC spCadastroCliente 
    @nomeCliente = 'Celia Nogueira',
    @dataNascimentoCliente = '1992-06-06',
    @ruaCliente = 'Rua Andes',
    @numCasaCliente = 234,
    @cepCliente = '08.456-090',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'S�o Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '234.567.890-12',
    @sexoCliente = 'F';

-- Paulo Cesar Siqueira
EXEC spCadastroCliente 
    @nomeCliente = 'Paulo Cesar Siqueira',
    @dataNascimentoCliente = '1984-04-04',
    @ruaCliente = 'Rua Castelo do Piau�',
    @numCasaCliente = 232,
    @cepCliente = '08.109-000',
    @bairroCliente = 'Itaquera',
    @cidadeCliente = 'S�o Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '345.678.901-23',
    @sexoCliente = 'M';

-- Rodrigo Favaroni
EXEC spCadastroCliente 
    @nomeCliente = 'Rodrigo Favaroni',
    @dataNascimentoCliente = '1991-04-09',
    @ruaCliente = 'Rua Sans�o Castelo Branco',
    @numCasaCliente = 10,
    @cepCliente = '08.431-090',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'S�o Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '456.789.012-34',
    @sexoCliente = 'M';

-- Fl�via Regina Brito
EXEC spCadastroCliente 
    @nomeCliente = 'Fl�via Regina Brito',
    @dataNascimentoCliente = '1992-04-22',
    @ruaCliente = 'Rua Mariano Moro',
    @numCasaCliente = 300,
    @cepCliente = '08.200-123',
    @bairroCliente = 'Itaquera',
    @cidadeCliente = 'S�o Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '567.890.123-45',
    @sexoCliente = 'F';
GO


--d)
select * from tbCliente

SELECT * FROM tbEncomenda

CREATE PROCEDURE spCriarEncomenda
    @cpfCliente VARCHAR(11),
    @dataEncomenda DATE,
    @valorTotalEncomenda DECIMAL(10, 2),
    @dataEntregaEncomenda DATE
AS
BEGIN
    -- Verificar se o cliente est� cadastrado e obter o codCliente e nomeCliente
    DECLARE @codCliente INT;
    DECLARE @nomeCliente VARCHAR(100);

    SELECT @codCliente = codCliente, @nomeCliente = nomeCliente 
    FROM tbCliente 
    WHERE cpfCliente = @cpfCliente;

    IF @codCliente IS NULL
    BEGIN
        PRINT('N�o foi poss�vel efetivar a encomenda pois o cliente com CPF ' + @cpfCliente + ' n�o est� cadastrado');
        RETURN;
    END

    -- Verificar se a data de entrega n�o � menor do que a data da encomenda
    IF @dataEntregaEncomenda < @dataEncomenda
    BEGIN
        PRINT('N�o � poss�vel entregar uma encomenda antes da encomenda ser realizada');
        RETURN;
    END

    -- Inserir a encomenda
    INSERT INTO tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
    VALUES (@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda);
    
    -- Obter o n�mero da encomenda rec�m-criada
    DECLARE @codEncomenda INT;
    SET @codEncomenda = SCOPE_IDENTITY();

    -- Exibir mensagem de sucesso
	PRINT('Encomenda ' + CAST(@codEncomenda AS VARCHAR(10)) + ' para o cliente ' + @nomeCliente + ' efetuada com sucesso');
END;
GO

SELECT * FROM tbEncomenda
-- Encomenda 1
EXEC spCriarEncomenda
    @cpfCliente = '123.456.789',
    @dataEncomenda = '2015-08-08',
    @valorTotalEncomenda = 450.00,
    @dataEntregaEncomenda = '2015-08-15';


-- Encomenda 2
EXEC spCriarEncomenda
    @cpfCliente = '234.567.890', -- Verifique se este CPF corresponde ao codCliente = 2
    @dataEncomenda = '2015-10-10',
    @valorTotalEncomenda = 200.00,
    @dataEntregaEncomenda = '2015-10-15';

-- Encomenda 3
EXEC spCriarEncomenda
    @cpfCliente = '345.678.901', -- Verifique se este CPF corresponde ao codCliente = 3
    @dataEncomenda = '2015-10-10',
    @valorTotalEncomenda = 150.00,
    @dataEntregaEncomenda = '2015-12-10';

-- Encomenda 4
EXEC spCriarEncomenda
    @cpfCliente = '123.456.789', -- Correspondente ao codCliente = 1
    @dataEncomenda = '2015-10-06',
    @valorTotalEncomenda = 250.00,
    @dataEntregaEncomenda = '2015-10-12';

-- Encomenda 5
EXEC spCriarEncomenda
    @cpfCliente = '456.789.012', -- Verifique se este CPF corresponde ao codCliente = 4
    @dataEncomenda = '2015-10-05',
    @valorTotalEncomenda = 150.00,
    @dataEntregaEncomenda = '2015-10-12';

--Arrumar cpf do ex D

--e)
