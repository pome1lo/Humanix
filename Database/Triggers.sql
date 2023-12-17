CREATE OR REPLACE TRIGGER emp_id_trg
    BEFORE INSERT ON employees FOR EACH ROW
    BEGIN
        :NEW.salt := generate_salt(:NEW.email);
        SELECT emp_id_seq.NEXTVAL INTO :new.emp_id FROM dual;
    END;
/

CREATE OR REPLACE TRIGGER department_id_trg
    BEFORE INSERT ON departments FOR EACH ROW
    BEGIN
        SELECT department_id_seq.NEXTVAL INTO :new.department_id FROM dual;
    END;
/

CREATE OR REPLACE TRIGGER location_id_trg
    BEFORE INSERT ON locations FOR EACH ROW
    BEGIN
        SELECT location_id_seq.NEXTVAL INTO :new.location_id FROM dual;
    END;
/

CREATE OR REPLACE TRIGGER project_id_trg
    BEFORE INSERT ON projects FOR EACH ROW
    BEGIN
        SELECT project_id_seq.NEXTVAL INTO :new.project_id FROM dual;
    END;
/

CREATE OR REPLACE TRIGGER task_id_trg
    BEFORE INSERT ON tasks FOR EACH ROW
    BEGIN
        SELECT task_id_seq.NEXTVAL INTO :new.task_id FROM dual;
    END;
/

CREATE OR REPLACE TRIGGER vacation_id_trg
    BEFORE INSERT ON vacations FOR EACH ROW
    BEGIN
        SELECT vacation_id_seq.NEXTVAL INTO :new.vacation_id FROM dual;
    END;
/

DROP TRIGGER vacation_id_trg;
DROP TRIGGER task_id_trg;
DROP TRIGGER project_id_trg;
DROP TRIGGER location_id_trg;
DROP TRIGGER department_id_trg;
DROP TRIGGER emp_id_trg;