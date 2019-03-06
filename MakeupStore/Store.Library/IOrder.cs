using System;
using MakeupStore.DataAccess;
using Store.Library;

namespace Store.Library
{
    public interface IOrder<Order>
    {
        int OrderId { get; set; }
        string OrderLocation { get; set; }
        ICustomer<Customer> CustomerId { get; set; }
        string OrderTime { get; set; }

        void AddToOrder(MakeupStoreDbContext dbContext);



    }
}
