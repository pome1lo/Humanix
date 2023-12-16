-- Создание индекса для id
CREATE INDEX idx_jobs_job_id ON jobs (job_id); -- в таблице jobs
CREATE INDEX idx_departments_department_id ON departments (department_id); -- в таблице departments
CREATE INDEX idx_locations_location_id ON locations (location_id); -- в таблице locations
CREATE INDEX idx_countries_country_id ON countries (country_id); -- в таблице countries
CREATE INDEX idx_projects_project_id ON projects (project_id); -- в таблице projects
CREATE INDEX idx_tasks_task_id ON tasks (task_id); -- в таблице tasks
CREATE INDEX idx_participation_emp_project ON participation (EMP_EMAIL, project_id); -- в таблице participation
CREATE INDEX idx_employees_emp_id ON employees (emp_id, LAST_NAME); -- в таблице employees
CREATE INDEX idx_vacations_emp_id ON vacations (EMP_EMAIL); -- в таблице vacations

DROP INDEX idx_vacations_emp_id;
DROP INDEX idx_countries_country_id;
DROP INDEX idx_departments_department_id;
DROP INDEX idx_locations_location_id;
DROP INDEX idx_participation_emp_project;
DROP INDEX idx_projects_project_id;
DROP INDEX idx_tasks_task_id;
DROP INDEX idx_jobs_job_id;