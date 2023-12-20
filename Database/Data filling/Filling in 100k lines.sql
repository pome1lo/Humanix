DELETE FROM EMPLOYEES;
DELETE FROM PARTICIPATION;
DELETE FROM VACATIONS;

DROP TABLE EMPLOYEES;
DROP TABLE PARTICIPATION;
DROP TABLE VACATIONS;

CREATE INDEX idx_email ON EMPLOYEES (EMAIL);
DROP INDEX idx_email;
select * from ADMIN.EMPLOYEES;
COMMIT;
select * FROM EMPLOYEES WHERE EMAIL= 'email171@example.com';


DECLARE
  v_counter NUMBER := 0;
BEGIN
    WHILE v_counter <= 100000 LOOP
    INSERT INTO employees (first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id, ISAUTHENTIC) VALUES (
      DBMS_RANDOM.STRING('A', 10),
      DBMS_RANDOM.STRING('A', 10),
      'email' || TO_CHAR(v_counter) || '@example.com',
      '1234567890',
      'AD_PRES',
      DBMS_RANDOM.VALUE(2000, 8000),
      DBMS_RANDOM.VALUE(0, 0.2),
      null,
      10,
      0
    );
    v_counter := v_counter + 1;
  END LOOP;
END;
/