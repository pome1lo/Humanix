-- DELETE FROM EMPLOYEES;
-- DELETE FROM PARTICIPATION;

select * FROM EMPLOYEES WHERE LAST_NAME= 'IIyBBBXBcr';

DECLARE
  v_counter NUMBER := 0;
BEGIN
  WHILE v_counter <= 100000 LOOP
    INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (
      v_counter,
      DBMS_RANDOM.STRING('A', 10),
      DBMS_RANDOM.STRING('A', 10),
      'email' || TO_CHAR(v_counter) || '@example.com',
      '1234567890',
      SYSDATE,
      'AD_PRES',
      DBMS_RANDOM.VALUE(2000, 8000),
      DBMS_RANDOM.VALUE(0, 0.2),
      null,
      10
    );
    v_counter := v_counter + 1;
  END LOOP;
END;
/