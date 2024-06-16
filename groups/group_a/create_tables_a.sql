CREATE SCHEMA group_a;
SET search_path TO group_a;

SHOW search_path;

-- Tabela Endereco
CREATE TABLE Endereco (
    ID_Endereco SERIAL PRIMARY KEY,
    Rua VARCHAR(90) NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(90) NOT NULL,
    Cidade VARCHAR(90) NOT NULL,
    Estado VARCHAR(90) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    Complemento VARCHAR(45) NULL
);

-- Tabela Clientes
CREATE TABLE Clientes (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(90) NOT NULL,
    Tipo_Cliente VARCHAR(20) CHECK (Tipo_Cliente IN ('Fisica', 'Juridica')) NOT NULL,
    Documento VARCHAR(14) NOT NULL,
    ID_Endereco INT NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CNH INT NULL,
    Data_Validade_CNH DATE NULL,
    CNPJ_Empresa VARCHAR(14) NULL,
    FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco)
);

-- Tabela Grupos Veiculos
CREATE TABLE Grupos_Veiculos (
    ID_Grupo SERIAL PRIMARY KEY,
    Nome_Grupo VARCHAR(45) NOT NULL
);

-- Tabela Veiculos
CREATE TABLE Veiculos (
    ID_Veiculo SERIAL PRIMARY KEY,
    ID_Grupo INT NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    Marca VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Cor VARCHAR(45) NOT NULL,
    Ar_Condicionado BOOLEAN NOT NULL,
    Mecanizacao VARCHAR(20) CHECK (Mecanizacao IN ('Manual', 'Automatica')) NOT NULL,
    Cadeirinha BOOLEAN NOT NULL,
    Link_Fotos VARCHAR(255) NOT NULL,
    Assentos INT NOT NULL,
    Tamanho_Mala FLOAT NOT NULL,
    Carga_Maxima FLOAT NOT NULL,
    FOREIGN KEY (ID_Grupo) REFERENCES Grupos_Veiculos(ID_Grupo)
);



-- Tabela Prontuario
CREATE TABLE Prontuario (
    ID_Prontuario SERIAL PRIMARY KEY,
    ID_Veiculo INT NOT NULL,
    Data_Registro DATE NOT NULL,
    Descricao_Manutencao VARCHAR(255) NOT NULL,
    Estado_Conservacao VARCHAR(1) CHECK (Estado_Conservacao IN ('1', '2', '3', '4', '5')) NOT NULL,
    Pressao_Pneus FLOAT NOT NULL,
    Nivel_Oleo BOOLEAN NOT NULL,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID_Veiculo)
);

-- Tabela Patios
CREATE TABLE Patios (
    ID_Patio SERIAL PRIMARY KEY,
    ID_Endereco INT NOT NULL,
    Capacidade INT NOT NULL,
    FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco)
);

-- Tabela Reservas
CREATE TABLE Reservas (
    ID_Reserva SERIAL PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Veiculo INT NOT NULL,
    Data_Reserva DATE NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NOT NULL,
    Status_Reserva VARCHAR(10) CHECK (Status_Reserva IN ('Ativa', 'Cancelada', 'Concluida')) NOT NULL,
    Patio_Retirada INT NOT NULL,
    Patio_Devolucao INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID_Veiculo),
    FOREIGN KEY (Patio_Retirada) REFERENCES Patios(ID_Patio),
    FOREIGN KEY (Patio_Devolucao) REFERENCES Patios(ID_Patio)
);

-- Tabela Locacoes
CREATE TABLE Locacoes (
    ID_Locacao SERIAL PRIMARY KEY,
    ID_Reserva INT NOT NULL,
    Data_Retirada DATE NOT NULL,
    Data_Devolucao_Prevista DATE NOT NULL,
    Data_Devolucao_Realizada DATE NOT NULL,
    Valor_Aluguel FLOAT NOT NULL,
    Patio_Retirada INT NOT NULL,
    Patio_Devolucao INT NOT NULL,
    Status_Locacao VARCHAR(20) CHECK (Status_Locacao IN ('Em andamento', 'Concluida', 'Cancelada')) NOT NULL,
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva),
    FOREIGN KEY (Patio_Retirada) REFERENCES Patios(ID_Patio),
    FOREIGN KEY (Patio_Devolucao) REFERENCES Patios(ID_Patio)
);
