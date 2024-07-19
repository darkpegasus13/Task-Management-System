using System;
using System.Collections.Generic;

namespace TaskManagementSystemAPI.Model;

public partial class TaskComment
{
    public int CommentId { get; set; }

    public string? Comment { get; set; }

    public Guid? UserId { get; set; }

    public DateOnly? AddDate { get; set; }

    public int? TaskId { get; set; }

    public virtual Task? Task { get; set; }
}
