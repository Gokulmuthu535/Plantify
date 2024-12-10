using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

    namespace ECommerceApp
    {
        // Product Class
        class Product
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public double Price { get; set; }
            public int Quantity { get; set; }

            public Product(int id, string name, double price, int quantity)
            {
                Id = id;
                Name = name;
                Price = price;
                Quantity = quantity;
            }

            public void DisplayProduct()
            {
                Console.WriteLine($"ID: {Id}, Name: {Name}, Price: ${Price}, Quantity: {Quantity}");
            }
        }

        // Shopping Cart Class
        class ShoppingCart
        {
            private List<Product> cartItems = new List<Product>();

            public void AddProduct(Product product, int quantity)
            {
                if (quantity <= 0)
                {
                    Console.WriteLine("Quantity must be greater than zero.");
                    return;
                }

                var existingProduct = cartItems.Find(p => p.Id == product.Id);
                if (existingProduct != null)
                {
                    existingProduct.Quantity += quantity;
                }
                else
                {
                    cartItems.Add(new Product(product.Id, product.Name, product.Price, quantity));
                }
                Console.WriteLine($"{product.Name} has been added to the cart.");
            }

            public void RemoveProduct(int productId)
            {
                var product = cartItems.Find(p => p.Id == productId);
                if (product != null)
                {
                    cartItems.Remove(product);
                    Console.WriteLine($"{product.Name} has been removed from the cart.");
                }
                else
                {
                    Console.WriteLine("Product not found in the cart.");
                }
            }

            public void DisplayCart()
            {
                if (cartItems.Count == 0)
                {
                    Console.WriteLine("Your cart is empty.");
                    return;
                }

                Console.WriteLine("\nYour Cart:");
                foreach (var product in cartItems)
                {
                    Console.WriteLine($"ID: {product.Id}, Name: {product.Name}, Quantity: {product.Quantity}, Total: ${product.Price * product.Quantity}");
                }
            }

            public double CalculateTotal()
            {
                double total = 0;
                foreach (var product in cartItems)
                {
                    total += product.Price * product.Quantity;
                }
                return total;
            }
        }

        class Program
        {
            static void Main(string[] args)
            {
                // List of available products
                List<Product> products = new List<Product>
            {
                new Product(1, "Laptop", 799.99, 1),
                new Product(2, "Headphones", 29.99, 1),
                new Product(3, "Keyboard", 49.99, 1),
                new Product(4, "Mouse", 19.99, 1)
            };

                ShoppingCart cart = new ShoppingCart();
                bool running = true;

                while (running)
                {
                    Console.WriteLine("\n--- E-Commerce Console Application ---");
                    Console.WriteLine("1. View Products");
                    Console.WriteLine("2. Add Product to Cart");
                    Console.WriteLine("3. View Cart");
                    Console.WriteLine("4. Remove Product from Cart");
                    Console.WriteLine("5. Checkout");
                    Console.WriteLine("6. Exit");
                    Console.Write("Enter your choice: ");

                    try
                    {
                        int choice = int.Parse(Console.ReadLine());

                        switch (choice)
                        {
                            case 1:
                                Console.WriteLine("\nAvailable Products:");
                                foreach (var product in products)
                                {
                                    product.DisplayProduct();
                                }
                                break;

                            case 2:
                                Console.Write("Enter the Product ID to add to the cart: ");
                                int addId = int.Parse(Console.ReadLine());
                                var productToAdd = products.Find(p => p.Id == addId);

                                if (productToAdd != null)
                                {
                                    Console.Write("Enter quantity: ");
                                    int quantity = int.Parse(Console.ReadLine());
                                    cart.AddProduct(productToAdd, quantity);
                                }
                                else
                                {
                                    Console.WriteLine("Product not found.");
                                }
                                break;

                            case 3:
                                cart.DisplayCart();
                                break;

                            case 4:
                                Console.Write("Enter the Product ID to remove from the cart: ");
                                int removeId = int.Parse(Console.ReadLine());
                                cart.RemoveProduct(removeId);
                                break;

                            case 5:
                                cart.DisplayCart();
                                double total = cart.CalculateTotal();
                                Console.WriteLine($"\nYour total amount is: ${total}");
                                Console.WriteLine("Thank you for shopping with us!");
                                running = false; // Exit the loop after checkout
                                break;

                            case 6:
                                Console.WriteLine("Exiting the application. Thank you!");
                                running = false;
                                break;

                            default:
                                Console.WriteLine("Invalid choice. Please enter a number between 1 and 6.");
                                break;
                        }
                    }
                    catch (FormatException)
                    {
                        Console.WriteLine("Invalid input! Please enter a valid number.\n");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"An error occurred: {ex.Message}");
                    }
                }
            }
        }
    }

