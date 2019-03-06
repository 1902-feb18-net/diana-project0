using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class Locations
    {
        public Locations()
        {
            Inventory = new HashSet<Inventory>();
            StoreOrderHistory = new HashSet<StoreOrderHistory>();
        }

        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int InventoryId { get; set; }
        public int? OrderHistoryId { get; set; }

        public virtual StoreOrderHistory OrderHistory { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<StoreOrderHistory> StoreOrderHistory { get; set; }
    }
}
