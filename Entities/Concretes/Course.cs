using Core.Entities;

namespace Entities.Concretes
{
    public class Course : Entity<Guid>
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
        public Category? Category { get; set; }
        public Guid? CategoryId { get; set; }
        public Instructor? Instructor { get; set; }
        public Guid? InstructorId { get; set; }

    }
}
