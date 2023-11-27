-- Создание отдельной PDB
CREATE PLUGGABLE DATABASE HUMANIX_PDB
  ADMIN USER admin IDENTIFIED BY testpassword
  ROLES = (dba)
  FILE_NAME_CONVERT = (
      'C:\APP\USER\PRODUCT\21C\ORADATA\XE\PDBSEED\',
      'C:\Humanix\Files\PDB\'
  );
--ALTER PLUGGABLE DATABASE HUMANIX_PDB OPEN; -- sqlplus (dba)
--ALTER SESSION SET "AUDIT_SYS_OPERATIONS" = TRUE;

-- Создание табличного пространства USERS_TBS
CREATE TABLESPACE USERS_TBS
DATAFILE 'users_tbs.dat'
SIZE 100M
AUTOEXTEND ON;

-- Создание табличного пространства TEMP_TBS
CREATE TEMPORARY TABLESPACE TEMP_TBS
TEMPFILE 'temp_tbs.dat'
SIZE 50M
AUTOEXTEND ON;

ALTER USER admin default tablespace USERS_TBS;
ALTER USER admin QUOTA UNLIMITED ON USERS_TBS;

-- Создание профиля для пользователя
CREATE PROFILE user_profile LIMIT
  FAILED_LOGIN_ATTEMPTS 5
  SESSIONS_PER_USER   10
  CPU_PER_SESSION     UNLIMITED
  CPU_PER_CALL        3000
  CONNECT_TIME        45
  IDLE_TIME           15
  LOGICAL_READS_PER_SESSION DEFAULT
  LOGICAL_READS_PER_CALL    DEFAULT
  PRIVATE_SGA        15K
  COMPOSITE_LIMIT    5000000;

-- Создание профиля для администратора
CREATE PROFILE admin_profile LIMIT
  SESSIONS_PER_USER   UNLIMITED
  CPU_PER_SESSION     UNLIMITED
  CPU_PER_CALL        UNLIMITED
  CONNECT_TIME        UNLIMITED
  IDLE_TIME           UNLIMITED
  LOGICAL_READS_PER_SESSION DEFAULT
  LOGICAL_READS_PER_CALL    DEFAULT
  PRIVATE_SGA        UNLIMITED
  COMPOSITE_LIMIT    UNLIMITED;




-- Создаем таблицу сотрудников с первичным ключом emp_id
CREATE TABLE employees (
    emp_id NUMBER(6) PRIMARY KEY, -- Идентификатор сотрудника
    first_name VARCHAR2(20), -- Имя сотрудника
    last_name VARCHAR2(25) NOT NULL, -- Фамилия сотрудника
    email VARCHAR2(25) NOT NULL, -- Электронная почта сотрудника
    phone_number VARCHAR2(15), -- Номер телефона сотрудника
    hire_date DATE NOT NULL, -- Дата найма сотрудника
    job_id VARCHAR2(10) NOT NULL, -- Идентификатор должности сотрудника
    salary NUMBER(8,2), -- Зарплата сотрудника
    commission_pct NUMBER(2,2), -- Процент комиссии сотрудника
    manager_id NUMBER(6), -- Идентификатор менеджера сотрудника
    department_id NUMBER(4), -- Идентификатор отдела сотрудника
    password_hash VARCHAR2(128)
) TABLESPACE USERS_TBS;


-- Создаем таблицу должностей с первичным ключом job_id
CREATE TABLE jobs (
    job_id VARCHAR2(10) PRIMARY KEY, -- Идентификатор должности
    job_title VARCHAR2(35) NOT NULL, -- Название должности
    min_salary NUMBER(6), -- Минимальная зарплата для должности
    max_salary NUMBER(6) -- Максимальная зарплата для должности
) TABLESPACE USERS_TBS;

-- Создаем таблицу отделов с первичным ключом department_id
CREATE TABLE departments (
    department_id NUMBER(4) PRIMARY KEY, -- Идентификатор отдела
    department_name VARCHAR2(30) NOT NULL, -- Название отдела
    manager_id NUMBER(6), -- Идентификатор менеджера отдела
    location_id NUMBER(4) -- Идентификатор местоположения отдела
) TABLESPACE USERS_TBS;

