using System.Collections.Generic;
using MakeupStore.DataAccess;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Store.Library
{
    public class Customer : ICustomer<Customer>
    {

        protected int customerIdNumber;
        protected string firstName;
        protected string lastName;
        protected string email;
        protected string phoneNumber;
        protected string defaultStoreLocation;
        protected string currentLocation; // will be linked to the order location

        // getters and setters
        public int CustomerIdNumber
        {
            get
            {
                return customerIdNumber;
            }
            set
            {
                customerIdNumber = value;
            }
        }
        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
            }
        }
        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
            }
        }
        public string Email
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }
        public string PhoneNumber
        {
            get
            {
                return phoneNumber;
            }
            set
            {
                phoneNumber = value;
            }
        }
        public string DefaultStoreLocation
        {
            get
            {
                return defaultStoreLocation;
            }
            set
            {
                defaultStoreLocation = value;
            }
        }
        public string CurrentLocation
        {
            get
            {
                return currentLocation;
            }
            set
            {
                currentLocation = value;
            }
        }

        public string GetCustomerFullName()
        {
            return firstName + " " + lastName;
        }

        //might not be in this class (maybe move to order)
        public void PlaceOrder(MakeupStoreDbContext dbContext)
        {
                var o = new Orders();
                string ans = "";
                string where = "";

                if (defaultStoreLocation != null)
                {
                    Console.WriteLine($"Would you like to shop at {defaultStoreLocation}?");
                    ans = Console.ReadLine();
                    if (ans.Equals("y"))
                    {
                        where = "Arlington";
                    }
                    else
                    {
                        Console.WriteLine("Enter your preffered store to shop:");
                        foreach (var loc in dbContext.Locations.Include(l => l.Inventory))
                        {
                            Console.WriteLine($"{loc.LocationId}. {loc.LocationName}");
                        }
                        where = Console.ReadLine();
                    }
                }
                else
                {
                    Console.WriteLine("Enter your preffered store to shop:");
                    foreach (var loc in dbContext.Locations.Include(l => l.Inventory))
                    {
                        Console.WriteLine($"{loc.LocationId}. {loc.LocationName}");
                    }
                    where = Console.ReadLine();
                }



                Console.WriteLine($"Displaying Inventory for {where}:");
                    foreach (var item in dbContext.InventoryItem.Include(i => i.Inventory))
                    {
                        Console.WriteLine($"{item.ItemId}. {item.ItemName} Price: ${item.Price}");
                    }
                    int it = 0;
                    float tot = 0;
                while (true)
                {

                    Console.WriteLine("Enter ID to Item you want:");
                    it = Convert.ToInt32(Console.ReadLine());

                foreach (var item in dbContext.InventoryItem.Include(i => i.Inventory))
                {
                    if(it == item.ItemId)
                    {
                        tot += item.Price;
                    }
                }

                o.LocationName = where;
                    o.ItemId = it;
                    o.OrderTime = DateTime.Now;

                //dbContext.Database.ExecuteSqlCommand("UPDATE TABLE [dbo].[Inventory] WHERE [LocationId] ==");

                    foreach (var cust in dbContext.Customer.Include(c => c.Orders))
                    {
                        if (cust.FirstName.Equals(firstName) && cust.LastName.Equals(LastName))
                        {
                            o.CustomerId = cust.CustomerId;
                        }
                    }
                    dbContext.Add(o);
                    var newOrderHistory = new OrderHistory
                    {
                        OrderId = o.OrderId,
                        CustomerId = o.CustomerId,
                        Total = tot
                    };
                try
                {
                    dbContext.Add(newOrderHistory);
                    dbContext.SaveChanges();
                }
                  catch(DbUpdateException e)
                {
                    Console.WriteLine("Unable yo update thr database!", e);
                }
                finally
                {

                }

                Console.WriteLine("Buy another item? (y/n)");
                    ans = Console.ReadLine();

                    if(ans.Equals("n"))
                    {
                        break;
                    }


            }
        }

        public void AddCustomer(MakeupStoreDbContext dbContext)
        {
            var newCustomer = new MakeupStore.DataAccess.Customer
            {
                FirstName = firstName,
                LastName = lastName,
                Email = email
            };
            dbContext.Customer.Add(newCustomer);
            dbContext.SaveChanges();

        }




        public void CheckOrderHistory(MakeupStoreDbContext dbContext)
        {
            var myHistory = dbContext
                .OrderHistory
                .Where(u => u.CustomerId == customerIdNumber)
                .Include(x=> x);
            Console.WriteLine(myHistory);
        }


    }
}
