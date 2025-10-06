CREATE DATABASE bdRestaurante01;
GO
USE bdRestaurante01;
GO

CREATE TABLE tbCargo (
    idCargo INT IDENTITY(1,1) PRIMARY KEY,
    nomeCargo VARCHAR(35) NOT NULL,
    descCargo VARCHAR(90),
    salarioCargo INT
);

CREATE TABLE tbFuncionario(
    idFuncionario INT IDENTITY(1,1) PRIMARY KEY,
    nomeFuncionario VARCHAR(75) NOT NULL,
    dataContratoFuncionario DATE NOT NULL,
    statusFuncionario VARCHAR(30),
    lograFuncionario VARCHAR(60) NOT NULL,
    numLograFuncionario VARCHAR(10) NOT NULL,
    bairroFuncionario VARCHAR(50) NOT NULL,
    ufFuncionario VARCHAR(2) NOT NULL,
    cidadeFuncionario VARCHAR(50),
    cepFuncionario VARCHAR(8) NOT NULL,
    compleFuncionario VARCHAR(90),
    idCargo INT FOREIGN KEY REFERENCES tbCargo(idCargo)
);

CREATE TABLE tbFoneFuncionario(
    idFoneFuncionario INT IDENTITY(1,1) PRIMARY KEY,
    numFoneFuncionario VARCHAR(13),
    idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario)
);

CREATE TABLE tbProduto(
    idProduto INT IDENTITY(1,1) PRIMARY KEY,
    nomeProduto VARCHAR(75),
    precoProduto VARCHAR(75) NOT NULL,
    quantidadeProduto VARCHAR(50) NOT NULL,
    dataValidadeProduto DATE,
    dataFabricacaoProduto DATE
);

CREATE TABLE tbCardapio (
    idCardapio INT IDENTITY(1,1) PRIMARY KEY,
    descCardapio VARCHAR(75),
    itemCardapio VARCHAR(50),
    precoCardapio VARCHAR(10), 
    categoriaCardapio VARCHAR(50), 
    disponibilidadeCardapio VARCHAR(50), 
    idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
);

CREATE TABLE tbCardapioProduto(
    idCardapioProduto  INT IDENTITY (1,1) PRIMARY KEY,
    idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto),
    idCardapio INT FOREIGN KEY REFERENCES tbCardapio(idCardapio)
);

CREATE TABLE tbCliente(
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nomeCliente VARCHAR(75),
    emailCliente VARCHAR(255),
    idCardapio INT FOREIGN KEY REFERENCES tbCardapio(idCardapio),
    lograCliente VARCHAR(60) NOT NULL,
    numLograCliente VARCHAR(10) NOT NULL,
    bairroCliente VARCHAR(50) NOT NULL,
    ufCliente VARCHAR(2) NOT NULL,
    cidadeCliente VARCHAR(50),
    cepCliente VARCHAR(8) NOT NULL,
    compleCliente VARCHAR(90)
);

CREATE TABLE tbPedido (
    idPedido INT IDENTITY(1,1) PRIMARY KEY,
    dtaPedido DATE,
    horaPedido TIME,
    descPedido VARCHAR(45),
    idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario),
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbPagamento(
    idPagamento INT IDENTITY(1,1) PRIMARY KEY,
    valorTotalPagamento INT,
    dAtaPagamento DATE,
    horaPagamento TIME,
    descPagamento VARCHAR(50),
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbHistoricoVenda(
    idHistoricoVenda INT IDENTITY (1,1) PRIMARY KEY,
    idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario),
    idPagamento INT FOREIGN KEY REFERENCES tbPagamento(idPagamento),
    valorTotalHistoricoVenda INT
);

CREATE TABLE tbAvaliacao(
    idAvaliacao INT IDENTITY (1,1) PRIMARY KEY,
    notaAvaliacao INT NOT NULL,
    dataAvaliacao DATE NOT NULL,
    comentAvaliacao VARCHAR(250),
    descAvaliacao VARCHAR(90),
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbReserva(
    idReserva INT IDENTITY (1,1) PRIMARY KEY,
    statusReserva VARCHAR(15),
    dataReserva DATE,
    horaReserva TIME,
    descReserva VARCHAR(75),
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbFoneCliente(
    idFoneCliente INT IDENTITY(1,1) PRIMARY KEY,
    numFoneCliente VARCHAR (13),
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbCadastro(
    idCadastro INT IDENTITY(1,1) PRIMARY KEY,
    descCadastro VARCHAR (75),
    dataCadastro DATE,
    horaCadastro TIME,
    idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
);

CREATE TABLE tbFornecedor(
    idFornecedor INT IDENTITY(1,1) PRIMARY KEY,
    nomeFornecedor VARCHAR(75),
    emailFornecedor VARCHAR(255),
    lograFornecedor VARCHAR(60) NOT NULL,
    numLograFornecedor VARCHAR(10) NOT NULL,
    bairroFornecedor VARCHAR(50) NOT NULL,
    ufFornecedor VARCHAR(2) NOT NULL,
    cidadeFornecedor VARCHAR(50),
    cepFornecedor VARCHAR(8) NOT NULL,
    compleFornecedor VARCHAR(90),
    cnpjFornecedor VARCHAR(15) UNIQUE,
    descFornecedor VARCHAR(75)
);

CREATE TABLE tbEstoque(
    idEstoque INT IDENTITY(1,1) PRIMARY KEY,
    descEstoque VARCHAR(75),
    idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto),
    idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
);

CREATE TABLE tbFoneFornecedor(
    idFoneFornecedor INT IDENTITY(1,1) PRIMARY KEY,
    numFoneFornecedor VARCHAR (13),
    idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
); 