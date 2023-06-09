/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2019 (15.0.2080)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2019
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'57iFrp1hAxgq8we5YOT0o20fKOIIrn3cO2hk3Q2AsHA=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'+04K3C+wNI3W2QlFj38t9kri9EI1ao15fWLepHk4jCU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQL$MSSQLSERVER01]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQL$MSSQLSERVER01')
CREATE LOGIN [NT Service\MSSQL$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$MSSQLSERVER01]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLAgent$MSSQLSERVER01')
CREATE LOGIN [NT SERVICE\SQLAgent$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$MSSQLSERVER01]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY$MSSQLSERVER01')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [SAMAWIA_CS29100\It Zone]    Script Date: 3/6/2022 3:02:48 AM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'SAMAWIA_CS29100\It Zone')
CREATE LOGIN [SAMAWIA_CS29100\It Zone] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$MSSQLSERVER01]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLAgent$MSSQLSERVER01]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [SAMAWIA_CS29100\It Zone]
GO
USE [ProjectA]
GO
/****** Object:  Table [dbo].[Advisor]    Script Date: 3/6/2022 3:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Advisor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Advisor](
	[Id] [int] NOT NULL,
	[Designation] [int] NOT NULL,
	[Salary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Advisor] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Evaluation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Evaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[TotalWeightage] [int] NOT NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Evaluation] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Group]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created_On] [date] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Group] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GroupEvaluation]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupEvaluation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupEvaluation](
	[GroupId] [int] NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[ObtainedMarks] [int] NOT NULL,
	[EvaluationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupEvaluation] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[EvaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[GroupEvaluation] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GroupProject]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupProject]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupProject](
	[ProjectId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupProject] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[GroupProject] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GroupStudent]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupStudent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupStudent](
	[GroupId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupStudent] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[GroupStudent] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lookup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Category] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Lookup] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Person] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Project] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ProjectAdvisor]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProjectAdvisor](
	[AdvisorId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AdvisorRole] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProjectAdvisor] PRIMARY KEY CLUSTERED 
(
	[AdvisorId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[ProjectAdvisor] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/6/2022 3:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[RegistrationNo] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Student] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (1, 6, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (2, 7, CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (3, 8, CAST(8758 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (4, 9, CAST(674476 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (5, 10, CAST(76747 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (6, 6, CAST(674748 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (7, 7, CAST(85889 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (8, 8, CAST(857598 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (9, 9, CAST(677868 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (10, 10, CAST(78557 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (11, 6, CAST(87575 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (12, 7, CAST(785776 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (13, 8, CAST(646456 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (14, 9, CAST(77567 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (15, 10, CAST(535354 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (16, 6, CAST(67755 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (17, 7, CAST(757668 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (18, 8, CAST(65656 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (19, 9, CAST(3454343 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (20, 10, CAST(54546 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (78, 10, CAST(757576 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1, N'Asad', 89, 98)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (2, N'Saif', 67, 76)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (3, N'Nabeel', 78, 97)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1002, N'Rafaqat', 76, 87)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1003, N'Usher', 79, 97)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1004, N'Nouman', 64, 89)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1006, N'Muzamil', 67, 80)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1007, N'Aqsa', 75, 67)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1008, N'Malaika', 88, 97)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1010, N'Zeeshan', 87, 89)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1011, N'Ali', 89, 94)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1012, N'Aabroo', 76, 65)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1013, N'Umar', 89, 75)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1014, N'Fiza', 88, 77)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1015, N'Munawar', 89, 88)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1016, N'Mariam', 67, 75)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1017, N'Ahmad', 76, 86)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1018, N'AMNA', 67, 89)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1019, N'Samawia', 84, 89)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1020, N'Ahsan', 89, 88)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1021, N'Taha', 88, 87)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1023, N'MHS', 97, 89)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (1024, N'Ehsaan', 98, 89)
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1, CAST(N'2020-01-23' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (2, CAST(N'2020-01-24' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (3, CAST(N'2020-01-25' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1002, CAST(N'2020-01-23' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1003, CAST(N'2020-01-28' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1004, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1012, CAST(N'2020-03-07' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1013, CAST(N'2020-03-10' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1014, CAST(N'2020-03-23' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1015, CAST(N'2020-10-29' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1016, CAST(N'2020-10-30' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1017, CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1018, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1019, CAST(N'2020-10-27' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1020, CAST(N'2020-10-23' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1021, CAST(N'2020-10-08' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1022, CAST(N'2020-10-10' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1023, CAST(N'2020-10-11' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1024, CAST(N'2020-10-14' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1025, CAST(N'2020-10-26' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1026, CAST(N'2020-01-29' AS Date))
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1, 1, 45, CAST(N'2020-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (2, 2, 55, CAST(N'2020-02-24T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (3, 2, 56, CAST(N'2022-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (3, 3, 65, CAST(N'2020-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1002, 1004, 68, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1003, 1003, 68, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1004, 1012, 78, CAST(N'2022-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1012, 1008, 67, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1017, 1017, 60, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1018, 1014, 87, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1018, 1018, 90, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1019, 1019, 69, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1020, 1020, 66, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1021, 1007, 79, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1022, 1008, 63, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1023, 1006, 76, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1024, 1010, 56, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1025, 1013, 78, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (1026, 1014, 0, CAST(N'2022-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1, 1, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (5, 1002, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (6, 3, CAST(N'2022-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1003, 1004, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1004, 1012, CAST(N'2022-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1009, 1015, CAST(N'2022-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1010, 1023, CAST(N'2022-03-17T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1014, 1015, CAST(N'2022-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1016, 1016, CAST(N'2022-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1018, 1018, CAST(N'2022-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1019, 1022, CAST(N'2022-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1020, 1024, CAST(N'2022-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1, 1, 3, CAST(N'1994-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (2, 2, 3, CAST(N'1994-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (3, 3, 3, CAST(N'1994-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1002, 1003, 4, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1014, 1014, 4, CAST(N'2022-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1017, 1020, 3, CAST(N'2022-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1019, 1032, 3, CAST(N'2022-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1023, 1032, 4, CAST(N'2022-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1023, 1038, 4, CAST(N'2022-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1024, 1024, 4, CAST(N'2022-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (1025, 1025, 3, CAST(N'2022-03-23T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Lookup] ON 

INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (1, N'Male', N'GENDER')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (2, N'Female', N'GENDER')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (3, N'Active', N'STATUS')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (4, N'InActive', N'STATUS')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (6, N'Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (7, N'Associate Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (8, N'Assisstant Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (9, N'Lecturer', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (10, N'Industry Professional', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (11, N'Main Advisor', N'ADVISOR_ROLE')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (12, N'Co-Advisror', N'ADVISOR_ROLE')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (14, N'Industry Advisor', N'ADVISOR_ROLE')
SET IDENTITY_INSERT [dbo].[Lookup] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1, N'Asad-ullah', N'Bhatti', N'1564634', N'asad@gmail.com', CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (2, N'Saif-Ullah', N'ullah', N'8623868', N'saif@gmail.com', CAST(N'2022-03-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (3, N' Nabeel', N'Yousaf', N'8665535', N'nabeel@gmail.com', CAST(N'2022-03-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (6, N'Rafaqat', N'Hussain', N'7573255', N'rafaqat@gmail.com', CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (7, N'Usher', N'Ahmad', N'6827397', N'usher@gmail.com', CAST(N'2022-05-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (8, N'Muzamil', N'Iqbal', N'8687687', N'muzamil@gmail.com', CAST(N'2022-03-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1002, N'Nouman', N'Butt', N'9868362', N'nouman@gmail.com', CAST(N'2022-03-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1003, N' Aqsa', N'Riaz', N'8263238', N'aqsa@gmail.com', CAST(N'2022-03-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1004, N'Malaika', N'malaika', N'5621735', N'malaika@gmail.com', CAST(N'2022-03-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1005, N'Zeeshan', N'ayub', N'7532135', N'zeeshan@gmail.com', CAST(N'2022-05-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1006, N'Ali', N'Murtaza', N'7398126', N'ali@gmail.com', CAST(N'2022-03-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1007, N' Aabroo', N'Fatima', N'8632386', N'aabroo@gmail.com', CAST(N'2022-03-31T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1014, N'Umar', N'umar', N'6785489', N'umar@gmail.com ', CAST(N'2022-03-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1020, N'Fiza', N'manzoor', N'8727352', N'fiza@gmail.com', CAST(N'2022-03-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1021, N'Munawar', N'Ali', N'7235248', N'munawar@gmail.com', CAST(N'2022-03-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1022, N'Mariam', N'Ijaz', N'8623826', N'mariam@gmail.com', CAST(N'2022-03-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1023, N'Muhammad', N'Ahmad', N'7863782', N'ahmad@gmail.com', CAST(N'2022-08-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1024, N'Amna', N'Maryam', N'6382937', N'amna@gmail.com', CAST(N'2022-12-31T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1025, N'samawia', N'Ijaz', N'978192566', N'samawia@gmail.com', CAST(N'2022-10-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1027, N'Muhammad', N'ahsan', N'8631287', N'ahsan@gmail.com', CAST(N'2022-06-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1028, N'Muhammad', N'Taha', N'7623876', N'taah@gmail.com', CAST(N'2022-08-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1032, N'Muhammad', N'hamza saeed', N'735287', N'mhs@gmail.com', CAST(N'2022-07-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1033, N'Muhammad', N'Ehsaan', N'8346846', N'ehsaan@gmail.com', CAST(N'2022-10-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1034, N'noor', N'Atif', N'8734386', N'noor@gmail.com', CAST(N'2022-10-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1037, N'Nouman', N'Butt', N'9868362', N'nouman@gmail.com', CAST(N'2022-03-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1038, N'samawia', N'Ijaz', N'978192566', N'samawia@gmail.com', CAST(N'2022-10-29T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1, N'Project on School', N'School Management System')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (5, N'Project on Hotel', N'Hotel Management system')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (6, N'Project on Library', N'Library Management ')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1002, N'Project on Medicine', N'Medicine Maangement system')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1003, N'Project on Pharmacy', N'Pharmacy Maangement system')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1004, N'Project on Hostel', N'Hostel Management ')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1009, N'Project on room', N'Room Management SYSTEM')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1010, N'Project on Ambulance', N'Ambulance Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1011, N'Project on Bus', N'Bus Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1012, N'Project on Traffic', N'Traffic Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1013, N'Project on Shop', N'Shop Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1014, N'Project on Exams', N'Exam Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1015, N'Project on Book', N'book Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1016, N'Project on Student', N'Student Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1018, N'Project on College', N'College Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1019, N'Project on University', N'University Management')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1020, N'Project on room', N'Room Management SYSTEM')
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (1, 1, 11, CAST(N'1994-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (2, 1, 12, CAST(N'1994-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (2, 1002, 12, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (4, 1004, 12, CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (5, 1009, 14, CAST(N'2022-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (6, 1010, 11, CAST(N'2022-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (7, 1011, 12, CAST(N'2022-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (9, 1003, 14, CAST(N'2022-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (10, 1014, 12, CAST(N'2022-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (11, 1015, 14, CAST(N'2022-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (12, 1016, 12, CAST(N'2022-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (13, 1018, 11, CAST(N'2022-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (14, 1019, 14, CAST(N'2022-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (15, 5, 11, CAST(N'2022-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (19, 1018, 14, CAST(N'2022-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (78, 1011, 14, CAST(N'2022-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1, N'2020-CS-101')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (2, N'2020-CS-102')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (3, N'2020-CS-103')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (6, N'2020-CS-104')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (7, N'2020-CS-107')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1002, N'2020-CS-117')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1003, N'2020-CS-108')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1004, N'2020-CS-118')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1006, N'2020-CS-110')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1007, N'2020-CS-111')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1014, N'2020-CS-112')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1020, N'2020-CS-120')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1023, N'2020-CS-114')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1024, N'2020-CS-119')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1025, N'2020-CS-113')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1027, N'2020-CS-123')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1028, N'2020-CS-124')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1032, N'2020-CS-125')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1038, N'2020-CS-130')
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advisor_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advisor]'))
ALTER TABLE [dbo].[Advisor]  WITH CHECK ADD  CONSTRAINT [FK_Advisor_Lookup] FOREIGN KEY([Designation])
REFERENCES [dbo].[Lookup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Advisor_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Advisor]'))
ALTER TABLE [dbo].[Advisor] CHECK CONSTRAINT [FK_Advisor_Lookup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupEvaluation_Evaluation]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupEvaluation]'))
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_GroupEvaluation_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupEvaluation_Evaluation]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupEvaluation]'))
ALTER TABLE [dbo].[GroupEvaluation] CHECK CONSTRAINT [FK_GroupEvaluation_Evaluation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupEvaluation_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupEvaluation]'))
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_GroupEvaluation_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupEvaluation_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupEvaluation]'))
ALTER TABLE [dbo].[GroupEvaluation] CHECK CONSTRAINT [FK_GroupEvaluation_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupProject_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupProject]'))
ALTER TABLE [dbo].[GroupProject]  WITH CHECK ADD  CONSTRAINT [FK_GroupProject_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupProject_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupProject]'))
ALTER TABLE [dbo].[GroupProject] CHECK CONSTRAINT [FK_GroupProject_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupProject_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupProject]'))
ALTER TABLE [dbo].[GroupProject]  WITH CHECK ADD  CONSTRAINT [FK_GroupProject_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupProject_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupProject]'))
ALTER TABLE [dbo].[GroupProject] CHECK CONSTRAINT [FK_GroupProject_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupStudents_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudents_Lookup] FOREIGN KEY([Status])
REFERENCES [dbo].[Lookup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupStudents_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudents_Lookup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectStudents_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStudents_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectStudents_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_ProjectStudents_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectStudents_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStudents_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectStudents_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupStudent]'))
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_ProjectStudents_Student]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Person_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Lookup] FOREIGN KEY([Gender])
REFERENCES [dbo].[Lookup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Person_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Lookup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectAdvisor_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAdvisor_Lookup] FOREIGN KEY([AdvisorRole])
REFERENCES [dbo].[Lookup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectAdvisor_Lookup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectAdvisor_Lookup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectAdvisor_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAdvisor_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectAdvisor_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectAdvisor_Project]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectTeachers_Teacher]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTeachers_Teacher] FOREIGN KEY([AdvisorId])
REFERENCES [dbo].[Advisor] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProjectTeachers_Teacher]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProjectAdvisor]'))
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectTeachers_Teacher]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
