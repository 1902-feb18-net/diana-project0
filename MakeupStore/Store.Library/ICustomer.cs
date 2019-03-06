using System;
using MakeupStore.DataAccess;

namespace Store.Library
{
    public interface ICustomer<Customer>
    {
        int CustomerIdNumber { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string Email { get; set; }
        string PhoneNumber { get; set; }
        string DefaultStoreLocation { get; set; }

        void PlaceOrder(MakeupStoreDbContext dbContext);
        void AddCustomer(MakeupStoreDbContext dbContext);
        void CheckOrderHistory(MakeupStoreDbContext dbContext);

    }
}
