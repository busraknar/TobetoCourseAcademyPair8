using Business.Abstracts;
using Business.Dtos.Requests.Instructor;
using Business.Dtos.Requests.Page;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InstructorsController : ControllerBase
    {
        IInstructorService _instructorService;

        public InstructorsController(IInstructorService instructorService)
        {
            _instructorService = instructorService;
        }

        [HttpPost]

        public async Task<IActionResult> Add([FromBody] CreateInstructorRequest createInstructorRequest)
        {
            var result = await _instructorService.Add(createInstructorRequest);
            return Ok(result);

        }
        [HttpDelete]
        public async Task<IActionResult> Delete(DeleteInstructorRequest deleteInstructorRequest)
        {
            var result = await _instructorService.Delete(deleteInstructorRequest);
            return Ok(result);

        }
        [HttpPut]
        public async Task<IActionResult> Update([FromBody] UpdateInstructorRequest updateInstructorRequest)
        {
            var result = await _instructorService.Update(updateInstructorRequest);
            return Ok(result);

        }

        [HttpGet]

        public async Task<IActionResult> GetList([FromQuery] PageRequest pageRequest)
        {
            var result = await _instructorService.GetListAsync(pageRequest);
            return Ok(result);
        }

    }
}
