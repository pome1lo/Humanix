//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin
{
    using System;
    using System.Collections.Generic;
    
    public partial class DEPARTMENTS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DEPARTMENTS()
        {
            this.EMPLOYEES = new HashSet<EMPLOYEES>();
            this.PROJECTS = new HashSet<PROJECTS>();
        }
    
        public short DEPARTMENT_ID { get; set; }
        public string DEPARTMENT_NAME { get; set; }
        public Nullable<int> MANAGER_ID { get; set; }
        public Nullable<short> LOCATION_ID { get; set; }
    
        public virtual LOCATIONS LOCATIONS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EMPLOYEES> EMPLOYEES { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PROJECTS> PROJECTS { get; set; }
    }
}