namespace TaskManagementSystemAPI.DTOs
{
    public class TeamPerformanceDTO
    {
        public string TeamName { get; set; }
        public int TotalTasks { get; set; }
        public int CompletedTasks { get; set; }
        public int CompletionPercentage {get;set;}
    }
}
