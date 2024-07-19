using TaskManagementSystemAPI.DTOs;
using TaskManagementSystemAPI.Model;

namespace TaskManagementSystemAPI.Repository
{
    public interface ITMSRepository
    {
        Task<IEnumerable<TaskDTO>> GetTasksByUserIdAsync(Guid userId);
        Task<IEnumerable<TeamInfo>> GetTeamInfoByManagerIdAsync(Guid managerId);
        Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceWeeklyAsync(Guid userId);
        Task<IEnumerable<TeamPerformanceDTO>> GetTeamPerformanceMonthlyAsync(Guid userId);
        Task<int> AddTaskAsync(TaskDTO jsonStr);
        Task<int> AddCommentInTaskAsync(TaskCommentsDTO dto);
        Task<int> AddAttachmentInTaskAsync(TaskAttachmentsDTO dto);
    }
}
