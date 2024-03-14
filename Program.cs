namespace Task1_Assignment;

class Program
{
    static void Main(string[] args)
    {
        string status = "Processing";

        if(status == "Cancelled")
        {
            Console.WriteLine("The order is Cancelled");
        }
        else if(status == "Processing")
        {
            Console.WriteLine("The order is under processing"); ;
        }
        else if(status == "Delivered")
        {
            Console.WriteLine("The order is Delivered");
        }
    }
}

