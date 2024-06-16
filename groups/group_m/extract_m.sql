SET search_path TO group_m;


-- Veiculo
INSERT INTO dwh.Veiculo (Cd_Veiculo, Nu_Placa, Nm_Marca, Nm_Modelo, Nm_Cor, Ds_Ar_Condicionado, Ds_Foto)
SELECT
    ID_Veiculo AS Cd_Veiculo,
    Placa AS Nu_Placa,
    Marca AS Nm_Marca,
    Modelo AS Nm_Modelo,
    Cor AS Nm_Cor,
    Ar_Condicionado AS Ds_Ar_Condicionado,
    Foto_URL AS Ds_Foto
FROM
    group_m.Veiculo;
   
-- Insert Categoria table into dwh.Veiculo
INSERT INTO dwh.Veiculo (Cd_Categoria, Vl_Valor_da_Categoria)
SELECT
	Nome AS Cd_Categoria,
	Faixa_Valor_Diaria AS Vl_Valor_da_Categoria
FROM group_m.Grupo_Categoria;
   
   

-- Cliente
INSERT INTO dwh.Cliente (Cd_Cliente, Nm_Cliente, Cd_CNPJ_CPF, Endereco, Nu_Telefone, Nm_Email, Cd_CNH, Dt_Validade_CNH)
SELECT
    ID_Cliente AS Cd_Cliente,
    Nome AS Nm_Cliente,
    CPF_CNPJ AS Cd_CNPJ_CPF,
    Endereco,
    Telefone AS Nu_Telefone,
    Email AS Nm_Email,
    Numero_CNH AS Cd_CNH,
    Validade_CNH AS Dt_Validade_CNH
FROM
    group_m.Cliente;

   
-- Reserva = locacao_m 
INSERT INTO dwh.Reserva (Cd_Reserva)
SELECT
    ID_Locacao AS Cd_Reserva
FROM
    group_m.Locacao;

   
-- Insert reserva_m info into Reserva
INSERT INTO dwh.Reserva (Dt_Reserva, Dt_Entrega, Dt_Devolucao)
SELECT
    Data_Reserva AS Dt_Reserva,
    Data_Retirada AS Dt_Entrega,
    Data_Devolucao AS Dt_Devolucao
FROM
	group_m.Reserva;
   
 
-- Locacao (fact) = reserva_m
INSERT INTO dwh.Locacao (Cd_Locacao, CD_Veiculo, CD_Patio, CD_Cliente, Nu_Total_por_veiculo, Qt_Locacoes_por_veiculo)
SELECT
    ID_Reserva AS Cd_Locacao,
    ID_Veiculo AS CD_Veiculo,
    NULL AS CD_Patio,
    ID_Cliente AS CD_Cliente,
    NULL AS Nu_Total_por_veiculo,
    NULL AS Qt_Locacoes_por_veiculo
FROM
    group_m.Reserva;


-- Insert Patio from group_m.locacao table
INSERT INTO dwh.Locacao (CD_Patio)
SELECT
    Patio_Saida AS CD_Patio
FROM
	group_m.Locacao;
  
   
-- Patio
INSERT INTO dwh.Patio (Cd_Patio, Nm_Patio)
SELECT
    ID_Patio AS Cd_Patio,
    Nome AS Nm_Patio
FROM
    group_m.Patio;
