using Entities.Abstracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concretes
{
    public class Instructor:IEntity
    {
        public int Id { get; set; } 
        public Course[] Courses { get; set; } 
        public string Name { get; set; }
    }
}
