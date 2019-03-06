/*
 * This is essentially the order.
 * Each customer will have an order they will fill.
 * 
 */

using System;
using MakeupStore.DataAccess;

namespace Store.Library
{
    public class Order : IOrder<Order>
    {
        protected bool isEmpty = true;
        protected int orderId;
        protected string orderLocation;
        protected ICustomer<Customer> customerId;
        protected string orderTime;

        public bool IsEmpty 
        {
            get 
            {
                return isEmpty;
            }
            set
            {
                isEmpty = value;
            }
        }
        public int OrderId 
        {
            get
            {
                return orderId;
            }
            set
            {
                orderId = value;
            }

        }
        public string OrderLocation
        {
            get
            {
                return orderLocation;
            }
            set
            {
                orderLocation = value;
            }
        }
        public ICustomer<Customer> CustomerId
        {
            get
            {
                return customerId;
            }
            set
            {
                customerId = value;
            }
        }
        public string OrderTime
        {
            get
            {
                return orderTime;
            }
            set
            {
                orderTime = value;
            }
        } // can use logger for this
        //additional business rules (limited edition items can only be two per order)

        public void AddToOrder(MakeupStoreDbContext dbContext)
        {


        }
        
        public static void RemoveFromBag(InventoryItem x)
        {
            Console.WriteLine($"{x} has been removed from your bag.");

        }

        public void DisplayBag()
        {
            // Console.WriteLine($"Displaying {this.FirstName}'s bag:");

        }

        //public static bool CheckIfLtd(InventoryItem x)


    }
}
