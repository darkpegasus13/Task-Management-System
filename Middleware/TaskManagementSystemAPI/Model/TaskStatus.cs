using System;
using System.Collections.Generic;

namespace TaskManagementSystemAPI.Model;

public partial class TaskStatus
{
    public int StatusId { get; set; }

    public string? Status { get; set; }

    public virtual ICollection<Task> Tasks { get; set; } = new List<Task>();
}
