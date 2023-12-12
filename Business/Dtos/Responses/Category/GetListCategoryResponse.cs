using Entities.Concretes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Dtos.Responses.Category
{
    public class GetListCategoryResponse
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        // public List<Course>? Courses { get; set; } --> kullanım ihtiyacına göre ileride kullanılabilir.
        // --> categoriye ait kursların da listelenmesi gerekirse include ile burası da doldurulabilir ileride.
    }
}
