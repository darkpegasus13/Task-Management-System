using TaskManagementSystemAPI.DTOs;
using TaskManagementSystemAPI.Model;

namespace TaskManagementSystemAPI.MappingService
{
    public class MappingSvc
    {
        public static IEnumerable<TaskAttachmentsDTO> MapAttachmentTOAttachmentDTO(List<TaskAttachment> dstList)
        {
            var lst = new List<TaskAttachmentsDTO>();
            foreach (var dst in dstList)
            {
                lst.Add(new TaskAttachmentsDTO()
                {
                    TaskId = dst.TaskId,
                    Attachment = dst.Attachment
                });
            }
            return lst;
        }

        public static IEnumerable<TaskCommentsDTO> MapCommentTOCommentsDTO(List<TaskComment> dstList)
        {
            var lst = new List<TaskCommentsDTO>();
            foreach (var dst in dstList)
            {
                lst.Add(new TaskCommentsDTO()
                {
                    TaskId = dst.TaskId,
                    Comment = dst.Comment
                });
            }
            return lst;
        }

        public static IEnumerable<TaskDTO> MapTaskTOTasksDTO(List<Model.Task> dstList)
        {
            var lst = new List<TaskDTO>();
            foreach (var dst in dstList)
            {
                lst.Add(new TaskDTO()
                {
                    TaskTitle = dst.TaskTitle,
                    TaskDescription = dst.TaskDescription,
                    StatusId=dst.StatusId,
                    UserId = dst.UserId,
                    TaskId = dst.TaskId
                });
            }
            return lst;
        }
    }
}