-- Создаем таблицу местоположений с первичным ключом location_id
CREATE TABLE locations (
    location_id NUMBER(4) PRIMARY KEY, -- Идентификатор местоположения
    street_address VARCHAR2(40), -- Улица местоположения
    postal_code VARCHAR2(12), -- Почтовый индекс местоположения
    city VARCHAR2(30) NOT NULL, -- Город местоположения
    state_province VARCHAR2(25), -- Область местоположения
    country_id CHAR(2) NOT NULL -- Идентификатор страны местоположения
) TABLESPACE USERS_TBS;

-- Создаем таблицу стран с первичным ключом country_id
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY, -- Идентификатор страны
    country_name VARCHAR2(40) NOT NULL -- Название страны
) TABLESPACE USERS_TBS;

-- Создаем таблицу проектов с первичным ключом project_id
CREATE TABLE projects (
    project_id NUMBER(4) PRIMARY KEY, -- Идентификатор проекта
    project_name VARCHAR2(50) NOT NULL, -- Название проекта
    start_date DATE NOT NULL, -- Дата начала проекта
    end_date DATE, -- Дата окончания проекта (может быть null)
    budget NUMBER(12,2), -- Бюджет проекта
    department_id NUMBER(4) NOT NULL  -- Идентификатор отдела, ответственного за проект
) TABLESPACE USERS_TBS;

-- Создаем таблицу задач с первичным ключом task_id
CREATE TABLE tasks (
    task_id NUMBER(6) PRIMARY KEY, -- Идентификатор задачи
    task_name VARCHAR2(100) NOT NULL, -- Название задачи
    description VARCHAR2(500), -- Описание задачи
    duration NUMBER(4) NOT NULL, -- Продолжительность задачи в часах
    project_id NUMBER(4) NOT NULL -- Идентификатор проекта, к которому относится задача
) TABLESPACE USERS_TBS;

-- Создаем таблицу участия сотрудников в проектах с составным первичным ключом из emp_id и project_id
CREATE TABLE participation (
    emp_id NUMBER(6) NOT NULL, -- Идентификатор сотрудника, участвующего в проекте
    project_id NUMBER(4) NOT NULL, -- Идентификатор проекта, в котором участвует сотрудник
    role VARCHAR2(50), -- Роль сотрудника в проекте
    hours NUMBER(4), -- Количество часов, затраченных сотрудником на проект
    PRIMARY KEY (emp_id, project_id) -- Составной первичный ключ из emp_id и project_id
) TABLESPACE USERS_TBS;


CREATE TABLE vacations (
    vacation_id NUMBER(6) PRIMARY KEY, -- Идентификатор отпуска
    emp_id NUMBER(6) NOT NULL, -- Идентификатор сотрудника
    start_date DATE NOT NULL, -- Дата начала отпуска
    end_date DATE NOT NULL, -- Дата окончания отпуска
    reason VARCHAR2(500) -- Причина отпуска
) TABLESPACE USERS_TBS;


-- Создаем внешние ключи для связи между таблицами

-- Связываем таблицу employees с таблицей jobs по атрибуту job_id
ALTER TABLE employees ADD CONSTRAINT fk_employees_jobs FOREIGN KEY (job_id) REFERENCES jobs (job_id);

-- Связываем таблицу employees с самой собой по атрибуту manager_id
ALTER TABLE employees ADD CONSTRAINT fk_employees_managers FOREIGN KEY (manager_id) REFERENCES employees (emp_id);

-- Связываем таблицу employees с таблицей departments по атрибуту department_id
ALTER TABLE employees ADD CONSTRAINT fk_employees_departments FOREIGN KEY (department_id) REFERENCES departments (department_id);

-- Связываем таблицу departments с таблицей locations по атрибуту location_id
ALTER TABLE departments ADD CONSTRAINT fk_departments_locations FOREIGN KEY (location_id) REFERENCES locations (location_id);

-- Связываем таблицу locations с таблицей countries по атрибуту country_id
ALTER TABLE locations ADD CONSTRAINT fk_locations_countries FOREIGN KEY (country_id) REFERENCES countries (country_id);

