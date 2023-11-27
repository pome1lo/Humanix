
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_employees (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_hire_date DATE,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
) IS v_emp_id employees.emp_id%TYPE;
BEGIN
    INSERT INTO employees (
        emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, password_hash
    ) VALUES (
        v_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id, ENCRYPT(p_password_hash)
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END insert_into_employees;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_employees (p_emp_id NUMBER) IS
BEGIN
  DELETE FROM employees WHERE emp_id = p_emp_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_employees;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_employees (p_emp_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone_number VARCHAR2, p_hire_date DATE, p_job_id VARCHAR2, p_salary NUMBER, p_commission_pct NUMBER, p_manager_id NUMBER, p_department_id NUMBER) IS
BEGIN
  UPDATE employees
  SET first_name = p_first_name,
      last_name = p_last_name,
      email = p_email,
      phone_number = p_phone_number,
      hire_date = p_hire_date,
      job_id = p_job_id,
      salary = p_salary,
      commission_pct = p_commission_pct,
      manager_id = p_manager_id,
      department_id = p_department_id
  WHERE emp_id = p_emp_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_employees;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_jobs (p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
BEGIN
  INSERT INTO jobs (job_title, min_salary, max_salary)
  VALUES (p_job_title, p_min_salary, p_max_salary);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_jobs;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_jobs (p_job_id VARCHAR2) IS
BEGIN
  DELETE FROM jobs WHERE job_id = p_job_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_jobs;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_jobs (p_job_id VARCHAR2, p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
BEGIN
  UPDATE jobs
  SET job_title = p_job_title,
      min_salary = p_min_salary,
      max_salary = p_max_salary
  WHERE job_id = p_job_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_jobs;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_departments (p_department_name VARCHAR2, p_manager_id NUMBER, p_location_id NUMBER) IS
BEGIN
  INSERT INTO departments (department_name, manager_id, location_id)
  VALUES (p_department_name, p_manager_id, p_location_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_departments;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_departments (p_department_id NUMBER) IS
BEGIN
  DELETE FROM departments WHERE department_id = p_department_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_departments;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_departments (p_department_id NUMBER, p_department_name VARCHAR2, p_manager_id NUMBER, p_location_id NUMBER) IS
BEGIN
  UPDATE departments
  SET department_name = p_department_name,
      manager_id = p_manager_id,
      location_id = p_location_id
  WHERE department_id = p_department_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_departments;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_locations (p_street_address VARCHAR2, p_postal_code VARCHAR2, p_city VARCHAR2, p_state_province VARCHAR2, p_country_id CHAR) IS
BEGIN
  INSERT INTO locations (street_address, postal_code, city, state_province, country_id)
  VALUES (p_street_address, p_postal_code, p_city, p_state_province, p_country_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_locations;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_locations (p_location_id NUMBER) IS
BEGIN
  DELETE FROM locations WHERE location_id = p_location_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_locations;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_locations (p_location_id NUMBER, p_street_address VARCHAR2, p_postal_code VARCHAR2, p_city VARCHAR2, p_state_province VARCHAR2, p_country_id CHAR) IS
BEGIN
  UPDATE locations
  SET street_address = p_street_address,
      postal_code = p_postal_code,
      city = p_city,
      state_province = p_state_province,
      country_id = p_country_id
  WHERE location_id = p_location_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_locations;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_countries (p_country_name VARCHAR2) IS
BEGIN
  INSERT INTO countries (country_name)
  VALUES (p_country_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_countries;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_countries (p_country_id CHAR) IS
BEGIN
  DELETE FROM countries WHERE country_id = p_country_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_countries;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_countries (p_country_id CHAR, p_country_name VARCHAR2) IS
BEGIN
  UPDATE countries
  SET country_name = p_country_name
  WHERE country_id = p_country_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_countries;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_projects (p_project_name VARCHAR2, p_start_date DATE, p_end_date DATE, p_budget NUMBER, p_department_id NUMBER) IS
BEGIN
  INSERT INTO projects (project_name, start_date, end_date, budget, department_id)
  VALUES (p_project_name, p_start_date, p_end_date, p_budget, p_department_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_projects;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_projects (p_project_id NUMBER) IS
BEGIN
  DELETE FROM projects WHERE project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_projects;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_projects (p_project_id NUMBER, p_project_name VARCHAR2, p_start_date DATE, p_end_date DATE, p_budget NUMBER, p_department_id NUMBER) IS
BEGIN
  UPDATE projects
  SET project_name = p_project_name,
      start_date = p_start_date,
      end_date = p_end_date,
      budget = p_budget,
      department_id = p_department_id
  WHERE project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_projects;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_tasks (p_task_name VARCHAR2, p_description VARCHAR2, p_duration NUMBER, p_project_id NUMBER) IS
BEGIN
  INSERT INTO tasks (task_name, description, duration, project_id)
  VALUES (p_task_name, p_description, p_duration, p_project_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_tasks;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_tasks (p_task_id NUMBER) IS
BEGIN
  DELETE FROM tasks WHERE task_id = p_task_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_tasks;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_tasks (p_task_id NUMBER, p_task_name VARCHAR2, p_description VARCHAR2, p_duration NUMBER, p_project_id NUMBER) IS
BEGIN
  UPDATE tasks
  SET task_name = p_task_name,
      description = p_description,
      duration = p_duration,
      project_id = p_project_id
  WHERE task_id = p_task_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_tasks;
/


-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_participation (p_project_id NUMBER, p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  INSERT INTO participation (project_id, role, hours)
  VALUES (p_project_id, p_role, p_hours);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_participation;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_participation (p_emp_id NUMBER, p_project_id NUMBER) IS
BEGIN
  DELETE FROM participation WHERE emp_id = p_emp_id AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_participation;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_participation (p_emp_id NUMBER, p_project_id NUMBER, p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  UPDATE participation
  SET role = p_role,
      hours = p_hours
  WHERE emp_id = p_emp_id AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_participation;
/

CREATE OR REPLACE PROCEDURE hire_employee (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_hire_date DATE,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
) IS v_emp_id employees.emp_id%TYPE;
BEGIN
    SELECT MIN(NVL(emp_id,0) + 1) INTO v_emp_id FROM employees
        WHERE (emp_id + 1) NOT IN (SELECT emp_id FROM employees);

    INSERT INTO employees (
        emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, password_hash
    ) VALUES (
        v_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id, ENCRYPT(p_password_hash)
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END hire_employee;
/


-- Процедура для увольнения сотрудника
CREATE OR REPLACE PROCEDURE fire_employee (p_emp_id NUMBER) IS
BEGIN
  -- Удалить данные о сотруднике из таблицы employees
  DELETE FROM employees WHERE emp_id = p_emp_id;
  -- Вывести сообщение об успешном увольнении сотрудника
  DBMS_OUTPUT.PUT_LINE('Employee ' || p_emp_id || ' has been fired.');
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END fire_employee;
/
-- Процедура для повышения в должности сотрудника
CREATE OR REPLACE PROCEDURE promote_employee (
    p_emp_id IN employees.emp_id%TYPE,
    p_new_job_id IN employees.job_id%TYPE
) IS
BEGIN
    UPDATE employees SET job_id = p_new_job_id WHERE emp_id = p_emp_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK; RAISE;
END promote_employee;
/



-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_vacations (p_vacation_id NUMBER, p_emp_id NUMBER, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
BEGIN
  INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason)
  VALUES (p_vacation_id, p_emp_id, p_start_date, p_end_date, p_reason);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_vacations;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_vacations (p_vacation_id NUMBER) IS
BEGIN
  DELETE FROM vacations WHERE vacation_id = p_vacation_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_vacations;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_vacations (p_vacation_id NUMBER, p_emp_id NUMBER, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
BEGIN
  UPDATE vacations
  SET emp_id = p_emp_id,
      start_date = p_start_date,
      end_date = p_end_date,
      reason = p_reason
  WHERE vacation_id = p_vacation_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_vacations;
/


-- рабочий экспорт
CREATE OR REPLACE PROCEDURE export_json AS
    v_file  UTL_FILE.FILE_TYPE;
    v_data  employees%ROWTYPE;
    v_json  VARCHAR2(32767);
BEGIN
    -- Открываем файл для записи
    v_file := UTL_FILE.FOPEN('MY_DIRECTORY', 'employees_export.json', 'w', 32767);

    -- Начинаем цикл по всем записям в таблице employees
    FOR v_data IN (SELECT * FROM employees) LOOP
        -- Преобразуем каждую запись в JSON
        v_json := JSON_OBJECT(
            'emp_id' VALUE v_data.emp_id,
            'first_name' VALUE v_data.first_name,
            'last_name' VALUE v_data.last_name,
            'email' VALUE v_data.email,
            'phone_number' VALUE v_data.phone_number,
            'hire_date' VALUE TO_CHAR(v_data.hire_date, 'YYYY-MM-DD'),
            'job_id' VALUE v_data.job_id,
            'salary' VALUE v_data.salary,
            'commission_pct' VALUE v_data.commission_pct,
            'manager_id' VALUE v_data.manager_id,
            'department_id' VALUE v_data.department_id
        );

        -- Записываем JSON в файл
        UTL_FILE.PUT_LINE(v_file, v_json);
    END LOOP;

    -- Закрываем файл
    UTL_FILE.FCLOSE(v_file);
EXCEPTION
    WHEN OTHERS THEN
        -- Если произошла ошибка, закрываем файл
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        RAISE;
END export_json;
/
CREATE OR REPLACE PROCEDURE import_json IS
    v_file UTL_FILE.FILE_TYPE;
    v_data CLOB;
    v_line VARCHAR2(32767);
    v_json JSON_ARRAY_T;
    v_json_obj JSON_OBJECT_T;
    v_emp_rec employees%ROWTYPE;
BEGIN
    -- Открываем файл для чтения
    v_file := UTL_FILE.FOPEN('MY_DIRECTORY', 'employees_import.json', 'r');

    -- Читаем данные из файла
    BEGIN
        LOOP
            UTL_FILE.GET_LINE(v_file, v_line);
            v_data := v_data || v_line;
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL; -- Игнорируем исключение, так как это означает, что мы достигли конца файла
    END;

    -- Закрываем файл
    UTL_FILE.FCLOSE(v_file);

    -- Парсим JSON
    v_json := JSON_ARRAY_T.parse(v_data);

    -- Извлекаем данные из JSON и вставляем их в таблицу
    FOR i IN 0 .. v_json.get_size() - 1 LOOP
        v_json_obj := JSON_OBJECT_T(v_json.get(i));
        v_emp_rec.emp_id := v_json_obj.get_number('emp_id');
        v_emp_rec.first_name := v_json_obj.get_string('first_name');
        v_emp_rec.last_name := v_json_obj.get_string('last_name');
        v_emp_rec.email := v_json_obj.get_string('email');
        v_emp_rec.phone_number := v_json_obj.get_string('phone_number');
        v_emp_rec.hire_date := TO_DATE(v_json_obj.get_string('hire_date'), 'YYYY-MM-DD');
        v_emp_rec.job_id := v_json_obj.get_string('job_id');
        v_emp_rec.salary := v_json_obj.get_number('salary');
        v_emp_rec.commission_pct := v_json_obj.get_number('commission_pct');
        v_emp_rec.manager_id := v_json_obj.get_number('manager_id');
        v_emp_rec.department_id := v_json_obj.get_number('department_id');
        v_emp_rec.password_hash := v_json_obj.get_string('password_hash');

        INSERT INTO employees VALUES v_emp_rec;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END import_json;
/

CREATE OR REPLACE FUNCTION get_employee_id (p_email IN VARCHAR2(25), p_password_hash IN VARCHAR2(128))
RETURN NUMBER IS
  v_emp_id NUMBER(6);
BEGIN

    SELECT emp_id INTO v_emp_id
      FROM employees
      WHERE email = p_email AND password_hash = encrypt(p_password_hash);
        RETURN v_emp_id;

EXCEPTION
  WHEN OTHERS THEN
    RETURN 0;
END get_employee_id;
/

begin
    login_employee('vvv@example.com', 'password1137');
end;
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (1002, 'Петр', 'Петров', 'test@example.com', '0987654321', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'AD_PRES', 60000, 0.15, 1001, 20, ENCRYPT('password69'));
begin
    insert_into_employees('Иван', 'Иванов', 'vvv@example.com', '1234567890', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'AD_PRES', 50000, 0.1, NULL, 10, ENCRYPT('password1137'));
end;

SELECT emp_id FROM employees WHERE email = 'vvv@example.com' AND password_hash = encrypt('password1137');
SELECT * FROM EMPLOYEES WHERE EMAIL = 'vvv@example.com' FETCH FIRST 1 ROW ONLY;
SELECT * FROM EMPLOYEES;

DROP PROCEDURE insert_into_employees;
DROP PROCEDURE delete_from_employees;
DROP PROCEDURE update_employees;
DROP PROCEDURE insert_into_jobs;
DROP PROCEDURE delete_from_jobs;
DROP PROCEDURE update_jobs;
DROP PROCEDURE insert_into_departments;
DROP PROCEDURE delete_from_departments;
DROP PROCEDURE update_departments;
DROP PROCEDURE insert_into_departments;
DROP PROCEDURE delete_from_departments;
DROP PROCEDURE update_departments;
DROP PROCEDURE insert_into_locations;
DROP PROCEDURE delete_from_locations;
DROP PROCEDURE update_locations;
DROP PROCEDURE insert_into_countries;
DROP PROCEDURE delete_from_countries;
DROP PROCEDURE update_countries;
DROP PROCEDURE insert_into_projects;
DROP PROCEDURE delete_from_projects;
DROP PROCEDURE update_projects;
DROP PROCEDURE insert_into_vacations;
DROP PROCEDURE delete_from_vacations;
DROP PROCEDURE update_vacations;
DROP PROCEDURE insert_into_tasks;
DROP PROCEDURE delete_from_tasks;
DROP PROCEDURE update_tasks;
DROP PROCEDURE insert_into_participation;
DROP PROCEDURE delete_from_participation;
DROP PROCEDURE update_participation;
DROP PROCEDURE fire_employee;
DROP PROCEDURE promote_employee;
DROP PROCEDURE hire_employee;



SELECT * FROM EMPLOYEES;
DELETE FROM VACATIONS;
DELETE FROM PARTICIPATION;
DELETE FROM EMPLOYEES;



DECLARE
    l_employee NUMBER(6);
BEGIN
    l_employee := find_employee('vvv@example.com', 'password1137');
         DBMS_OUTPUT.PUT_LINE('Сотрудник найден: ' || l_employee);
END;
