
CREATE OR REPLACE PROCEDURE SetIsAuthentic (p_email IN employees.email%TYPE) IS
BEGIN
    UPDATE employees SET IsAuthentic = 1 WHERE email = p_email;
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


begin HIRE_EMPLOYEE('TEST_TEST', 'OLD', 'HIRE_TEST', '1234567890','AD_PRES', 50000, 0.1, NULL, 1, 'password1137'); end;
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';

begin promote_employee(12, 'PU_CLERK'); end;
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';

begin SetIsAuthentic('HIRE_TEST'); end;
SELECT * FROM EMPLOYEES WHERE EMP_ID = 12;

DECLARE v_num number;
begin
    v_num :=login_employee('HIRE_TEST', 'password1137');
    DBMS_OUTPUT.PUT_LINE(v_num);
end;


begin FIRE_EMPLOYEE(12); end;
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';


SELECT * FROM EMPLOYEES;