#CRIAÇÃO DE UMA STORED PROCEDURE PARAMENTROS PARA A LISTAGEM DE DADOS DE AGENDAMENTO DE CIRURGIA


DELIMITER $

CREATE PROCEDURE LISTAGEM_AGENDA_PARAM(IN cod_medico_param int(10))

BEGIN

SELECT
    ta.data_cirurgia, ta.status_cirurgia,
    ts.nro_sala,
    tm.nome_medico, tm.celular_medico,
    tp.nome_paciente, tp.celular_paciente,
    tp.nome_responsavel, tp.telefone_responsavel
FROM tbl_agenda AS ta
INNER JOIN tbl_sala AS ts
ON ta.cod_sala = ts.cod_sala
INNER JOIN tbl_medico AS tm
ON ta.cod_medico = tm.cod_medico
INNER JOIN tbl_paciente AS tp
ON ta.cod_paciente = tp.cod_paciente
WHERE ta.cod_medico = cod_medico_param;

END


$

CALL LISTAGEM_AGENDA_PARAM(3)

DROP PROCEDURE LISTAGEM_AGENDA_PARAM;