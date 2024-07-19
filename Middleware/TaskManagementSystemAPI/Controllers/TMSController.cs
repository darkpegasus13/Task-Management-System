using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;
using TaskManagementSystemAPI.DTOs;
using TaskManagementSystemAPI.Model;
using TaskManagementSystemAPI.Repository;

namespace TaskManagementSystemAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TMSController : ControllerBase
    {
        private readonly ITMSRepository _repo;

        public TMSController(ITMSRepository repo)
        {
            _repo = repo;
        }

       
        [Route("GetTasksByUserId/{userId}")]
        [HttpGet]
        public async Task<IEnumerable<TaskDTO>> GetTasksByUserIdAsync(Guid userId)
        {
            return await _repo.GetTasksByUserIdAsync(userId);
        }

        [Route("GetTeamInfoByManagerId/{managerId}")]
        [HttpGet]
        public async Task<IEnumerable<TeamInfo>> GetTeamInfoByManagerIdAsync(Guid managerId)
        {
            return await _repo.GetTeamInfoByManagerIdAsync(managerId);
        }

        [Route("GetTeamPerformanceWeekly/{userId}")]
        [HttpGet]
        public async Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceWeekly(Guid userId)
        {
            var tempList =  await _repo.GetTeamPerformanceWeeklyAsync(userId);
            return tempList;
        }

        [Route("GetTeamPerformanceMonthly/{userId}")]
        [HttpGet]
        public async Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceMonthlyAsync(Guid userId)
        {
            var tempList = await _repo.GetTeamPerformanceMonthlyAsync(userId);
            return tempList;
        }


        [Route("AddTaskAsync")]
        [HttpPost]
        public async Task<HttpStatusCode> AddTaskAsync([FromBody] TaskDTO jsonString)
        {
            var res = await _repo.AddTaskAsync(jsonString);
            if(res==1)
                return HttpStatusCode.OK;
            return HttpStatusCode.InternalServerError;
        }

        [Route("AddCommentInTask")]
        [HttpPost]
        public async Task<HttpStatusCode> AddCommentInTaskAsync([FromBody] TaskCommentsDTO jsonString)
        {
            var res = await _repo.AddCommentInTaskAsync(jsonString);
            if (res == 1)
                return HttpStatusCode.OK;
            return HttpStatusCode.InternalServerError;
        }

        [Route("AddAttachmentInTask")]
        [HttpPost]
        public async Task<HttpStatusCode> AddAttachmentInTask([FromBody] TaskAttachmentsDTO jsonString)
        {
            var res = await _repo.AddAttachmentInTaskAsync(jsonString);
            if (res == 1)
                return HttpStatusCode.OK;
            return HttpStatusCode.InternalServerError;
        }

    }
}