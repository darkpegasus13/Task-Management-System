using Microsoft.EntityFrameworkCore;
using System.Collections;
using TaskManagementSystemAPI.Model;
using System.Data.SqlClient;
using TaskManagementSystemAPI.DTOs;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using System.Net;
using Microsoft.AspNetCore.Http.HttpResults;
using System.Globalization;
using TaskManagementSystemAPI.MappingService;

namespace TaskManagementSystemAPI.Repository
{
    public class TMSRepository : ITMSRepository
    {
        private PractiseDbContext _dbContext;
        public TMSRepository(PractiseDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        /// <summary>
        /// User retrieves all the tasks assigned to him
        /// </summary>
        /// <param name="userId"></param>
        /// <returns>All tasks assigned to user</returns>
        public async Task<IEnumerable<TaskDTO>> GetTasksByUserIdAsync(Guid userId)
        {
            var userType = MappingSvc.MapTaskTOTasksDTO(await _dbContext.Tasks.FromSql($"dbo.GetTasksByUserId {userId}").ToListAsync());
            foreach(var curr in userType)
            {
                var taskComments = await _dbContext.TaskComments.
                    Where(x => x.TaskId == curr.TaskId)
                    .ToListAsync();
                var taskAttachments = await _dbContext.TaskAttachments.
                    Where(x => x.TaskId == curr.TaskId)
                    .ToListAsync();
                curr.Comments = MappingSvc.MapCommentTOCommentsDTO(taskComments);
                curr.Attachments = MappingSvc.MapAttachmentTOAttachmentDTO(taskAttachments);
            }
            return userType;
        }

        /// <summary>
        /// Manager or team lead can see the tasks
        /// assignedto their teammates who have them as manager
        /// and belong to same team
        /// </summary>
        /// <param name="managerId"></param>
        /// <returns>all tasks assigned to team mates</returns>
        public async Task<IEnumerable<TeamInfo>> GetTeamInfoByManagerIdAsync(Guid managerId)
        {
            var teamInfo = await _dbContext.TeamInfo.FromSql($"dbo.GetEmployeesUnderManager {managerId}").ToListAsync();

            return teamInfo;
        }

        /// <summary>
        /// Gets team Monthly performance if role is Admin
        /// performance for all the team would be shown if 
        /// Manager then his team's performance is visible
        /// </summary>
        /// <param name="userId"></param>
        /// <returns>Teams collective performance</returns>
        public async Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceMonthlyAsync(Guid userId)
        {
            var teamPerf = await _dbContext.TeamPerformances.FromSql($"dbo.[GetTeamsPerformanceMonthly] {userId}").ToListAsync();
            var results = teamPerf.GroupBy(
                    p => p.TeamName,
                    (key, g) => new TeamPerformanceDTO
                    {
                        TeamName = key,
                        TotalTasks = g.Count(),
                        CompletedTasks = g.Where(x => x.Status == "Completed").Count(),
                        CompletionPercentage = 100 * (g.Where(x => x.Status == "Completed").Count() / g.Count())
                    });
            return results;
        }

        /// <summary>
        /// Gets team Weekly performance if role is Admin
        /// performance for all the team would be shown if 
        /// Manager then his team's performance is visible
        /// </summary>
        /// <param name="userId"> User Id of the one making the request</param>
        /// <returns>Teams performance</returns>
        public async Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceWeeklyAsync(Guid userId)
        {
            var teamPerf = await _dbContext.TeamPerformances.FromSql($"dbo.[GetTeamsPerformanceWeekly] {userId}").ToListAsync();
            var results = teamPerf.GroupBy(
                    p => p.TeamName,
                    (key, g) => new TeamPerformanceDTO
                    {
                        TeamName = key,
                        TotalTasks = g.Count(),
                        CompletedTasks = g.Where(x => x.Status == "Completed").Count(),
                        CompletionPercentage = 100 * (g.Where(x => x.Status == "Completed").Count() / g.Count())
                    });
            return results;
        }

        /// <summary>
        /// Add a new task
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<int> AddTaskAsync(TaskDTO dto)
        {
            try
            {
                var dateCurr = DateOnly.FromDateTime(DateTime.Now);
                var taskObj = new Model.Task
                {
                    TaskTitle = dto.TaskTitle,
                    TaskDescription = dto.TaskDescription,
                    StatusId = dto.StatusId,
                    StartDate = dateCurr,
                    EndDate = dateCurr.AddDays(10),//considering two week sprint
                    UserId = dto.UserId
                };
                await _dbContext.Tasks.AddAsync(taskObj);
                await _dbContext.SaveChangesAsync();
                return 1;
            }
            catch(Exception)
            {
                return -1;
            }
        }
        //public ActionResult UpdateTaskAsync()
        //{

        //}
        /// <summary>
        /// Adds comment to the given task id
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<int> AddCommentInTaskAsync(TaskCommentsDTO dto)
        {
            try
            {
                var dateCurr = DateOnly.FromDateTime(DateTime.Now);
                var taskObj = new TaskComment
                {
                    Comment=dto.Comment,
                    UserId=dto.UserId,
                    AddDate=dateCurr,
                    TaskId=dto.TaskId
                };
                await _dbContext.TaskComments.AddAsync(taskObj);
                await _dbContext.SaveChangesAsync();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// Adds attachment to the given task id
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public async Task<int> AddAttachmentInTaskAsync(TaskAttachmentsDTO dto)
        {
            try
            {
                var dateCurr = DateOnly.FromDateTime(DateTime.Now);
                var taskObj = new TaskAttachment
                {
                   TaskId = dto.TaskId,
                   Attachment=dto.Attachment
                };
                await _dbContext.TaskAttachments.AddAsync(taskObj);
                await _dbContext.SaveChangesAsync();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}
