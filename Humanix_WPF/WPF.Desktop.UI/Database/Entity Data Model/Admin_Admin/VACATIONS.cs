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
    
    public partial class VACATIONS
    {
        public int VACATION_ID { get; set; }
        public string EMP_EMAIL { get; set; }
        public System.DateTime START_DATE { get; set; }
        public System.DateTime END_DATE { get; set; }
        public string REASON { get; set; }
    
        public virtual EMPLOYEES EMPLOYEES { get; set; }
    }
}
