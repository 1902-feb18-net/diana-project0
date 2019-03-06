using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class InventoryItem
    {
        public InventoryItem()
        {
            Inventory = new HashSet<Inventory>();
            Orders = new HashSet<Orders>();
        }

        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public bool IfLimitedEdition { get; set; }
        public float Price { get; set; }

        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
