using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class OrderHistory
    {
        public OrderHistory()
        {
            StoreOrderHistory = new HashSet<StoreOrderHistory>();
        }

        public int HistoryId { get; set; }
        public int OrderId { get; set; }
        public int? CustomerId { get; set; }
        public float Total { get; set; }

        public virtual Orders Order { get; set; }
        public virtual ICollection<StoreOrderHistory> StoreOrderHistory { get; set; }
    }
}
