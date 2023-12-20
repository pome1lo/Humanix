begin ADMIN.INSERT_INTO_JOBS('test', 'test_OLD', 20000, 40000); end;
SELECT * FROM ADMIN.JOBS WHERE job_id = 'test';

begin ADMIN.UPDATE_JOBS('test', 'test_NEW', 20000, 50000); end;
SELECT * FROM ADMIN.JOBS WHERE job_id = 'test';

begin ADMIN.DELETE_FROM_JOBS('test'); end;
SELECT * FROM ADMIN.JOBS WHERE job_id = 'test';





begin ADMIN.INSERT_INTO_COUNTRIES ('TE', 'TEST_OLD'); end;
SELECT * FROM ADMIN.COUNTRIES WHERE country_id = 'TE';

begin ADMIN.UPDATE_COUNTRIES ('TE', 'TEST_NEW'); end;
SELECT * FROM ADMIN.COUNTRIES WHERE country_id = 'TE';

begin ADMIN.DELETE_FROM_COUNTRIES('TE'); END;
SELECT * FROM ADMIN.COUNTRIES WHERE country_id = 'TE';





begin ADMIN.INSERT_INTO_LOCATIONS('TEST_OLD', '12345', 'TEST', 'NY', 'US'); end;
SELECT * FROM ADMIN.LOCATIONS WHERE CITY = 'TEST';

begin ADMIN.UPDATE_LOCATIONS(11, 'TEST_NEW', '12345', 'TEST', 'NY', 'US'); end;
SELECT * FROM ADMIN.LOCATIONS WHERE CITY = 'TEST';

begin ADMIN.DELETE_FROM_LOCATIONS(11); end;
SELECT * FROM ADMIN.LOCATIONS WHERE CITY = 'TEST';





begin ADMIN.INSERT_INTO_DEPARTMENTS('TEST_OLD', 1, 1); end;
SELECT * FROM ADMIN.DEPARTMENTS WHERE DEPARTMENT_NAME = 'TEST_OLD';

begin ADMIN.UPDATE_DEPARTMENTS(11,'TEST_NEW',1, 1); end;
SELECT * FROM ADMIN.DEPARTMENTS WHERE DEPARTMENT_NAME = 'TEST_NEW';

begin ADMIN.DELETE_FROM_DEPARTMENTS(11); end;
SELECT * FROM ADMIN.DEPARTMENTS WHERE DEPARTMENT_NAME = 'TEST_NEW';





begin ADMIN.INSERT_INTO_PROJECTS ('TEST_OLD', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), 50000.00, 1); end;
SELECT * FROM ADMIN.PROJECTS WHERE PROJECT_NAME = 'TEST_OLD';

begin ADMIN.UPDATE_PROJECTS(11,'TEST_NEW', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), 50000.00, 1); end;
SELECT * FROM ADMIN.PROJECTS WHERE PROJECT_NAME = 'TEST_NEW';

begin ADMIN.DELETE_FROM_PROJECTS(11); end;
SELECT * FROM ADMIN.PROJECTS WHERE PROJECT_NAME = 'TEST_NEW';





begin ADMIN.INSERT_INTO_TASKS ('TEST', 'OLD', 40, 1); end;
SELECT * FROM ADMIN.TASKS WHERE TASK_NAME ='TEST';

begin ADMIN.UPDATE_TASKS(11,'TEST', 'NEW', 40, 1); end;
SELECT * FROM ADMIN.TASKS WHERE TASK_NAME ='TEST';

begin ADMIN.DELETE_FROM_TASKS(11); end;
SELECT * FROM ADMIN.TASKS WHERE TASK_NAME ='TEST';




begin ADMIN.INSERT_INTO_EMPLOYEES('TEST_TEST', 'OLD', 'TEST_INSERT', '1234567890','AD_PRES', 50000, 0.1, NULL, 1, 'password1137'); end;
begin ADMIN.HIRE_EMPLOYEE('TEST_TEST', 'OLD', 'TEST_HIRE', '1234567890','AD_PRES', 50000, 0.1, NULL, 1, 'password1137'); end;
SELECT * FROM ADMIN.EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';

begin ADMIN.UPDATE_EMPLOYEES(100034,'TEST_TEST', 'NEW', 'TEST_INSERT', '1234567890','AD_PRES', 50000, 0.1, NULL, 1); end;
begin ADMIN.UPDATE_EMPLOYEES(100035,'TEST_TEST', 'NEW', 'TEST_HIRE',   '1234567890','AD_PRES', 50000, 0.1, NULL, 1); end;
SELECT * FROM ADMIN.EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';

begin ADMIN.DELETE_FROM_EMPLOYEES(100034); END;
begin ADMIN.FIRE_EMPLOYEE(100035); END;
SELECT * FROM ADMIN.EMPLOYEES WHERE FIRST_NAME = 'TEST_TEST';





Begin ADMIN.INSERT_INTO_PARTICIPATION('test@example.com', 2, 'OLD', 40); end;
SELECT * FROM ADMIN.PARTICIPATION WHERE PROJECT_ID = 2 AND EMP_EMAIL = 'test@example.com';

Begin ADMIN.UPDATE_PARTICIPATION('test@example.com', 2, 'NEW', 40); end;
SELECT * FROM ADMIN.PARTICIPATION WHERE PROJECT_ID = 2 AND EMP_EMAIL = 'test@example.com';

begin ADMIN.delete_from_participation('test@example.com', 2); end;
SELECT * FROM ADMIN.PARTICIPATION WHERE PROJECT_ID = 2 AND EMP_EMAIL = 'test@example.com';



SELECT * FROM ADMIN.EMPLOYEES;

begin ADMIN.INSERT_INTO_VACATIONS('sergeev@bk.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'OLD'); end;
SELECT * FROM ADMIN.VACATIONS WHERE EMP_EMAIL = 'sergeev@bk.com';

begin ADMIN.Update_vacations(122,'sergeev@bk.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'NEW'); end;
SELECT * FROM ADMIN.VACATIONS WHERE EMP_EMAIL = 'sergeev@bk.com';

begin ADMIN.delete_from_vacations(122); end;
SELECT * FROM ADMIN.VACATIONS WHERE EMP_EMAIL = 'sergeev@bk.com';