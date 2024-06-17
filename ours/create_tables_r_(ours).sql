-- Grupo:
-- Felipe da Costa Marroni, DRE: 115092322
-- Janine Qiao Ma, DRE: 110072270
-- Rayssa Cristina de Almeida, DRE: 121041567


-- Dimension Table: Cliente
CREATE TABLE Cliente
( 
    Cd_Cliente         SERIAL PRIMARY KEY,
    Nm_Cliente         VARCHAR(30),
    Cd_CNH             VARCHAR(30),
    Cd_CNPJ_CPF        VARCHAR(30),
    Endereco           VARCHAR(255),
    Dt_Nascimento      TIMESTAMP,
    Nu_Telefone        VARCHAR(30),
    Nm_Email           VARCHAR(30),
    Dt_Validade_CNH    TIMESTAMP,
    Nm_Pneu            VARCHAR(30),
    Vl_Valor_da_Categoria DECIMAL(15,2)
);

-- Dimension Table: Data
-- CREATE TABLE Data
-- ( 
--     Cd_Tempo           SERIAL PRIMARY KEY,
--     Hh_Hora            TIME,
--     Dd_Dia             INTEGER,
--     Mm_Mes             INTEGER,
--     Aa_Ano             INTEGER
-- );

-- Dimension Table: Patio
CREATE TABLE Patio
( 
    Cd_Patio           SERIAL PRIMARY KEY,
    Nm_Patio           VARCHAR(30)
);

-- Dimension Table: Reserva
CREATE TABLE Reserva
( 
    Cd_Reserva         SERIAL PRIMARY KEY,
    Dt_Reserva         TIMESTAMP,
    Dt_Entrega         TIMESTAMP,
    Dt_Devolucao       TIMESTAMP,
    Cd_Situacao        VARCHAR(30)
);

-- Dimension Table: Veiculo
CREATE TABLE Veiculo
( 
    Cd_Veiculo              SERIAL PRIMARY KEY,
    Nm_Motor                VARCHAR(30),
    Nm_Combustivel          VARCHAR(30),
    Ds_Motorizacao          VARCHAR(30),
    Nu_Placa                VARCHAR(20),
    Nu_Chassi               VARCHAR(30),  -- Changed to VARCHAR for compatibility with possible alphanumeric values
    Nm_Cor                  VARCHAR(20),
    Nm_Modelo               VARCHAR(30),
    Nm_Marca                VARCHAR(30),
    Nm_Pneu                 VARCHAR(30),
    Cd_Categoria            VARCHAR(30),
    Vl_Valor_da_Categoria   DECIMAL(15,2),
    Ds_Ar_Condicionado      BOOLEAN,
    Ds_Foto                 VARCHAR(255), -- URL
);

-- Fact Table: Locacao
CREATE TABLE Locacao
( 
    Cd_Locacao         SERIAL PRIMARY KEY,
    Cd_Veiculo         INTEGER NOT NULL,
    Cd_Patio           INTEGER NOT NULL,
    Cd_Cliente         INTEGER NOT NULL,
    Cd_Reserva         INTEGER NOT NULL,
    Qt_Locacoes_por_Veiculo INTEGER,
    Qt_Reserva         INTEGER NOT NULL,
    Nu_Quantidade      INTEGER NOT NULL
    FOREIGN KEY (Cd_Veiculo) REFERENCES Veiculo(Cd_Veiculo),
    FOREIGN KEY (Cd_Tempo) REFERENCES Data(Cd_Tempo),
    FOREIGN KEY (Cd_Patio) REFERENCES Patio(Cd_Patio),
    FOREIGN KEY (Cd_Cliente) REFERENCES Cliente(Cd_Cliente),
    FOREIGN KEY (Cd_Reserva) REFERENCES Reserva(Cd_Reserva)
);


-- CREATE TABLE dwh.temp
-- (

-- );