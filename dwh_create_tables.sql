SHOW search_path;
SET search_path TO dwh;

-- Dimension Table: Cliente
CREATE TABLE dwh_cliente
( 
    Cd_Cliente         SERIAL PRIMARY KEY,
    Nm_Cliente         VARCHAR(30),
    Cd_CNH             VARCHAR(30),
    Cd_CNPJ_CPF        VARCHAR(30),
    Nm_Cidade          VARCHAR(30),
    Nm_Estado          VARCHAR(30),
    Dt_Nascimento      TIMESTAMP,
    Nu_Telefone        INTEGER,
    Nm_Email           VARCHAR(30),
    Dt_Validade_CNH    TIMESTAMP,
    Nm_Pneu            VARCHAR(30),
    Vl_Valor_da_Categoria DECIMAL(15,2)
);

-- Dimension Table: Data
CREATE TABLE dwh_data
( 
    Cd_Tempo           SERIAL PRIMARY KEY,
    Hh_Hora            TIME,
    Dd_Dia             INTEGER,
    Mm_Mes             INTEGER,
    Aa_Ano             INTEGER
);

-- Dimension Table: Patio
CREATE TABLE dwh_patio
( 
    Cd_Patio           SERIAL PRIMARY KEY,
    Nm_Patio           VARCHAR(30)
);

-- Dimension Table: Reserva
CREATE TABLE dwh_reserva
( 
    Cd_Reserva         SERIAL PRIMARY KEY,
    Dt_Reserva         TIMESTAMP,
    Dt_Entrega         TIMESTAMP,
    Dt_Devolucao       TIMESTAMP,
    Cd_Situacao        BOOLEAN
);

-- Dimension Table: Veiculo
CREATE TABLE dwh_veiculo
( 
    Cd_Veiculo         SERIAL PRIMARY KEY,
    Nm_Motor           VARCHAR(30),
    Nm_Combustivel     VARCHAR(30),
    Ds_Motorizacao     VARCHAR(30),
    Nu_Placa           VARCHAR(20),
    Nu_Chassi          VARCHAR(30),  -- Changed to VARCHAR for compatibility with possible alphanumeric values
    Nm_Cor             VARCHAR(20),
    Nm_Modelo          VARCHAR(30),
    Nm_Marca           VARCHAR(30),
    Cd_Categoria       INTEGER,
    Ds_Ar_Condicionado BOOLEAN,
    Ds_Foto            BYTEA
);

-- Fact Table: Locacao
CREATE TABLE dwh_locacao
( 
    Cd_Locacao         SERIAL PRIMARY KEY,
    Cd_Veiculo         INTEGER NOT NULL,
    Cd_Tempo           INTEGER NOT NULL,
    Cd_Patio           INTEGER NOT NULL,
    Cd_Cliente         INTEGER NOT NULL,
    Cd_Reserva         INTEGER NOT NULL,
    Dt_Intervalo_de_Tempo TIMESTAMP,
    Nu_Total_por_Veiculo INTEGER,
    Qt_Locacoes_por_Veiculo INTEGER,
    FOREIGN KEY (Cd_Veiculo) REFERENCES dwh_veiculo(Cd_Veiculo),
    FOREIGN KEY (Cd_Tempo) REFERENCES dwh_data(Cd_Tempo),
    FOREIGN KEY (Cd_Patio) REFERENCES dwh_patio(Cd_Patio),
    FOREIGN KEY (Cd_Cliente) REFERENCES dwh_cliente(Cd_Cliente),
    FOREIGN KEY (Cd_Reserva) REFERENCES dwh_reserva(Cd_Reserva)
);
