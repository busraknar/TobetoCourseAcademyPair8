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
    public class InstructorConfiguration : IEntityTypeConfiguration<Instructor>
    {
        public void Configure(EntityTypeBuilder<Instructor> builder)
        {
            builder.ToTable("Instructors").HasKey(b => b.Id);
            builder.Property(b => b.Id).HasColumnName("Id").IsRequired();
            builder.Property(b => b.FirstName).HasColumnName("FirstName").IsRequired();
            builder.Property(b => b.LastName).HasColumnName("LastName").IsRequired();
            builder.HasIndex(indexExpression:b=>b.FirstName,name:"UK_Instructors_FirstName").IsUnique();
            builder.HasMany(ct => ct.Courses).WithOne(c => c.Instructor).HasForeignKey(c => c.InstructorId);
            builder.HasQueryFilter(b=>!b.DeletedDate.HasValue);
        }
    }
}
