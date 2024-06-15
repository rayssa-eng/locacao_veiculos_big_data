-- Dimension Table: Cliente
CREATE TABLE [Cliente]
( 
    [Cd_Cliente]         integer  NOT NULL,
    [Nm_Cliente]         varchar(30)  NULL,
    [Cd_CNH]             varchar(30)  NULL,
    [Cd_CNPJ_CPF]        varchar(30)  NULL,
    [Nm_Cidade]          varchar(30)  NULL,
    [Nm_Estado]          varchar(30)  NULL,
    [Dt_Nascimento]      datetime  NULL,
    [Nu_Telefone]        integer  NULL,
    [Nm_Email]           varchar(30)  NULL,
    [Dt_Validade_CNH]    datetime  NULL,
    [Nm_Pneu]            varchar(30)  NULL,
    [Vl_Valor_da_Categoria] decimal(15,2)  NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED ([Cd_Cliente] ASC)
)
GO

-- Dimension Table: Data
CREATE TABLE [Data]
( 
    [Cd_Tempo]           integer  NOT NULL,
    [Hh_Hora]            timestamp  NULL,
    [Dd_Dia]             integer  NULL,
    [Mm_Mes]             integer  NULL,
    [Aa_Ano]             integer  NULL,
    CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED ([Cd_Tempo] ASC)
)
GO

-- Dimension Table: Patio
CREATE TABLE [Patio]
( 
    [Cd_Patio]           integer  NOT NULL,
    [Nm_Patio]           varchar(30)  NULL,
    CONSTRAINT [PK_Patio] PRIMARY KEY CLUSTERED ([Cd_Patio] ASC)
)
GO

-- Dimension Table: Reserva
CREATE TABLE [Reserva]
( 
    [Cd_Reserva]         integer  NOT NULL,
    [Dt_Reserva]         datetime  NULL,
    [Dt_Entrega]         datetime  NULL,
    [Dt_Devolucao]       datetime  NULL,
    [Cd_Situacao]        bit  NULL,
    CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED ([Cd_Reserva] ASC)
)
GO

-- Dimension Table: Veiculo
CREATE TABLE [Veiculo]
( 
    [Cd_Veiculo]         integer  NOT NULL,
    [Nm_Motor]           varchar(30)  NULL,
    [Nm_Combustivel]     varchar(30)  NULL,
    [Ds_Motorizacao]     varchar(30)  NULL,
    [Nu_Placa]           varchar(20)  NULL,
    [Nu_Chassi]          integer  NULL,
    [Nm_Cor]             varchar(20)  NULL,
    [Nm_Modelo]          varchar(30)  NULL,
    [Nm_Marca]           varchar(30)  NULL,
    [Cd_Categoria]       integer  NULL,
    [Ds_Ar_Condicionado] bit  NULL,
    [Ds_Foto]            image  NULL,
    CONSTRAINT [PK_Veiculo] PRIMARY KEY CLUSTERED ([Cd_Veiculo] ASC)
)
GO

-- Fact Table: Locacao
CREATE TABLE [Locacao]
( 
    [Cd_Locacao]         integer  NOT NULL IDENTITY(1,1),
    [Cd_Veiculo]         integer  NOT NULL,
    [Cd_Tempo]           integer  NOT NULL,
    [Cd_Patio]           integer  NOT NULL,
    [Cd_Cliente]         integer  NOT NULL,
    [Cd_Reserva]         integer  NOT NULL,
    [Dt_Intervalo_de_Tempo] datetime  NULL,
    [Nu_Total_por_Veiculo] integer  NULL,
    [Qt_Locacoes_por_Veiculo] integer  NULL,
    CONSTRAINT [PK_Locacao] PRIMARY KEY CLUSTERED ([Cd_Locacao] ASC)
)
GO

-- Foreign Key Constraints
ALTER TABLE [Locacao]
    ADD CONSTRAINT [FK_Locacao_Veiculo] FOREIGN KEY ([Cd_Veiculo]) REFERENCES [Veiculo]([Cd_Veiculo])
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
GO

ALTER TABLE [Locacao]
    ADD CONSTRAINT [FK_Locacao_Data] FOREIGN KEY ([Cd_Tempo]) REFERENCES [Data]([Cd_Tempo])
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
GO

ALTER TABLE [Locacao]
    ADD CONSTRAINT [FK_Locacao_Patio] FOREIGN KEY ([Cd_Patio]) REFERENCES [Patio]([Cd_Patio])
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
GO

ALTER TABLE [Locacao]
    ADD CONSTRAINT [FK_Locacao_Cliente] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
GO

ALTER TABLE [Locacao]
    ADD CONSTRAINT [FK_Locacao_Reserva] FOREIGN KEY ([Cd_Reserva]) REFERENCES [Reserva]([Cd_Reserva])
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
GO
