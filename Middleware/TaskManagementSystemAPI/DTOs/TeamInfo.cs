using TaskManagementSystemAPI.Model;

namespace TaskManagementSystemAPI.DTOs
{
    public class TeamInfo
    {
        public string FullName { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public string Status { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime? CompletionDate { get; set; }
    }
}
