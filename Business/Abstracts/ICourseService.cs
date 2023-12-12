using Business.Dtos.Requests.Course;
using Business.Dtos.Requests.Page;
using Business.Dtos.Responses.Course;
using Core.DataAccess.Paging;

namespace Business.Abstracts
{
    public interface ICourseService
    {
        Task<IPaginate<GetListCourseResponse>> GetListAsync(PageRequest pageRequest);
        Task<CreatedCourseResponse> Add(CreateCourseRequest createCourseRequest);
        Task<DeletedCourseResponse> Delete(DeleteCourseRequest deleteCourseRequest);
        Task<UpdatedCourseResponse> Update(UpdateCourseRequest updateCourseRequest);
    }
}
