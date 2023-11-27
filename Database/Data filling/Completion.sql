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

INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (1001, 'Иван', 'Иванов', 'vvv@example.com', '1234567890', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'AD_PRES', 50000, 0.1, NULL, 10, ENCRYPT('password1137'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (1002, 'Петр', 'Петров', 'test@example.com', '0987654321', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'AD_PRES', 60000, 0.15, 1001, 20, ENCRYPT('password69'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (303, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, NULL, 30, ENCRYPT('password1'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (404, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password2'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (505, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password3'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (606, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password4'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (707, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password5'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (808, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password6'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (909, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password8'));
INSERT INTO employees (emp_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, PASSWORD_HASH) VALUES (1000, 'Сергей', 'Сергеев', 'sergeev@example.com', '1029384756', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'AD_PRES', 70000, 0.2, 1002, 30, ENCRYPT('password8'));

INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1001, 1001, 'Researcher', 40);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1001, 'Project Manager', 20);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1002, 'UI Designer', 30);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1002, 'Backend Developer', 60);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1003, 'QA Tester', 50);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1003, 'Technical Writer', 20);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1004, 'Marketing Manager', 30);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1004, 'Graphic Designer', 40);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1005, 'Training Specialist', 50);
INSERT INTO participation (emp_id, project_id, role, hours) VALUES (1002, 1005, 'Trainer', 30);

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

