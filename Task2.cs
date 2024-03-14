class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Enter the weight: ");
        float parcelWeights = float.Parse(Console.ReadLine());// Example weights for parcels

        
        string category = CategorizeParcel(parcelWeights);
        Console.WriteLine("A parcel weighing "+parcelWeights+"g is categorized as "+category);
    }

    static string CategorizeParcel(float weight)
    {
        string category = "";

        switch (weight)
        {
            case float n when (n < 500.0):
                category = "Light";
                break;
            case float n when (n >= 500.0 && n < 900.0):
                category = "Medium";
                break;
            case float n when (n>=900.0):
                category = "Heavy";
                break;
        }

        return category;
    }
}
