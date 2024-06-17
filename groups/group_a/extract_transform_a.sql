
-- Grupo:
-- Felipe da Costa Marroni, DRE: 115092322
-- Janine Qiao Ma, DRE: 110072270
-- Rayssa Cristina de Almeida, DRE: 121041567


SET search_path TO group_a;

-- Clientes
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


-- Patios
INSERT INTO dwh.Patio (Cd_Patio, Nm_Patio)
SELECT ID_Patio AS Cd_Patio,
	   NULL AS Nm_Patio
FROM group_a.Patios;


-- Veiculos
INSERT INTO dwh.Veiculo (Cd_Veiculo, Nm_Marca, Nm_Modelo, Nm_Cor, Ds_Ar_Condicionado, Ds_Motorizacao, Nm_Pneu, Vl_Valor_da_Categoria, Nu_Placa, Nu_Chassi, Ds_Foto)
SELECT ID_Veiculo AS Cd_Veiculo,
       Marca AS Nm_Marca,
       Modelo AS Nm_Modelo,
       Cor AS Nm_Cor,
       Ar_Condicionado AS Ds_Ar_Condicionado,
       Mecanizacao AS Ds_Motorizacao,
       NULL AS Nm_Pneu,
       NULL AS Vl_Valor_da_Categoria,
       Placa AS Nu_Placa,
       NULL AS Nu_Chassi,
       Link_Fotos AS Ds_Foto
FROM group_a.Veiculos;

-- Nu_Quantidade_Veiculo
INSERT INTO dwh.Veiculo (Nu_Quantidade_Veiculo)
SELECT COUNT(Cd_Veiculo)
FROM dwh.Veiculo
GROUP BY Cd_Veiculo;

-- Grupo = categoria
INSERT INTO dwh.Veiculo(Cd_Categoria)
SELECT nome_grupo AS Cd_Categoria
FROM group_a.grupos_veiculos;


-- Locacao (fact) = reservas_m 
INSERT INTO dwh.Locacao (Cd_Veiculo, Cd_Cliente, Cd_Patio)
SELECT ID_Veiculo AS Cd_Veiculo,
       ID_Cliente AS Cd_Cliente,
       Patio_Retirada AS CD_Patio
FROM group_a.Reservas;

-- Qt_Locacoes_por_Veiculo
INSERT INTO dwh.Locacao (Qt_Locacoes_por_Veiculo)
SELECT COUNT(Cd_Veiculo)
FROM dwh.Locacao
GROUP BY Cd_Veiculo;


-- Locacoes table = reserva
INSERT INTO dwh.Reserva (Cd_Reserva, Cd_Situacao)
SELECT ID_Locacao AS Cd_Reserva,
	Status_Locacao AS CD_Situacao
FROM group_a.Locacoes;

-- Insert dates into our Reserva table
INSERT INTO dwh.Reserva (Dt_Reserva, Dt_Entrega, Dt_Devolucao)
SELECT Data_Reserva AS Dt_Reserva,
	Data_Inicio  AS Dt_Entrega,
	Data_Fim AS Dt_Devolucao
FROM group_a.Reservas;


-- Qt_Reserva
INSERT INTO dwh.Reserva (Qt_Reserva)
SELECT COUNT(Cd_Reserva)
FROM dwh.Reserva
GROUP BY Cd_Reserva;