using Business.Dtos.Requests.Instructor;
using Business.Dtos.Requests.Page;
using Business.Dtos.Responses.Instructor;
using Core.DataAccess.Paging;

namespace Business.Abstracts
{
    public interface IInstructorService
    {
        Task<IPaginate<GetListInstructorResponse>> GetListAsync(PageRequest pageRequest);
        Task<CreatedInstructorResponse> Add(CreateInstructorRequest createInstructorRequest);
        Task<DeletedInstructorResponse> Delete(DeleteInstructorRequest deleteInstructorRequest);
        Task<UpdatedInstructorResponse> Update(UpdateInstructorRequest updateInstructorRequest);
    }
}
