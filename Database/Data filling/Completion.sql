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
INSERT_INTO_TASKS ('Task E', 'Test and debug software', 50, 5);
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



DELETE FROM EMPLOYEES;
DELETE FROM VACATIONS;
DELETE FROM PARTICIPATION;
DELETE FROM JOBS;
DELETE FROM TASKS;
DELETE FROM PROJECTS;
DELETE FROM DEPARTMENTS;
DELETE FROM LOCATIONS;
DELETE FROM COUNTRIES;