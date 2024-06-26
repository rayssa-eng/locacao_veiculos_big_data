-- Grupo:
-- Felipe da Costa Marroni, DRE: 115092322
-- Janine Qiao Ma, DRE: 110072270
-- Rayssa Cristina de Almeida, DRE: 121041567


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

-- Nu_Quantidade_Veiculo
INSERT INTO dwh.Locacao (Nu_Quantidade_Veiculo)
SELECT COUNT(Cd_Veiculo)
FROM dwh.Veiculo
GROUP BY Cd_Veiculo;
   

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

-- Qt_Reserva
INSERT INTO dwh.Locacao (Qt_Reserva)
SELECT COUNT(Cd_Reserva)
FROM dwh.Reserva
GROUP BY Cd_Reserva;
   
-- Insert reserva_m info into Reserva
INSERT INTO dwh.Reserva (Cd_Reserva, Dt_Reserva, Dt_Entrega, Dt_Devolucao)
SELECT
    ID_Locacao AS Cd_Reserva,
    Data_Reserva AS Dt_Reserva,
    Data_Retirada AS Dt_Entrega,
    Data_Devolucao AS Dt_Devolucao
FROM
	group_m.Reserva;
   
 
-- Locacao (fact) = reserva_m
INSERT INTO dwh.Locacao (CD_Veiculo, CD_Cliente)
SELECT 
    ID_Veiculo AS CD_Veiculo,
    ID_Cliente AS CD_Cliente,   
FROM
    group_m.Reserva;


-- Qt_Locacoes_por_Veiculo
INSERT INTO dwh.Locacao (Qt_Locacoes_por_veiculo)
SELECT COUNT(Cd_Veiculo)
FROM dwh.Locacao
GROUP BY Cd_Veiculo;


-- Insert Patio from group_m.locacao table
INSERT INTO dwh.Locacao (CD_Patio)
SELECT
    Patio_Saida AS CD_Patio
FROM
	group_m.Locacao;


-- Nu_Quantidade_Veiculo
INSERT INTO dwh.Locacao (Nu_Quantidade_Veiculo)
SELECT COUNT(Cd_Veiculo)
FROM dwh.Veiculo
GROUP BY Cd_Veiculo;
   
-- Patio
INSERT INTO dwh.Patio (Cd_Patio, Nm_Patio)
SELECT
    ID_Patio AS Cd_Patio,
    Nome AS Nm_Patio
FROM
    group_m.Patio;
