using AutoMapper;
using Business.Abstracts;
using Business.Dtos.Requests.Instructor;
using Business.Dtos.Requests.Page;
using Business.Dtos.Responses.Instructor;
using Core.DataAccess.Paging;
using DataAccess.Abstracts;
using Entities.Concretes;

namespace Business.Concretes
{
    public class InstructorManager : IInstructorService
    {
        IInstructorDal _instructorDal;
        IMapper _mapper;

        public InstructorManager(IInstructorDal instructorDal, IMapper mapper)
        {
            _instructorDal = instructorDal;
            _mapper = mapper;
        }

        public async Task<CreatedInstructorResponse> Add(CreateInstructorRequest createInstructorRequest)
        {
            Instructor instructor = _mapper.Map<Instructor>(createInstructorRequest);
            instructor.Id = Guid.NewGuid();

            await _instructorDal.AddAsync(instructor);

            CreatedInstructorResponse createdInstructorResponse = _mapper.Map<CreatedInstructorResponse>(instructor);

            return createdInstructorResponse;
        }

        public async Task<DeletedInstructorResponse> Delete(DeleteInstructorRequest deleteInstructorRequest)
        {
            Instructor instructor = await _instructorDal.GetAsync(predicate: p => p.Id == deleteInstructorRequest.Id);
            Instructor deletedInstructor = await _instructorDal.DeleteAsync(instructor);

            DeletedInstructorResponse response = _mapper.Map<DeletedInstructorResponse>(deletedInstructor);
            return response;
        }
        public async Task<UpdatedInstructorResponse> Update(UpdateInstructorRequest updateInstructorRequest)
        {
            Instructor instructor = await _instructorDal.GetAsync(predicate: p => p.Id == updateInstructorRequest.Id);
            instructor.FirstName = updateInstructorRequest.FirstName;
            instructor.LastName = updateInstructorRequest.LastName;
            Instructor updatedInstructor = await _instructorDal.UpdateAsync(instructor);

            UpdatedInstructorResponse response = _mapper.Map<UpdatedInstructorResponse>(updatedInstructor);
            return response;
        }
        public async Task<IPaginate<GetListInstructorResponse>> GetListAsync(PageRequest pageRequest)
        {
            var result = await _instructorDal.GetListAsync(index: pageRequest.Index, size: pageRequest.Size);
            Paginate<GetListInstructorResponse> response = _mapper.Map<Paginate<GetListInstructorResponse>>(result);

            return response;

        }


    }
}
