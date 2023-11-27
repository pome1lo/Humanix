DELETE FROM EMPLOYEES;
DELETE FROM PARTICIPATION;






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

/*
--     -- Заполнение таблицы jobs
--     insert_into_jobs(
--       'JOB' || TO_CHAR(v_counter),
--       DBMS_RANDOM.STRING('A', 10),
--       DBMS_RANDOM.VALUE(1000, 9000),
--       DBMS_RANDOM.VALUE(2000, 10000)
--     );
--
--     -- Заполнение таблицы departments
--     insert_into_departments(
--       v_counter,
--       DBMS_RANDOM.STRING('A', 10),
--       ROUND(DBMS_RANDOM.VALUE(1, 10000)),
--       ROUND(DBMS_RANDOM.VALUE(1, 10000))
--     );
--
--     -- Заполнение таблицы locations
--     insert_into_locations(
--       v_counter,
--       DBMS_RANDOM.STRING('A', 10),
--       DBMS_RANDOM.STRING('A', 5),
--       DBMS_RANDOM.STRING('A', 10),
--       DBMS_RANDOM.STRING('A', 10),
--       'US'
--     );
--
--     -- Заполнение таблицы countries
--     insert_into_countries(
--       'C' || TO_CHAR(v_counter),
--       DBMS_RANDOM.STRING('A', 10)
--     );
--
--     -- Заполнение таблицы projects
--     insert_into_projects(
--       v_counter,
--       DBMS_RANDOM.STRING('A', 10),
--       SYSDATE,
--       SYSDATE + DBMS_RANDOM.VALUE(1, 365),
--       DBMS_RANDOM.VALUE(10000, 100000),
--       ROUND(DBMS_RANDOM.VALUE(1, 10000))
--     );
--
--     -- Заполнение таблицы tasks
--     insert_into_tasks(
--       v_counter,
--       DBMS_RANDOM.STRING('A', 10),
--       DBMS_RANDOM.STRING('A', 50),
--       ROUND(DBMS_RANDOM.VALUE(1, 8)),
--       ROUND(DBMS_RANDOM.VALUE(1, 10000))
--     );
--
--     -- Заполнение таблицы participation
--     insert_into_participation(
--       ROUND(DBMS_RANDOM.VALUE(1, 10000)),
--       ROUND(DBMS_RANDOM.VALUE(1, 10000)),
--       DBMS_RANDOM.STRING('A', 10),
--       ROUND(DBMS_RANDOM.VALUE(1, 40))
--     );
*/ -- заполнение других таблиц