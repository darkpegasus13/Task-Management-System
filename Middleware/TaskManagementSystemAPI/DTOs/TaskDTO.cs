using TaskManagementSystemAPI.Model;

namespace TaskManagementSystemAPI.DTOs
{
    public class TaskDTO
    {
        public int? TaskId { get; set; }
        public string TaskTitle { get; set; } = null!;

        public string TaskDescription { get; set; } = null!;

        public int StatusId { get; set; }

        public Guid? UserId { get; set; }

        public IEnumerable<TaskCommentsDTO>? Comments { get; set; }

        public IEnumerable<TaskAttachmentsDTO>? Attachments { get; set; }

    }
}
