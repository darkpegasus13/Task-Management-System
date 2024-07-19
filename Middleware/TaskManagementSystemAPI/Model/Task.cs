using System;
using System.Collections.Generic;

namespace TaskManagementSystemAPI.Model;

public partial class Task
{
    public int TaskId { get; set; }

    public string TaskTitle { get; set; } = null!;

    public string TaskDescription { get; set; } = null!;

    public int StatusId { get; set; }

    public DateOnly StartDate { get; set; }

    public DateOnly EndDate { get; set; }

    public DateOnly? CompletionDate { get; set; }

    public Guid? UserId { get; set; }

    public virtual TaskStatus Status { get; set; } = null!;

    public virtual ICollection<TaskAttachment> TaskAttachments { get; set; } = new List<TaskAttachment>();

    public virtual ICollection<TaskComment> TaskComments { get; set; } = new List<TaskComment>();

    public virtual User? User { get; set; }
}
