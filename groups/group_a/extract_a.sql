-- Switch to group_a schema for extraction
SET search_path TO group_a;

-- Clientes table
INSERT INTO dwh.Cliente (Cd_Cliente, Nm_Cliente, Cd_CNH, Cd_CNPJ_CPF, Dt_Nascimento, Nu_Telefone, Nm_Email, Dt_Validade_CNH)
SELECT ID_Cliente AS Cd_Cliente,
       Nome AS Nm_Cliente,
       CNH AS Cd_CNH,
       Documento AS Cd_CNPJ_CPF,
       Data_Nascimento AS Dt_Nascimento,
       Telefone AS Nu_Telefone,
       Email AS Nm_Email,
       Data_Validade_CNH AS Dt_Validade_CNH
FROM group_a.Clientes;


-- Patios table
INSERT INTO dwh.Patio (Cd_Patio, Nm_Patio)
SELECT ID_Patio AS Cd_Patio,
	   NULL AS Nm_Patio
FROM group_a.Patios;


-- Veiculos table
INSERT INTO dwh.Veiculo (Cd_Veiculo, Nm_Marca, Nm_Modelo, Nm_Cor, Ds_Ar_Condicionado, Ds_Motorizacao, Nm_Pneu, Cd_Categoria, Vl_Valor_da_Categoria, Nu_Placa, Nu_Chassi, Ds_Foto)
SELECT ID_Veiculo AS Cd_Veiculo,
       Marca AS Nm_Marca,
       Modelo AS Nm_Modelo,
       Cor AS Nm_Cor,
       Ar_Condicionado AS Ds_Ar_Condicionado,
       Mecanizacao AS Ds_Motorizacao,
       NULL AS Nm_Pneu,
       NULL AS Cd_Categoria,
       NULL AS Vl_Valor_da_Categoria,
       Placa AS Nu_Placa,
       NULL AS Nu_Chassi,
       NULL AS Ds_Foto
FROM group_a.Veiculos;


-- Reservas table = locacao (fact)
INSERT INTO dwh.Locacao (Cd_Locacao, Cd_Veiculo, Cd_Cliente, Cd_Patio)
SELECT ID_Reserva AS Cd_Locacao,
       ID_Veiculo AS Cd_Veiculo,
       ID_Cliente AS Cd_Cliente,
       Patio_Retirada AS CD_Patio
FROM group_a.Reservas;

INSERT INTO dwh.Reserva (Dt_Reserva, Dt_Entrega, Dt_Devolucao)

SELECT Data_Reserva AS Dt_Reserva,
	   Data_Inicio  AS Dt_Entrega,
	   Data_Fim AS Dt_Devolucao
FROM group_a.Reservas;
	   

-- Locacoes table = reserva
INSERT INTO dwh.Reserva (Cd_Reserva, Cd_Situacao)
SELECT 
       ID_Locacao AS Cd_Reserva,
	   Status_Locacao AS CD_Situacao
FROM group_a.Locacoes;