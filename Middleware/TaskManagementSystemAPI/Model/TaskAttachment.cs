using System;
using System.Collections.Generic;

namespace TaskManagementSystemAPI.Model;

public partial class TaskAttachment
{
    public int AttachmentId { get; set; }

    public int? TaskId { get; set; }

    public byte[]? Attachment { get; set; }

    public virtual Task? Task { get; set; }
}
