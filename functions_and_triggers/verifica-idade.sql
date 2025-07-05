CREATE OR REPLACE FUNCTION verificar_idade_treino_aluno() RETURNS TRIGGER AS $$
DECLARE
    idade_aluno INT;
    idade_minima INT;
    equipamento_inadequado BOOLEAN := FALSE;
BEGIN
    SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, dt_nasc))
    INTO idade_aluno
    FROM aluno
    WHERE id_aluno = NEW.id_aluno;
    
    FOR idade_minima IN
        SELECT idade_min
        FROM item_treino
        JOIN equipamento ON item_treino.id_equip = equipamento.id_equip
        WHERE item_treino.id_trei = NEW.id_trei
    LOOP
        IF idade_aluno < idade_minima THEN
            equipamento_inadequado := TRUE;
            EXIT;
        END IF;
    END LOOP;
    
    IF equipamento_inadequado THEN
        RAISE NOTICE 'Aluno não possui idade suficiente para algum equipamento do treino. Treino deve ser criado manualmente após a matrícula.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER verificar_idade_antes_insert
BEFORE INSERT ON treino_aluno
FOR EACH ROW EXECUTE FUNCTION verificar_idade_treino_aluno();
