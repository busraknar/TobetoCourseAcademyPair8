namespace CSharp_Basics;

class Program
{
    static void Main(string[] args)
    {
        #region  0-15 types and variables
        //Console.WriteLine("Hello, Tobeto!"); //ilk uygulama
        //Console.ReadKey();

        //int number1 = 10;
        //Console.WriteLine(number1);
        //Console.WriteLine("Number 1 in {0}", number1);
        //Console.WriteLine($"Number 1 is {number1}");

        //byte byteNumber = 255; // 8bit
        //short shortNumber = 32767; //16bit
        //int intNumber = 2147483647; // 32bit
        //long number = 2147483648; // 64bit

        //bool condition = true; // or false

        //enum Days
        //{
        //    Monday,Tuesday,Wednesday,Thursday,Friday
        //}

        //Console.WriteLine(Days.Friday);
        //Console.WriteLine((int)Days.Monday);
        #endregion

        #region 15-21 Conditionals
        //var number = 10;
        //if (number == 10)
        //{
        //    Console.WriteLine("Number is 10");
        //}
        //else
        //{
        //    Console.WriteLine("Number is not 10");
        //}

        //var number = 11;
        //Console.WriteLine(number == 10 ? "number is 10":"number is not 10"); //turnery operator

        //var number = 15;
        //if (number == 10)
        //{
        //    Console.WriteLine("number is 10");
        //}
        //else if (number == 15)
        //{
        //    Console.WriteLine("number is 15");
        //}
        //else if (number == 25)
        //{
        //    Console.WriteLine("number is 25");
        //}
        //else
        //{
        //    Console.WriteLine("number is something");
        //}

        //var number = 20;

        //switch (number)
        //{
        //    case 10:
        //        Console.WriteLine("number is 10");
        //        break;
        //    case 15:
        //        Console.WriteLine("number is 15");
        //        break;
        //    case 20:
        //        Console.WriteLine("number is 20");
        //        break;
        //    default:
        //        Console.WriteLine("number is something");
        //        break;
        //}

        //var number = 20;

        //if (number >= 0 && number<= 100)
        //{
        //    Console.WriteLine("number is between 0-100");
        //}
        //else if (number >= 0 && number <= 200)
        //{
        //    Console.WriteLine("number is between 0-200");
        //}
        //else if (number > 200 || number < 0)
        //{
        //    Console.WriteLine("number is less then 0 or greater then 200");
        //}

        //var number = 20;
        //if (number < 100)
        //{
        //    if (number > 90)
        //    {
        //        Console.WriteLine("number is between 90-100");
        //    }
        //}



        #endregion

        #region 21-28 Methods
        //static void Add()
        //{
        //    Console.WriteLine("Added!!!");
        //}

        //static int Add2(int number1, int number2)
        //{
        //    return number1 + number2;
        //}
        //Add();
        //Add();
        //var result = Add2(10, 20);
        //Console.WriteLine(result);

        //ref keywordu deger turlu degiskenlerin referans turlu degisken gibi kullanılmasını sağlar.

        //static int Multiply(int number1, int number2)
        //{
        //    return number1 * number2;
        //}
        //static int Multiply(int number1, int number2, int number3)
        //{
        //    return number1 * number2 * number3;
        //}
        //static int Add4(params int[] numbers)
        //{
        //    return numbers.Sum();
        //}

        //Console.WriteLine(Multiply(2,4));
        //Console.WriteLine(Multiply(2,4,6)); // metot overloading
        //Console.WriteLine(Add4(4,3,5,6,2,5,6,2,4));
        #endregion

        #region 28-30 Arrays

        //string[] students = new string[3];
        //students[0] = "Gani";
        //students[1] = "Ayten";
        //students[2] = "Sıdıka";

        //string[] students1 = { "Gani", "Ayten"};

        //foreach (var student in students)
        //{
        //    Console.WriteLine(student);
        //}

        //string[,] regions = new string[5, 3] // çok boyutlu dizi. multi dimensional, 5 satır - 3 sütun
        //{
        //        {"Tekirdağ","Edirne","Kırklareli" },
        //        {"Ankara","Konya","Eskişehir" },
        //        {"Antalya","Adana","Mersin" },
        //        {"Rize","Trabzon","Of" },
        //        {"İzmir","Muğla","Aydın" },
        //};

        //for (int i = 0; i <= regions.GetUpperBound(0); i++)
        //{
        //    for (int j = 0; j <= regions.GetUpperBound(1); j++)
        //    {
        //        Console.WriteLine(regions[i, j]);
        //    }
        //    Console.WriteLine("*****");
        //}

        #endregion

        #region 30-34 Loops

        //for (int i = 1; i <= 100; i++)
        //{
        //    Console.WriteLine(i);
        //}
        //Console.WriteLine("Finished!");

        //int number = 100;
        //while (number >= 0)
        //{
        //    Console.WriteLine(number);
        //    number--;
        //}
        //Console.WriteLine("Now number is {0}", number);

        //int number = 10;
        //do
        //{
        //    Console.WriteLine(number);
        //    number--;

        //} while(number >=11);

        //string[] students = { "İrem", "Emir","Umay" };
        //foreach (var student in students) 
        //{
        //    Console.WriteLine(student); 
        //}
        #endregion

        #region Question

        //private static bool IsPrimeNumber(int number)
        //{
        //    bool result = true;
        //    for (int i = 2; i < number - 1; i++)
        //    {
        //        if (number % i == 0)
        //        {
        //            result = false;
        //        }
        //    }
        //    return result;
        //}

        //if (IsPrimeNumber(7))
        //{
        //    Console.WriteLine("This is a prime number");
        //}
        //else
        //{
        //    Console.WriteLine("This is not a prime number");
        //}

        #endregion

        #region 35-36 string

        //string city = "Tekirdağ"; // string aslında bir char array dir. char dizisidir.
        //Console.WriteLine(city[0]);

        //foreach (var item in city)
        //{
        //    Console.WriteLine(item);
        //}

        //string city2 = "İstanbul";
        //string result = city + city2;

        

        //string sentence = "My name is Gani";

        //var result = sentence.Length;
        //var result1 = sentence.Clone();
        //bool result2 = sentence.EndsWith(" ğ");
        //bool result3 = sentence.StartsWith("My name");
        //var result4 = sentence.IndexOf("name");
        //var result5 = sentence.LastIndexOf(" ");
        //var result6 = sentence.Insert(0, "Hello, "); // 0. elemndan itibaren cümleye ekle
        //var result7 = sentence.Substring(3, 4); // 3.karakterden itibaren 4 tane al
        //var result8 = sentence.ToLower();
        //var result9 = sentence.ToUpper();
        //var result10 = sentence.Replace(" ", "-");
        //var result11 = sentence.Remove(2, 5); // 2den itibaren 5 karakteri sil
        //Console.WriteLine(result10);


        #endregion

    }
}