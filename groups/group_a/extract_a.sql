-- Set search path to your DWH schema
SET search_path TO dwh;

-- Extract data from group_a.Endereco (if needed, create a mapping or specific storage approach)

-- Extract data from group_a.Clientes into dwh.dwh_cliente
INSERT INTO dwh.dwh_cliente (Cd_Cliente, Nm_Cliente, Cd_CNH, Cd_CNPJ_CPF, Nm_Cidade, Nm_Estado, Dt_Nascimento, Nu_Telefone, Nm_Email, Dt_Validade_CNH)
SELECT ID_Cliente, Nome, CAST(CNH AS VARCHAR(30)), CAST(CNPJ_Empresa AS VARCHAR(30)), NULL, NULL, Data_Nascimento, CAST(Telefone AS INTEGER), Email, Data_Validade_CNH
FROM group_a.Clientes;

-- Extract data from group_a.Grupos_Veiculos (assuming not directly used in DWH)

-- Extract data from group_a.Veiculos into dwh.dwh_veiculo
INSERT INTO dwh.dwh_veiculo (Cd_Veiculo, Nm_Motor, Nm_Combustivel, Ds_Motorizacao, Nu_Placa, Nu_Chassi, Nm_Cor, Nm_Modelo, Nm_Marca, Cd_Categoria, Ds_Ar_Condicionado, Ds_Foto)
SELECT ID_Veiculo, NULL, NULL, Mecanizacao, Placa, NULL, Cor, Modelo, Marca, NULL, Ar_Condicionado, NULL -- Assuming Ds_Foto is not used directly
FROM group_a.Veiculos;

-- Extract data from group_a.Prontuario (assuming not directly used in DWH)

-- Extract data from group_a.Patios into dwh.dwh_patio
INSERT INTO dwh.dwh_patio (Cd_Patio, Nm_Patio)
SELECT ID_Patio, NULL
FROM group_a.Patios;

-- Extract data from group_a.Reservas into dwh.dwh_reserva
INSERT INTO dwh.dwh_reserva (Cd_Reserva, Dt_Reserva, Dt_Entrega, Dt_Devolucao, Cd_Situacao)
SELECT ID_Reserva, Data_Reserva, Data_Inicio, Data_Fim, CASE WHEN Status_Reserva = 'Ativa' THEN true ELSE false END
FROM group_a.Reservas;

-- Extract data from group_a.Locacoes into dwh.dwh_locacao
INSERT INTO dwh.dwh_locacao (Cd_Locacao, Cd_Veiculo, Cd_Tempo, Cd_Patio, Cd_Cliente, Cd_Reserva, Dt_Intervalo_de_Tempo, Nu_Total_por_Veiculo, Qt_Locacoes_por_Veiculo)
SELECT ID_Locacao, NULL, NULL, Patio_Retirada, NULL, ID_Reserva, NULL, NULL, NULL
FROM group_a.Locacoes;
