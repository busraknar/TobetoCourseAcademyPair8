using Entities.Concretes;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.EntityConfigurations
{
    public class CourseConfiguration : IEntityTypeConfiguration<Course>
    {
        public void Configure(EntityTypeBuilder<Course> builder)
        {
            builder.ToTable("Courses").HasKey(b => b.Id);
            builder.Property(b=> b.Id).HasColumnName("Id").IsRequired();
            builder.Property(b=> b.InstructorId).HasColumnName("InstructorId").IsRequired();
            builder.Property(b => b.CategoryId).HasColumnName("CategoryId").IsRequired();
            builder.Property(b => b.Name).HasColumnName("Name").IsRequired();
            builder.Property(b=> b.Description).HasColumnName("Description").IsRequired();
            builder.Property(b => b.ImageUrl).HasColumnName("ImageUrl").IsRequired();
            builder.Property(b => b.Price).HasColumnName("Price").IsRequired();
            builder.HasIndex(indexExpression: b => b.Name, name: "UK_Courses_Name").IsUnique();

            builder.HasOne(b => b.Instructor).WithMany(i => i.Courses).HasForeignKey(c => c.InstructorId);
            builder.HasOne(b => b.Category).WithMany(c => c.Courses).HasForeignKey(c => c.CategoryId); ;

            builder.HasQueryFilter(b=>!b.DeletedDate.HasValue);

        }
    }
}
