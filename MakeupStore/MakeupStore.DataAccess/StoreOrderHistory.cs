using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class StoreOrderHistory
    {
        public StoreOrderHistory()
        {
            Locations = new HashSet<Locations>();
        }

        public int HistoryId { get; set; }
        public int LocationId { get; set; }
        public int OrderId { get; set; }

        public virtual Locations Location { get; set; }
        public virtual OrderHistory Order { get; set; }
        public virtual ICollection<Locations> Locations { get; set; }
    }
}
