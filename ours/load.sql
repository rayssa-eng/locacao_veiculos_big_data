
-- Assuming temp_something are the temporary tables storing the data manipulated in ET.

SET search_path TO dwh;


INSERT INTO Cliente (Cd_Cliente, Nm_Cliente, Cd_CNH, Cd_CNPJ_CPF, Endereco, Dt_Nascimento, Nu_Telefone, Nm_Email, Dt_Validade_CNH)
SELECT
    DISTINCT Cd_Cliente,
    Nm_Cliente,
    Cd_CNH,
    Cd_CNPJ_CPF,
    Endereco,
    Dt_Nascimento,
    Nu_Telefone,
    Nm_Email,
    Dt_Validade_CNH
FROM
    temp_clientes;


INSERT INTO Data (Cd_Tempo, Hh_Hora, Dd_Dia, Mm_Mes, Aa_Ano)
SELECT
    DISTINCT Cd_Tempo,
    Hh_Hora,
    Dd_Dia,
    Mm_Mes,
    Aa_Ano
FROM
    temp_datas;


INSERT INTO Patio (Cd_Patio, Nm_Patio)
SELECT
    DISTINCT Cd_Patio,
    Nm_Patio
FROM
    temp_patios;

INSERT INTO Reserva (Cd_Reserva, Dt_Reserva, Dt_Entrega, Dt_Devolucao, Cd_Situacao)
SELECT
    DISTINCT Cd_Reserva,
    Dt_Reserva,
    Dt_Entrega,
    Dt_Devolucao,
    Cd_Situacao
FROM
    temp_reservas;


INSERT INTO Veiculo (Cd_Veiculo, Nm_Motor, Nm_Combustivel, Ds_Motorizacao, Nu_Placa, Nu_Chassi, Nm_Cor, Nm_Modelo, Nm_Marca, Nm_Pneu, Cd_Categoria, Vl_Valor_da_Categoria, Ds_Ar_Condicionado, Ds_Foto)
SELECT
    DISTINCT Cd_Veiculo,
    Nm_Motor,
    Nm_Combustivel,
    Ds_Motorizacao,
    Nu_Placa,
    Nu_Chassi,
    Nm_Cor,
    Nm_Modelo,
    Nm_Marca,
    Nm_Pneu,
    Cd_Categoria,
    Vl_Valor_da_Categoria,
    Ds_Ar_Condicionado,
    Ds_Foto
FROM
    temp_veiculos;


INSERT INTO Locacao (Cd_Locacao, Cd_Veiculo, Cd_Tempo, Cd_Patio, Cd_Cliente, Cd_Reserva, Dt_Intervalo_de_Tempo, Nu_Total_por_Veiculo, Qt_Locacoes_por_Veiculo)
SELECT
    DISTINCT Cd_Locacao,
    Cd_Veiculo,
    Cd_Tempo,
    Cd_Patio,
    Cd_Cliente,
    Cd_Reserva,
    Dt_Intervalo_de_Tempo,
    Nu_Total_por_Veiculo,
    Qt_Locacoes_por_Veiculo
FROM
    temp_locacoes;


RESET search_path;
