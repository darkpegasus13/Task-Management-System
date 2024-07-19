using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TaskManagementSystemAPI.DTOs;

namespace TaskManagementSystemAPI.Model;

public partial class PractiseDbContext : DbContext
{
    public PractiseDbContext()
    {
    }

    public PractiseDbContext(DbContextOptions<PractiseDbContext> options)
        : base(options)
    {
    }
    public virtual DbSet<TeamInfo> TeamInfo { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Task> Tasks { get; set; }

    public virtual DbSet<TaskAttachment> TaskAttachments { get; set; }

    public virtual DbSet<TaskComment> TaskComments { get; set; }

    public virtual DbSet<TaskStatus> TaskStatuses { get; set; }

    public virtual DbSet<Team> Teams { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<TeamPerformance> TeamPerformances { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=JAYESH1309\\SQLEXPRESS;Database=PractiseDB; Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.Role1)
                .HasMaxLength(50)
                .HasColumnName("Role");
        });

        modelBuilder.Entity<Task>(entity =>
        {
            entity.Property(e => e.TaskTitle)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.Status).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Tasks_TaskStatus");

            entity.HasOne(d => d.User).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_Tasks_Users");
        });

        modelBuilder.Entity<TaskAttachment>(entity =>
        {
            entity.HasKey(e => e.AttachmentId);

            entity.Property(e => e.Attachment).HasColumnType("image");

            entity.HasOne(d => d.Task).WithMany(p => p.TaskAttachments)
                .HasForeignKey(d => d.TaskId)
                .HasConstraintName("FK_TaskAttachments_Tasks");
        });

        modelBuilder.Entity<TaskComment>(entity =>
        {
            entity.HasKey(e => e.CommentId);

            entity.HasOne(d => d.Task).WithMany(p => p.TaskComments)
                .HasForeignKey(d => d.TaskId)
                .HasConstraintName("FK_TaskComments_Tasks");
        });

        modelBuilder.Entity<TaskStatus>(entity =>
        {
            entity.HasKey(e => e.StatusId);

            entity.ToTable("TaskStatus");

            entity.Property(e => e.Status).HasMaxLength(20);
        });

        modelBuilder.Entity<Team>(entity =>
        {
            entity.Property(e => e.TeamName)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.EmpId);

            entity.Property(e => e.EmpId).ValueGeneratedNever();
            entity.Property(e => e.FirstName).HasColumnName("First Name");
            entity.Property(e => e.LastName).HasColumnName("Last Name");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_Roles");
        });

        modelBuilder.Entity<TeamInfo>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.FullName);
            entity.Property(e => e.TaskTitle);
            entity.Property(e => e.TaskDescription);
            entity.Property(e => e.Status);
            entity.Property(e => e.StartDate);
            entity.Property(e => e.EndDate);
            entity.Property(e => e.CompletionDate);
        });

        modelBuilder.Entity<TeamPerformance>(entity =>
        {
            entity.HasNoKey();

            entity.Property(e => e.FullName);
            entity.Property(e => e.TaskTitle);
            entity.Property(e => e.TeamName);
            entity.Property(e => e.Status);
        });
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