-- Связываем таблицу projects с таблицей departments по атрибуту department_id
ALTER TABLE projects ADD CONSTRAINT fk_projects_departments FOREIGN KEY (department_id) REFERENCES departments (department_id);

-- Связываем таблицу tasks с таблицей projects по атрибуту project_id
ALTER TABLE tasks ADD CONSTRAINT fk_tasks_projects FOREIGN KEY (project_id) REFERENCES projects (project_id);

-- Связываем таблицу participation с таблицей employees по атрибуту emp_id
ALTER TABLE participation ADD CONSTRAINT fk_participation_employees FOREIGN KEY (emp_id) REFERENCES employees (emp_id);

-- Связываем таблицу participation с таблицей projects по атрибуту project_id
ALTER TABLE participation ADD CONSTRAINT fk_participation_projects FOREIGN KEY (project_id) REFERENCES projects (project_id);

-- Связываем таблицу vacations с таблицей employees по атрибуту emp_id
ALTER TABLE vacations ADD CONSTRAINT fk_vacations_emp_id FOREIGN KEY (emp_id) REFERENCES employees(emp_id);



-- Создание роли для пользователя
CREATE ROLE user_role;

-- Назначение привилегий для роли пользователя
GRANT SELECT ON jobs        TO user_role;
GRANT SELECT ON departments TO user_role;
GRANT SELECT ON locations   TO user_role;
GRANT SELECT ON countries   TO user_role;
GRANT SELECT ON projects    TO user_role;
GRANT SELECT ON tasks       TO user_role;
GRANT SELECT ON participation TO user_role;
GRANT SELECT ON employees   TO user_role;

-- Создание роли для администратора
CREATE ROLE admin_role;

-- Назначение привилегий для роли администратора
GRANT ALL PRIVILEGES ON jobs TO admin_role;
GRANT ALL PRIVILEGES ON departments TO admin_role;
GRANT ALL PRIVILEGES ON locations TO admin_role;
GRANT ALL PRIVILEGES ON countries TO admin_role;
GRANT ALL PRIVILEGES ON projects TO admin_role;
GRANT ALL PRIVILEGES ON tasks TO admin_role;
GRANT ALL PRIVILEGES ON participation TO admin_role;
GRANT ALL PRIVILEGES ON employees TO admin_role;



-- Создание пользователя с ролью пользователя и профилем пользователя
CREATE USER user_user IDENTIFIED BY user_password
    DEFAULT TABLESPACE USERS_TBS
    TEMPORARY TABLESPACE TEMP_TBS
    PROFILE user_profile;

GRANT CONNECT, RESOURCE, user_role TO user_user;

-- Создание пользователя с ролью администратора и профилем администратора
CREATE USER admin_user IDENTIFIED BY admin_password
    DEFAULT TABLESPACE USERS_TBS
    TEMPORARY TABLESPACE TEMP_TBS
    PROFILE admin_profile;

GRANT CONNECT, RESOURCE, DBA, admin_role TO admin_user;

