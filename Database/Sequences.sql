-- Создание последовательности для поля ID в
CREATE SEQUENCE department_id_seq START WITH 1 INCREMENT BY 1; -- в таблице departments
CREATE SEQUENCE location_id_seq START WITH 1 INCREMENT BY 1; -- в таблице locations
CREATE SEQUENCE project_id_seq START WITH 1 INCREMENT BY 1; -- в таблице projects
CREATE SEQUENCE task_id_seq START WITH 1 INCREMENT BY 1; -- в таблице tasks
CREATE SEQUENCE emp_id_seq START WITH 1 INCREMENT BY 1; -- в таблице employees
CREATE SEQUENCE vacation_id_seq START WITH 1 INCREMENT BY 1; -- в таблице vacations
CREATE SEQUENCE participation_id_seq START WITH 1 INCREMENT BY 1; -- в таблице participation

DROP SEQUENCE participation_id_seq;
DROP SEQUENCE department_id_seq;
DROP SEQUENCE location_id_seq;
DROP SEQUENCE project_id_seq;
DROP SEQUENCE task_id_seq;
DROP SEQUENCE emp_id_seq;
DROP SEQUENCE vacation_id_seq;