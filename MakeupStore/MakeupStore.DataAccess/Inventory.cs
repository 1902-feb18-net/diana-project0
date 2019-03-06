using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class Inventory
    {
        public int InventoryId { get; set; }
        public int ItemId { get; set; }
        public int Quanity { get; set; }
        public int StoreId { get; set; }

        public virtual InventoryItem Item { get; set; }
        public virtual Locations Store { get; set; }
    }
}