-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_employees (p_emp_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone_number VARCHAR2, p_hire_date DATE, p_job_id VARCHAR2, p_salary NUMBER, p_commission_pct NUMBER, p_manager_id NUMBER, p_department_id NUMBER) IS
BEGIN
  INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
  VALUES (p_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id);
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
CREATE OR REPLACE PROCEDURE insert_into_jobs (p_job_id VARCHAR2, p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
BEGIN
  INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
  VALUES (p_job_id, p_job_title, p_min_salary, p_max_salary);
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
CREATE OR REPLACE PROCEDURE insert_into_departments (p_department_id NUMBER, p_department_name VARCHAR2, p_manager_id NUMBER, p_location_id NUMBER) IS
BEGIN
  INSERT INTO departments (department_id, department_name, manager_id, location_id)
  VALUES (p_department_id, p_department_name, p_manager_id, p_location_id);
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
CREATE OR REPLACE PROCEDURE insert_into_locations (p_location_id NUMBER, p_street_address VARCHAR2, p_postal_code VARCHAR2, p_city VARCHAR2, p_state_province VARCHAR2, p_country_id CHAR) IS
BEGIN
  INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
  VALUES (p_location_id, p_street_address, p_postal_code, p_city, p_state_province, p_country_id);
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
CREATE OR REPLACE PROCEDURE insert_into_countries (p_country_id CHAR, p_country_name VARCHAR2) IS
BEGIN
  INSERT INTO countries (country_id, country_name)
  VALUES (p_country_id, p_country_name);
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
CREATE OR REPLACE PROCEDURE insert_into_projects (p_project_id NUMBER, p_project_name VARCHAR2, p_start_date DATE, p_end_date DATE, p_budget NUMBER, p_department_id NUMBER) IS
BEGIN
  INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id)
  VALUES (p_project_id, p_project_name, p_start_date, p_end_date, p_budget, p_department_id);
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
CREATE OR REPLACE PROCEDURE insert_into_tasks (p_task_id NUMBER, p_task_name VARCHAR2, p_description VARCHAR2, p_duration NUMBER, p_project_id NUMBER) IS
BEGIN
  INSERT INTO tasks (task_id, task_name, description, duration, project_id)
  VALUES (p_task_id, p_task_name, p_description, p_duration, p_project_id);
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
CREATE OR REPLACE PROCEDURE insert_into_participation (p_emp_id NUMBER, p_project_id NUMBER, p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  INSERT INTO participation (emp_id, project_id, role, hours)
  VALUES (p_emp_id, p_project_id, p_role, p_hours);
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


-- Процедура для найма сотрудника
CREATE OR REPLACE PROCEDURE hire_employee (p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone_number VARCHAR2, p_hire_date DATE, p_job_id VARCHAR2, p_salary NUMBER, p_commission_pct NUMBER, p_manager_id NUMBER, p_department_id NUMBER) IS
  v_emp_id NUMBER; -- Переменная для хранения идентификатора нового сотрудника
BEGIN
  -- Получить следующий свободный идентификатор сотрудника из последовательности emp_seq
  SELECT emp_seq.NEXTVAL INTO v_emp_id FROM DUAL;
  -- Вставить данные о новом сотруднике в таблицу employees
  INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
  VALUES (v_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id);
  -- Вывести сообщение об успешном найме сотрудника
  DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has been hired.');
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
CREATE OR REPLACE PROCEDURE promote_employee (p_emp_id NUMBER, p_new_job_id VARCHAR2) IS
BEGIN
  -- Обновить данные о должности сотрудника в таблице employees
  UPDATE employees
  SET job_id = p_new_job_id
  WHERE emp_id = p_emp_id;
  -- Вывести сообщение об успешном повышении в должности сотрудника
  DBMS_OUTPUT.PUT_LINE('Employee ' || p_emp_id || ' has been promoted to ' || p_new_job_id || '.');
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
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


CREATE OR REPLACE FUNCTION encrypt(p_plain_text VARCHAR2) RETURN RAW IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    encrypted_raw RAW(2048);
BEGIN
    encrypted_raw := DBMS_CRYPTO.ENCRYPT(
        src => UTL_I18N.STRING_TO_RAW(p_plain_text, 'AL32UTF8'),
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN encrypted_raw;
END encrypt;
/

CREATE OR REPLACE FUNCTION decrypt(p_encrypted_text RAW) RETURN VARCHAR2 IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    decrypted_raw RAW(2048);
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT(
        src => p_encrypted_text,
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');
END decrypt;
/


CREATE OR REPLACE FUNCTION get_employee_by_email_and_password (
    p_email IN employees.email%TYPE,
    p_password IN VARCHAR2
) RETURN employees%ROWTYPE IS
    l_employee employees%ROWTYPE;
BEGIN
    SELECT *
    INTO l_employee
    FROM employees
    WHERE email = p_email AND decrypt(password_hash) = p_password;

    RETURN l_employee;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Сотрудник не найден или пароль неверный');
        RETURN NULL;
END;
/

CREATE OR REPLACE PROCEDURE add_employee (
    p_emp_id IN employees.emp_id%TYPE,
    p_first_name IN employees.first_name%TYPE,
    p_last_name IN employees.last_name%TYPE,
    p_email IN employees.email%TYPE,
    p_password IN VARCHAR2,
    p_hire_date IN employees.hire_date%TYPE,
    p_job_id IN employees.JOB_ID%TYPE
) IS
BEGIN
    INSERT INTO employees (emp_id, first_name, last_name, email, password_hash, hire_date, JOB_ID)
    VALUES (p_emp_id, p_first_name, p_last_name, p_email, encrypt(p_password), p_hire_date, p_job_id);
END;
/


GRANT EXECUTE ON insert_into_employees TO admin_user;
GRANT EXECUTE ON insert_into_jobs TO admin_user;
GRANT EXECUTE ON insert_into_departments TO admin_user;
GRANT EXECUTE ON insert_into_locations TO admin_user;
GRANT EXECUTE ON insert_into_countries TO admin_user;
GRANT EXECUTE ON insert_into_projects TO admin_user;
GRANT EXECUTE ON insert_into_vacations TO admin_user;
GRANT EXECUTE ON insert_into_tasks TO admin_user;
GRANT EXECUTE ON insert_into_participation TO admin_user;

GRANT EXECUTE ON update_employees TO admin_user;
GRANT EXECUTE ON update_jobs TO admin_user;
GRANT EXECUTE ON update_departments TO admin_user;
GRANT EXECUTE ON update_locations TO admin_user;
GRANT EXECUTE ON update_countries TO admin_user;
GRANT EXECUTE ON update_projects TO admin_user;
GRANT EXECUTE ON update_vacations TO admin_user;
GRANT EXECUTE ON update_tasks TO admin_user;
GRANT EXECUTE ON update_participation TO admin_user;

GRANT EXECUTE ON delete_from_employees TO admin_user;
GRANT EXECUTE ON delete_from_jobs TO admin_user;
GRANT EXECUTE ON delete_from_departments TO admin_user;
GRANT EXECUTE ON delete_from_locations TO admin_user;
GRANT EXECUTE ON delete_from_countries TO admin_user;
GRANT EXECUTE ON delete_from_projects TO admin_user;
GRANT EXECUTE ON delete_from_vacations TO admin_user;
GRANT EXECUTE ON delete_from_tasks TO admin_user;
GRANT EXECUTE ON delete_from_participation TO admin_user;

GRANT EXECUTE ON fire_employee TO admin_user;
GRANT EXECUTE ON promote_employee TO admin_user;
GRANT EXECUTE ON hire_employee TO admin_user;

GRANT EXECUTE ON ENCRYPT TO admin_user;
GRANT EXECUTE ON DECRYPT TO admin_user;

COMMIT;





INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_VP', 'Vice President', 15000, 30000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_ASST', 'Administration Assistant', 5000, 10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('FI_MGR', 'Finance Manager', 10000, 20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('FI_ACCOUNT', 'Accountant', 5000, 10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_MGR', 'Accounting Manager', 10000, 20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_ACCOUNT', 'Public Accountant', 5000, 10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_REP', 'Sales Representative', 5000, 10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('PU_CLERK', 'Purchasing Clerk', 3000, 6000);

INSERT INTO countries (country_id, country_name) VALUES ('US', 'United States');
INSERT INTO countries (country_id, country_name) VALUES ('CA', 'Canada');
INSERT INTO countries (country_id, country_name) VALUES ('MX', 'Mexico');
INSERT INTO countries (country_id, country_name) VALUES ('GB', 'United Kingdom');
INSERT INTO countries (country_id, country_name) VALUES ('FR', 'France');
INSERT INTO countries (country_id, country_name) VALUES ('DE', 'Germany');
INSERT INTO countries (country_id, country_name) VALUES ('JP', 'Japan');
INSERT INTO countries (country_id, country_name) VALUES ('CN', 'China');
INSERT INTO countries (country_id, country_name) VALUES ('AU', 'Australia');
INSERT INTO countries (country_id, country_name) VALUES ('BR', 'Brazil');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1000, '123 Main St', '12345', 'New York', 'NY', 'US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1001, '456 Maple Ave', '67890', 'Toronto', 'ON', 'CA');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1002, '789 Oak St', '54321', 'Mexico City', NULL, 'MX');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1003, '10 Downing St', 'SW1A 2AA', 'London', NULL, 'GB');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1004, '20 Rue de la Paix', '75001', 'Paris', NULL, 'FR');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1005, '30 Berliner Strasse', '10115', 'Berlin', NULL, 'DE');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1006, '40 Tokyo Ave', '123-4567', 'Tokyo', NULL, 'JP');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1007, '50 Beijing Rd', '100000', 'Beijing', NULL, 'CN');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1008, '60 Sydney St', '2000', 'Sydney', 'NSW', 'AU');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1009, '70 Rio Ave', '20000-000', 'Rio de Janeiro', 'RJ', 'BR');

INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (10, 'Finance', 100, 1000);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (20, 'Marketing', 101, 1001);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (30, 'Human Resources', 102, 1002);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (40, 'Information Technology', 103, 1003);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (50, 'Sales', 104, 1004);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (60, 'Research and Development', 105, 1005);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (70, 'Customer Service', 106, 1006);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (80, 'Production', 107, 1007);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (90, 'Purchasing', 108, 1008);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (100, 'Quality Assurance', 109, 1009);

INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1001, 'Project A', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), 50000.00, 10);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1002, 'Project B', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 100000.00, 20);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1003, 'Project C', TO_DATE('2022-03-01', 'YYYY-MM-DD'), NULL, 75000.00, 30);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1004, 'Project D', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 150000.00, 40);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1005, 'Project E', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 25000.00, 50);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1006, 'Project F', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 200000.00, 60);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1007, 'Project G', TO_DATE('2022-07-01', 'YYYY-MM-DD'), NULL, 100000.00, 70);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1008, 'Project H', TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 75000.00, 80);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1009, 'Project I', TO_DATE('2022-09-01', 'YYYY-MM-DD'), NULL, 50000.00, 90);
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, department_id) VALUES (1010, 'Project J', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 300000.00, 100);

INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1001, 'Task A', 'Complete research for project', 40, 1001);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1002, 'Task B', 'Develop project plan', 20, 1001);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1003, 'Task C', 'Design user interface', 30, 1002);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1004, 'Task D', 'Develop backend functionality', 60, 1002);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1005, 'Task E', 'Test and debug software', 50, 1003);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1006, 'Task F', 'Create user documentation', 20, 1003);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1007, 'Task G', 'Develop marketing plan', 30, 1004);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1008, 'Task H', 'Create advertising materials', 40, 1004);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1009, 'Task I', 'Develop training program', 50, 1005);
INSERT INTO tasks (task_id, task_name, description, duration, project_id) VALUES (1010, 'Task J', 'Conduct training sessions', 30, 1005);

INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1001, 'Иван', 'Иванов', 'ivanov@example.com', '1234567890', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'AD_PRES', 50000, 0.1, NULL, 10);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1002, 'Петр', 'Петров', 'petrov@example.com', '0987654321', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'AD_PRES', 60000, 0.15, 1001, 20);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1003, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1004, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1005, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1006, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1007, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1008, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1009, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) VALUES (1010, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30);

INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1001, 1001, 'Researcher', 40);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1001, 'Project Manager', 20);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1003, 1002, 'UI Designer', 30);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1004, 1002, 'Backend Developer', 60);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1005, 1003, 'QA Tester', 50);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1006, 1003, 'Technical Writer', 20);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1007, 1004, 'Marketing Manager', 30);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1008, 1004, 'Graphic Designer', 40);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1009, 1005, 'Training Specialist', 50);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1010, 1005, 'Trainer', 30);

INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (1, 1001, TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'Family vacation');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (2, 1002, TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), 'Personal travel');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (3, 1003, TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'Attending a conference');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (4, 1004, TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-08', 'YYYY-MM-DD'), 'Honeymoon');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (5, 1005, TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), 'Visiting family');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (6, 1006, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), 'New Year holiday');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (7, 1007, TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Ski trip');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (8, 1008, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-07', 'YYYY-MM-DD'), 'Spring break');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (9, 1009, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'International travel');
INSERT INTO vacations (vacation_id, emp_id, start_date, end_date, reason) VALUES (10, 1010, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'Beach vacation');

