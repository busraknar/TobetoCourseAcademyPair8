using Entities.Concretes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstracts
{
    public interface ICourseService
    {
        void Add(Course course);
        void Update(Course course); 
        void Delete(Course course); 
        List<Course> GetAll();
        List<Course> GetAllByCategoryId(int Id);
        List<Course> GetAllByInstructorId(int Id);


    }
}
