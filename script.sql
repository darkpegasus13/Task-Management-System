USE [master]
GO
/****** Object:  Database [PractiseDB]    Script Date: 18-07-2024 18:24:03 ******/
CREATE DATABASE [PractiseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PractiseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PractiseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PractiseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PractiseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PractiseDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PractiseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PractiseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PractiseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PractiseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PractiseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PractiseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PractiseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PractiseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PractiseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PractiseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PractiseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PractiseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PractiseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PractiseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PractiseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PractiseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PractiseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PractiseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PractiseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PractiseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PractiseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PractiseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PractiseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PractiseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PractiseDB] SET  MULTI_USER 
GO
ALTER DATABASE [PractiseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PractiseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PractiseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PractiseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PractiseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PractiseDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PractiseDB] SET QUERY_STORE = OFF
GO
USE [PractiseDB]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskAttachments]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskAttachments](
	[AttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NULL,
	[Attachment] [image] NULL,
 CONSTRAINT [PK_TaskAttachments] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskComments]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NULL,
	[AddDate] [date] NULL,
	[TaskId] [int] NULL,
 CONSTRAINT [PK_TaskComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskTitle] [nchar](10) NOT NULL,
	[TaskDescription] [nchar](10) NOT NULL,
	[StatusId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[CompletionDate] [date] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nchar](10) NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[EmpId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
	[First Name] [nvarchar](max) NOT NULL,
	[Last Name] [nvarchar](max) NULL,
	[ManagerId] [uniqueidentifier] NULL,
	[TeamId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaskAttachments]  WITH CHECK ADD  CONSTRAINT [FK_TaskAttachments_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([TaskId])
GO
ALTER TABLE [dbo].[TaskAttachments] CHECK CONSTRAINT [FK_TaskAttachments_Tasks]
GO
ALTER TABLE [dbo].[TaskComments]  WITH CHECK ADD  CONSTRAINT [FK_TaskComments_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([TaskId])
GO
ALTER TABLE [dbo].[TaskComments] CHECK CONSTRAINT [FK_TaskComments_Tasks]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[TaskStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatus]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([EmpId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[GetEMployeesUnderManager]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEMployeesUnderManager]
(@managerId uniqueidentifier)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Users where ManagerId=@managerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTasksByUserId]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTasksByUserId]
(@userId uniqueidentifier)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Tasks t where UserId = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsPerformanceMonthly]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetTeamsPerformanceMonthly]
(@managerId uniqueidentifier,
@userId uniqueidentifier)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select AVG(t.StatusId)/count(u.EmpId) from Tasks t join Users u on 
	t.UserId = u.EmpId where t.StartDate BETWEEN DATEADD(MONTH,-1,GETDATE()) AND GETDATE() group by u.TeamId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsPerformanceWeekly]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTeamsPerformanceWeekly]
(@managerId uniqueidentifier,
@userId uniqueidentifier)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select AVG(t.StatusId)/count(u.EmpId) from Tasks t join Users u on 
	t.UserId = u.EmpId where t.StartDate BETWEEN DATEADD(WEEK,-1,GETDATE()) AND GETDATE() group by u.TeamId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTeamsPerformanceYearly]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetTeamsPerformanceYearly]
(@managerId uniqueidentifier,
@userId uniqueidentifier)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select AVG(t.StatusId)/count(u.EmpId) from Tasks t join Users u on 
	t.UserId = u.EmpId where t.StartDate BETWEEN DATEADD(YEAR,-1,GETDATE()) AND GETDATE() group by u.TeamId;
END
GO
/****** Object:  StoredProcedure [dbo].[ProgressStatus]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProgressStatus](
	@taskId int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Begin Try
    -- Insert statements for procedure here
	Begin Tran
	Declare @status int;
	set @status=(select StatusId from Tasks where TaskId=@taskId);
	if(@status+1>04)
		set @status=4;
	update Tasks set StatusId = @status where TaskId=@taskId; 
	Commit TRAN
	return 0;
	End Try
	Begin Catch
		ROLLBACK TRAN
		return -1;
	End Catch
END
GO
/****** Object:  StoredProcedure [dbo].[RegressStatus]    Script Date: 18-07-2024 18:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[RegressStatus](
	@taskId int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Begin Try
    -- Insert statements for procedure here
	Begin Tran
	Declare @status int;
	set @status=(select StatusId from Tasks where TaskId=@taskId);
	if(@status-1<0)
		set @status = 0;
	update Tasks set StatusId = @status where TaskId=@taskId; 
	Commit TRAN
	return 0;
	End Try
	Begin Catch
		ROLLBACK TRAN
		return -1;
	End Catch
END
GO
USE [master]
GO
ALTER DATABASE [PractiseDB] SET  READ_WRITE 
GO
