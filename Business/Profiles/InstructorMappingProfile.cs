using AutoMapper;
using Business.Dtos.Requests.Instructor;
using Business.Dtos.Responses.Instructor;
using Core.DataAccess.Paging;
using Entities.Concretes;

namespace Business.Profiles
{
    public class InstructorMappingProfile : Profile // AutoMapper Profile class'ını inherit eder.
    {
        public InstructorMappingProfile()
        {
            // Profile class'ının constructorında bir CreateMap mevcuttur.
            // ReverseMap --> iki yönlü dönüşebilmesi için.

            CreateMap<Instructor, CreateInstructorRequest>().ReverseMap();
            CreateMap<Instructor, UpdateInstructorRequest>().ReverseMap();
            CreateMap<Instructor, DeleteInstructorRequest>().ReverseMap();

            CreateMap<Instructor, CreatedInstructorResponse>().ReverseMap();
            CreateMap<Instructor, UpdatedInstructorResponse>().ReverseMap();
            CreateMap<Instructor, DeletedInstructorResponse>().ReverseMap();

            CreateMap<Paginate<Instructor>, Paginate<GetListInstructorResponse>>().ReverseMap();
            CreateMap<Instructor, GetListInstructorResponse>().ReverseMap();
        }
        // Bu aşamadan sonra dependency.injection configurasyonlarını yapmamız lazım.
        // şimdilik gidip webApi içerisinde program.cs te yapıyoruz.
    }

}
