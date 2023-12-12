using Entities.Concretes;
using DataAccess.Concretes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concretes
{
    public class DataManager
    {
        public void Add(Course course1)
        {
            //Console.WriteLine(course1.Name + " Eklendi.");
            AdoNetCategoryDal courseDal = new AdoNetCategoryDal();
            courseDal.Add_Course(course1);
        }
    }
}
