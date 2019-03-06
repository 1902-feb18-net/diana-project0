using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class Orders
    {
        public Orders()
        {
            OrderHistory = new HashSet<OrderHistory>();
        }

        public int OrderId { get; set; }
        public string LocationName { get; set; }
        public int? CustomerId { get; set; }
        public DateTime? OrderTime { get; set; }
        public int? ItemId { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual InventoryItem Item { get; set; }
        public virtual ICollection<OrderHistory> OrderHistory { get; set; }
    }
}
