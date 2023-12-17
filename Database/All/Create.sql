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
    emp_id NUMBER(6) NOT NULL ,--PRIMARY KEY , -- Идентификатор сотрудника
    first_name VARCHAR2(20), -- Имя сотрудника
    last_name VARCHAR2(25) NOT NULL, -- Фамилия сотрудника
    email VARCHAR2(25) PRIMARY KEY , -- Электронная почта сотрудника
    phone_number VARCHAR2(15), -- Номер телефона сотрудника
    hire_date DATE NOT NULL, -- Дата найма сотрудника
    job_id VARCHAR2(10) NOT NULL, -- Идентификатор должности сотрудника
    salary NUMBER(8,2), -- Зарплата сотрудника
    commission_pct NUMBER(2,2), -- Процент комиссии сотрудника
    manager_id NUMBER(6), -- Идентификатор менеджера сотрудника
    department_id NUMBER(4), -- Идентификатор отдела сотрудника
    password_hash VARCHAR2(128)
  --CONSTRAINT employees_pk PRIMARY KEY (emp_id, email)
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
CREATE OR REPLACE PROCEDURE insert_into_employees (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
) IS v_emp_id employees.emp_id%TYPE;
     v_salt employees.salt%TYPE;
BEGIN
    INSERT INTO employees (
        emp_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id, password_hash, salt, ISAUTHENTIC
    ) VALUES (
        v_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id, ENCRYPT(p_password_hash, v_salt), v_salt, 0
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END insert_into_employees;
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
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_countries (p_country_id CHAR, p_country_name VARCHAR2) IS
BEGIN
  INSERT INTO countries (COUNTRY_ID, country_name)
  VALUES (p_country_id, p_country_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_countries;
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
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_participation (p_emp_email varchar2, p_project_id NUMBER,p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  INSERT INTO participation (EMP_EMAIL, PROJECT_ID, role, hours)
  VALUES (p_emp_email, p_project_id, p_role, p_hours);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_participation;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_vacations (p_emp_email NVARCHAR2, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
BEGIN
  INSERT INTO vacations (EMP_EMAIL, start_date, end_date, reason)
  VALUES (p_emp_email, p_start_date, p_end_date, p_reason);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_vacations;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE insert_into_jobs (p_job_id varchar2,p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
BEGIN
  INSERT INTO jobs (JOB_ID, job_title, min_salary, max_salary)
  VALUES (p_job_id, p_job_title, p_min_salary, p_max_salary);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END insert_into_jobs;
/

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
            'job_id' VALUE v_data.job_id,
            'salary' VALUE v_data.salary,
            'commission_pct' VALUE v_data.commission_pct,
            'manager_id' VALUE v_data.manager_id,
            'department_id' VALUE v_data.department_id,
            'password_hash' VALUE v_data.PASSWORD_HASH,
            'isauthentic' value v_data.ISAUTHENTIC
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
        v_emp_rec.job_id := v_json_obj.get_string('job_id');
        v_emp_rec.salary := v_json_obj.get_number('salary');
        v_emp_rec.commission_pct := v_json_obj.get_number('commission_pct');
        v_emp_rec.manager_id := v_json_obj.get_number('manager_id');
        v_emp_rec.department_id := v_json_obj.get_number('department_id');
        v_emp_rec.password_hash := v_json_obj.get_string('password_hash');
        v_emp_rec.ISAUTHENTIC := v_json_obj.get_string('isauthentic');

        INSERT INTO employees VALUES v_emp_rec;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END import_json;
/

CREATE OR REPLACE FUNCTION encrypt(p_plain_text VARCHAR2, p_salt VARCHAR2) RETURN RAW IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    encrypted_raw RAW(2048);
BEGIN
    encrypted_raw := DBMS_CRYPTO.ENCRYPT(
        src => UTL_I18N.STRING_TO_RAW(p_plain_text || p_salt, 'AL32UTF8'),
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN encrypted_raw;
END encrypt;
/

CREATE OR REPLACE FUNCTION decrypt(p_encrypted_text RAW, p_salt VARCHAR2) RETURN VARCHAR2 IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    decrypted_raw RAW(2048);
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT(
        src => p_encrypted_text,
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN separate_string(UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8'), p_salt);
END decrypt;
/

CREATE OR REPLACE FUNCTION separate_string(p_pass VARCHAR2, p_salt VARCHAR2) RETURN VARCHAR2 IS
    result_string VARCHAR2(2000);
BEGIN
    IF INSTR(p_pass, p_salt) > 0 THEN
        result_string := SUBSTR(p_pass, 1, INSTR(p_pass, p_salt) - 1);
    ELSE
        result_string := p_pass;
    END IF;
    RETURN result_string;
END separate_string;
/

CREATE OR REPLACE FUNCTION generate_salt(p_email VARCHAR2) RETURN VARCHAR2 IS
    v_salt VARCHAR2(128);
BEGIN
    -- Генерируем соль на основе email
    SELECT DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(p_email, 'AL32UTF8'), DBMS_CRYPTO.HASH_SH1) INTO v_salt FROM dual;
    RETURN v_salt;
END generate_salt;
/

CREATE OR REPLACE PROCEDURE SetIsAuthentic (p_email IN employees.email%TYPE) IS
BEGIN
    UPDATE employees
    SET IsAuthentic = 1
    WHERE email = p_email;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END SetIsAuthentic;
/

CREATE OR REPLACE FUNCTION login_employee(p_email VARCHAR2, p_password VARCHAR2) RETURN NUMBER IS
    l_employee employees%ROWTYPE;
    l_password_hash VARCHAR2(128);
BEGIN
    SELECT * into l_employee FROM employees WHERE email = p_email;
    l_password_hash := decrypt(l_employee.PASSWORD_HASH, GENERATE_SALT(p_email));

    IF l_password_hash = p_password THEN
        RETURN l_employee.EMP_ID;
    ELSE
        RETURN 0;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END login_employee;
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
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE delete_from_participation (p_emp_email VARCHAR2, p_project_id NUMBER) IS
BEGIN
  DELETE FROM participation WHERE EMP_EMAIL = p_emp_email AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END delete_from_participation;
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
CREATE OR REPLACE PROCEDURE update_employees (p_emp_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone_number VARCHAR2, p_job_id VARCHAR2, p_salary NUMBER, p_commission_pct NUMBER, p_manager_id NUMBER, p_department_id NUMBER) IS
BEGIN
  UPDATE employees
  SET first_name = p_first_name,
      last_name = p_last_name,
      email = p_email,
      phone_number = p_phone_number,
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
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_participation (p_emp_email NVARCHAR2, p_project_id NUMBER, p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  UPDATE participation
  SET role = p_role,
      hours = p_hours
  WHERE EMP_EMAIL = p_emp_email AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_participation;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE update_vacations (p_vacation_id NUMBER, p_emp_email NVARCHAR2, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
BEGIN
  UPDATE vacations
  SET EMP_EMAIL = p_emp_email,
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

CREATE OR REPLACE PROCEDURE hire_employee (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
) IS v_emp_id employees.emp_id%TYPE;
     v_salt employees.salt%TYPE;
BEGIN
    INSERT INTO employees (
        emp_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id, password_hash, salt, ISAUTHENTIC
    ) VALUES (
        v_emp_id, p_first_name, p_last_name, p_email, p_phone_number, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id, ENCRYPT(p_password_hash, v_salt), v_salt, 0
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


begin
INSERT_INTO_JOBS('AD_PRES', 'President', 20000, 40000);
INSERT_INTO_JOBS('AD_VP', 'Vice President', 15000, 30000);
INSERT_INTO_JOBS('AD_ASST', 'Administration Assistant', 5000, 10000);
INSERT_INTO_JOBS('FI_MGR', 'Finance Manager', 10000, 20000);
INSERT_INTO_JOBS('FI_ACCOUNT', 'Accountant', 5000, 10000);
INSERT_INTO_JOBS('AC_MGR', 'Accounting Manager', 10000, 20000);
INSERT_INTO_JOBS('AC_ACCOUNT', 'Public Accountant', 5000, 10000);
INSERT_INTO_JOBS('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT_INTO_JOBS('SA_REP', 'Sales Representative', 5000, 10000);
INSERT_INTO_JOBS('PU_CLERK', 'Purchasing Clerk', 3000, 6000);
end;
begin
INSERT_INTO_COUNTRIES ('US', 'United States');
INSERT_INTO_COUNTRIES ('CA', 'Canada');
INSERT_INTO_COUNTRIES ('MX', 'Mexico');
INSERT_INTO_COUNTRIES ('GB', 'United Kingdom');
INSERT_INTO_COUNTRIES ('FR', 'France');
INSERT_INTO_COUNTRIES ('DE', 'Germany');
INSERT_INTO_COUNTRIES ('JP', 'Japan');
INSERT_INTO_COUNTRIES ('CN', 'China');
INSERT_INTO_COUNTRIES ('AU', 'Australia');
INSERT_INTO_COUNTRIES ('BR', 'Brazil');
end;
begin
INSERT_INTO_LOCATIONS('123 Main St', '12345', 'New York', 'NY', 'US');
INSERT_INTO_LOCATIONS('456 Maple Ave', '67890', 'Toronto', 'ON', 'CA');
INSERT_INTO_LOCATIONS('789 Oak St', '54321', 'Mexico City', NULL, 'MX');
INSERT_INTO_LOCATIONS('10 Downing St', 'SW1A 2AA', 'London', NULL, 'GB');
INSERT_INTO_LOCATIONS('20 Rue de la Paix', '75001', 'Paris', NULL, 'FR');
INSERT_INTO_LOCATIONS('30 Berliner Strasse', '10115', 'Berlin', NULL, 'DE');
INSERT_INTO_LOCATIONS('40 Tokyo Ave', '123-4567', 'Tokyo', NULL, 'JP');
INSERT_INTO_LOCATIONS('50 Beijing Rd', '100000', 'Beijing', NULL, 'CN');
INSERT_INTO_LOCATIONS('60 Sydney St', '2000', 'Sydney', 'NSW', 'AU');
INSERT_INTO_LOCATIONS('70 Rio Ave', '20000-000', 'Rio de Janeiro', 'RJ', 'BR');
end;
begin
INSERT_INTO_DEPARTMENTS('Finance', 1, 1);
INSERT_INTO_DEPARTMENTS('Marketing', 2, 2);
INSERT_INTO_DEPARTMENTS('Human Resources', 2, 3);
INSERT_INTO_DEPARTMENTS('Information Technology', 1, 4);
INSERT_INTO_DEPARTMENTS('Sales', 1, 4);
INSERT_INTO_DEPARTMENTS('Research and Development', 2, 5);
INSERT_INTO_DEPARTMENTS('Customer Service', 2, 6);
INSERT_INTO_DEPARTMENTS('Production', 1, 7);
INSERT_INTO_DEPARTMENTS('Purchasing', 1, 8);
INSERT_INTO_DEPARTMENTS('Quality Assurance', 1, 9);
end;
begin
INSERT_INTO_PROJECTS ('Project A', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), 50000.00, 1);
INSERT_INTO_PROJECTS ('Project B', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 100000.00, 2);
INSERT_INTO_PROJECTS ('Project C', TO_DATE('2022-03-01', 'YYYY-MM-DD'), NULL, 75000.00, 7);
INSERT_INTO_PROJECTS ('Project D', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 150000.00, 4);
INSERT_INTO_PROJECTS ('Project E', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 25000.00, 3);
INSERT_INTO_PROJECTS ('Project F', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 200000.00, 2);
INSERT_INTO_PROJECTS ('Project G', TO_DATE('2022-07-01', 'YYYY-MM-DD'), NULL, 100000.00, 5);
INSERT_INTO_PROJECTS ('Project H', TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 75000.00, 4);
INSERT_INTO_PROJECTS ('Project I', TO_DATE('2022-09-01', 'YYYY-MM-DD'), NULL, 50000.00, 9);
INSERT_INTO_PROJECTS ('Project J', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 300000.00, 8);
end;
begin
INSERT_INTO_TASKS ('Task A', 'Complete research for project', 40, 1);
INSERT_INTO_TASKS ('Task B', 'Develop project plan', 20, 2);
INSERT_INTO_TASKS ('Task C', 'Design user interface', 30, 3);
INSERT_INTO_TASKS ('Task D', 'Develop backend functionality', 60, 4);
INSERT_INTO_TASKS ('Task E', 'Demo and debug software', 50, 5);
INSERT_INTO_TASKS ('Task F', 'Create user documentation', 20, 5);
INSERT_INTO_TASKS ('Task G', 'Develop marketing plan', 30, 6);
INSERT_INTO_TASKS ('Task H', 'Create advertising materials', 40, 7);
INSERT_INTO_TASKS ('Task I', 'Develop training program', 50, 8);
INSERT_INTO_TASKS ('Task J', 'Conduct training sessions', 30, 9);
end;
begin
INSERT_INTO_EMPLOYEES('Иван', 'Иванов', 'vvv@example.com', '1234567890','AD_PRES', 50000, 0.1, NULL, 1, 'password1137');
INSERT_INTO_EMPLOYEES('Петр', 'Петров', 'test@example.com', '0987654321','AD_PRES', 60000, 0.15, NULL, 2, 'password69');
INSERT_INTO_EMPLOYEES('Сергей', 'Сергеев', 'sergeev@example.com', '1029384756','AD_PRES', 70000, 0.2, NULL, 3, 'password1');
end;
begin
INSERT_INTO_PARTICIPATION('vvv@example.com', 2, 'Researcher', 40);
INSERT_INTO_PARTICIPATION('vvv@example.com', 3, 'Project Manager', 20);
INSERT_INTO_PARTICIPATION('vvv@example.com', 4, 'UI Designer', 30);
INSERT_INTO_PARTICIPATION('vvv@example.com', 5, 'Backend Developer', 60);
INSERT_INTO_PARTICIPATION('vvv@example.com', 6, 'QA Tester', 50);
end;
begin
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'Family vacation');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), 'Personal travel');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'Attending a conference');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-08', 'YYYY-MM-DD'), 'Honeymoon');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), 'Visiting family');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), 'New Year holiday');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Ski trip');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-07', 'YYYY-MM-DD'), 'Spring break');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'International travel');
INSERT_INTO_VACATIONS('vvv@example.com', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'Beach vacation');
end;

COMMIT ;