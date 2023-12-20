-- Создание индексов для id
CREATE INDEX idx_departments_department_id ON departments (DEPARTMENT_NAME); -- в таблице departments
CREATE INDEX idx_countries_country_id ON countries (country_name); -- в таблице countries
CREATE INDEX idx_projects_project_id ON projects (project_name); -- в таблице projects
CREATE INDEX idx_participation_emp_project ON participation (ROLE); -- в таблице participation
CREATE INDEX idx_vacations_emp_id ON vacations (EMP_EMAIL); -- в таблице vacations

DROP INDEX idx_vacations_emp_id;
DROP INDEX idx_countries_country_id;
DROP INDEX idx_departments_department_id;
DROP INDEX idx_participation_emp_project;
DROP INDEX idx_projects_project_id;
