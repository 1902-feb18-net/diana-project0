using System;
using MakeupStore.DataAccess;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.Extensions.Logging;
using Store.Library;
using Microsoft.Extensions.Options;

namespace MakeupStore.ConsoleApp
{
    class Program
    {
        public static string first = "";
        public static string last = "";
        public static string email = "";
        
        static void Main(string[] args)
        { 

        string yesOrNo = "";

            Console.WriteLine("Welcome to Revature Cosmetics!");

            try
            {
                Console.WriteLine("Are you an existing customer? (y/n)");
                yesOrNo = Console.ReadLine();
                if (!yesOrNo.Equals("y", StringComparison.OrdinalIgnoreCase) && !yesOrNo.Equals("n", StringComparison.OrdinalIgnoreCase))
                {
                    throw new ArgumentException("Please enter a valid input. (y/n)");
                }

            }
            catch (ArgumentException e)
            {
                Console.WriteLine("Please enter a valid input. (y/n)", e);
            }
            finally
            {
                yesOrNo = Console.ReadLine();
            }

            if (yesOrNo.Equals("y", StringComparison.OrdinalIgnoreCase))
            {
                Console.WriteLine("Please enter your first name:");
                first = Console.ReadLine();
                Console.WriteLine("Please enter your last name:");
                last = Console.ReadLine();
            }
            else
            {
                Console.WriteLine("Please enter your first name:");
                first = Console.ReadLine();
                Console.WriteLine("Please enter your last name:");
                last = Console.ReadLine();
                Console.WriteLine("Enter your email:");
                email = Console.ReadLine();
            }

            bool ifContinue = true;


            while (ifContinue)
            {
                Program p = new Program();
                int response;
                Console.WriteLine("Select an option to proceed:(Enter correcponding number)");
                Console.WriteLine("1. Place Order");
                Console.WriteLine("2. View Order History");

                response = Convert.ToInt32(Console.ReadLine());
                p.UserResponse(response);

                try
                {
                    Console.WriteLine("Would you like to perform another action?(y/n)");
                    yesOrNo = Console.ReadLine();
                    if (!yesOrNo.Equals("y", StringComparison.OrdinalIgnoreCase))
                    {
                        Console.WriteLine("Goodbye :-) !");
                        break;
                    }
                }
                catch (ArgumentException e)
                {
                    Console.WriteLine("Please enter a valid input. (y/n)", e);
                }
                finally
                {
                    yesOrNo = Console.ReadLine();
                }

            }

            Environment.Exit(0);
        }

        public void UserResponse(int response)
        {
            var optionsBuilder = new DbContextOptionsBuilder<MakeupStoreDbContext>();
            optionsBuilder.UseSqlServer(SecretConfiguration.ConnectionString);
            var options = optionsBuilder.Options;
            using(var dbContext = new MakeupStoreDbContext(options))
            {
                var c = new Store.Library.Customer();
                c.FirstName = first;
                c.LastName = last;
                c.Email = email;
                c.AddCustomer(dbContext);

                if (response == 1)
                {

                    c.PlaceOrder(dbContext);

                }
                if(response == 2)
                {
                    c.CheckOrderHistory(dbContext);
                }

            }


        }
    }
}
