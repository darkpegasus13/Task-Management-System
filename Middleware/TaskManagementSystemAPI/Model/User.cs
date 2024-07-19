using System;
using System.Collections.Generic;

namespace TaskManagementSystemAPI.Model;

public partial class User
{
    public Guid EmpId { get; set; }

    public int RoleId { get; set; }

    public string FirstName { get; set; } = null!;

    public string? LastName { get; set; }

    public Guid? ManagerId { get; set; }

    public int? TeamId { get; set; }

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<Task> Tasks { get; set; } = new List<Task>();
}
