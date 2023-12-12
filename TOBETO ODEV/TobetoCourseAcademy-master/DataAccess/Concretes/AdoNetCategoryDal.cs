using Entities.Concretes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concretes
{
    public class AdoNetCategoryDal
    {
        public void Add(Category category)
        {
            //SQL çalışır
            Console.WriteLine("Ado.NET kullanılarak veritabanına eklendi.");
        }
        public void Add_Course(Course course)
        {
            //SQL çalışır
            Console.WriteLine(course.Name + " Kursu Ado.NET kullanılarak veritabanına eklendi.");
        }
    }
}
