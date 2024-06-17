-- Grupo:
-- Felipe da Costa Marroni, DRE: 115092322
-- Janine Qiao Ma, DRE: 110072270
-- Rayssa Cristina de Almeida, DRE: 121041567


SET search_path TO group_f;

-- Cliente
INSERT INTO dwh.Cliente (Cd_Cliente, Nm_Cliente, Cd_CNPJ_CPF, Endereco, Nu_Telefone, Nm_Email)
SELECT ClienteID AS Cd_Cliente,
       Nome AS Nm_Cliente,
       CPF_CNPJ AS Cd_CNPJ_CPF,
       Endereco,
       Telefone AS Nu_Telefone,
       Email AS Nm_Email
FROM group_f.Cliente;

-- Condutor skip

-- Patio
INSERT INTO dwh.Patio (Cd_Patio, Nm_Patio)
SELECT PatioID AS Cd_Patio,
       Nome AS Nm_Patio
FROM group_f.Patio;


-- Reserva
INSERT INTO dwh.Reserva (Cd_Reserva, Dt_Reserva, Dt_Entrega, Dt_Devolucao, Cd_Situacao)
SELECT ReservaID AS Cd_Reserva,
       DataReserva AS Dt_Reserva,
       DataInicio AS Dt_Entrega,
       DataFim AS Dt_Devolucao,
       Status AS Cd_Situacao
FROM group_f.Reserva;


-- Veículo
INSERT INTO dwh.Veiculo (Cd_Veiculo, Nu_Placa, Nu_Chassi, Nm_Marca, Nm_Modelo, Nm_Cor, Ds_Ar_Condicionado, Ds_Motorizacao, Nm_Pneu, Cd_Categoria, Vl_Valor_da_Categoria, Ds_Foto)
SELECT VeiculoID AS Cd_Veiculo,
       Placa AS Nu_Placa,
	Chassis AS Nu_Chassi,
       Marca AS Nm_Marca,
       Modelo AS Nm_Modelo,
       Cor AS Nm_Cor,
       ArCondicionado AS Ds_Ar_Condicionado,
       Mecanizacao AS Ds_Motorizacao,
       NULL AS Nm_Pneu,
       Grupo AS Cd_Categoria,
       NULL AS Vl_Valor_da_Categoria,
       fotos::CHAR AS Ds_Foto
FROM group_f.Veículo;


-- Locacao (fact)
INSERT INTO dwh.Locacao (Cd_Locacao, Cd_Reserva, Cd_Patio, Cd_Cliente, Nu_Total_por_Veiculo, Qt_Locacoes_por_Veiculo)
SELECT LocacaoID AS Cd_Locacao,
       ReservaID AS Cd_Reserva,
       PatioRetiradaID AS Cd_Patio,
       ClienteID AS Cd_Cliente,
       NULL AS Nu_Total_por_Veiculo,
       NULL AS Qt_Locacoes_por_Veiculo
FROM group_f.Locacao;