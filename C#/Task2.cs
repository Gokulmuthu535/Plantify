using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
          
                // Step 1: Generate a random number between 1 and 100
                Random random = new Random();
                int target = random.Next(1, 101); // Random number between 1 and 100
                int guess = 0; // User's guess
                int attempts = 0; // To count attempts

                Console.WriteLine("Welcome to the Number Guessing Game!");
                Console.WriteLine("I have chosen a number between 1 and 100. Try to guess it.\n");

                // Step 2: Use a while loop for multiple guesses
                while (guess != target)
                {
                    Console.Write("Enter your guess: ");

                    // Step 3: Validate user input
                    string input = Console.ReadLine();
                    bool isValid = int.TryParse(input, out guess);

                    if (!isValid)
                    {
                        Console.WriteLine("Please enter a valid number between 1 and 100.\n");
                        continue;
                    }

                    // Step 4: Increment attempt count
                    attempts++;

                    // Step 5: Provide feedback
                    if (guess > target)
                    {
                        Console.WriteLine("Too high! Try again.\n");
                    }
                    else if (guess < target)
                    {
                        Console.WriteLine("Too low! Try again.\n");
                    }
                    else
                    {
                        Console.WriteLine($"\nCongratulations! You guessed the number {target} correctly.");
                        Console.WriteLine($"It took you {attempts} attempts.");
                    }
                }

                // End message
                Console.WriteLine("Thank you for playing the Number Guessing Game!");
                Console.ReadLine(); // Prevent the console from closing immediately
            }
        }
    }



