CREATE OR REPLACE PROCEDURE ADMIN.handle_error(p_error_code IN NUMBER) IS
BEGIN
  -- Обработка исключений на основе кода ошибки
  IF p_error_code = 1 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Дублирование значения ключа. Код ошибки: 1');
  ELSIF p_error_code = 1400 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Нулевое значение не допустимо. Код ошибки: 1400');
  ELSIF p_error_code = 2292 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Нарушение целостности. Код ошибки: 2292');
  ELSIF p_error_code = 942 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Таблица или представление не существует. Код ошибки: 942');
  ELSIF p_error_code = 1017 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Неверное имя пользователя или пароль. Код ошибки: 1017');
  ELSIF p_error_code = 12154 THEN
    DBMS_OUTPUT.PUT_LINE('🛠 Ошибка: Не удалось разрешить имя службы. Код ошибки: 12154');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Ошибка:'|| SQLERRM || ':( ');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
END handle_error;
/

drop procedure ADMIN.handle_error;

-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_employees (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
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
        ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_employees;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_departments (p_department_name VARCHAR2, p_manager_id NUMBER, p_location_id NUMBER) IS
BEGIN
  INSERT INTO departments (department_name, manager_id, location_id)
  VALUES (p_department_name, p_manager_id, p_location_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_departments;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_locations (p_street_address VARCHAR2, p_postal_code VARCHAR2, p_city VARCHAR2, p_state_province VARCHAR2, p_country_id CHAR) IS
BEGIN
  INSERT INTO locations (street_address, postal_code, city, state_province, country_id)
  VALUES (p_street_address, p_postal_code, p_city, p_state_province, p_country_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_locations;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_countries (p_country_id CHAR, p_country_name VARCHAR2) IS
BEGIN
  INSERT INTO countries (COUNTRY_ID, country_name)
  VALUES (p_country_id, p_country_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_countries;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_projects (p_project_name VARCHAR2, p_start_date DATE, p_end_date DATE, p_budget NUMBER, p_department_id NUMBER) IS
BEGIN
  INSERT INTO projects (project_name, start_date, end_date, budget, department_id)
  VALUES (p_project_name, p_start_date, p_end_date, p_budget, p_department_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_projects;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_tasks (p_task_name VARCHAR2, p_description VARCHAR2, p_duration NUMBER, p_project_id NUMBER) IS
BEGIN
  INSERT INTO tasks (task_name, description, duration, project_id)
  VALUES (p_task_name, p_description, p_duration, p_project_id);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_tasks;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_participation (p_emp_email varchar2, p_project_id NUMBER,p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  INSERT INTO participation (EMP_EMAIL, PROJECT_ID, role, hours)
  VALUES (p_emp_email, p_project_id, p_role, p_hours);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_participation;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_vacations (p_emp_email NVARCHAR2, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
BEGIN
  INSERT INTO vacations (EMP_EMAIL, start_date, end_date, reason)
  VALUES (p_emp_email, p_start_date, p_end_date, p_reason);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_vacations;
/
-- Процедура для вставки данных
CREATE OR REPLACE PROCEDURE ADMIN.insert_into_jobs (p_job_id varchar2,p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
BEGIN
  INSERT INTO jobs (JOB_ID, job_title, min_salary, max_salary)
  VALUES (p_job_id, p_job_title, p_min_salary, p_max_salary);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END insert_into_jobs;
/

drop procedure ADMIN.INSERT_INTO_EMPLOYEES;
drop procedure ADMIN.INSERT_INTO_JOBS;
drop procedure ADMIN.INSERT_INTO_DEPARTMENTS;
drop procedure ADMIN.INSERT_INTO_LOCATIONS;
drop procedure ADMIN.INSERT_INTO_VACATIONS;
drop procedure ADMIN.INSERT_INTO_COUNTRIES;
drop procedure ADMIN.INSERT_INTO_PROJECTS;
drop procedure ADMIN.INSERT_INTO_TASKS;
drop procedure ADMIN.INSERT_INTO_PARTICIPATION;

CREATE OR REPLACE PROCEDURE ADMIN.export_json AS
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
        ADMIN.HANDLE_ERROR(SQLCODE);
END export_json;
/

CREATE OR REPLACE PROCEDURE ADMIN.import_json IS
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
        ADMIN.HANDLE_ERROR(SQLCODE);
END import_json;
/

drop procedure ADMIN.export_json;
drop procedure ADMIN.import_json;

CREATE OR REPLACE FUNCTION ADMIN.encrypt(p_plain_text VARCHAR2, p_salt VARCHAR2) RETURN RAW IS
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

CREATE OR REPLACE FUNCTION ADMIN.decrypt(p_encrypted_text RAW, p_salt VARCHAR2) RETURN VARCHAR2 IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    decrypted_raw RAW(2048);
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT(
        src => p_encrypted_text,
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN ADMIN.separate_string(UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8'), p_salt);
END decrypt;
/

CREATE OR REPLACE FUNCTION ADMIN.separate_string(p_pass VARCHAR2, p_salt VARCHAR2) RETURN VARCHAR2 IS
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

CREATE OR REPLACE FUNCTION ADMIN.generate_salt(p_email VARCHAR2) RETURN VARCHAR2 IS
    v_salt VARCHAR2(128);
BEGIN
    -- Генерируем соль на основе email
    SELECT DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(p_email, 'AL32UTF8'), DBMS_CRYPTO.HASH_SH1) INTO v_salt FROM dual;
    RETURN v_salt;
END generate_salt;
/

drop function ADMIN.encrypt;
drop function ADMIN.decrypt;
drop function ADMIN.separate_string;
drop function ADMIN.generate_salt;

CREATE OR REPLACE PROCEDURE ADMIN.SetIsAuthentic (p_email IN employees.email%TYPE) IS
BEGIN
    UPDATE employees
    SET IsAuthentic = 1
    WHERE email = p_email;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        ADMIN.HANDLE_ERROR(SQLCODE);
END SetIsAuthentic;
/

CREATE OR REPLACE FUNCTION ADMIN.login_employee(p_email VARCHAR2, p_password VARCHAR2) RETURN NUMBER IS
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

DROP PROCEDURE ADMIN.SetIsAuthentic;
DROP PROCEDURE ADMIN.login_employee;


-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_employees (p_emp_id NUMBER) IS
BEGIN
  DELETE FROM employees WHERE emp_id = p_emp_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_employees;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_jobs (p_job_id VARCHAR2) IS
BEGIN
  DELETE FROM jobs WHERE job_id = p_job_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_jobs;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_departments (p_department_id NUMBER) IS
BEGIN
  DELETE FROM departments WHERE department_id = p_department_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_departments;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_locations (p_location_id NUMBER) IS
BEGIN
  DELETE FROM locations WHERE location_id = p_location_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_locations;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_countries (p_country_id CHAR) IS
BEGIN
  DELETE FROM countries WHERE country_id = p_country_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_countries;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_projects (p_project_id NUMBER) IS
BEGIN
  DELETE FROM projects WHERE project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_projects;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_tasks (p_task_id NUMBER) IS
BEGIN
  DELETE FROM tasks WHERE task_id = p_task_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_tasks;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_participation (p_emp_email VARCHAR2, p_project_id NUMBER) IS
BEGIN
  DELETE FROM participation WHERE EMP_EMAIL = p_emp_email AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_participation;
/
-- Процедура для удаления данных
CREATE OR REPLACE PROCEDURE ADMIN.delete_from_vacations (p_vacation_id NUMBER) IS
BEGIN
  DELETE FROM vacations WHERE vacation_id = p_vacation_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END delete_from_vacations;
/

drop procedure ADMIN.DELETE_FROM_EMPLOYEES;
drop procedure ADMIN.DELETE_FROM_JOBS;
drop procedure ADMIN.DELETE_FROM_DEPARTMENTS;
drop procedure ADMIN.DELETE_FROM_LOCATIONS;
drop procedure ADMIN.DELETE_FROM_COUNTRIES;
drop procedure ADMIN.DELETE_FROM_PROJECTS;
drop procedure ADMIN.DELETE_FROM_TASKS;
drop procedure ADMIN.DELETE_FROM_PARTICIPATION;
drop procedure ADMIN.DELETE_FROM_VACATIONS;

-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_employees (p_emp_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone_number VARCHAR2, p_job_id VARCHAR2, p_salary NUMBER, p_commission_pct NUMBER, p_manager_id NUMBER, p_department_id NUMBER) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_employees;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_jobs (p_job_id VARCHAR2, p_job_title VARCHAR2, p_min_salary NUMBER, p_max_salary NUMBER) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_jobs;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_departments (p_department_id NUMBER, p_department_name VARCHAR2, p_manager_id NUMBER, p_location_id NUMBER) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_departments;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_locations (p_location_id NUMBER, p_street_address VARCHAR2, p_postal_code VARCHAR2, p_city VARCHAR2, p_state_province VARCHAR2, p_country_id CHAR) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_locations;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_countries (p_country_id CHAR, p_country_name VARCHAR2) IS
BEGIN
  UPDATE countries
  SET country_name = p_country_name
  WHERE country_id = p_country_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_countries;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_projects (p_project_id NUMBER, p_project_name VARCHAR2, p_start_date DATE, p_end_date DATE, p_budget NUMBER, p_department_id NUMBER) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_projects;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_tasks (p_task_id NUMBER, p_task_name VARCHAR2, p_description VARCHAR2, p_duration NUMBER, p_project_id NUMBER) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_tasks;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_participation (p_emp_email NVARCHAR2, p_project_id NUMBER, p_role VARCHAR2, p_hours NUMBER) IS
BEGIN
  UPDATE participation
  SET role = p_role,
      hours = p_hours
  WHERE EMP_EMAIL = p_emp_email AND project_id = p_project_id;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_participation;
/
-- Процедура для изменения данных
CREATE OR REPLACE PROCEDURE ADMIN.update_vacations (p_vacation_id NUMBER, p_emp_email NVARCHAR2, p_start_date DATE, p_end_date DATE, p_reason VARCHAR2) IS
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
    ADMIN.HANDLE_ERROR(SQLCODE);
END update_vacations;
/

drop procedure ADMIN.UPDATE_EMPLOYEES;
drop procedure ADMIN.UPDATE_JOBS;
drop procedure ADMIN.UPDATE_DEPARTMENTS;
drop procedure ADMIN.UPDATE_LOCATIONS;
drop procedure ADMIN.UPDATE_COUNTRIES;
drop procedure ADMIN.UPDATE_PROJECTS;
drop procedure ADMIN.UPDATE_TASKS;
drop procedure ADMIN.UPDATE_PARTICIPATION;
drop procedure ADMIN.UPDATE_VACATIONS;

CREATE OR REPLACE PROCEDURE ADMIN.hire_employee (p_first_name VARCHAR2,p_last_name VARCHAR2,p_email VARCHAR2,p_phone_number VARCHAR2,p_job_id VARCHAR2,p_salary NUMBER,p_commission_pct NUMBER,p_manager_id NUMBER,p_department_id NUMBER,p_password_hash VARCHAR2
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
        ADMIN.HANDLE_ERROR(SQLCODE);
END hire_employee;
/
-- Процедура для увольнения сотрудника
CREATE OR REPLACE PROCEDURE ADMIN.fire_employee (p_emp_id NUMBER) IS
BEGIN
  -- Удалить данные о сотруднике из таблицы employees
  DELETE FROM employees WHERE emp_id = p_emp_id;
  -- Вывести сообщение об успешном увольнении сотрудника
  DBMS_OUTPUT.PUT_LINE('Employee ' || p_emp_id || ' has been fired.');
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END fire_employee;
/
-- Процедура для повышения в должности сотрудника
CREATE OR REPLACE PROCEDURE ADMIN.promote_employee (
    p_emp_id IN employees.emp_id%TYPE,
    p_new_job_id IN employees.job_id%TYPE
) IS
BEGIN
    UPDATE employees SET job_id = p_new_job_id WHERE emp_id = p_emp_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    ADMIN.HANDLE_ERROR(SQLCODE);
END promote_employee;
/

drop procedure ADMIN.HIRE_EMPLOYEE;
drop procedure ADMIN.FIRE_EMPLOYEE;
drop procedure ADMIN.PROMOTE_EMPLOYEE;