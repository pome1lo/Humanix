CREATE DIRECTORY MY_DIRECTORY AS 'C:\Humanix\Files\JSON';
--DROP DIRECTORY MY_DIRECTORY;

CREATE OR REPLACE PROCEDURE export_json AS
    v_file  UTL_FILE.FILE_TYPE;
    v_data  employees%ROWTYPE;
    v_json  VARCHAR2(32767);
    v_count NUMBER := 0;
    v_total NUMBER := 0;
BEGIN
    -- Получаем общее количество записей
    SELECT COUNT(*) INTO v_total FROM employees;

    -- Открываем файл для записи
    v_file := UTL_FILE.FOPEN('MY_DIRECTORY', 'employees.json', 'w', 32767);

    -- Записываем открывающую квадратную скобку
    UTL_FILE.PUT_LINE(v_file, '[');

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

     -- Увеличиваем счетчик
        v_count := v_count + 1;

        -- Записываем JSON в файл
        IF v_count < v_total THEN
            UTL_FILE.PUT_LINE(v_file, v_json || ',');
        ELSE
            UTL_FILE.PUT_LINE(v_file, v_json);
        END IF;

        -- Записываем JSON в файл
--         UTL_FILE.PUT_LINE(v_file, v_json);
    END LOOP;


    -- Записываем закрывающую квадратную скобку
    UTL_FILE.PUT_LINE(v_file, ']');
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
    v_file := UTL_FILE.FOPEN('MY_DIRECTORY', 'employees.json', 'r');

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

BEGIN
    --ADMIN.export_json;
    ADMIN.import_json;
END; /

SELECT * FROM ADMIN.EMPLOYEES;
-- DELETE FROM ADMIN.PARTICIPATION;
-- DELETE FROM ADMIN.VACATIONS;
 DELETE FROM ADMIN.EMPLOYEES;