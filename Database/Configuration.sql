CREATE PLUGGABLE DATABASE HUMANIX_PDB
  ADMIN USER admin IDENTIFIED BY testpassword
  ROLES = (dba)
  FILE_NAME_CONVERT = (
      'C:\APP\USER\PRODUCT\21C\ORADATA\XE\PDBSEED\',
      'C:\Humanix\Files\PDB\'
  );
--ALTER PLUGGABLE DATABASE HUMANIX_PDB OPEN; -- sqlplus (dba)

ALTER SESSION SET "AUDIT_SYS_OPERATIONS" = TRUE;

-- Создание табличного пространства USERS_TBS
CREATE TABLESPACE USERS_TBS
DATAFILE 'users_tbs.dat'
SIZE 100M
AUTOEXTEND ON;

-- Создание табличного пространства TEMP_TBS
CREATE TEMPORARY TABLESPACE TEMP_TBS
TEMPFILE 'temp_tbs.dat'
SIZE 50M
AUTOEXTEND ON;

ALTER USER admin default tablespace USERS_TBS;
ALTER USER admin QUOTA UNLIMITED ON USERS_TBS;


-- Создание профиля для пользователя
CREATE PROFILE user_profile LIMIT
  FAILED_LOGIN_ATTEMPTS 5
  SESSIONS_PER_USER   10
  CPU_PER_SESSION     UNLIMITED
  CPU_PER_CALL        3000
  CONNECT_TIME        45
  IDLE_TIME           15
  LOGICAL_READS_PER_SESSION DEFAULT
  LOGICAL_READS_PER_CALL    DEFAULT
  PRIVATE_SGA        15K
  COMPOSITE_LIMIT    5000000;

-- Создание профиля для администратора
CREATE PROFILE admin_profile LIMIT
  SESSIONS_PER_USER   UNLIMITED
  CPU_PER_SESSION     UNLIMITED
  CPU_PER_CALL        UNLIMITED
  CONNECT_TIME        UNLIMITED
  IDLE_TIME           UNLIMITED
  LOGICAL_READS_PER_SESSION DEFAULT
  LOGICAL_READS_PER_CALL    DEFAULT
  PRIVATE_SGA        UNLIMITED
  COMPOSITE_LIMIT    UNLIMITED;

-- Создание роли для пользователя
CREATE ROLE user_role;

-- Назначение привилегий для роли пользователя
GRANT SELECT ON jobs        TO user_role;
GRANT SELECT ON departments TO user_role;
GRANT SELECT ON locations   TO user_role;
GRANT SELECT ON countries   TO user_role;
GRANT SELECT ON projects    TO user_role;
GRANT SELECT ON tasks       TO user_role;
GRANT SELECT ON participation TO user_role;
GRANT SELECT ON employees   TO user_role;

-- Создание роли для администратора
CREATE ROLE admin_role;

-- Назначение привилегий для роли администратора
GRANT ALL PRIVILEGES ON jobs TO admin_role;
GRANT ALL PRIVILEGES ON departments TO admin_role;
GRANT ALL PRIVILEGES ON locations TO admin_role;
GRANT ALL PRIVILEGES ON countries TO admin_role;
GRANT ALL PRIVILEGES ON projects TO admin_role;
GRANT ALL PRIVILEGES ON tasks TO admin_role;
GRANT ALL PRIVILEGES ON participation TO admin_role;
GRANT ALL PRIVILEGES ON employees TO admin_role;



-- Создание пользователя с ролью пользователя и профилем пользователя
CREATE USER user_user IDENTIFIED BY user_password
    DEFAULT TABLESPACE USERS_TBS
    TEMPORARY TABLESPACE TEMP_TBS
    PROFILE user_profile;

GRANT CONNECT, RESOURCE, user_role TO user_user;

-- Создание пользователя с ролью администратора и профилем администратора
CREATE USER admin_user IDENTIFIED BY admin_password
    DEFAULT TABLESPACE USERS_TBS
    TEMPORARY TABLESPACE TEMP_TBS
    PROFILE admin_profile;

GRANT CONNECT, RESOURCE, DBA, admin_role TO admin_user;


GRANT EXECUTE ON insert_into_employees TO admin_user;
GRANT EXECUTE ON insert_into_jobs TO admin_user;
GRANT EXECUTE ON insert_into_departments TO admin_user;
GRANT EXECUTE ON insert_into_locations TO admin_user;
GRANT EXECUTE ON insert_into_countries TO admin_user;
GRANT EXECUTE ON insert_into_projects TO admin_user;
GRANT EXECUTE ON insert_into_vacations TO admin_user;
GRANT EXECUTE ON insert_into_tasks TO admin_user;
GRANT EXECUTE ON insert_into_participation TO admin_user;

GRANT EXECUTE ON update_employees TO admin_user;
GRANT EXECUTE ON update_jobs TO admin_user;
GRANT EXECUTE ON update_departments TO admin_user;
GRANT EXECUTE ON update_locations TO admin_user;
GRANT EXECUTE ON update_countries TO admin_user;
GRANT EXECUTE ON update_projects TO admin_user;
GRANT EXECUTE ON update_vacations TO admin_user;
GRANT EXECUTE ON update_tasks TO admin_user;
GRANT EXECUTE ON update_participation TO admin_user;

GRANT EXECUTE ON delete_from_employees TO admin_user;
GRANT EXECUTE ON delete_from_jobs TO admin_user;
GRANT EXECUTE ON delete_from_departments TO admin_user;
GRANT EXECUTE ON delete_from_locations TO admin_user;
GRANT EXECUTE ON delete_from_countries TO admin_user;
GRANT EXECUTE ON delete_from_projects TO admin_user;
GRANT EXECUTE ON delete_from_vacations TO admin_user;
GRANT EXECUTE ON delete_from_tasks TO admin_user;
GRANT EXECUTE ON delete_from_participation TO admin_user;

GRANT EXECUTE ON fire_employee TO admin_user;
GRANT EXECUTE ON promote_employee TO admin_user;
GRANT EXECUTE ON hire_employee TO admin_user;
GRANT EXECUTE ON EXPORT_JSON TO admin_user;
GRANT EXECUTE ON IMPORT_JSON TO admin_user;
GRANT EXECUTE ON ENCRYPT TO admin_user;
GRANT EXECUTE ON DECRYPT TO admin_user;

COMMIT;

DROP TABLESPACE USERS_TBS INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE TEMP_TBS INCLUDING CONTENTS AND DATAFILES;