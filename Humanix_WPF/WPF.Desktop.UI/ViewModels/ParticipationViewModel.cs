using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;
using WPF.Desktop.UI.Database.Entity_Data_Model.User_User;

namespace WPF.Desktop.UI.ViewModels
{
    internal class ParticipationViewModel : ViewModelBase
    {
        #region Property
         
        public ICollection<PARTICIPATION> Participations
        {
            get => CurrentUser.PARTICIPATION;
            set
            {
                CurrentUser.PARTICIPATION = value;
                OnPropertyChanged(nameof(Participations));
            }
        }

        public ParticipationViewModel()
        {
            using (var context = new UserEntity())
            {
                 test = context.Database.SqlQuery<EMPLOYEES>("SELECT * FROM ADMIN.EMPLOYEES").ToList();
            }
        }

        private ICollection<EMPLOYEES> list = new List<EMPLOYEES>();

        public ICollection<EMPLOYEES> test
        {
            get => list;
            set
            {
                list = value;
                OnPropertyChanged(nameof(test));
            }
        }

        #endregion
    }
}