CREATE DATABASE bdRestaurante
Go
USE bdRestaurante
CREATE TABLE tbCargo (
	idCargo INT IDENTITY(1,1) PRIMARY KEY,
	nomeCargo VARCHAR (35) NOT NULL,
	descCargo VARCHAR (90),
	salarioCargo INT
);
CREATE TABLE tbFuncionario(
	idFuncionario INT IDENTITY(1,1) PRIMARY KEY,
	nomeFuncionario VARCHAR(75) NOT NULL,
	dataContratoFuncionario DATE NOT NULL,
	statusFuncionario VARCHAR (30),
	lograFuncionario VARCHAR (60) NOT NULL,
	numLograFuncionario VARCHAR (10) NOT NULL,
	bairroFuncionario VARCHAR (50) NOT NULL,
	ufFuncionario VARCHAR (2) NOT NULL,
	cidadeFuncionario VARCHAR (50),
	cepFuncionario VARCHAR (8) NOT NULL,
	compleFuncionario VARCHAR (90),
	idCargo INT FOREIGN KEY (idCargo) REFERENCES tbCargo(idCargo)
);
CREATE TABLE tbFoneFuncionario(
	idFoneFuncionario INT IDENTITY(1,1) PRIMARY KEY,
	numFoneFuncionario VARCHAR (13),
	idFuncionario INT FOREIGN KEY (idFuncionario) REFERENCES tbFuncionario(idFuncionario)
);
CREATE TABLE tbPedido (
	idPedido INT IDENTITY(1,1) PRIMARY KEY,
	dtaPedido DATE,
	horaPedido TIME,
	descPedido VARCHAR (45),
	idFuncionario INT FOREIGN KEY (idFuncionario) REFERENCES tbFuncionario(idFuncionario)
	idCliente INT FOREIGN KEY (idCliente) REFERENCES tbCliente(idCliente)
);
CREATE TABLE tbHistoricoVenda(
	idHistoricoVenda INT IDENTITY (1,1) PRIMARY KEY,
	idFuncionario INT FOREIGN KEY (idFuncionario) REFERENCES tbFuncionario(idFuncionario),
	idPagamento INT FOREIGN KEY (idPagamento) REFERENCES tbPagamento(idPagamento),
	valorTotalHistoricoVenda INT
);
CREATE TABLE tbPagamento(
	idPagamento INT IDENTITY (1,1) PRIMARY KEY,
	valorTotalPagamento INT,
	dtaPagamento DATE,
	horaPagamento TIME,
	descPagamento VARCHAR (50),
	idCliente INT FOREIGN KEY (idCliente) REFERENCES tbCliente(idCliente)
);
CREATE TABLE tbCliente(
	idCliente INT IDENTITY (1,1) PRIMARY KEY,
	nomeCliente VARCHAR (75),
	emailCliente VARCHAR (255),
	idCardapio INT FOREIGN KEY (idCardapio) REFERENCES tbCardapio(idCardapio),
	lograCliente VARCHAR (60) NOT NULL,
	numLograCliente VARCHAR (10) NOT NULL,
	bairroCliente VARCHAR (50) NOT NULL,
	ufCliente VARCHAR (2) NOT NULL,
	cidadeCliente VARCHAR (50),
	cepCliente VARCHAR (8) NOT NULL,
	compleCliente VARCHAR (90),
);
CREATE TABLE tbAvaliacao(
	idAvaliacao INT IDENTITY (1,1) PRIMARY KEY,
	notaAvaliacao INT NOT NULL,
	dataAvaliacao DATE NOT NULL,
	comentAvaliacao VARCHAR (250),
	descAvaliacao VARCHAR (90),
	idCliente INT FOREIGN KEY (idCliente) REFERENCES tbCliente(idCliente)
);
CREATE TABLE tbReserva(
	idReserva INT IDENTITY (1,1) PRIMARY KEY,
	statusReserva VARCHAR(15),
	dataReserva DATE,
	horaReserva TIME,
	descReserva VARCHAR(75),
	idCliente INT FOREIGN KEY (idCliente) REFERENCES tbCliente(idCliente)
);