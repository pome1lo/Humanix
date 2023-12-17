using System.Collections.Generic;
using WPF.Desktop.UI.Database.Entity_Data_Model.Admin_Admin;

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

        #endregion
    }
}