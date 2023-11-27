﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WPF.Desktop.UI.Database.Entity_Data_Model.Admin
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MainAdminEntity : DbContext
    {
        public MainAdminEntity()
            : base("name=MainAdminEntity")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<COUNTRIES> COUNTRIES { get; set; }
        public virtual DbSet<DEPARTMENTS> DEPARTMENTS { get; set; }
        public virtual DbSet<EMPLOYEES> EMPLOYEES { get; set; }
        public virtual DbSet<JOBS> JOBS { get; set; }
        public virtual DbSet<LOCATIONS> LOCATIONS { get; set; }
        public virtual DbSet<PARTICIPATION> PARTICIPATION { get; set; }
        public virtual DbSet<PROJECTS> PROJECTS { get; set; }
        public virtual DbSet<TASKS> TASKS { get; set; }
        public virtual DbSet<VACATIONS> VACATIONS { get; set; }
    
        public virtual int DELETE_FROM_COUNTRIES(string p_COUNTRY_ID)
        {
            var p_COUNTRY_IDParameter = p_COUNTRY_ID != null ?
                new ObjectParameter("P_COUNTRY_ID", p_COUNTRY_ID) :
                new ObjectParameter("P_COUNTRY_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_COUNTRIES", p_COUNTRY_IDParameter);
        }
    
        public virtual int DELETE_FROM_DEPARTMENTS(Nullable<decimal> p_DEPARTMENT_ID)
        {
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_DEPARTMENTS", p_DEPARTMENT_IDParameter);
        }
    
        public virtual int DELETE_FROM_EMPLOYEES(Nullable<decimal> p_EMP_ID)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_EMPLOYEES", p_EMP_IDParameter);
        }
    
        public virtual int DELETE_FROM_JOBS(string p_JOB_ID)
        {
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_JOBS", p_JOB_IDParameter);
        }
    
        public virtual int DELETE_FROM_LOCATIONS(Nullable<decimal> p_LOCATION_ID)
        {
            var p_LOCATION_IDParameter = p_LOCATION_ID.HasValue ?
                new ObjectParameter("P_LOCATION_ID", p_LOCATION_ID) :
                new ObjectParameter("P_LOCATION_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_LOCATIONS", p_LOCATION_IDParameter);
        }
    
        public virtual int DELETE_FROM_PARTICIPATION(Nullable<decimal> p_EMP_ID, Nullable<decimal> p_PROJECT_ID)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_PARTICIPATION", p_EMP_IDParameter, p_PROJECT_IDParameter);
        }
    
        public virtual int DELETE_FROM_PROJECTS(Nullable<decimal> p_PROJECT_ID)
        {
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_PROJECTS", p_PROJECT_IDParameter);
        }
    
        public virtual int DELETE_FROM_TASKS(Nullable<decimal> p_TASK_ID)
        {
            var p_TASK_IDParameter = p_TASK_ID.HasValue ?
                new ObjectParameter("P_TASK_ID", p_TASK_ID) :
                new ObjectParameter("P_TASK_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_TASKS", p_TASK_IDParameter);
        }
    
        public virtual int DELETE_FROM_VACATIONS(Nullable<decimal> p_VACATION_ID)
        {
            var p_VACATION_IDParameter = p_VACATION_ID.HasValue ?
                new ObjectParameter("P_VACATION_ID", p_VACATION_ID) :
                new ObjectParameter("P_VACATION_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETE_FROM_VACATIONS", p_VACATION_IDParameter);
        }
    
        public virtual int EXPORT_JSON()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXPORT_JSON");
        }
    
        public virtual int FIRE_EMPLOYEE(Nullable<decimal> p_EMP_ID)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("FIRE_EMPLOYEE", p_EMP_IDParameter);
        }
    
        public virtual int HIRE_EMPLOYEE(string p_FIRST_NAME, string p_LAST_NAME, string p_EMAIL, string p_PHONE_NUMBER, Nullable<System.DateTime> p_HIRE_DATE, string p_JOB_ID, Nullable<decimal> p_SALARY, Nullable<decimal> p_COMMISSION_PCT, Nullable<decimal> p_MANAGER_ID, Nullable<decimal> p_DEPARTMENT_ID, string p_PASSWORD_HASH)
        {
            var p_FIRST_NAMEParameter = p_FIRST_NAME != null ?
                new ObjectParameter("P_FIRST_NAME", p_FIRST_NAME) :
                new ObjectParameter("P_FIRST_NAME", typeof(string));
    
            var p_LAST_NAMEParameter = p_LAST_NAME != null ?
                new ObjectParameter("P_LAST_NAME", p_LAST_NAME) :
                new ObjectParameter("P_LAST_NAME", typeof(string));
    
            var p_EMAILParameter = p_EMAIL != null ?
                new ObjectParameter("P_EMAIL", p_EMAIL) :
                new ObjectParameter("P_EMAIL", typeof(string));
    
            var p_PHONE_NUMBERParameter = p_PHONE_NUMBER != null ?
                new ObjectParameter("P_PHONE_NUMBER", p_PHONE_NUMBER) :
                new ObjectParameter("P_PHONE_NUMBER", typeof(string));
    
            var p_HIRE_DATEParameter = p_HIRE_DATE.HasValue ?
                new ObjectParameter("P_HIRE_DATE", p_HIRE_DATE) :
                new ObjectParameter("P_HIRE_DATE", typeof(System.DateTime));
    
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            var p_SALARYParameter = p_SALARY.HasValue ?
                new ObjectParameter("P_SALARY", p_SALARY) :
                new ObjectParameter("P_SALARY", typeof(decimal));
    
            var p_COMMISSION_PCTParameter = p_COMMISSION_PCT.HasValue ?
                new ObjectParameter("P_COMMISSION_PCT", p_COMMISSION_PCT) :
                new ObjectParameter("P_COMMISSION_PCT", typeof(decimal));
    
            var p_MANAGER_IDParameter = p_MANAGER_ID.HasValue ?
                new ObjectParameter("P_MANAGER_ID", p_MANAGER_ID) :
                new ObjectParameter("P_MANAGER_ID", typeof(decimal));
    
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            var p_PASSWORD_HASHParameter = p_PASSWORD_HASH != null ?
                new ObjectParameter("P_PASSWORD_HASH", p_PASSWORD_HASH) :
                new ObjectParameter("P_PASSWORD_HASH", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("HIRE_EMPLOYEE", p_FIRST_NAMEParameter, p_LAST_NAMEParameter, p_EMAILParameter, p_PHONE_NUMBERParameter, p_HIRE_DATEParameter, p_JOB_IDParameter, p_SALARYParameter, p_COMMISSION_PCTParameter, p_MANAGER_IDParameter, p_DEPARTMENT_IDParameter, p_PASSWORD_HASHParameter);
        }
    
        public virtual int IMPORT_JSON()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("IMPORT_JSON");
        }
    
        public virtual int INSERT_INTO_COUNTRIES(string p_COUNTRY_ID, string p_COUNTRY_NAME)
        {
            var p_COUNTRY_IDParameter = p_COUNTRY_ID != null ?
                new ObjectParameter("P_COUNTRY_ID", p_COUNTRY_ID) :
                new ObjectParameter("P_COUNTRY_ID", typeof(string));
    
            var p_COUNTRY_NAMEParameter = p_COUNTRY_NAME != null ?
                new ObjectParameter("P_COUNTRY_NAME", p_COUNTRY_NAME) :
                new ObjectParameter("P_COUNTRY_NAME", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_COUNTRIES", p_COUNTRY_IDParameter, p_COUNTRY_NAMEParameter);
        }
    
        public virtual int INSERT_INTO_DEPARTMENTS(Nullable<decimal> p_DEPARTMENT_ID, string p_DEPARTMENT_NAME, Nullable<decimal> p_MANAGER_ID, Nullable<decimal> p_LOCATION_ID)
        {
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            var p_DEPARTMENT_NAMEParameter = p_DEPARTMENT_NAME != null ?
                new ObjectParameter("P_DEPARTMENT_NAME", p_DEPARTMENT_NAME) :
                new ObjectParameter("P_DEPARTMENT_NAME", typeof(string));
    
            var p_MANAGER_IDParameter = p_MANAGER_ID.HasValue ?
                new ObjectParameter("P_MANAGER_ID", p_MANAGER_ID) :
                new ObjectParameter("P_MANAGER_ID", typeof(decimal));
    
            var p_LOCATION_IDParameter = p_LOCATION_ID.HasValue ?
                new ObjectParameter("P_LOCATION_ID", p_LOCATION_ID) :
                new ObjectParameter("P_LOCATION_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_DEPARTMENTS", p_DEPARTMENT_IDParameter, p_DEPARTMENT_NAMEParameter, p_MANAGER_IDParameter, p_LOCATION_IDParameter);
        }
    
        public virtual int INSERT_INTO_EMPLOYEES(string p_FIRST_NAME, string p_LAST_NAME, string p_EMAIL, string p_PHONE_NUMBER, Nullable<System.DateTime> p_HIRE_DATE, string p_JOB_ID, Nullable<decimal> p_SALARY, Nullable<decimal> p_COMMISSION_PCT, Nullable<decimal> p_MANAGER_ID, Nullable<decimal> p_DEPARTMENT_ID, string p_PASSWORD_HASH)
        {
            var p_FIRST_NAMEParameter = p_FIRST_NAME != null ?
                new ObjectParameter("P_FIRST_NAME", p_FIRST_NAME) :
                new ObjectParameter("P_FIRST_NAME", typeof(string));
    
            var p_LAST_NAMEParameter = p_LAST_NAME != null ?
                new ObjectParameter("P_LAST_NAME", p_LAST_NAME) :
                new ObjectParameter("P_LAST_NAME", typeof(string));
    
            var p_EMAILParameter = p_EMAIL != null ?
                new ObjectParameter("P_EMAIL", p_EMAIL) :
                new ObjectParameter("P_EMAIL", typeof(string));
    
            var p_PHONE_NUMBERParameter = p_PHONE_NUMBER != null ?
                new ObjectParameter("P_PHONE_NUMBER", p_PHONE_NUMBER) :
                new ObjectParameter("P_PHONE_NUMBER", typeof(string));
    
            var p_HIRE_DATEParameter = p_HIRE_DATE.HasValue ?
                new ObjectParameter("P_HIRE_DATE", p_HIRE_DATE) :
                new ObjectParameter("P_HIRE_DATE", typeof(System.DateTime));
    
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            var p_SALARYParameter = p_SALARY.HasValue ?
                new ObjectParameter("P_SALARY", p_SALARY) :
                new ObjectParameter("P_SALARY", typeof(decimal));
    
            var p_COMMISSION_PCTParameter = p_COMMISSION_PCT.HasValue ?
                new ObjectParameter("P_COMMISSION_PCT", p_COMMISSION_PCT) :
                new ObjectParameter("P_COMMISSION_PCT", typeof(decimal));
    
            var p_MANAGER_IDParameter = p_MANAGER_ID.HasValue ?
                new ObjectParameter("P_MANAGER_ID", p_MANAGER_ID) :
                new ObjectParameter("P_MANAGER_ID", typeof(decimal));
    
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            var p_PASSWORD_HASHParameter = p_PASSWORD_HASH != null ?
                new ObjectParameter("P_PASSWORD_HASH", p_PASSWORD_HASH) :
                new ObjectParameter("P_PASSWORD_HASH", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_EMPLOYEES", p_FIRST_NAMEParameter, p_LAST_NAMEParameter, p_EMAILParameter, p_PHONE_NUMBERParameter, p_HIRE_DATEParameter, p_JOB_IDParameter, p_SALARYParameter, p_COMMISSION_PCTParameter, p_MANAGER_IDParameter, p_DEPARTMENT_IDParameter, p_PASSWORD_HASHParameter);
        }
    
        public virtual int INSERT_INTO_JOBS(string p_JOB_ID, string p_JOB_TITLE, Nullable<decimal> p_MIN_SALARY, Nullable<decimal> p_MAX_SALARY)
        {
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            var p_JOB_TITLEParameter = p_JOB_TITLE != null ?
                new ObjectParameter("P_JOB_TITLE", p_JOB_TITLE) :
                new ObjectParameter("P_JOB_TITLE", typeof(string));
    
            var p_MIN_SALARYParameter = p_MIN_SALARY.HasValue ?
                new ObjectParameter("P_MIN_SALARY", p_MIN_SALARY) :
                new ObjectParameter("P_MIN_SALARY", typeof(decimal));
    
            var p_MAX_SALARYParameter = p_MAX_SALARY.HasValue ?
                new ObjectParameter("P_MAX_SALARY", p_MAX_SALARY) :
                new ObjectParameter("P_MAX_SALARY", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_JOBS", p_JOB_IDParameter, p_JOB_TITLEParameter, p_MIN_SALARYParameter, p_MAX_SALARYParameter);
        }
    
        public virtual int INSERT_INTO_LOCATIONS(Nullable<decimal> p_LOCATION_ID, string p_STREET_ADDRESS, string p_POSTAL_CODE, string p_CITY, string p_STATE_PROVINCE, string p_COUNTRY_ID)
        {
            var p_LOCATION_IDParameter = p_LOCATION_ID.HasValue ?
                new ObjectParameter("P_LOCATION_ID", p_LOCATION_ID) :
                new ObjectParameter("P_LOCATION_ID", typeof(decimal));
    
            var p_STREET_ADDRESSParameter = p_STREET_ADDRESS != null ?
                new ObjectParameter("P_STREET_ADDRESS", p_STREET_ADDRESS) :
                new ObjectParameter("P_STREET_ADDRESS", typeof(string));
    
            var p_POSTAL_CODEParameter = p_POSTAL_CODE != null ?
                new ObjectParameter("P_POSTAL_CODE", p_POSTAL_CODE) :
                new ObjectParameter("P_POSTAL_CODE", typeof(string));
    
            var p_CITYParameter = p_CITY != null ?
                new ObjectParameter("P_CITY", p_CITY) :
                new ObjectParameter("P_CITY", typeof(string));
    
            var p_STATE_PROVINCEParameter = p_STATE_PROVINCE != null ?
                new ObjectParameter("P_STATE_PROVINCE", p_STATE_PROVINCE) :
                new ObjectParameter("P_STATE_PROVINCE", typeof(string));
    
            var p_COUNTRY_IDParameter = p_COUNTRY_ID != null ?
                new ObjectParameter("P_COUNTRY_ID", p_COUNTRY_ID) :
                new ObjectParameter("P_COUNTRY_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_LOCATIONS", p_LOCATION_IDParameter, p_STREET_ADDRESSParameter, p_POSTAL_CODEParameter, p_CITYParameter, p_STATE_PROVINCEParameter, p_COUNTRY_IDParameter);
        }
    
        public virtual int INSERT_INTO_PARTICIPATION(Nullable<decimal> p_EMP_ID, Nullable<decimal> p_PROJECT_ID, string p_ROLE, Nullable<decimal> p_HOURS)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            var p_ROLEParameter = p_ROLE != null ?
                new ObjectParameter("P_ROLE", p_ROLE) :
                new ObjectParameter("P_ROLE", typeof(string));
    
            var p_HOURSParameter = p_HOURS.HasValue ?
                new ObjectParameter("P_HOURS", p_HOURS) :
                new ObjectParameter("P_HOURS", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_PARTICIPATION", p_EMP_IDParameter, p_PROJECT_IDParameter, p_ROLEParameter, p_HOURSParameter);
        }
    
        public virtual int INSERT_INTO_PROJECTS(Nullable<decimal> p_PROJECT_ID, string p_PROJECT_NAME, Nullable<System.DateTime> p_START_DATE, Nullable<System.DateTime> p_END_DATE, Nullable<decimal> p_BUDGET, Nullable<decimal> p_DEPARTMENT_ID)
        {
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            var p_PROJECT_NAMEParameter = p_PROJECT_NAME != null ?
                new ObjectParameter("P_PROJECT_NAME", p_PROJECT_NAME) :
                new ObjectParameter("P_PROJECT_NAME", typeof(string));
    
            var p_START_DATEParameter = p_START_DATE.HasValue ?
                new ObjectParameter("P_START_DATE", p_START_DATE) :
                new ObjectParameter("P_START_DATE", typeof(System.DateTime));
    
            var p_END_DATEParameter = p_END_DATE.HasValue ?
                new ObjectParameter("P_END_DATE", p_END_DATE) :
                new ObjectParameter("P_END_DATE", typeof(System.DateTime));
    
            var p_BUDGETParameter = p_BUDGET.HasValue ?
                new ObjectParameter("P_BUDGET", p_BUDGET) :
                new ObjectParameter("P_BUDGET", typeof(decimal));
    
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_PROJECTS", p_PROJECT_IDParameter, p_PROJECT_NAMEParameter, p_START_DATEParameter, p_END_DATEParameter, p_BUDGETParameter, p_DEPARTMENT_IDParameter);
        }
    
        public virtual int INSERT_INTO_TASKS(Nullable<decimal> p_TASK_ID, string p_TASK_NAME, string p_DESCRIPTION, Nullable<decimal> p_DURATION, Nullable<decimal> p_PROJECT_ID)
        {
            var p_TASK_IDParameter = p_TASK_ID.HasValue ?
                new ObjectParameter("P_TASK_ID", p_TASK_ID) :
                new ObjectParameter("P_TASK_ID", typeof(decimal));
    
            var p_TASK_NAMEParameter = p_TASK_NAME != null ?
                new ObjectParameter("P_TASK_NAME", p_TASK_NAME) :
                new ObjectParameter("P_TASK_NAME", typeof(string));
    
            var p_DESCRIPTIONParameter = p_DESCRIPTION != null ?
                new ObjectParameter("P_DESCRIPTION", p_DESCRIPTION) :
                new ObjectParameter("P_DESCRIPTION", typeof(string));
    
            var p_DURATIONParameter = p_DURATION.HasValue ?
                new ObjectParameter("P_DURATION", p_DURATION) :
                new ObjectParameter("P_DURATION", typeof(decimal));
    
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_TASKS", p_TASK_IDParameter, p_TASK_NAMEParameter, p_DESCRIPTIONParameter, p_DURATIONParameter, p_PROJECT_IDParameter);
        }
    
        public virtual int INSERT_INTO_VACATIONS(Nullable<decimal> p_VACATION_ID, Nullable<decimal> p_EMP_ID, Nullable<System.DateTime> p_START_DATE, Nullable<System.DateTime> p_END_DATE, string p_REASON)
        {
            var p_VACATION_IDParameter = p_VACATION_ID.HasValue ?
                new ObjectParameter("P_VACATION_ID", p_VACATION_ID) :
                new ObjectParameter("P_VACATION_ID", typeof(decimal));
    
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_START_DATEParameter = p_START_DATE.HasValue ?
                new ObjectParameter("P_START_DATE", p_START_DATE) :
                new ObjectParameter("P_START_DATE", typeof(System.DateTime));
    
            var p_END_DATEParameter = p_END_DATE.HasValue ?
                new ObjectParameter("P_END_DATE", p_END_DATE) :
                new ObjectParameter("P_END_DATE", typeof(System.DateTime));
    
            var p_REASONParameter = p_REASON != null ?
                new ObjectParameter("P_REASON", p_REASON) :
                new ObjectParameter("P_REASON", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("INSERT_INTO_VACATIONS", p_VACATION_IDParameter, p_EMP_IDParameter, p_START_DATEParameter, p_END_DATEParameter, p_REASONParameter);
        }
    
        public virtual int PROMOTE_EMPLOYEE(Nullable<decimal> p_EMP_ID, string p_NEW_JOB_ID)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_NEW_JOB_IDParameter = p_NEW_JOB_ID != null ?
                new ObjectParameter("P_NEW_JOB_ID", p_NEW_JOB_ID) :
                new ObjectParameter("P_NEW_JOB_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("PROMOTE_EMPLOYEE", p_EMP_IDParameter, p_NEW_JOB_IDParameter);
        }
    
        public virtual int UPDATE_COUNTRIES(string p_COUNTRY_ID, string p_COUNTRY_NAME)
        {
            var p_COUNTRY_IDParameter = p_COUNTRY_ID != null ?
                new ObjectParameter("P_COUNTRY_ID", p_COUNTRY_ID) :
                new ObjectParameter("P_COUNTRY_ID", typeof(string));
    
            var p_COUNTRY_NAMEParameter = p_COUNTRY_NAME != null ?
                new ObjectParameter("P_COUNTRY_NAME", p_COUNTRY_NAME) :
                new ObjectParameter("P_COUNTRY_NAME", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_COUNTRIES", p_COUNTRY_IDParameter, p_COUNTRY_NAMEParameter);
        }
    
        public virtual int UPDATE_DEPARTMENTS(Nullable<decimal> p_DEPARTMENT_ID, string p_DEPARTMENT_NAME, Nullable<decimal> p_MANAGER_ID, Nullable<decimal> p_LOCATION_ID)
        {
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            var p_DEPARTMENT_NAMEParameter = p_DEPARTMENT_NAME != null ?
                new ObjectParameter("P_DEPARTMENT_NAME", p_DEPARTMENT_NAME) :
                new ObjectParameter("P_DEPARTMENT_NAME", typeof(string));
    
            var p_MANAGER_IDParameter = p_MANAGER_ID.HasValue ?
                new ObjectParameter("P_MANAGER_ID", p_MANAGER_ID) :
                new ObjectParameter("P_MANAGER_ID", typeof(decimal));
    
            var p_LOCATION_IDParameter = p_LOCATION_ID.HasValue ?
                new ObjectParameter("P_LOCATION_ID", p_LOCATION_ID) :
                new ObjectParameter("P_LOCATION_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_DEPARTMENTS", p_DEPARTMENT_IDParameter, p_DEPARTMENT_NAMEParameter, p_MANAGER_IDParameter, p_LOCATION_IDParameter);
        }
    
        public virtual int UPDATE_EMPLOYEES(Nullable<decimal> p_EMP_ID, string p_FIRST_NAME, string p_LAST_NAME, string p_EMAIL, string p_PHONE_NUMBER, Nullable<System.DateTime> p_HIRE_DATE, string p_JOB_ID, Nullable<decimal> p_SALARY, Nullable<decimal> p_COMMISSION_PCT, Nullable<decimal> p_MANAGER_ID, Nullable<decimal> p_DEPARTMENT_ID)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_FIRST_NAMEParameter = p_FIRST_NAME != null ?
                new ObjectParameter("P_FIRST_NAME", p_FIRST_NAME) :
                new ObjectParameter("P_FIRST_NAME", typeof(string));
    
            var p_LAST_NAMEParameter = p_LAST_NAME != null ?
                new ObjectParameter("P_LAST_NAME", p_LAST_NAME) :
                new ObjectParameter("P_LAST_NAME", typeof(string));
    
            var p_EMAILParameter = p_EMAIL != null ?
                new ObjectParameter("P_EMAIL", p_EMAIL) :
                new ObjectParameter("P_EMAIL", typeof(string));
    
            var p_PHONE_NUMBERParameter = p_PHONE_NUMBER != null ?
                new ObjectParameter("P_PHONE_NUMBER", p_PHONE_NUMBER) :
                new ObjectParameter("P_PHONE_NUMBER", typeof(string));
    
            var p_HIRE_DATEParameter = p_HIRE_DATE.HasValue ?
                new ObjectParameter("P_HIRE_DATE", p_HIRE_DATE) :
                new ObjectParameter("P_HIRE_DATE", typeof(System.DateTime));
    
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            var p_SALARYParameter = p_SALARY.HasValue ?
                new ObjectParameter("P_SALARY", p_SALARY) :
                new ObjectParameter("P_SALARY", typeof(decimal));
    
            var p_COMMISSION_PCTParameter = p_COMMISSION_PCT.HasValue ?
                new ObjectParameter("P_COMMISSION_PCT", p_COMMISSION_PCT) :
                new ObjectParameter("P_COMMISSION_PCT", typeof(decimal));
    
            var p_MANAGER_IDParameter = p_MANAGER_ID.HasValue ?
                new ObjectParameter("P_MANAGER_ID", p_MANAGER_ID) :
                new ObjectParameter("P_MANAGER_ID", typeof(decimal));
    
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_EMPLOYEES", p_EMP_IDParameter, p_FIRST_NAMEParameter, p_LAST_NAMEParameter, p_EMAILParameter, p_PHONE_NUMBERParameter, p_HIRE_DATEParameter, p_JOB_IDParameter, p_SALARYParameter, p_COMMISSION_PCTParameter, p_MANAGER_IDParameter, p_DEPARTMENT_IDParameter);
        }
    
        public virtual int UPDATE_JOBS(string p_JOB_ID, string p_JOB_TITLE, Nullable<decimal> p_MIN_SALARY, Nullable<decimal> p_MAX_SALARY)
        {
            var p_JOB_IDParameter = p_JOB_ID != null ?
                new ObjectParameter("P_JOB_ID", p_JOB_ID) :
                new ObjectParameter("P_JOB_ID", typeof(string));
    
            var p_JOB_TITLEParameter = p_JOB_TITLE != null ?
                new ObjectParameter("P_JOB_TITLE", p_JOB_TITLE) :
                new ObjectParameter("P_JOB_TITLE", typeof(string));
    
            var p_MIN_SALARYParameter = p_MIN_SALARY.HasValue ?
                new ObjectParameter("P_MIN_SALARY", p_MIN_SALARY) :
                new ObjectParameter("P_MIN_SALARY", typeof(decimal));
    
            var p_MAX_SALARYParameter = p_MAX_SALARY.HasValue ?
                new ObjectParameter("P_MAX_SALARY", p_MAX_SALARY) :
                new ObjectParameter("P_MAX_SALARY", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_JOBS", p_JOB_IDParameter, p_JOB_TITLEParameter, p_MIN_SALARYParameter, p_MAX_SALARYParameter);
        }
    
        public virtual int UPDATE_LOCATIONS(Nullable<decimal> p_LOCATION_ID, string p_STREET_ADDRESS, string p_POSTAL_CODE, string p_CITY, string p_STATE_PROVINCE, string p_COUNTRY_ID)
        {
            var p_LOCATION_IDParameter = p_LOCATION_ID.HasValue ?
                new ObjectParameter("P_LOCATION_ID", p_LOCATION_ID) :
                new ObjectParameter("P_LOCATION_ID", typeof(decimal));
    
            var p_STREET_ADDRESSParameter = p_STREET_ADDRESS != null ?
                new ObjectParameter("P_STREET_ADDRESS", p_STREET_ADDRESS) :
                new ObjectParameter("P_STREET_ADDRESS", typeof(string));
    
            var p_POSTAL_CODEParameter = p_POSTAL_CODE != null ?
                new ObjectParameter("P_POSTAL_CODE", p_POSTAL_CODE) :
                new ObjectParameter("P_POSTAL_CODE", typeof(string));
    
            var p_CITYParameter = p_CITY != null ?
                new ObjectParameter("P_CITY", p_CITY) :
                new ObjectParameter("P_CITY", typeof(string));
    
            var p_STATE_PROVINCEParameter = p_STATE_PROVINCE != null ?
                new ObjectParameter("P_STATE_PROVINCE", p_STATE_PROVINCE) :
                new ObjectParameter("P_STATE_PROVINCE", typeof(string));
    
            var p_COUNTRY_IDParameter = p_COUNTRY_ID != null ?
                new ObjectParameter("P_COUNTRY_ID", p_COUNTRY_ID) :
                new ObjectParameter("P_COUNTRY_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_LOCATIONS", p_LOCATION_IDParameter, p_STREET_ADDRESSParameter, p_POSTAL_CODEParameter, p_CITYParameter, p_STATE_PROVINCEParameter, p_COUNTRY_IDParameter);
        }
    
        public virtual int UPDATE_PARTICIPATION(Nullable<decimal> p_EMP_ID, Nullable<decimal> p_PROJECT_ID, string p_ROLE, Nullable<decimal> p_HOURS)
        {
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            var p_ROLEParameter = p_ROLE != null ?
                new ObjectParameter("P_ROLE", p_ROLE) :
                new ObjectParameter("P_ROLE", typeof(string));
    
            var p_HOURSParameter = p_HOURS.HasValue ?
                new ObjectParameter("P_HOURS", p_HOURS) :
                new ObjectParameter("P_HOURS", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_PARTICIPATION", p_EMP_IDParameter, p_PROJECT_IDParameter, p_ROLEParameter, p_HOURSParameter);
        }
    
        public virtual int UPDATE_PROJECTS(Nullable<decimal> p_PROJECT_ID, string p_PROJECT_NAME, Nullable<System.DateTime> p_START_DATE, Nullable<System.DateTime> p_END_DATE, Nullable<decimal> p_BUDGET, Nullable<decimal> p_DEPARTMENT_ID)
        {
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            var p_PROJECT_NAMEParameter = p_PROJECT_NAME != null ?
                new ObjectParameter("P_PROJECT_NAME", p_PROJECT_NAME) :
                new ObjectParameter("P_PROJECT_NAME", typeof(string));
    
            var p_START_DATEParameter = p_START_DATE.HasValue ?
                new ObjectParameter("P_START_DATE", p_START_DATE) :
                new ObjectParameter("P_START_DATE", typeof(System.DateTime));
    
            var p_END_DATEParameter = p_END_DATE.HasValue ?
                new ObjectParameter("P_END_DATE", p_END_DATE) :
                new ObjectParameter("P_END_DATE", typeof(System.DateTime));
    
            var p_BUDGETParameter = p_BUDGET.HasValue ?
                new ObjectParameter("P_BUDGET", p_BUDGET) :
                new ObjectParameter("P_BUDGET", typeof(decimal));
    
            var p_DEPARTMENT_IDParameter = p_DEPARTMENT_ID.HasValue ?
                new ObjectParameter("P_DEPARTMENT_ID", p_DEPARTMENT_ID) :
                new ObjectParameter("P_DEPARTMENT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_PROJECTS", p_PROJECT_IDParameter, p_PROJECT_NAMEParameter, p_START_DATEParameter, p_END_DATEParameter, p_BUDGETParameter, p_DEPARTMENT_IDParameter);
        }
    
        public virtual int UPDATE_TASKS(Nullable<decimal> p_TASK_ID, string p_TASK_NAME, string p_DESCRIPTION, Nullable<decimal> p_DURATION, Nullable<decimal> p_PROJECT_ID)
        {
            var p_TASK_IDParameter = p_TASK_ID.HasValue ?
                new ObjectParameter("P_TASK_ID", p_TASK_ID) :
                new ObjectParameter("P_TASK_ID", typeof(decimal));
    
            var p_TASK_NAMEParameter = p_TASK_NAME != null ?
                new ObjectParameter("P_TASK_NAME", p_TASK_NAME) :
                new ObjectParameter("P_TASK_NAME", typeof(string));
    
            var p_DESCRIPTIONParameter = p_DESCRIPTION != null ?
                new ObjectParameter("P_DESCRIPTION", p_DESCRIPTION) :
                new ObjectParameter("P_DESCRIPTION", typeof(string));
    
            var p_DURATIONParameter = p_DURATION.HasValue ?
                new ObjectParameter("P_DURATION", p_DURATION) :
                new ObjectParameter("P_DURATION", typeof(decimal));
    
            var p_PROJECT_IDParameter = p_PROJECT_ID.HasValue ?
                new ObjectParameter("P_PROJECT_ID", p_PROJECT_ID) :
                new ObjectParameter("P_PROJECT_ID", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_TASKS", p_TASK_IDParameter, p_TASK_NAMEParameter, p_DESCRIPTIONParameter, p_DURATIONParameter, p_PROJECT_IDParameter);
        }
    
        public virtual int UPDATE_VACATIONS(Nullable<decimal> p_VACATION_ID, Nullable<decimal> p_EMP_ID, Nullable<System.DateTime> p_START_DATE, Nullable<System.DateTime> p_END_DATE, string p_REASON)
        {
            var p_VACATION_IDParameter = p_VACATION_ID.HasValue ?
                new ObjectParameter("P_VACATION_ID", p_VACATION_ID) :
                new ObjectParameter("P_VACATION_ID", typeof(decimal));
    
            var p_EMP_IDParameter = p_EMP_ID.HasValue ?
                new ObjectParameter("P_EMP_ID", p_EMP_ID) :
                new ObjectParameter("P_EMP_ID", typeof(decimal));
    
            var p_START_DATEParameter = p_START_DATE.HasValue ?
                new ObjectParameter("P_START_DATE", p_START_DATE) :
                new ObjectParameter("P_START_DATE", typeof(System.DateTime));
    
            var p_END_DATEParameter = p_END_DATE.HasValue ?
                new ObjectParameter("P_END_DATE", p_END_DATE) :
                new ObjectParameter("P_END_DATE", typeof(System.DateTime));
    
            var p_REASONParameter = p_REASON != null ?
                new ObjectParameter("P_REASON", p_REASON) :
                new ObjectParameter("P_REASON", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UPDATE_VACATIONS", p_VACATION_IDParameter, p_EMP_IDParameter, p_START_DATEParameter, p_END_DATEParameter, p_REASONParameter);
        }
    }
}