-- Grupo:
-- Felipe da Costa Marroni, DRE: 115092322
-- Janine Qiao Ma, DRE: 110072270
-- Rayssa Cristina de Almeida, DRE: 121041567

select
	veiculo.cd_categoria
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao,
	sum(locacao.nu_quantidade_veiculo) as "Total"
from
	veiculo,
	patio, 
	locacao
where
	veiculo.cd_veiculo = locacao.cd_veiculo and
	patio.nm_patio = "exemplo" and
	patio.cd_patio = locacao.cd_patio and
group by
	veiculo.cd_categoria,
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao
	

------------

select
	veiculo.cd_categoria
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao,
	reserva.dt_entrega,
	reserva.dt_devolucao,
	sum(locacao.nu_quantidade_veiculo) as "Total"
from
	veiculo,
	reserva
where
	veiculo.cd_veiculo = locacao.cd_veiculo and
	reserva.cd_reserva = locacao.cd_reserva	
group by
	veiculo.cd_categoria,
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao
	
-----------------


select
	veiculo.cd_categoria
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao,
	patio.nm_patio,
	sum(locacao.qt_reservas) as "Total"
from
	veiculo,
	reserva,
	cliente,
	patio
where
	veiculo.cd_veiculo = locacao.cd_veiculo and
	reserva.cd_reserva = locacao.cd_reserva	and
	patio.cd_patio = locacao.cd_patio and
	reserva.dt_reserva = "Exemplo" and
	cliente.endereço like "%Exemplo%"
group by
	patio.nm_patio,
	veiculo.cd_categoria,
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao
	
----------------


select
	veiculo.cd_categoria
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao,
	sum(locacao.qt_locacoes_por_veiculo) as "Total"
from
	veiculo,
	locacao
where
	veiculo.cd_veiculo = locacao.cd_veiculo
group by
	veiculo.cd_categoria,
	veiculo.nm_marca,
	veiculo.nm_modelo,
	veiculo.ds_motorizacao