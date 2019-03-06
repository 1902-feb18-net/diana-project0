using System;
using System.Collections.Generic;

namespace MakeupStore.DataAccess
{
    public partial class Customer
    {
        public Customer()
        {
            Orders = new HashSet<Orders>();
        }

        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int? DefaultStoreId { get; set; }

        public virtual ICollection<Orders> Orders { get; set; }
    }
}
