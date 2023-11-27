-- Создаем таблицу сотрудников с первичным ключом emp_id
CREATE TABLE employees (
    emp_id NUMBER(6) PRIMARY KEY , -- Идентификатор сотрудника
    first_name VARCHAR2(20), -- Имя сотрудника
    last_name VARCHAR2(25) NOT NULL, -- Фамилия сотрудника
    email VARCHAR2(25) , -- Электронная почта сотрудника
    phone_number VARCHAR2(15), -- Номер телефона сотрудника
    hire_date DATE NOT NULL, -- Дата найма сотрудника
    job_id VARCHAR2(10) NOT NULL, -- Идентификатор должности сотрудника
    salary NUMBER(8,2), -- Зарплата сотрудника
    commission_pct NUMBER(2,2), -- Процент комиссии сотрудника
    manager_id NUMBER(6), -- Идентификатор менеджера сотрудника
    department_id NUMBER(4), -- Идентификатор отдела сотрудника
    password_hash VARCHAR2(128)
  -- CONSTRAINT employees_pk PRIMARY KEY (emp_id, email)
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


DROP TABLE participation;
DROP TABLE tasks;
DROP TABLE projects;
DROP TABLE vacations;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE jobs;
DROP TABLE locations;
DROP TABLE countries;