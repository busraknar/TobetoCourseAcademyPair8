using AutoMapper;
using Business.Dtos.Requests.Course;
using Business.Dtos.Responses.Course;
using Core.DataAccess.Paging;
using Entities.Concretes;

namespace Business.Profiles
{
    public class CourseMappingProfile : Profile
    {
        public CourseMappingProfile()
        {
            CreateMap<Course, CreateCourseRequest>().ReverseMap();
            CreateMap<Course, UpdateCourseRequest>().ReverseMap();
            CreateMap<Course, DeleteCourseRequest>().ReverseMap();

            CreateMap<Course, CreatedCourseResponse>().ReverseMap();
            CreateMap<Course, DeletedCourseResponse>().ReverseMap();
            CreateMap<Course, UpdatedCourseResponse>().ReverseMap();
            CreateMap<UpdateCourseRequest, UpdatedCourseResponse>();

            CreateMap<Paginate<Course>, Paginate<GetListCourseResponse>>().ReverseMap();
            CreateMap<Course, GetListCourseResponse>()
                .ForMember(destinationMember: c => c.CategoryName,
                memberOptions: opt => opt.MapFrom(c => c.Category.Name)).ReverseMap();

            CreateMap<Course, GetListCourseResponse>()
                .ForMember(destinationMember: c => c.InstructorFirstName,
                memberOptions: opt => opt.MapFrom(c => c.Instructor.FirstName)).ReverseMap();

            CreateMap<Course, GetListCourseResponse>()
                .ForMember(destinationMember: c => c.InstructorLastName,
                memberOptions: opt => opt.MapFrom(c => c.Instructor.LastName)).ReverseMap();

            CreateMap<Course, UpdatedCourseResponse>()
               .ForMember(destinationMember: c => c.CategoryName,
               memberOptions: opt => opt.MapFrom(c => c.Category.Name)).ReverseMap();

            CreateMap<Course, UpdatedCourseResponse>()
                .ForMember(destinationMember: c => c.InstructorFirstName,
                memberOptions: opt => opt.MapFrom(c => c.Instructor.FirstName)).ReverseMap();

            CreateMap<Course, UpdatedCourseResponse>()
                .ForMember(destinationMember: c => c.InstructorLastName,
                memberOptions: opt => opt.MapFrom(c => c.Instructor.LastName)).ReverseMap();




        }
    }

}
