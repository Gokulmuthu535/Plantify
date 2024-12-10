using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
                // Step 1: Declare variables of different data types
                int number1 = 10;
                double number2 = 20.5;
                bool isTrue = true;
                char letter = 'A';
                string message = "Hello, World!";

                // Print declared variables
                Console.WriteLine("Declared Variables:");
                Console.WriteLine($"Integer: {number1}");
                Console.WriteLine($"Double: {number2}");
                Console.WriteLine($"Boolean: {isTrue}");
                Console.WriteLine($"Character: {letter}");
                Console.WriteLine($"String: {message}\n");

                // Step 2: Perform arithmetic operations
                Console.WriteLine("Arithmetic Operations:");
                int sum = number1 + 5;
                double product = number1 * number2;
                double division = number2 / 2;

                Console.WriteLine($"Addition: {number1} + 5 = {sum}");
                Console.WriteLine($"Multiplication: {number1} * {number2} = {product}");
                Console.WriteLine($"Division: {number2} / 2 = {division}\n");

                // Step 3: Use comparison and logical operators
                Console.WriteLine("Comparison and Logical Operations:");
                bool comparison = number1 < number2;
                bool logicalAnd = (number1 < 20) && isTrue;

                Console.WriteLine($"Is {number1} less than {number2}? {comparison}");
                Console.WriteLine($"Logical AND: Is {number1} < 20 AND isTrue? {logicalAnd}");

                // Prevent console from closing immediately
                Console.ReadLine();
            

        }
    }
}
