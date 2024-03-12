create view listagem_geral_medico AS
select * from tbl_medico;

select * from listagem_geral_medico
where cod_medico = 1;

##### LISTAGEM MÉDICO/ESPECIALIDADE #####
SELECT tm.nome_medico, tm.telefone_medico, tm.celular_medico, tm.email_medico
FROM tbl_medico AS tm
INNER JOIN tbl_especialidade AS te
ON te.cod_especialidade = tm.cod_especialidade;

##### LISTAGEM SALA/ESPECIALIDADE #####
SELECT ts.nro_sala, te.nome_especialidade
FROM tbl_sala AS ts
INNER JOIN tbl_especialidade AS te
ON te.cod_especialidade = ts.cod_especialidade;

##### LISTAGEM AGENDA #####
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
ON ta.cod_paciente = tp.cod_paciente;


#testando as views
select * from  listagem_medico_especialidade_aula;
select * from  listagem_sala_especialidade_aula;
select * from agenda_aula;

#excluir views
drop view listagem_medico_especialidade_aula;
drop view listagem_sala_especialidade_aula;
drop view agenda_aula;
