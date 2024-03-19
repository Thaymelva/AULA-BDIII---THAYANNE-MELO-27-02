USE centro_cirurgico_bd;

-- CRIAÇÃO DO DELIMITADOR DE INICIO DA TRIGGER
DELIMITER $

-- DECLARAÇÃO DO CORPO DA TRIGGER
CREATE TRIGGER trg_delete_paciente BEFORE DELETE ON tbl_paciente
FOR EACH ROW 
BEGIN
    INSERT INTO tbl_paciente_bkp (cod_paciente, nome_paciente, telefone_paciente, celular_paciente, email_paciente, nome_responsavel, telefone_responsavel, date_delete)
    VALUES (OLD.cod_paciente, OLD.nome_paciente, OLD.telefone_paciente, OLD.celular_paciente, OLD.email_paciente, OLD.nome_responsavel, OLD.telefone_responsavel, NOW());
END $
-- CRIAÇÃO DO DELIMITADOR DE FIM DA TRIGGER
DELIMITER ;
