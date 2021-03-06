USE [master]
GO
/****** Object:  Database [TicketSystem]    Script Date: 3/29/2017 10:56:10 AM ******/
CREATE DATABASE [TicketSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSystem', FILENAME = N'G:\MS-SQL2005DATA\Data\TicketSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TicketSystem_log', FILENAME = N'G:\MS-SQL2005DATA\Log\TicketSystem_log.ldf' , SIZE = 3976KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TicketSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TicketSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketSystem', N'ON'
GO
USE [TicketSystem]
GO
/****** Object:  User [darshan]    Script Date: 3/29/2017 10:56:10 AM ******/
CREATE USER [darshan] FOR LOGIN [darshan] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [darshan]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [darshan]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [darshan]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [darshan]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [darshan]
GO
ALTER ROLE [db_datareader] ADD MEMBER [darshan]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [darshan]
GO
/****** Object:  Table [dbo].[MST_IssueType]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_IssueType](
	[IssueTypeID] [int] IDENTITY(1,1) NOT NULL,
	[IssueType] [varchar](50) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_Issue__Activ__0BC6C43E]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_Issu__6CC41B5909DE7BCC] PRIMARY KEY CLUSTERED 
(
	[IssueTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Menus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Menus](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[ParentID] [int] NOT NULL,
	[MenuPage] [varchar](500) NULL,
	[Active] [bit] NOT NULL,
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_Date] [datetime] NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_MST_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Modules]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Modules](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ModuleName] [varchar](100) NULL,
	[ModuleVer] [varchar](20) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_Modul__Activ__060DEAE8]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_Modu__2B7477870425A276] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Projects]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[ProjectVer] [varchar](20) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_Proje__Activ__014935CB]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_Proj__761ABED07F60ED59] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Rights]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Rights](
	[RightsID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NULL,
	[MenuID] [int] NULL,
	[Active] [bit] NOT NULL,
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Rights] PRIMARY KEY CLUSTERED 
(
	[RightsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MST_TicketStatus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_TicketStatus](
	[TicketStatusID] [int] IDENTITY(1,1) NOT NULL,
	[TicketStatus] [varchar](50) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_Ticke__Activ__108B795B]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_Tick__76E509E10EA330E9] PRIMARY KEY CLUSTERED 
(
	[TicketStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Users]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NULL,
	[UserName] [varchar](30) NULL,
	[Password] [varchar](100) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [bigint] NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_Users__Activ__38996AB5]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_User__1788CCAC36B12243] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_UserType]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MST_UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF__MST_UserT__Activ__1A14E395]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__MST_User__40D2D8F6182C9B23] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRN_Tickets]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRN_Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketStatusID] [int] NULL,
	[ProjectID] [int] NULL,
	[ModuleID] [int] NULL,
	[IssueTypeID] [int] NULL,
	[Priority] [varchar](10) NOT NULL,
	[AssignToUserID] [int] NULL,
	[TicketSummary] [varchar](200) NOT NULL,
	[TicketDescription] [varchar](max) NULL,
	[Active] [bit] NULL DEFAULT ((1)),
	[Created_By] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRN_TicketsAttachments]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRN_TicketsAttachments](
	[TicketAtchID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NULL,
	[FileName] [varchar](200) NULL,
	[Active] [bit] NULL CONSTRAINT [DF__TRN_Ticke__Activ__3D5E1FD2]  DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
 CONSTRAINT [PK__TRN_Tick__9790A8E63B75D760] PRIMARY KEY CLUSTERED 
(
	[TicketAtchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRN_TicketsNotes]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRN_TicketsNotes](
	[TicketNoteID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NULL,
	[UserID] [int] NULL,
	[NoteDesc] [varchar](max) NULL,
	[Active] [nchar](10) NULL DEFAULT ((1)),
	[Created_by] [int] NULL,
	[Modified_By] [int] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Modified_Date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MST_IssueType] ON 

INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, N'Bugss', 1, 1, 1, CAST(N'2016-02-03 00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, N'sdfdsf', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, N'Buggs', 1, NULL, 1, NULL, CAST(N'2016-02-08 02:12:19.2770000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, N'close', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, N'fsdfsdfsd', 0, 1, 1, CAST(N'2016-02-04 12:14:51.7671794' AS DateTime2), CAST(N'2016-02-04 12:24:34.2770191' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, N'opensss', 1, 1, 1, CAST(N'2016-02-04 05:03:44.7630000' AS DateTime2), CAST(N'2016-02-08 04:04:22.9730000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, N'openclose', 1, 1, NULL, CAST(N'2016-02-04 05:04:40.9170000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, N'close2', 1, 1, 1, CAST(N'2016-02-04 05:55:15.1700000' AS DateTime2), CAST(N'2016-02-04 05:58:21.4430000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, N'opcls', 1, 1, 1, CAST(N'2016-02-06 00:20:18.3300000' AS DateTime2), CAST(N'2016-02-06 00:20:24.6500000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (10, N'reopensss', 1, 1, NULL, CAST(N'2016-02-08 04:04:09.4130000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (11, N'demo77000', 1, 3, 3, CAST(N'2016-02-09 01:19:12.8070000' AS DateTime2), CAST(N'2016-02-09 01:19:35.8400000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (12, N'test', 1, 3, NULL, CAST(N'2016-02-09 04:37:01.0770000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (13, N'test4', 1, 3, 3, CAST(N'2016-02-09 04:53:21.2130000' AS DateTime2), CAST(N'2016-02-09 04:53:31.3530000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (14, N'open5', 1, 3, 3, CAST(N'2016-02-09 05:11:22.7000000' AS DateTime2), CAST(N'2016-02-09 05:11:29.9200000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (15, N'reopen5', 1, 3, NULL, CAST(N'2016-02-09 06:19:52.5030000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (16, N'reopen7', 1, 3, 3, CAST(N'2016-02-09 06:21:13.6770000' AS DateTime2), CAST(N'2016-02-09 06:21:20.4700000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (17, N'test75', 1, 3, 3, CAST(N'2016-02-09 06:53:45.4330000' AS DateTime2), CAST(N'2016-02-09 06:53:52.3900000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (18, N'Megha', 1, 3, 3, CAST(N'2016-02-09 07:02:11.7770000' AS DateTime2), CAST(N'2016-02-10 05:25:34.5600000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, N'Megha', 0, 3, 3, CAST(N'2016-02-10 02:07:34.5100000' AS DateTime2), CAST(N'2016-02-10 04:11:18.1770000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, N'Megha', 0, 3, 3, CAST(N'2016-02-10 05:20:50.3930000' AS DateTime2), CAST(N'2016-02-10 05:21:29.7530000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (22, N'reissue', 1, 86, NULL, CAST(N'2016-02-10 05:49:02.9100000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, N'raman', 1, 86, 86, CAST(N'2016-02-10 08:46:41.5130000' AS DateTime2), CAST(N'2016-02-10 08:46:50.7230000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, N'reclose', 0, 115, 115, CAST(N'2016-02-11 04:10:57.0330000' AS DateTime2), CAST(N'2016-02-11 04:11:10.6800000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, N'repone5', 1, 115, 115, CAST(N'2016-02-11 05:05:15.9430000' AS DateTime2), CAST(N'2016-02-11 05:05:23.3170000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (26, N'rder', 1, 115, 115, CAST(N'2016-02-11 08:28:14.4470000' AS DateTime2), CAST(N'2016-02-11 08:28:23.5630000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, N'abcd', 0, 115, 115, CAST(N'2016-02-20 01:54:34.6770000' AS DateTime2), CAST(N'2016-02-20 01:54:43.8970000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, N'afsdf', 1, NULL, NULL, CAST(N'2016-02-22 06:24:07.9400000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (29, N'hmmmss', 1, NULL, NULL, CAST(N'2016-02-22 06:25:03.6170000' AS DateTime2), CAST(N'2016-02-23 06:35:18.2500000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (30, N'tikudi', 0, 115, NULL, CAST(N'2016-02-23 06:26:44.6900000' AS DateTime2), CAST(N'2016-02-23 08:53:02.3300000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (31, N'sujal', 1, 115, NULL, CAST(N'2016-02-23 08:53:15.8570000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (32, N'see', 1, 115, NULL, CAST(N'2016-03-08 00:19:10.4600000' AS DateTime2), CAST(N'2016-03-08 02:31:45.7500000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (33, N'admin', 0, 115, NULL, CAST(N'2016-03-08 02:32:39.8230000' AS DateTime2), CAST(N'2016-03-08 02:33:16.6830000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (34, N'kin', 1, 115, NULL, CAST(N'2016-03-08 02:33:26.0600000' AS DateTime2), NULL)
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (35, N'efdsfdsf', 1, 115, NULL, CAST(N'2016-03-08 02:33:34.3970000' AS DateTime2), CAST(N'2016-03-08 04:58:46.4230000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (36, N'ffffg', 0, 115, NULL, CAST(N'2016-03-09 05:11:55.8900000' AS DateTime2), CAST(N'2016-03-09 05:12:04.6930000' AS DateTime2))
INSERT [dbo].[MST_IssueType] ([IssueTypeID], [IssueType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (37, N'Task', 1, 107, NULL, CAST(N'2016-11-28 02:55:38.9270000' AS DateTime2), CAST(N'2016-11-28 02:56:15.6570000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[MST_IssueType] OFF
SET IDENTITY_INSERT [dbo].[MST_Menus] ON 

INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (1, N'Admin', 0, NULL, 1, 1, 98, NULL, CAST(N'2016-03-08 02:49:27.750' AS DateTime), 1)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (2, N'Ticket', 0, NULL, 1, 1, NULL, NULL, NULL, 2)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (5, N'User', 0, NULL, 1, 1, 98, NULL, CAST(N'2016-03-08 02:49:36.190' AS DateTime), 3)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (7, N'Project', 1, N'../project/Project', 1, 1, 98, NULL, CAST(N'2016-11-24 08:40:08.040' AS DateTime), 4)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (8, N'Module', 1, N'../Module/Modules', 1, 1, 1, NULL, NULL, 5)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (9, N'User Type', 1, N'../UserType/UserType', 1, 1, 98, NULL, CAST(N'2016-03-08 04:59:37.173' AS DateTime), 6)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (10, N'Issue Type', 1, N'../IssueTypes/IssueTypes', 1, 1, 98, NULL, CAST(N'2016-02-23 08:32:42.260' AS DateTime), 7)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (11, N'Ticket Status', 1, N'../TicketStatus/TicketStatus', 1, 1, NULL, NULL, NULL, 8)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (12, N'Menu', 1, N'../Menus/Menu', 1, 1, 98, NULL, CAST(N'2016-11-24 05:15:40.710' AS DateTime), 9)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (13, N'Add Ticket', 1, N'../Tickets/TicketsEdit', 1, 1, 98, NULL, CAST(N'2016-11-24 08:40:48.267' AS DateTime), 10)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (14, N'Search', 2, N'../Tickets/Search', 1, 1, 98, NULL, CAST(N'2016-03-08 02:55:10.133' AS DateTime), 15)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (15, N'Profile', 5, N'../Users/UserProfile', 1, 1, 107, NULL, CAST(N'2016-11-28 04:07:53.167' AS DateTime), 12)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (40, N'Rights management', 1, N'../RightsManagement/Rights', 1, 1, 98, CAST(N'2016-02-23 02:36:56.343' AS DateTime), CAST(N'2016-03-08 02:56:05.490' AS DateTime), 11)
INSERT [dbo].[MST_Menus] ([MenuID], [MenuName], [ParentID], [MenuPage], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date], [Sequence]) VALUES (52, N'Add User', 5, N'../Users/Users', 1, 107, 107, CAST(N'2016-11-28 04:08:54.000' AS DateTime), CAST(N'2016-11-28 04:10:29.180' AS DateTime), 16)
SET IDENTITY_INSERT [dbo].[MST_Menus] OFF
SET IDENTITY_INSERT [dbo].[MST_Modules] ON 

INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, 3, N'Module1', N'M.0.0.1', 1, 1, NULL, CAST(N'2016-02-03 08:24:44.9570000' AS DateTime2), CAST(N'2016-02-19 08:17:38.2800000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, 3, N'Module21', N'M.0.2', 1, 1, 86, CAST(N'2016-02-03 08:24:44.9570000' AS DateTime2), CAST(N'2016-02-10 06:11:58.5070000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, 12, N'Module34', N'M.0.34', 1, 1, 86, CAST(N'2016-02-03 08:26:25.9400000' AS DateTime2), CAST(N'2016-02-10 06:11:32.3800000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, 3, N'Module44', N'M.0.4', 1, 1, 86, CAST(N'2016-02-04 00:20:13.2870000' AS DateTime2), CAST(N'2016-02-10 06:10:40.7270000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, 3, N'Module5', N'M.0.5', 0, 1, 1, CAST(N'2016-02-04 00:20:31.3830000' AS DateTime2), CAST(N'2016-02-04 00:20:31.3830000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, 6, N'Module6', N'M.0.6', 0, 1, 1, CAST(N'2016-02-04 00:20:45.7200000' AS DateTime2), CAST(N'2016-02-04 00:20:45.7200000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, 7, N'Module7', N'M.0.7', 0, 1, 1, CAST(N'2016-02-04 00:21:04.6270000' AS DateTime2), CAST(N'2016-02-04 00:21:04.6270000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, 8, N'Module8', N'M.0.8', 1, 1, 1, CAST(N'2016-02-04 00:21:17.6630000' AS DateTime2), CAST(N'2016-02-04 00:21:17.6630000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, 25, N'Module9', N'M.0.9', 1, 1, 1, CAST(N'2016-02-04 00:21:39.4100000' AS DateTime2), CAST(N'2016-02-08 02:39:09.4330000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (10, 9, N'Module10', N'M.0.10', 1, 1, 1, CAST(N'2016-02-04 00:22:02.3770000' AS DateTime2), CAST(N'2016-02-08 02:37:10.9900000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, 1, N'kushal', N'Goswami', 1, 99, NULL, CAST(N'2016-02-19 08:59:57.4630000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, 23, N'Test', N'v.0.01', 1, NULL, NULL, CAST(N'2016-02-19 09:01:23.3170000' AS DateTime2), CAST(N'2016-02-19 09:01:49.1130000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, 1, N'test123', N'v.0.0.3123', 1, NULL, 0, CAST(N'2016-02-20 00:20:00.1000000' AS DateTime2), CAST(N'2016-02-22 05:50:21.9930000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, 20, N'Mod123', N'123', 0, 0, 99, CAST(N'2016-02-22 05:50:40.4830000' AS DateTime2), CAST(N'2016-02-25 00:42:04.7800000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, 15, N'dfghfgh', N'fdhfgh', 0, 99, NULL, CAST(N'2016-02-26 07:46:44.9470000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, 16, N'ddddddddddd', N'Mo.0.0.1', 1, 98, 98, CAST(N'2016-02-29 00:30:52.0630000' AS DateTime2), CAST(N'2016-02-29 00:31:09.7730000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (26, 28, N'Chart', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 01:57:48.8870000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, 28, N'ICD', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 01:58:04.4770000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, 28, N'Allergy', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 01:58:24.9530000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (29, 28, N'Screening Intervention', N'6.0.8', 0, 107, NULL, CAST(N'2016-02-29 01:59:07.5300000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (30, 28, N'Medication', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 01:59:27.5630000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (31, 28, N'Lab', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 02:00:10.5500000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (32, 29, N'Message', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 02:02:19.8470000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (33, 29, N'Patient Registration', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 02:02:43.1800000' AS DateTime2), NULL)
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (34, 29, N'XRay', N'5.0.1', 1, 99, 107, CAST(N'2016-03-08 02:45:35.4230000' AS DateTime2), CAST(N'2016-11-24 08:31:29.5870000' AS DateTime2))
INSERT [dbo].[MST_Modules] ([ModuleID], [ProjectID], [ModuleName], [ModuleVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (35, 45, N'Support Ticket', N'0001', 1, 107, NULL, CAST(N'2016-11-28 02:58:57.6900000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[MST_Modules] OFF
SET IDENTITY_INSERT [dbo].[MST_Projects] ON 

INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, N'Project44', N'V.0.2.44', 0, NULL, 99, CAST(N'2016-02-17 06:24:29.3330000' AS DateTime2), CAST(N'2016-02-24 09:03:05.8670000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, N'Project43', N'V.0.2.1', 1, NULL, NULL, CAST(N'2016-02-17 06:39:32.3270000' AS DateTime2), CAST(N'2016-02-18 04:06:28.6130000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, N'Project51', N'V.0.2.2', 1, 1, NULL, CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2), CAST(N'2016-02-11 06:36:54.0570000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, N'Project47', N'v.0.2.2.3', 1, NULL, NULL, CAST(N'2016-02-17 06:41:35.1270000' AS DateTime2), CAST(N'2016-02-17 06:41:50.7130000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, N'Project49', N'v.0.2.2.3', 0, NULL, NULL, CAST(N'2016-02-19 02:18:03.1000000' AS DateTime2), CAST(N'2016-02-19 04:13:33.8900000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, N'Project6', N'V.0.5', 1, 1, 1, CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2), CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, N'Project7', N'V.0.6', 0, 1, 1, CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2), CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, N'Project8', N'V.0.7', 1, 1, 1, CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2), CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, N'Project10', N'V.0.10', 1, 1, NULL, CAST(N'2016-02-02 08:42:01.6700000' AS DateTime2), CAST(N'2016-02-11 06:16:31.2200000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (11, N'Project11', N'V.0.11', 0, 1, 1, CAST(N'2016-02-03 04:10:20.0800000' AS DateTime2), CAST(N'2016-02-03 04:11:02.3900000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (12, N'Project12', N'V.0.12', 1, 1, 1, CAST(N'2016-02-03 04:10:36.6130000' AS DateTime2), CAST(N'2016-02-03 06:17:58.4100000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (13, N'Testabcv', N'v.0.1.1', 1, NULL, NULL, CAST(N'2016-02-19 04:09:31.7330000' AS DateTime2), CAST(N'2016-02-19 04:10:43.9370000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (14, N'Project13', N'V.0.13', 0, 1, 1, CAST(N'2016-02-03 04:48:36.3470000' AS DateTime2), CAST(N'2016-02-03 04:48:36.3470000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (15, N'Project15', N'V.0.15', 1, 1, 1, CAST(N'2016-02-03 04:52:41.0700000' AS DateTime2), CAST(N'2016-02-03 06:41:52.9370000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (16, N'Project16', N'V.0.16', 1, 1, 1, CAST(N'2016-02-03 06:30:11.0830000' AS DateTime2), CAST(N'2016-02-06 05:01:35.1000000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (17, N'Project17', N'V.0.17', 0, 1, 1, CAST(N'2016-02-03 06:53:52.3330000' AS DateTime2), CAST(N'2016-02-05 02:39:39.8630000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (18, N'Test1', N'Test1', 1, NULL, NULL, CAST(N'2016-02-19 08:41:03.4800000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, N'Project18', N'V.0.18', 1, NULL, 1, CAST(N'2016-02-05 07:56:12.9000000' AS DateTime2), CAST(N'2016-02-06 05:13:32.3400000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, N'ddddddddddd', N'dddddddddd', 1, 99, NULL, CAST(N'2016-02-19 08:43:11.0530000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, N'nnnnnnnnnnnnnn', N'nnnnnnnnnn', 1, 99, NULL, CAST(N'2016-02-19 08:44:08.4730000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (22, N'mmmmmmmmmmm', N'mmmmmmmmmm', 1, 99, NULL, CAST(N'2016-02-19 08:44:46.9530000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, N'Project333', N'v.0.01', 0, NULL, NULL, CAST(N'2016-02-19 09:00:47.8530000' AS DateTime2), CAST(N'2016-02-19 09:01:04.9330000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, N'dfhgfgggg', N'ggggg', 1, 0, NULL, CAST(N'2016-02-22 05:05:03.8070000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, N'KKR99', N'KKR.0.12', 1, 99, NULL, CAST(N'2016-02-26 07:44:09.7500000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, N'Prj 101', N'Pro.0.0.2', 0, 98, 98, CAST(N'2016-02-29 00:29:25.3700000' AS DateTime2), CAST(N'2016-02-29 00:29:38.9830000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, N'Geesemed', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 01:57:17.0000000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (29, N'Patient Portal', N'6.0.8', 1, 107, NULL, CAST(N'2016-02-29 02:01:43.4200000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (30, N'asdfasdf', N'asdfsdaf', 1, 99, NULL, CAST(N'2016-02-29 04:30:13.6600000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (31, N'asdfdsfddddd', N'dddddd', 1, 99, NULL, CAST(N'2016-03-04 01:08:41.7000000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (32, N'bbbbb', N'bbbb', 1, 99, NULL, CAST(N'2016-03-04 01:08:54.2430000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (33, N'New Portal', N'1.0', 0, 98, 98, CAST(N'2016-03-07 04:41:36.8570000' AS DateTime2), CAST(N'2016-03-07 04:42:07.1630000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (34, N'abc', N'a.02', 1, 115, NULL, CAST(N'2016-03-08 02:23:15.1170000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (35, N'Project11211123', N'P.00.00', 1, 99, 98, CAST(N'2016-03-08 02:37:56.4100000' AS DateTime2), CAST(N'2016-03-09 05:08:22.0600000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (36, N'test', N'test', 1, 98, NULL, CAST(N'2016-03-10 06:39:32.0370000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (37, N'qwe', N'qwe', 0, 98, 99, CAST(N'2016-03-11 04:38:12.8930000' AS DateTime2), CAST(N'2016-03-11 05:33:55.7300000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (38, N'awerew', N'werwrew', 0, 99, NULL, CAST(N'2016-03-11 05:56:30.5830000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (39, N'123', N'123', 0, 99, NULL, CAST(N'2016-03-11 06:38:39.5930000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (40, N'gggggg', N'ertret', 0, 99, 98, CAST(N'2016-03-11 07:16:36.1400000' AS DateTime2), CAST(N'2016-03-11 07:43:43.0370000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (41, N'new123', N'ertret', 1, 98, 98, CAST(N'2016-03-11 07:43:52.2470000' AS DateTime2), CAST(N'2016-11-24 05:59:07.9300000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (42, N'kkk', N'kkkkk', 0, 107, NULL, CAST(N'2016-11-24 06:17:03.8070000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (43, N'Bruce', N'Bruce123', 1, 107, NULL, CAST(N'2016-11-24 06:24:41.3370000' AS DateTime2), NULL)
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (44, N'dfghgfdg', N'vvvvvv', 1, 107, 107, CAST(N'2016-11-24 06:34:51.6030000' AS DateTime2), CAST(N'2016-11-24 07:10:21.3630000' AS DateTime2))
INSERT [dbo].[MST_Projects] ([ProjectID], [ProjectName], [ProjectVer], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (45, N'Support Ticket', N'0001', 1, 107, 107, CAST(N'2016-11-24 07:20:31.0130000' AS DateTime2), CAST(N'2016-11-28 03:24:13.1600000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[MST_Projects] OFF
SET IDENTITY_INSERT [dbo].[MST_Rights] ON 

INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, 2, 7, 1, 98, 98, CAST(N'2016-02-29 02:58:55.837' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, 2, 8, 1, 98, 98, CAST(N'2016-02-29 02:58:55.867' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, 2, 9, 1, 98, 98, CAST(N'2016-02-29 02:58:55.873' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, 2, 10, 1, 98, 98, CAST(N'2016-02-29 02:58:55.880' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, 2, 11, 1, 98, 98, CAST(N'2016-02-29 02:58:55.887' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, 2, 12, 0, 98, 98, CAST(N'2016-02-29 02:58:55.893' AS DateTime), CAST(N'2016-03-08 01:55:35.327' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, 2, 40, 0, 98, 98, CAST(N'2016-02-29 02:58:55.900' AS DateTime), CAST(N'2016-03-08 01:55:35.327' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, 2, 13, 1, 98, 98, CAST(N'2016-02-29 02:58:55.910' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (10, 2, 14, 1, 98, 98, CAST(N'2016-02-29 02:58:55.917' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (11, 1, 7, 1, 98, 107, CAST(N'2016-02-29 02:59:25.267' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (12, 1, 7, 1, 98, 107, CAST(N'2016-02-29 02:59:25.273' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (13, 1, 8, 1, 98, 107, CAST(N'2016-02-29 02:59:25.280' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (14, 1, 9, 1, 98, 107, CAST(N'2016-02-29 02:59:25.290' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (15, 1, 10, 1, 98, 107, CAST(N'2016-02-29 02:59:25.297' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (16, 1, 11, 1, 98, 107, CAST(N'2016-02-29 02:59:25.303' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (17, 1, 12, 1, 98, 107, CAST(N'2016-02-29 02:59:25.310' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (18, 1, 40, 1, 98, 107, CAST(N'2016-02-29 02:59:25.320' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, 1, 13, 1, 98, 107, CAST(N'2016-02-29 02:59:25.327' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, 1, 14, 1, 98, 107, CAST(N'2016-02-29 02:59:25.333' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, 1, 15, 1, 98, 107, CAST(N'2016-02-29 02:59:25.340' AS DateTime), CAST(N'2016-11-28 04:02:36.680' AS DateTime))
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (22, 3, 13, 1, 98, NULL, CAST(N'2016-03-01 01:34:12.507' AS DateTime), NULL)
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, 3, 14, 1, 98, NULL, CAST(N'2016-03-01 01:34:12.510' AS DateTime), NULL)
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, 3, 15, 1, 98, NULL, CAST(N'2016-03-01 01:34:12.520' AS DateTime), NULL)
INSERT [dbo].[MST_Rights] ([RightsID], [UserTypeID], [MenuID], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, 2, 15, 1, 98, 98, CAST(N'2016-03-02 05:24:18.380' AS DateTime), CAST(N'2016-03-08 01:55:35.320' AS DateTime))
SET IDENTITY_INSERT [dbo].[MST_Rights] OFF
SET IDENTITY_INSERT [dbo].[MST_TicketStatus] ON 

INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, N'Closed', 1, 2, 107, CAST(N'2016-02-05 01:43:08.0370000' AS DateTime2), CAST(N'2016-11-28 03:13:17.2600000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, N'Resolved', 1, 2, 99, CAST(N'2016-02-05 01:43:21.3430000' AS DateTime2), CAST(N'2016-03-09 05:04:50.7600000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, N'Waiting For Third Party Response', 1, 2, 107, CAST(N'2016-02-05 01:43:29.0800000' AS DateTime2), CAST(N'2016-11-28 03:13:57.6500000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, N'Recurring', 1, 2, 107, CAST(N'2016-02-05 01:43:44.6100000' AS DateTime2), CAST(N'2016-11-28 02:46:38.1430000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, N'InProcess', 1, 2, 107, CAST(N'2016-02-05 01:43:57.3800000' AS DateTime2), CAST(N'2016-11-28 02:46:06.2570000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, N'New', 1, 107, 107, CAST(N'2016-11-23 09:23:48.3330000' AS DateTime2), CAST(N'2016-11-28 02:47:15.2770000' AS DateTime2))
INSERT [dbo].[MST_TicketStatus] ([TicketStatusID], [TicketStatus], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, N'Approved', 1, 107, NULL, CAST(N'2016-11-28 03:14:15.4100000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[MST_TicketStatus] OFF
SET IDENTITY_INSERT [dbo].[MST_Users] ON 

INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, 1, N'Vadminws', N'Vadmins1', N'Vendor', N'Admins', N'jigarp@mdofficemanager.com', 88888888889, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (82, 3, N'sitasdf', N'sitadfd', N'sitasdf', N'lohanasdf', N'sita@yahoos.com', 1234567891, 1, 3, 3, CAST(N'2016-02-10 00:12:31.3270000' AS DateTime2), CAST(N'2016-02-10 05:15:42.0930000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (83, 1, N'sersrdf', N'weredf', N'weredf', N'wererdf', N'we@yahood.com', 1234567890, 1, 3, 3, CAST(N'2016-02-10 00:59:56.4000000' AS DateTime2), CAST(N'2016-02-10 05:01:36.2700000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (84, 3, N'gita1', N'gita1', N'gita1', N'gita1', N'gita@gmail1.com', 123456789, 1, 3, 3, CAST(N'2016-02-10 04:57:19.8030000' AS DateTime2), CAST(N'2016-02-10 05:19:17.7200000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (85, 3, N'kirtan', N'kirtan', N'kirtan', N'kambli', N'kambli@gmail.com', 1234567866, 1, 3, 107, CAST(N'2016-02-10 04:59:54.3630000' AS DateTime2), CAST(N'2016-02-11 05:12:36.6900000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (86, 1, N'Megha', N'megha', N'Megha', N'Thakkar', N'megha@gmail.com', 3535436456, 1, 3, 115, CAST(N'2016-02-10 05:34:00.3170000' AS DateTime2), CAST(N'2016-03-08 00:29:43.6100000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (87, 2, N'k', N'123', N'kruti', N'dave', N'kruti@gmail.com', 234343451, 1, 86, 86, CAST(N'2016-02-10 05:58:48.9370000' AS DateTime2), CAST(N'2016-02-10 06:46:56.7270000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (88, 3, N'vinits', N'vinits', N'vinits', N'vinits', N'vinits@jkjl.com', 23423434, 1, 86, 86, CAST(N'2016-02-10 06:34:56.8200000' AS DateTime2), CAST(N'2016-02-10 06:36:24.1470000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (89, 2, N'sdfdsf', N'dfdf', N'sdfdf', N'sdfds', N'sdfds@sdff.com', 234234234, 1, 86, NULL, CAST(N'2016-02-10 06:57:31.8530000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (90, 2, N'Beena', N'beena', N'beena', N'beena', N'beena@gmail.com', 1243243434, 1, 86, 86, CAST(N'2016-02-10 06:59:53.6500000' AS DateTime2), CAST(N'2016-02-10 07:00:00.7930000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (91, 3, N'krishna', N'krishna', N'krishna', N'krishan', N'krishna@gmail.com', 234234324, 1, 1, NULL, CAST(N'2016-02-10 07:06:24.0500000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (92, 3, N'dsfdsf', N'sfdsf', N'sdfsdf', N'sdfdsf', N'sdf@gmail.com', 1312423434, 1, 86, NULL, CAST(N'2016-02-10 07:20:48.9500000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (93, 1, N'nitin2', N'sdfdsf', N'3w435', N'345435', N'3454@df.com', 2132343243, 1, 86, 86, CAST(N'2016-02-10 07:24:25.7670000' AS DateTime2), CAST(N'2016-02-10 07:26:56.8800000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (94, 2, N'kamal', N'kamal', N'kamal', N'kamala', N'kamal@supara.com', 1234234234, 1, 86, 86, CAST(N'2016-02-10 07:27:32.6970000' AS DateTime2), CAST(N'2016-02-10 07:28:11.9470000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (95, 2, N'kajal', N'kajal', N'sdfdsf', N'sdfdsf', N'sfsd@gg.com', 2123423432, 1, 86, 86, CAST(N'2016-02-10 07:30:36.2630000' AS DateTime2), CAST(N'2016-02-10 07:31:32.7930000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (96, 2, N'Rina', N'sdfdsf', N'sdfsdf', N'sdfds', N'sf@fdf.com', 1231232132, 1, 86, 86, CAST(N'2016-02-10 07:39:46.5170000' AS DateTime2), CAST(N'2016-02-10 07:40:00.1270000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (97, 2, N'harsh', N'harsh', N'HARSH', N'HARSH', N'HARSH@GMAIL.COM', 2112423432, 1, 86, NULL, CAST(N'2016-02-10 07:40:31.0630000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (98, 1, N'SONAL', N'sonal', N'sonal', N'sonal', N'sonal@yahoo.com', 2123423432, 1, 86, NULL, CAST(N'2016-02-10 07:41:05.6800000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (99, 2, N'kushal', N'123', N'khusali', N'dave', N'khushali@gmail.com', 2132323233, 1, 86, 1, CAST(N'2016-02-10 07:42:42.0200000' AS DateTime2), CAST(N'2016-03-08 00:33:59.7170000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (100, 2, N'Arti', N'Arti', N'arti', N'pandya', N'arti@gmail.com', 213243435, 1, 86, NULL, CAST(N'2016-02-10 07:47:44.6570000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (101, 2, N'vaidehi', N'vaidehi', N'vaidehi', N'vaidehi', N'vedehi@gmail.com', 1232123432, 1, 86, NULL, CAST(N'2016-02-10 07:48:46.5730000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (102, 3, N'vibah', N'vibha', N'viabha', N'vibha', N'viabha@gmail.com', 1224242423, 1, 86, NULL, CAST(N'2016-02-10 07:51:20.3070000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (103, 3, N'vibah', N'vibha', N'viabha', N'vibha', N'vibha@gmail.com', 1422342342, 1, 86, NULL, CAST(N'2016-02-10 07:53:02.7130000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (104, 3, N'vandanA', N'vandana', N'vandana', N'vandana', N'vandana@gmail.com', 1322132321, 1, 86, NULL, CAST(N'2016-02-10 07:53:56.1300000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (105, 3, N'mohan', N'mohan', N'mohan', N'mohan', N'mohan@gmail.com', 2123423432, 1, 86, NULL, CAST(N'2016-02-10 07:56:09.3670000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (106, 2, N'damyanti', N'damyanati', N'damyanti1', N'Thakkar', N'damyanti@gmail.com', 1232343423, 1, 86, NULL, CAST(N'2016-02-10 07:59:50.0470000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (107, 1, N'Demo', N'demo', N'Demos', N'Demos', N'peter@medivoxx.com', 1234567890, 1, 90, NULL, CAST(N'2016-02-10 08:01:38.9400000' AS DateTime2), CAST(N'2016-03-02 01:54:21.3000000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (108, 2, N'yahvi', N'yashvi', N'yashvi', N'yashvi', N'yashvi@gmail.com', 1321323423, 1, 86, NULL, CAST(N'2016-02-10 08:09:28.5900000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (109, 2, N'neel', N'neel', N'neel', N'thakkar', N'neel@gmail.com', 1231212123, 1, 86, NULL, CAST(N'2016-02-10 08:16:49.8500000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (110, 2, N'neelkanth', N'neelkanth', N'neelkantha', N'daxini', N'neelkanth@gmail.com', 1223423423, 1, 86, NULL, CAST(N'2016-02-10 08:18:07.3300000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (111, 2, N'payal', N'payal', N'payal', N'daxini', N'payal@gmail.com', 1212342343, 1, 86, NULL, CAST(N'2016-02-10 08:23:33.6900000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (112, 2, N'kailahs', N'kailash', N'kailash', N'kailash', N'kailash@gmail.com', 1231234323, 1, 86, NULL, CAST(N'2016-02-10 08:27:10.3170000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (113, 2, N'Gunvant', N'gunavant', N'GUNVANT', N'halani', N'gunavant@gmail.com', 1212223434, 1, 86, NULL, CAST(N'2016-02-10 08:28:04.0630000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (114, 2, N'rsohni', N'roshni', N'roshani', N'halani', N'rsohani@gmail.com', 1313232332, 1, 86, NULL, CAST(N'2016-02-10 08:28:50.8270000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (115, 2, N'admin', N'admin', N'admin', N'admin', N'admin@gmail.com', 1231231277, 1, 86, NULL, CAST(N'2016-02-10 08:34:35.2900000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (116, 2, N'kamini', N'kamini', N'kamini', N'pandya', N'kamini@gmail.com', 1423324344, 1, 115, NULL, CAST(N'2016-02-11 00:22:31.5300000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (117, 3, N'kavita', N'kavita', N'kavita', N'shrivastav', N'kavita@gmail.com', 1312232323, 1, 115, NULL, CAST(N'2016-02-11 00:36:07.7600000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (118, 2, N'upendra', N'upendra', N'upendra', N'joshi', N'upendra@gmail.com', 2123423432, 1, 115, NULL, CAST(N'2016-02-11 00:53:48.1270000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (119, 3, N'preety', N'preety', N'preety', N'parmar', N'preety@gmail.com', 1231323232, 1, 115, NULL, CAST(N'2016-02-11 00:56:43.8130000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (120, 1, N'namee', N'namee', N'namee', N'jani', N'namee@YAHOO.COM', 1234232343, 1, 115, NULL, CAST(N'2016-02-11 00:58:55.7430000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (121, 1, N'rahulq', N'rahul', N'rahul', N'shukala', N'rahul@gmail.com', 2424234343, 1, 115, NULL, CAST(N'2016-02-11 01:00:59.0200000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (122, 2, N'vipshA', N'vispsha', N'vipsha', N'solution', N'vipsha@gmail.com', 2143244344, 1, 115, 115, CAST(N'2016-02-11 01:01:46.8500000' AS DateTime2), CAST(N'2016-02-11 01:02:11.8430000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (123, 2, N'vishakha', N'vishakha', N'vishakha', N'halani', N'vishakha@gmail.com', 3424324323, 1, 115, 115, CAST(N'2016-02-11 01:02:57.7700000' AS DateTime2), CAST(N'2016-02-11 01:04:02.2770000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (124, 2, N'ragini', N'raginia', N'ragini', N'rafsdfds', N'ragini@gmail.com', 2324343445, 1, 115, 115, CAST(N'2016-02-11 01:05:19.3000000' AS DateTime2), CAST(N'2016-02-11 01:05:31.6930000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (125, 2, N'hitesh', N'hitesh', N'hitesh', N'thakkar', N'hitesh@gmail.com', 4233243434, 1, 115, NULL, CAST(N'2016-02-11 01:06:29.5900000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (126, 2, N'hitendra', N'hitendra', N'hitendra', N'shah', N'hitendra@gmail.com', 2312323232, 1, 115, NULL, CAST(N'2016-02-11 01:07:34.3800000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (127, 3, N'vishi', N'vidhi', N'vidhi', N'gnadhi', N'vidhi@gmail.com', 2342334343, 1, 115, NULL, CAST(N'2016-02-11 01:11:37.9030000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (128, 2, N'mayur', N'mayur', N'mayur', N'jija', N'mayur@gmail.com', 2342343434, 1, 115, NULL, CAST(N'2016-02-11 01:14:15.1770000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (136, 2, N'Deepika', N'shukala', N'deepika', N'shukala', N'dfsdf@gmail.com', 1343434343, 1, 115, 115, CAST(N'2016-02-11 04:03:44.8670000' AS DateTime2), CAST(N'2016-03-08 00:26:28.2530000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (137, 2, N'Deepaj', N'janij', N'deepaj', N'janij', N'wqe@gmial.com', 1312231323, 1, 115, 115, CAST(N'2016-02-11 04:06:05.1400000' AS DateTime2), CAST(N'2016-03-08 02:30:28.7600000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (138, 2, N'pintoo', N'pintoo', N'pintoo', N'daxini', N'ddd@gmail.com', 2243432434, 1, 115, 115, CAST(N'2016-02-11 04:42:01.1330000' AS DateTime2), CAST(N'2016-03-08 00:27:03.1370000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (139, 2, N'manishs', N'manish1s', N'manishs', N'Thakkars', N'mmv@gmal.com', 2423233245, 1, 115, 115, CAST(N'2016-02-11 05:07:11.6070000' AS DateTime2), CAST(N'2016-03-08 00:39:30.8600000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (140, 3, N'Ruchi', N'Ruchi', N'ruchi', N'Patel', N'ruchi@gmail.com', 2424324343, 0, 115, 115, CAST(N'2016-02-11 05:16:06.5300000' AS DateTime2), CAST(N'2016-03-08 00:26:35.5200000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (141, 2, N'mayas', N'mayas', N'mayas', N'shangvis', N'mayas@gfmail.com', 1234567891, 1, 115, 115, CAST(N'2016-02-11 07:09:03.9800000' AS DateTime2), CAST(N'2016-03-08 02:18:00.4800000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (142, 1, N'meenas', N'meeenas', N'meenas', N'meenas', N'meens@gmail.com', 2132132324, 0, 115, 115, CAST(N'2016-02-17 07:12:50.7730000' AS DateTime2), CAST(N'2016-03-08 00:37:52.0870000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (143, 2, N'ravinas', N'ravinas', N'ravinas', N'ravinas', N'ravins@gmail.com', 2132423343, 1, 115, 115, CAST(N'2016-02-17 07:18:43.1870000' AS DateTime2), CAST(N'2016-03-08 00:28:09.7230000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (144, 6, N'test', N'test', N'test', N'test', N'test@gmail.com', 1232423434, 1, 115, 115, CAST(N'2016-02-20 01:39:16.0770000' AS DateTime2), CAST(N'2016-02-20 01:39:26.6170000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (145, 5, N'chintan1', N'chitan1', N'chitan1', N'chintan1', N'2ersd1@gmail.com', 2342423431, 0, 115, 115, CAST(N'2016-02-22 02:06:31.6600000' AS DateTime2), CAST(N'2016-02-22 02:09:38.0900000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (146, 6, N'abc1', N'abc1', N'abc1', N'abc1', N'abc1@gmail.com', 1312321322, 0, NULL, NULL, CAST(N'2016-02-23 01:54:06.6300000' AS DateTime2), CAST(N'2016-02-23 01:54:39.1570000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (147, 4, N'Ratilal1', N'ratilal1', N'ratilal1', N'ratilal1', N'rr1@gmail.com', 2234234321, 0, 115, 115, CAST(N'2016-02-23 08:01:38.9400000' AS DateTime2), CAST(N'2016-02-23 08:02:18.5000000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (148, 6, N'test345', N'test345', N'test345', N'test345', N'test345@gmail.com', 1232234324, 1, 115, 115, CAST(N'2016-02-23 08:52:19.4300000' AS DateTime2), CAST(N'2016-02-23 08:52:40.8200000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (149, 1, N'Rahul', N'rahul', N'rahul', N'rahul', N'rahul@', 2343223454, 1, 115, NULL, CAST(N'2016-03-08 00:23:18.2200000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (150, 2, N'Deepika', N'padukoin', N'deepika', N'padukaon', N'deepika@gnail.com', 2324324324, 1, 115, NULL, CAST(N'2016-03-08 00:25:32.4130000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (151, 2, N'kuntis', N'kuntis', N'kuntis', N'kuntis', N'kuntis@gmail.com', 2342342343, 0, 115, 115, CAST(N'2016-03-08 00:40:25.5370000' AS DateTime2), CAST(N'2016-03-08 02:29:33.9570000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (152, 2, N'tithi', N'tithi', N'tithi', N'tithi', N'tithi@gmail.com', 3453454545, 1, 115, NULL, CAST(N'2016-03-08 02:31:28.0170000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (153, 2, N'dsfdsfd', N'sdfdsfd', N'dfdsfd', N'dfd', N'sdfd@gmail.com', 4234324328, 0, 115, 115, CAST(N'2016-03-09 05:17:40.4000000' AS DateTime2), CAST(N'2016-03-09 05:17:56.3270000' AS DateTime2))
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (154, 1, N'Peter', N'Peter', N'Peter', N'Parker', N'peter@medivoxx.com', 50221264, 1, 107, NULL, CAST(N'2016-11-28 04:12:03.6330000' AS DateTime2), NULL)
INSERT [dbo].[MST_Users] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [Email], [Phone], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (155, 1, N'Gary', N'Gary', N'Gary', N'Smith', N'gary@medivoxx.com', 5022126430, 1, 107, NULL, CAST(N'2016-11-28 04:12:52.6300000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[MST_Users] OFF
SET IDENTITY_INSERT [dbo].[MST_UserType] ON 

INSERT [dbo].[MST_UserType] ([UserTypeID], [UserType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, N'VendorAdmin', 1, 69, 99, CAST(N'2016-02-09 06:12:23.2130000' AS DateTime2), CAST(N'2016-03-09 05:04:41.1270000' AS DateTime2))
INSERT [dbo].[MST_UserType] ([UserTypeID], [UserType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, N'SupportAdmin', 1, 69, NULL, CAST(N'2016-02-09 06:12:33.3030000' AS DateTime2), NULL)
INSERT [dbo].[MST_UserType] ([UserTypeID], [UserType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, N'Users', 1, 69, NULL, CAST(N'2016-02-09 06:12:42.2700000' AS DateTime2), CAST(N'2016-02-18 04:09:11.3530000' AS DateTime2))
INSERT [dbo].[MST_UserType] ([UserTypeID], [UserType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, N'asd', 0, 115, 99, CAST(N'2016-03-08 02:23:35.9830000' AS DateTime2), CAST(N'2016-03-09 02:47:03.2070000' AS DateTime2))
INSERT [dbo].[MST_UserType] ([UserTypeID], [UserType], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, N'Test', 1, 99, 98, CAST(N'2016-03-11 05:37:01.0430000' AS DateTime2), CAST(N'2016-11-24 08:38:16.2900000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[MST_UserType] OFF
SET IDENTITY_INSERT [dbo].[TRN_Tickets] ON 

INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (110, 2, 1, 19, 3, N'Urgent', 99, N'artiassign', N'artiassign', 1, 100, 99, CAST(N'2016-02-25 06:33:25.7330000' AS DateTime2), CAST(N'2016-03-08 01:42:25.3570000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (111, 2, 12, 3, 3, N'Normal', 99, N'ddfdf', N'sdfdf', 1, 100, 100, CAST(N'2016-02-25 06:36:11.8700000' AS DateTime2), CAST(N'2016-03-08 00:21:58.1800000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (112, 3, 9, 10, 7, N'Normal', 82, N'sfsdf', N'sdfdf sdfdsfsd', 1, 100, 100, CAST(N'2016-02-25 06:37:06.9770000' AS DateTime2), CAST(N'2016-03-02 02:53:32.9800000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (113, 4, 8, 8, 9, N'Normal', 88, N'sdsgd', N'dsgdfg', 1, 100, NULL, CAST(N'2016-02-25 06:38:14.5400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (114, 5, 8, 8, 11, N'Normal', 90, N'dsfsdfg', N'sdgdfg', 1, 100, NULL, CAST(N'2016-02-25 06:39:20.0800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (115, 2, 3, 1, 3, N'Normal', 99, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.
The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.
The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.
The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients', 1, 100, 100, CAST(N'2016-02-25 06:41:42.5730000' AS DateTime2), CAST(N'2016-03-08 01:44:12.5400000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (116, 1, 9, 10, 9, N'Normal', 93, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,
', N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', 1, 100, 100, CAST(N'2016-02-25 06:42:38.2970000' AS DateTime2), CAST(N'2016-03-02 02:54:07.8170000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (117, 1, 8, 8, 1, N'Normal', 94, N'affdsf', N'sdfdsf', 1, 100, NULL, CAST(N'2016-02-25 06:43:21.7800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (118, 2, 1, 19, 23, N'Normal', 99, N'sdfdsf', N'sdfsdf', 1, 100, 99, CAST(N'2016-02-25 06:44:03.4870000' AS DateTime2), CAST(N'2016-03-08 01:22:58.0500000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (119, 1, 3, 1, 13, N'Normal', 99, N' The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', 1, 100, 100, CAST(N'2016-02-25 06:45:11.0600000' AS DateTime2), CAST(N'2016-03-08 01:04:28.5730000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (120, 2, 9, 10, 17, N'Normal', 95, N'azsadf', N'szdfsdf', 1, 100, NULL, CAST(N'2016-02-25 06:47:07.6070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (121, 2, 1, 19, 10, N'Normal', 94, N'safsdfs', N'dfsdfds', 1, 100, NULL, CAST(N'2016-02-25 06:48:07.9270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (122, 2, 1, 19, 17, N'Normal', 96, N'dsfsf', N'sdfdsf', 1, 100, NULL, CAST(N'2016-02-25 06:49:05.2230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (123, 3, 9, 10, 15, N'Normal', 83, N'sdfsdf', N'sdf', 1, 100, NULL, CAST(N'2016-02-25 06:56:35.3770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (124, 3, 9, 10, 10, N'Normal', 82, N'sadfsdfs', N'fsdfdsf', 1, 100, NULL, CAST(N'2016-02-25 06:57:17.1200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (125, 3, 3, 1, 18, N'Normal', 95, N'sdfsdf', N'sdfsd', 1, 100, NULL, CAST(N'2016-02-25 07:03:04.4300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (126, 3, 9, 10, 8, N'High', 96, N'asdasd', N'zdssad', 1, 100, NULL, CAST(N'2016-02-25 07:03:38.4270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (127, 3, 9, 10, 4, N'Normal', 89, N'dfdfg', N'dfgdf', 1, 100, NULL, CAST(N'2016-02-25 07:04:12.9170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (128, 4, 12, 3, 6, N'Normal', 82, N'gsddfg', N'dfgdfg', 1, 100, NULL, CAST(N'2016-02-25 07:04:51.8800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (129, 4, 12, 3, 17, N'High', 83, N'sdzfsf', N'sdfds', 1, 100, NULL, CAST(N'2016-02-25 07:05:19.3970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (130, 4, 12, 3, 22, N'Normal', 96, N'dsdfg', N'dgdfg', 1, 100, NULL, CAST(N'2016-02-25 07:05:45.8930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (131, 4, 1, 19, 25, N'Normal', 84, N'xzfsdf', N'sdfds', 1, 100, NULL, CAST(N'2016-02-25 07:06:28.6730000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (132, 5, 8, 8, 7, N'Normal', 88, N'dsfdsf', N'sdfds', 1, 100, NULL, CAST(N'2016-02-25 07:09:03.0300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (133, 5, 1, 19, 6, N'Normal', 87, N'sdfdsf', N'sdfds', 1, 100, NULL, CAST(N'2016-02-25 07:10:08.9200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (134, 5, 12, 3, 16, N'Normal', 92, N'sdfdsf', N'sdfdsf', 1, 100, NULL, CAST(N'2016-02-25 07:10:32.4030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (135, 5, 3, 1, 16, N'Normal', 91, N'sdfsdf', N'sdfds', 1, 100, NULL, CAST(N'2016-02-25 07:11:00.1670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (136, 1, 12, 3, 1, N'Normal', 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', 1, 99, 100, CAST(N'2016-02-25 07:12:55.1900000' AS DateTime2), CAST(N'2016-03-08 01:33:34.9700000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (137, 1, 3, 1, 11, N'Normal', 83, N'sds', N'sdfdsf', 1, 99, NULL, CAST(N'2016-02-25 07:13:40.3500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (138, 1, 1, 19, 8, N'Normal', 84, N'sdfsdf1', N'sdfsd1', 1, 115, 115, CAST(N'2016-02-25 07:17:40.7330000' AS DateTime2), CAST(N'2016-03-03 01:00:45.6930000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (139, 1, 1, 19, 14, N'Immediate', 100, N'sdfsdf', N'sdfd', 1, 99, 100, CAST(N'2016-02-25 07:19:57.1870000' AS DateTime2), CAST(N'2016-03-08 01:36:41.5770000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (140, 1, 8, 8, 4, N'Normal', 87, N'sdfdsf', N'sdfdsf', 1, 99, NULL, CAST(N'2016-02-25 07:22:23.6930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (141, 2, 3, 1, 4, N'Normal', 97, N'adasd', N'asdas', 1, 99, NULL, CAST(N'2016-02-25 07:25:02.2600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (142, 2, 12, 3, 14, N'Normal', 96, N'asdsad', N'asdsa', 1, 99, NULL, CAST(N'2016-02-25 07:25:25.9230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (143, 2, 12, 3, 13, N'Normal', 93, N'sadsf', N'sdfds', 1, 99, NULL, CAST(N'2016-02-25 07:25:49.7900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (144, 2, 9, 10, 18, N'Normal', 94, N'rsgdfg', N'dfgdfg', 1, 99, NULL, CAST(N'2016-02-25 07:26:21.5300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (145, 2, 12, 3, 23, N'Normal', 84, N'dgdfg', N'dfgfdg', 1, 99, NULL, CAST(N'2016-02-25 07:26:40.1230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (146, 3, 9, 10, 25, N'Normal', 95, N'sdfdsf', N'sdf', 1, 99, NULL, CAST(N'2016-02-25 07:27:34.4300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (147, 3, 1, 19, 9, N'Normal', 95, N'zfsdf', N'sdfsdf', 1, 99, NULL, CAST(N'2016-02-25 07:28:07.7000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (148, 3, 12, 3, 4, N'Normal', 87, N'dfgdfg', N'dfgdfg', 1, 99, NULL, CAST(N'2016-02-25 07:28:38.0470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (149, 3, 12, 3, 12, N'Normal', 88, N'sdfsdf', N'sdfds', 1, 99, NULL, CAST(N'2016-02-25 07:29:09.0470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (150, 3, 3, 1, 6, N'Normal', 93, N'sddfgd', N'fgfdg', 1, 99, NULL, CAST(N'2016-02-25 07:30:00.2600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (151, 4, 9, 10, 1, N'Normal', 91, N'fretertertet', N'etert', 1, 99, NULL, CAST(N'2016-02-25 07:33:07.5300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (152, 4, 9, 10, 16, N'Normal', 1, N'dfdsfg', N'dsgfdg', 1, 99, NULL, CAST(N'2016-02-25 07:33:42.5670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (153, 4, 12, 3, 18, N'Normal', 84, N'sdfsdf', N'sdfsdf', 1, 99, NULL, CAST(N'2016-02-25 07:35:24.2970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (154, 4, 3, 1, 10, N'Normal', 85, N'afsdf', N'sdf', 1, 99, NULL, CAST(N'2016-02-25 07:35:47.0870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (155, 4, 3, 1, 9, N'Normal', 87, N'sfsdf', N'sdf', 1, 99, NULL, CAST(N'2016-02-25 07:36:13.5970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (156, 5, 8, 8, 12, N'Normal', 100, N'sdfdsf', N'sdf', 1, 99, NULL, CAST(N'2016-02-25 07:38:19.2000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (157, 5, 1, 19, 16, N'Normal', NULL, N'ssdgdsg', N'dsgdfg', 1, 99, NULL, CAST(N'2016-02-25 07:40:57.0900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (158, 5, 3, 1, 17, N'Normal', NULL, N'xdfdfgdf', N'dfgdf', 1, 99, NULL, CAST(N'2016-02-25 07:41:12.0730000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (159, 5, 12, 3, 7, N'Normal', NULL, N'sddfgd', N'dfgfd', 1, 99, NULL, CAST(N'2016-02-25 07:42:42.0830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (160, 5, 12, 3, 9, N'Normal', NULL, N'sdfds', N'sdfds', 1, 99, NULL, CAST(N'2016-02-25 07:43:21.7170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (161, 1, 12, 3, 8, N'Normal', 87, N'adfdsf', N'dfgdf', 1, 99, NULL, CAST(N'2016-02-25 07:44:43.3930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (162, 2, 3, 1, 7, N'Normal', 85, N'fdfdf', N'dfdf', 1, 115, NULL, CAST(N'2016-02-25 08:00:24.7670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (163, 4, 3, 1, 12, N'Normal', 83, N'rytryutryu', N'truytyu', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.4170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (164, 5, 9, 10, 6, N'Normal', 86, N'fxdfg', N'dgdfg', 1, 115, NULL, CAST(N'2016-02-25 08:06:11.8500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (165, 5, 3, 1, 15, N'Normal', 85, N'dgfh', N'fhf', 1, 115, NULL, CAST(N'2016-02-25 08:10:55.6670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (166, 1, 1, 19, 1, N'Normal', NULL, N'test 666', N'test 9999', 1, 107, NULL, CAST(N'2016-02-25 09:11:44.6870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (167, 2, 1, 19, 4, N'High', 90, N'test 888', N'test 888', 1, 107, NULL, CAST(N'2016-02-25 09:15:38.1570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (168, 5, 3, 2, 14, N'High', 93, N'sdfsdf1', N'sdf1', 1, 115, 115, CAST(N'2016-02-26 00:27:44.4800000' AS DateTime2), CAST(N'2016-02-26 05:36:36.1570000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (169, 3, 3, 2, 1, N'High', 86, N'adasdtest1', N'asfdaftest1', 1, 115, 115, CAST(N'2016-02-26 00:32:41.9470000' AS DateTime2), CAST(N'2016-02-26 05:39:35.2100000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (170, 1, 1, 21, 3, N'Normal', 87, N'sdfsdf1test', N'rfhfhghj', 1, 115, 115, CAST(N'2016-02-26 00:44:01.9170000' AS DateTime2), CAST(N'2016-03-03 00:45:35.0700000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (171, 2, 1, 21, 6, N'Normal', 83, N'dgdrg', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-26 08:36:42.8370000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (172, 4, 1, 21, 4, N'Normal', 85, N'dsgfdg', N'dfgdfg', 1, 107, NULL, CAST(N'2016-02-26 08:38:53.7400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (173, 5, 1, 21, 23, N'Normal', 83, N'sdsfsdf', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-26 08:41:17.4630000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (174, 1, 28, 28, 3, N'High', 90, N'Allergy Is Not Working ', N'Food Allergy is Not Save', 1, 107, 107, CAST(N'2016-02-29 02:04:03.4200000' AS DateTime2), CAST(N'2016-02-29 02:24:15.1970000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (175, 1, 28, 26, 1, N'High', 120, N'test 7777888', N'test 7777888', 1, 107, 107, CAST(N'2016-02-29 02:26:30.5430000' AS DateTime2), CAST(N'2016-02-29 02:26:53.9600000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (176, 4, 3, 2, 4, N'Normal', 83, N'dfsdfs', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-29 02:39:18.7170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (177, 4, 3, 4, 11, N'Normal', 85, N'sadsdf', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-29 02:39:45.7800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (178, 4, 3, 4, 6, N'Normal', 84, N'adsdf', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-29 02:40:46.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (179, 3, 3, 4, 13, N'Normal', 89, N'fsdf', N'sfddsf', 1, 107, 107, CAST(N'2016-02-29 02:41:20.2970000' AS DateTime2), CAST(N'2016-02-29 07:39:45.2530000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (180, 1, 1, 21, 18, N'Low', 85, N'ersfs', N'sdfgg', 1, 107, NULL, CAST(N'2016-02-29 08:15:01.7900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (181, 3, 1, 21, 15, N'Low', 84, N'sdfsdgf', N'sfsd', 1, 107, NULL, CAST(N'2016-02-29 08:22:03.2170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (182, 3, 3, 2, 18, N'Normal', 91, N'sfsdf', N'sdfdsf', 1, 107, NULL, CAST(N'2016-02-29 08:27:56.2400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (183, 3, 1, 21, 22, N'Low', 83, N'sdfdsf', N'sdf', 1, 107, NULL, CAST(N'2016-02-29 08:31:40.0700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (184, 4, 1, 21, 10, N'Urgent', 84, N'vsdfsd', N'sdfsd', 1, 107, NULL, CAST(N'2016-02-29 08:33:41.7200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (185, 3, 3, 2, 25, N'Normal', 84, N'sfsdfsdf', N'szdfdsdf', 1, 107, NULL, CAST(N'2016-02-29 08:34:55.7430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (186, 5, 25, 9, 1, N'Normal', 85, N'Test', N'test', 1, 98, 107, CAST(N'2016-03-01 08:47:33.5100000' AS DateTime2), CAST(N'2016-11-28 03:23:42.0070000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (187, 2, 3, 4, 12, N'Normal', 85, N'sfsdfg', N'sfgsg', 1, 115, 115, CAST(N'2016-03-03 00:51:35.2930000' AS DateTime2), CAST(N'2016-03-04 06:00:58.2830000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (188, 2, 3, 4, 16, N'Low', 86, N'safsdf', N'sdfsdf', 1, 115, NULL, CAST(N'2016-03-03 00:52:26.9600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (189, 4, 3, 4, 18, N'Normal', 84, N'dsgdg', N'dfg', 1, 115, NULL, CAST(N'2016-03-03 00:53:12.4230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (190, 5, 3, 4, 25, N'Normal', 90, N'dfgd', N'dfgdf', 1, 115, NULL, CAST(N'2016-03-03 00:53:45.8870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (191, 1, 1, 21, 1, N'Low', 82, N'asfgdf', N'ddfg', 1, 115, 115, CAST(N'2016-03-04 00:09:40.5000000' AS DateTime2), CAST(N'2016-03-04 00:16:32.9730000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (192, 5, 9, 10, 14, N'Urgent', 86, N'test wihout note and ticketattachment', N'test wihout note and ticketattachment', 1, 115, 115, CAST(N'2016-03-04 00:29:43.7100000' AS DateTime2), CAST(N'2016-03-04 00:38:54.0770000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (193, 4, 3, 4, 7, N'Normal', 84, N'test', N'test', 1, 115, 115, CAST(N'2016-03-04 00:32:49.7600000' AS DateTime2), CAST(N'2016-03-04 04:21:04.5530000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (194, 1, 29, 32, 3, N'Low', 90, N'test', N'test', 1, 107, 107, CAST(N'2016-03-04 01:47:21.7330000' AS DateTime2), CAST(N'2016-03-04 01:53:57.9430000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (195, 1, 28, 26, 3, N'None', 94, N'test', N'test', 1, 107, 107, CAST(N'2016-03-04 02:02:03.9600000' AS DateTime2), CAST(N'2016-03-04 02:02:24.1400000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (196, 3, 16, 25, 8, N'Low', 88, N'sdfg', N'dtyry', 1, 115, NULL, CAST(N'2016-03-04 03:05:35.9570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (197, 4, 3, 4, 9, N'Normal', 90, N'hgfghj', N'ghjgh', 1, 115, NULL, CAST(N'2016-03-04 04:18:01.5700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (198, 5, 8, 8, 6, N'Normal', 85, N'vhf', N'fhfgh', 1, 115, 115, CAST(N'2016-03-04 05:18:42.2900000' AS DateTime2), CAST(N'2016-03-04 07:37:47.8570000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (199, 2, 1, 19, 18, N'None', 87, N'gyiyui', N'yuiu', 1, 115, 115, CAST(N'2016-03-04 07:31:54.7100000' AS DateTime2), CAST(N'2016-03-04 08:54:54.5930000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (200, 2, 8, 8, 18, N'Urgent', 84, N'sfsdf', N'sdfsdg', 1, 107, 107, CAST(N'2016-03-04 08:15:13.3530000' AS DateTime2), CAST(N'2016-03-04 09:06:42.5170000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (201, 3, 3, 2, 6, N'None', 1, N'Test Test', N'Test Test', 1, 100, NULL, CAST(N'2016-03-05 01:00:37.4330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (202, 3, 16, 25, 3, N'Low', 85, N'cdfdh', N'fhfghgfh', 1, 115, 115, CAST(N'2016-03-05 01:06:32.9670000' AS DateTime2), CAST(N'2016-03-05 01:29:55.1470000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (203, 2, 23, 20, 3, N'None', 85, N'sdfsdf', N'sdfdsf', 1, 115, NULL, CAST(N'2016-03-05 01:33:28.5870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (204, 1, 23, 20, 8, N'Normal', 90, N'ddf', N'dfgfd', 1, 115, NULL, CAST(N'2016-03-05 02:29:02.7430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (205, 5, 28, 26, 6, N'Low', 85, N'dgdfg', N'dfgf', 1, 115, NULL, CAST(N'2016-03-05 05:40:48.4430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (206, 5, 28, 26, 11, N'Normal', 85, N'sdgdfg', N'dfg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.1670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (207, 5, 29, 32, 10, N'Normal', 89, N'dyrfytr', N'rtytr', 1, 115, 115, CAST(N'2016-03-05 05:53:42.5500000' AS DateTime2), CAST(N'2016-03-08 01:41:39.4400000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (208, 4, 29, 32, 4, N'Normal', 93, N'dfgdfg', N'dfgfdg', 1, 115, 115, CAST(N'2016-03-07 04:00:18.4470000' AS DateTime2), CAST(N'2016-03-08 02:14:06.4030000' AS DateTime2))
GO
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (209, 1, 3, 4, 3, N'Normal', 1, N'This is Test Ticket...', N'This is Test Ticket...This is Test Ticket...This is Test Ticket...', 1, 117, NULL, CAST(N'2016-03-07 04:16:35.2900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (210, 3, 29, 32, 22, N'Urgent', 87, N'dfdsf', N'sdfdsf', 1, 115, NULL, CAST(N'2016-03-07 04:27:42.0200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (211, 3, 3, 2, 8, N'Low', 83, N'Test ticket', N'Test ticket', 1, 117, NULL, CAST(N'2016-03-07 04:33:52.0630000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (212, 1, 8, 8, 15, N'Normal', 88, N'dfdsf', N'dfd', 1, 115, 115, CAST(N'2016-03-07 04:36:17.5070000' AS DateTime2), CAST(N'2016-03-08 04:09:19.1100000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (213, 1, 28, 27, 14, N'Low', 125, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', 1, 100, 100, CAST(N'2016-03-07 05:44:24.8200000' AS DateTime2), CAST(N'2016-03-08 01:41:07.4300000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (214, 2, 1, 21, 7, N'Low', 88, N'safdsf', N'sdfsd', 1, 115, NULL, CAST(N'2016-03-08 01:39:16.1300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (215, 2, 3, 2, 15, N'Normal', 89, N'fsasdf', N'sdfd', 1, 115, NULL, CAST(N'2016-03-08 01:45:25.4800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (216, 1, 1, 21, 8, N'Normal', 83, N'wsdfdsf', N'sdfds', 1, 115, 115, CAST(N'2016-03-08 04:10:38.1130000' AS DateTime2), CAST(N'2016-03-08 07:34:30.4770000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (217, 5, 28, 26, 4, N'Normal', 85, N'sdfdsf1', N'sdf1', 1, 115, 115, CAST(N'2016-03-09 05:28:51.7070000' AS DateTime2), CAST(N'2016-03-09 05:30:07.9000000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (218, 2, 45, 35, 37, N'Normal', 99, N'Update Pharmacy On  all server', N'Update Pharmacy On  all server

Updated  on Swd1 and Test Server,will update on live by tomorrow', 1, 107, 107, CAST(N'2016-11-28 03:00:00.8230000' AS DateTime2), CAST(N'2016-11-28 03:26:00.6970000' AS DateTime2))
INSERT [dbo].[TRN_Tickets] ([TicketID], [TicketStatusID], [ProjectID], [ModuleID], [IssueTypeID], [Priority], [AssignToUserID], [TicketSummary], [TicketDescription], [Active], [Created_By], [Modified_By], [Created_date], [Modified_Date]) VALUES (219, 27, 3, 1, 23, N'None', 82, N'gdf', N'asdf', 1, 107, NULL, CAST(N'2016-11-28 06:25:01.2000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[TRN_Tickets] OFF
SET IDENTITY_INSERT [dbo].[TRN_TicketsAttachments] ON 

INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, 110, N'250216165814.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:33:34.3700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, 112, N'250216170200.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:37:07.1130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, 112, N'250216170200.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:37:07.1570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, 112, N'250216170200.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:37:07.1830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, 114, N'250216170412.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:39:20.2030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, 114, N'250216170412.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:39:20.2300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, 115, N'250216170635.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:41:42.6300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (12, 117, N'250216170815.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:43:21.8270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (13, 117, N'250216170815.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:43:21.8470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (14, 117, N'250216170815.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:43:21.8700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (15, 119, N'250216171004.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:45:11.2070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (16, 119, N'250216171004.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:45:11.2370000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (17, 119, N'250216171004.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:45:11.3070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (18, 121, N'250216171301.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:48:07.9770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, 121, N'250216171301.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:48:08.0000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, 122, N'250216171358.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:49:05.2470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, 122, N'250216171358.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:49:05.2700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (22, 123, N'250216172128.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:56:35.4530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, 123, N'250216172128.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:56:35.4830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, 123, N'250216172128.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:56:35.5170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, 124, N'250216172210.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:57:17.1930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (26, 124, N'250216172210.jpg', 1, 100, NULL, CAST(N'2016-02-25 06:57:17.2270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, 126, N'250216172831.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:03:38.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, 126, N'250216172831.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:03:38.4800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (29, 126, N'250216172831.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:03:38.5000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (30, 127, N'250216172906.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:12.9570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (31, 127, N'250216172906.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:12.9800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (32, 127, N'250216172906.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:13.0030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (33, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:51.9230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (34, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:51.9430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (35, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:51.9630000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (36, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:51.9830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (37, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:52.0000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (38, 128, N'250216172945.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:04:52.0170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (39, 130, N'250216173039.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:05:45.9530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (40, 130, N'250216173039.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:05:45.9770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (41, 130, N'250216173039.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:05:46.0000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (42, 131, N'250216173122.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:06:28.7170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (43, 131, N'250216173122.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:06:28.7400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (44, 131, N'250216173122.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:06:28.7670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (45, 133, N'250216173502.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:10:08.9730000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (46, 133, N'250216173502.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:10:08.9930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (47, 133, N'250216173502.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:10:09.0200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (48, 135, N'250216173553.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:11:00.2200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (49, 135, N'250216173553.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:11:00.2430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (50, 135, N'250216173553.jpg', 1, 100, NULL, CAST(N'2016-02-25 07:11:00.2630000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (51, 136, N'250216173748.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:12:55.2400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (52, 136, N'250216173748.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:12:55.2600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (53, 136, N'250216173748.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:12:55.2870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (54, 137, N'250216173834.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:13:40.4000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (55, 137, N'250216173834.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:13:40.4200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (56, 137, N'250216173834.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:13:40.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (57, 137, N'250216173834.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:13:40.4830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (59, 139, N'250216174450.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:19:57.2330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (60, 140, N'250216174717.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:22:23.7470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (61, 141, N'250216174956.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:25:02.3100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (62, 142, N'250216175019.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:25:25.9900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (63, 143, N'250216175043.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:25:49.8330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (64, 144, N'250216175115.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:26:21.5800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (65, 147, N'250216175301.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:28:07.8100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (66, 148, N'250216175331.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:28:38.0900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (67, 149, N'250216175402.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:29:09.0970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (68, 150, N'250216175454.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:30:00.3100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (69, 151, N'250216175801.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:33:07.5830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (70, 152, N'250216175836.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:33:42.6170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (71, 153, N'250216180018.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:35:24.3470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (72, 154, N'250216180040.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:35:47.1400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (73, 155, N'250216180107.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:36:13.6800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (74, 156, N'250216180312.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:38:19.2470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (75, 161, N'250216180937.jpg', 1, 99, NULL, CAST(N'2016-02-25 07:44:43.4500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (76, 162, N'250216182518.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:00:24.8470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (77, 162, N'250216182518.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:00:24.8670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (79, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (80, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.4800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (81, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.5200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (82, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.5370000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (83, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.5600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (84, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.5830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (85, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.6070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (86, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.6270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (87, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.6500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (88, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.6700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (89, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.6870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (90, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.7030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (91, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.7200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (92, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.7400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (93, 163, N'250216182914.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:04:20.7570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (94, 164, N'250216183105.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:06:11.8870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (95, 164, N'250216183105.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:06:11.9130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (96, 164, N'250216183105.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:06:11.9330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (97, 165, N'2502161835490.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:10:55.7100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (98, 165, N'2502161835491.jpg', 1, 115, NULL, CAST(N'2016-02-25 08:10:55.7270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (99, 168, N'2602161052370.jpg', 1, 115, NULL, CAST(N'2016-02-26 00:27:44.6000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (100, 168, N'2602161052371.jpg', 1, 115, NULL, CAST(N'2016-02-26 00:27:44.6370000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (101, 168, N'2602161052372.jpg', 1, 115, NULL, CAST(N'2016-02-26 00:27:44.6530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (102, 169, N'2602161057350.jpg', 1, 115, NULL, CAST(N'2016-02-26 00:32:41.9930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (103, 169, N'2602161057351.jpg', 1, 115, NULL, CAST(N'2016-02-26 00:32:42.0170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (106, 172, N'2602161903420.jpg', 1, 107, NULL, CAST(N'2016-02-26 08:38:53.8600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (107, 172, N'2602161903461.jpg', 1, 107, NULL, CAST(N'2016-02-26 08:38:53.8800000' AS DateTime2), NULL)
GO
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (108, 177, N'2902161304340.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:39:45.8530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (109, 177, N'2902161304351.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:39:45.8770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (110, 177, N'2902161304352.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:39:45.8970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (111, 179, N'2902161306090.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:41:20.3770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (112, 179, N'2902161306091.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:41:20.3930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (113, 179, N'2902161306092.jpg', 1, 107, NULL, CAST(N'2016-02-29 02:41:20.4170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (114, 181, N'2902161846510.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:22:03.2900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (115, 181, N'2902161846511.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:22:03.3400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (116, 181, N'2902161846512.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:22:03.3600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (117, 182, N'2902161852440.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:27:56.2930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (118, 182, N'2902161852441.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:27:56.3170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (119, 182, N'2902161852442.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:27:56.3400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (120, 185, N'2902161859440.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:34:55.7670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (121, 185, N'2902161859441.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:34:55.7900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (122, 185, N'2902161859442.jpg', 1, 107, NULL, CAST(N'2016-02-29 08:34:55.8100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (133, 186, N'0103161912470.jpg', 1, 98, NULL, CAST(N'2016-03-01 08:47:33.6700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (134, 110, N'0203161928480.jpg', 1, 98, NULL, CAST(N'2016-03-02 09:04:02.5070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (135, 170, N'0303161050210.jpg', 1, 115, NULL, CAST(N'2016-03-03 00:25:37.1300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (140, 189, N'0303161117560.jpg', 1, 115, NULL, CAST(N'2016-03-03 00:53:12.4900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (141, 189, N'0303161117561.jpg', 1, 115, NULL, CAST(N'2016-03-03 00:53:12.5130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (142, 189, N'0303161117562.jpg', 1, 115, NULL, CAST(N'2016-03-03 00:53:12.5400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (143, 138, N'0303161122080.jpg', 1, 115, NULL, CAST(N'2016-03-03 00:57:23.9130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (144, 191, N'0403161034240.jpg', 1, 115, NULL, CAST(N'2016-03-04 00:09:40.5500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (145, 191, N'0403161034241.jpg', 1, 115, NULL, CAST(N'2016-03-04 00:09:40.5800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (146, 191, N'0403161034242.jpg', 1, 115, NULL, CAST(N'2016-03-04 00:09:40.6000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (147, 192, N'0403161055130.jpg', 1, 115, NULL, CAST(N'2016-03-04 00:30:30.2930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (148, 192, N'0403161055131.jpg', 1, 115, NULL, CAST(N'2016-03-04 00:30:30.3200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (152, 194, N'0403161213300.png', 1, 107, NULL, CAST(N'2016-03-04 01:48:23.3900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (153, 194, N'0403161213301.png', 1, 107, NULL, CAST(N'2016-03-04 01:48:23.4130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (158, 194, N'0403161219050.png', 1, 107, NULL, CAST(N'2016-03-04 01:53:58.0000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (162, 195, N'0403161227110.png', 1, 107, NULL, CAST(N'2016-03-04 02:02:04.0370000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (165, 195, N'0403161227113.png', 1, 107, NULL, CAST(N'2016-03-04 02:02:04.1000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (175, 196, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-04 03:05:36.0030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (189, 187, N'truck1.jpg', 1, 115, NULL, CAST(N'2016-03-04 06:00:58.3430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (196, 198, N'downloadmorethan3mb2.jpg', 1, 115, NULL, CAST(N'2016-03-04 06:47:31.0230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (202, 199, N'images (2).jpg', 1, 115, NULL, CAST(N'2016-03-04 07:35:17.1200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (203, 198, N'images (3).jpg', 1, 115, NULL, CAST(N'2016-03-04 07:37:47.9030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (205, 199, N'rocket1.jpg', 1, 115, NULL, CAST(N'2016-03-04 08:54:54.7100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (209, 202, N'images.jpg', 1, 115, NULL, CAST(N'2016-03-05 01:24:24.4100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (214, 203, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 01:33:28.6430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (215, 203, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-05 01:33:28.6670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (216, 204, N'downloadmore3mb1.jpg', 1, 115, NULL, CAST(N'2016-03-05 02:29:02.8330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (217, 204, N'downloadmorethan3mb.jpg', 1, 115, NULL, CAST(N'2016-03-05 02:29:02.8630000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (218, 205, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:40:49.2700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (219, 205, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:40:49.2930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (220, 205, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:40:49.3270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (221, 206, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.2130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (222, 206, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.2330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (223, 206, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.2570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (224, 206, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.2770000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (225, 206, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:42:21.2970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (226, 207, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-05 05:53:42.6030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (234, 208, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:00:18.5300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (235, 208, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:00:18.5730000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (236, 209, N'secondarytile.png', 1, 117, NULL, CAST(N'2016-03-07 04:16:35.3700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (237, 210, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:27:42.0670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (238, 210, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:27:42.0870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (239, 210, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:27:42.1070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (240, 210, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:27:42.1330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (242, 207, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:28:33.3670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (244, 211, N'secondarytile.png', 1, 117, NULL, CAST(N'2016-03-07 04:33:52.1200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (245, 212, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-07 04:36:17.6070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (246, 207, N'images (2).jpg', 1, 115, NULL, CAST(N'2016-03-07 05:03:52.7170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (247, 214, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:39:19.7500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (248, 214, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:39:22.1830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (249, 214, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:39:24.4070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (250, 214, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:39:26.6170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (251, 214, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:39:28.8300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (252, 207, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-08 01:40:30.3130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (253, 208, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-08 02:14:06.5070000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (254, 212, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-08 04:09:19.2230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (255, 212, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-08 04:09:19.2500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (256, 216, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-08 04:10:38.1400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (258, 216, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-08 04:10:38.1870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (260, 217, N'car3 - Copy.jpg', 1, 115, NULL, CAST(N'2016-03-09 05:28:51.8130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (261, 217, N'5.jpg', 1, 115, NULL, CAST(N'2016-03-09 05:28:51.8400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (265, 217, N'car1.jpg', 1, 115, NULL, CAST(N'2016-03-09 05:28:51.9500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsAttachments] ([TicketAtchID], [TicketID], [FileName], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (266, 217, N'car2.jpg', 1, 115, NULL, CAST(N'2016-03-09 05:28:51.9730000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[TRN_TicketsAttachments] OFF
SET IDENTITY_INSERT [dbo].[TRN_TicketsNotes] ON 

INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (1, 110, 99, N'artitest1', N'1         ', 100, 99, CAST(N'2016-02-25 06:33:30.8870000' AS DateTime2), CAST(N'2016-03-08 01:42:25.3830000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (2, 112, 100, N'arti my tickets', N'1         ', 100, 100, CAST(N'2016-02-25 06:37:07.0830000' AS DateTime2), CAST(N'2016-03-02 02:53:33.0100000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (3, 113, 100, N'afsdfgdg', N'1         ', 100, NULL, CAST(N'2016-02-25 06:38:14.7430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (4, 114, 100, N'sdfsdf', N'1         ', 100, NULL, CAST(N'2016-02-25 06:39:20.1500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (5, 115, 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients', N'1         ', 100, 100, CAST(N'2016-02-25 06:41:42.6000000' AS DateTime2), CAST(N'2016-03-08 01:44:12.5930000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (6, 116, 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', N'1         ', 100, 100, CAST(N'2016-02-25 06:42:38.3200000' AS DateTime2), CAST(N'2016-03-02 02:54:07.8470000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (7, 117, 100, N'dfdfg', N'1         ', 100, NULL, CAST(N'2016-02-25 06:43:21.8000000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (8, 119, 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', N'1         ', 100, 100, CAST(N'2016-02-25 06:45:11.1070000' AS DateTime2), CAST(N'2016-03-08 01:04:28.5970000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (9, 120, 100, N'dfsdfsdf', N'1         ', 100, NULL, CAST(N'2016-02-25 06:47:07.6300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (10, 121, 100, N'sDsf', N'1         ', 100, NULL, CAST(N'2016-02-25 06:48:07.9500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (11, 123, 100, N'sdfsdf', N'1         ', 100, NULL, CAST(N'2016-02-25 06:56:35.4170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (12, 124, 100, N'sdfsd', N'1         ', 100, NULL, CAST(N'2016-02-25 06:57:17.1570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (13, 125, 100, N'esdsf', N'1         ', 100, NULL, CAST(N'2016-02-25 07:03:04.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (14, 127, 100, N'fdssdf', N'1         ', 100, NULL, CAST(N'2016-02-25 07:04:12.9330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (15, 128, 100, N'dfsgdfg', N'1         ', 100, NULL, CAST(N'2016-02-25 07:04:51.9030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (16, 129, 100, N'adsefwef', N'1         ', 100, NULL, CAST(N'2016-02-25 07:05:19.4230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (17, 130, 100, N'fdsert', N'1         ', 100, NULL, CAST(N'2016-02-25 07:05:45.9300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (18, 131, 100, N'dfgdfg', N'1         ', 100, NULL, CAST(N'2016-02-25 07:06:28.6930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (19, 132, 100, N'4ertertert', N'1         ', 100, NULL, CAST(N'2016-02-25 07:09:03.0500000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (20, 133, 100, N'sdffd', N'1         ', 100, NULL, CAST(N'2016-02-25 07:10:08.9470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (21, 134, 100, N'sfsdf', N'1         ', 100, NULL, CAST(N'2016-02-25 07:10:32.4300000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (22, 135, 100, N'adasd', N'1         ', 100, NULL, CAST(N'2016-02-25 07:11:00.1900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (23, 136, 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT, and business management team of GeeseMed Inc. GeeseMed brings 10+ years of experience which makes GeeseMed unique and easy to use EHR system. It''s powerful, full-featured solution provide a robust collaboration and information exchange capability. Rapid information sharing among medical providers is critical to making accurate diagnoses, setting effective courses of treatment, and providing continuous care to patients.', N'1         ', 99, 100, CAST(N'2016-02-25 07:12:55.2130000' AS DateTime2), CAST(N'2016-03-08 01:33:35.0170000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (24, 137, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:13:40.3700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (25, 138, 115, N'sdfsdf1', N'1         ', 115, 115, CAST(N'2016-02-25 07:17:40.7600000' AS DateTime2), CAST(N'2016-03-03 01:00:45.7200000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (26, 139, 100, N'dfsf', N'1         ', 99, 100, CAST(N'2016-02-25 07:19:57.2100000' AS DateTime2), CAST(N'2016-03-08 01:36:41.6270000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (27, 140, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:22:23.7200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (28, 141, 99, N'sdsaed', N'1         ', 99, NULL, CAST(N'2016-02-25 07:25:02.2900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (29, 142, 99, N'sdsad', N'1         ', 99, NULL, CAST(N'2016-02-25 07:25:25.9470000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (30, 143, 99, N'dsfs', N'1         ', 99, NULL, CAST(N'2016-02-25 07:25:49.8100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (31, 144, 99, N'dfgdfg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:26:21.5530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (32, 145, 99, N'dgfdg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:26:40.1600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (33, 146, 99, N'sdfsdf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:27:34.4600000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (34, 147, 99, N'dsfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:28:07.7200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (35, 148, 99, N'sfrsdf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:28:38.0670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (36, 149, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:29:09.0700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (37, 150, 99, N'dfgfdg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:30:00.2830000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (38, 151, 99, N'safsdf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:33:07.5570000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (39, 152, 99, N'gdfgdfg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:33:42.5900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (40, 153, 99, N'sfsdf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:35:24.3200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (41, 154, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:35:47.1130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (42, 155, 99, N'sdfsdf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:36:13.6200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (43, 156, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:38:19.2230000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (44, 159, 99, N'dfgdfg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:42:42.1030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (45, 160, 99, N'sdfdsf', N'1         ', 99, NULL, CAST(N'2016-02-25 07:43:21.7430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (46, 161, 99, N'dfgfdg', N'1         ', 99, NULL, CAST(N'2016-02-25 07:44:43.4270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (47, 162, 115, N'dfsfsdf', N'1         ', 115, NULL, CAST(N'2016-02-25 08:00:24.8100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (48, 163, 115, N'asdsad', N'1         ', 115, NULL, CAST(N'2016-02-25 08:04:20.4400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (49, 164, 115, N'dfgdfg', N'1         ', 115, NULL, CAST(N'2016-02-25 08:06:11.8700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (50, 165, 115, N'dfgfdg', N'1         ', 115, NULL, CAST(N'2016-02-25 08:10:55.6870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (51, 168, 115, N'afsdf1', N'1         ', 115, 115, CAST(N'2016-02-26 00:27:44.5570000' AS DateTime2), CAST(N'2016-02-26 05:36:36.1800000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (52, 169, 115, N'sdfsdftest1', N'1         ', 115, 115, CAST(N'2016-02-26 00:32:41.9700000' AS DateTime2), CAST(N'2016-02-26 05:39:35.2330000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (53, 170, 115, N'fsdf1', N'1         ', 115, 115, CAST(N'2016-02-26 00:44:01.9430000' AS DateTime2), CAST(N'2016-03-03 00:45:35.1000000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (54, 172, 107, N'sdfsdf', N'1         ', 107, NULL, CAST(N'2016-02-26 08:38:53.7870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (55, 173, 107, N'sfdsf', N'1         ', 107, NULL, CAST(N'2016-02-26 08:41:17.4870000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (56, 171, 107, N'9999', N'1         ', 107, NULL, CAST(N'2016-02-29 01:47:40.7700000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (57, 174, 107, NULL, N'1         ', 107, NULL, CAST(N'2016-02-29 02:24:15.2400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (58, 175, 107, N'the one hhh', N'1         ', 107, 107, CAST(N'2016-02-29 02:26:30.5670000' AS DateTime2), CAST(N'2016-02-29 02:26:53.9870000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (59, 177, 107, N'sdfdsf', N'1         ', 107, NULL, CAST(N'2016-02-29 02:39:45.8100000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (60, 178, 107, N'sdfdsf', N'1         ', 107, NULL, CAST(N'2016-02-29 02:40:46.6030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (61, 179, 107, N'sdfdsf', N'1         ', 107, 107, CAST(N'2016-02-29 02:41:20.3170000' AS DateTime2), CAST(N'2016-02-29 07:39:45.2970000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (62, 180, 107, N'sdfsdf', N'1         ', 107, NULL, CAST(N'2016-02-29 08:15:01.8170000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (63, 181, 107, N'sdfsdf', N'1         ', 107, NULL, CAST(N'2016-02-29 08:22:03.2400000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (64, 182, 107, N'sfsdf', N'1         ', 107, NULL, CAST(N'2016-02-29 08:27:56.2670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (65, 183, 107, N'sdf', N'1         ', 107, NULL, CAST(N'2016-02-29 08:31:48.2900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (66, 186, 107, N'test', N'1         ', 98, 107, CAST(N'2016-03-01 08:47:33.5670000' AS DateTime2), CAST(N'2016-11-28 03:23:42.0370000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (67, 187, 115, N'adasf', N'1         ', 115, 115, CAST(N'2016-03-03 00:51:35.3430000' AS DateTime2), CAST(N'2016-03-04 06:00:58.3170000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (68, 189, 115, N'wsfsrt', N'1         ', 115, NULL, CAST(N'2016-03-03 00:53:12.4530000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (69, 190, 115, N'dsg', N'1         ', 115, NULL, CAST(N'2016-03-03 00:53:45.9130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (70, 191, 115, N'fdfdfdfsdfdsf', N'1         ', 115, 115, CAST(N'2016-03-04 00:10:26.1600000' AS DateTime2), CAST(N'2016-03-04 00:16:32.9970000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (71, 192, 115, N'asdasfd', N'1         ', 115, 115, CAST(N'2016-03-04 00:30:30.1730000' AS DateTime2), CAST(N'2016-03-04 00:38:54.1200000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (72, 193, 115, N'dsdfd', N'1         ', 115, 115, CAST(N'2016-03-04 00:32:49.8000000' AS DateTime2), CAST(N'2016-03-04 04:21:04.5770000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (73, 194, 107, N'test', N'1         ', 107, 107, CAST(N'2016-03-04 01:47:21.8200000' AS DateTime2), CAST(N'2016-03-04 01:53:57.9670000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (74, 195, 107, N'sdfsdfasdf', N'1         ', 107, 107, CAST(N'2016-03-04 02:02:03.9930000' AS DateTime2), CAST(N'2016-03-04 02:02:24.1700000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (75, 196, 115, N'dfsf', N'1         ', 115, NULL, CAST(N'2016-03-04 03:05:35.9800000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (76, 197, 115, N'fgg', N'1         ', 115, NULL, CAST(N'2016-03-04 04:18:01.6030000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (77, 198, 115, N'fgdfg', N'1         ', 115, 115, CAST(N'2016-03-04 05:18:42.3400000' AS DateTime2), CAST(N'2016-03-04 07:37:47.8800000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (78, 199, 115, N'yuiuyi', N'1         ', 115, 115, CAST(N'2016-03-04 07:32:02.3070000' AS DateTime2), CAST(N'2016-03-04 08:54:54.6230000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (79, 200, 107, N'sdfs', N'1         ', 107, 107, CAST(N'2016-03-04 08:15:13.4030000' AS DateTime2), CAST(N'2016-03-04 09:06:42.5400000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (80, 201, 100, N'Test Test', N'1         ', 100, NULL, CAST(N'2016-03-05 01:00:37.4670000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (81, 202, 115, N'dfg', N'1         ', 115, 115, CAST(N'2016-03-05 01:06:32.9970000' AS DateTime2), CAST(N'2016-03-05 01:29:55.1730000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (82, 203, 115, N'sdfdsf', N'1         ', 115, NULL, CAST(N'2016-03-05 01:33:28.6200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (83, 204, 115, N'sdfds', N'1         ', 115, NULL, CAST(N'2016-03-05 02:29:02.7930000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (84, 205, 115, N'sdfsdf', N'1         ', 115, NULL, CAST(N'2016-03-05 05:40:49.0200000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (85, 206, 115, N'dsfgdfg', N'1         ', 115, NULL, CAST(N'2016-03-05 05:42:21.1900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (86, 207, 115, N'dfdfdffh', N'1         ', 115, 115, CAST(N'2016-03-05 05:53:42.5770000' AS DateTime2), CAST(N'2016-03-08 01:41:39.6200000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (87, 208, 115, N'ddfg', N'1         ', 115, 115, CAST(N'2016-03-07 04:00:18.4670000' AS DateTime2), CAST(N'2016-03-08 02:14:06.4300000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (88, 209, 117, N'This is Test Ticket...', N'1         ', 117, NULL, CAST(N'2016-03-07 04:16:35.3330000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (89, 210, 115, N'sfdf', N'1         ', 115, NULL, CAST(N'2016-03-07 04:27:42.0430000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (90, 211, 117, N'Test ticket', N'1         ', 117, NULL, CAST(N'2016-03-07 04:33:52.0900000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (91, 212, 115, N'dzfdf', N'1         ', 115, 115, CAST(N'2016-03-07 04:36:17.5330000' AS DateTime2), CAST(N'2016-03-08 04:09:19.1370000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (92, 213, 100, N'The GEESEMED EHR is introduced by team of physicians, highly experienced IT,', N'1         ', 100, 100, CAST(N'2016-03-07 05:44:24.8500000' AS DateTime2), CAST(N'2016-03-08 01:41:07.4570000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (93, 111, 100, NULL, N'1         ', 100, NULL, CAST(N'2016-03-08 00:21:58.2270000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (94, 118, 99, NULL, N'1         ', 100, 99, CAST(N'2016-03-08 00:23:01.8100000' AS DateTime2), CAST(N'2016-03-08 01:22:58.0830000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (95, 214, 115, N'dfsdf', N'1         ', 115, NULL, CAST(N'2016-03-08 01:39:18.3970000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (96, 215, 115, N'fdsf', N'1         ', 115, NULL, CAST(N'2016-03-08 01:45:25.5130000' AS DateTime2), NULL)
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (97, 216, 115, N'uiouo', N'1         ', 115, 115, CAST(N'2016-03-08 04:11:01.8300000' AS DateTime2), CAST(N'2016-03-08 07:34:30.5000000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (98, 217, 115, N'asdsfdf1', N'1         ', 115, 115, CAST(N'2016-03-09 05:28:51.7630000' AS DateTime2), CAST(N'2016-03-09 05:30:07.9300000' AS DateTime2))
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (99, 218, 107, N'Please close the ticket', N'1         ', 107, 107, CAST(N'2016-11-28 03:02:07.4670000' AS DateTime2), CAST(N'2016-11-28 03:26:00.7330000' AS DateTime2))
GO
INSERT [dbo].[TRN_TicketsNotes] ([TicketNoteID], [TicketID], [UserID], [NoteDesc], [Active], [Created_by], [Modified_By], [Created_Date], [Modified_Date]) VALUES (100, 219, 107, N'dfsdf', N'1         ', 107, NULL, CAST(N'2016-11-28 06:25:07.1570000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[TRN_TicketsNotes] OFF
ALTER TABLE [dbo].[MST_Modules]  WITH CHECK ADD  CONSTRAINT [FK_MST_Modules_MST_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[MST_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[MST_Modules] CHECK CONSTRAINT [FK_MST_Modules_MST_Projects]
GO
ALTER TABLE [dbo].[MST_Rights]  WITH CHECK ADD  CONSTRAINT [FK_MST_Rights_MST_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[MST_Menus] ([MenuID])
GO
ALTER TABLE [dbo].[MST_Rights] CHECK CONSTRAINT [FK_MST_Rights_MST_Menus]
GO
ALTER TABLE [dbo].[MST_Rights]  WITH CHECK ADD  CONSTRAINT [FK_MST_Rights_MST_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[MST_UserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[MST_Rights] CHECK CONSTRAINT [FK_MST_Rights_MST_UserType]
GO
ALTER TABLE [dbo].[TRN_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_TRN_Tickets_MST_IssueType] FOREIGN KEY([IssueTypeID])
REFERENCES [dbo].[MST_IssueType] ([IssueTypeID])
GO
ALTER TABLE [dbo].[TRN_Tickets] CHECK CONSTRAINT [FK_TRN_Tickets_MST_IssueType]
GO
ALTER TABLE [dbo].[TRN_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_TRN_Tickets_MST_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[MST_Modules] ([ModuleID])
GO
ALTER TABLE [dbo].[TRN_Tickets] CHECK CONSTRAINT [FK_TRN_Tickets_MST_Module]
GO
ALTER TABLE [dbo].[TRN_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_TRN_Tickets_MST_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[MST_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TRN_Tickets] CHECK CONSTRAINT [FK_TRN_Tickets_MST_Projects]
GO
ALTER TABLE [dbo].[TRN_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_TRN_Tickets_MST_TicketStatus] FOREIGN KEY([TicketStatusID])
REFERENCES [dbo].[MST_TicketStatus] ([TicketStatusID])
GO
ALTER TABLE [dbo].[TRN_Tickets] CHECK CONSTRAINT [FK_TRN_Tickets_MST_TicketStatus]
GO
ALTER TABLE [dbo].[TRN_TicketsAttachments]  WITH CHECK ADD  CONSTRAINT [FK_TRN_TicketsAttachments_TRN_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TRN_Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[TRN_TicketsAttachments] CHECK CONSTRAINT [FK_TRN_TicketsAttachments_TRN_Tickets]
GO
ALTER TABLE [dbo].[TRN_TicketsNotes]  WITH CHECK ADD  CONSTRAINT [FK_TRN_TicketsNotes_TRN_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TRN_Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[TRN_TicketsNotes] CHECK CONSTRAINT [FK_TRN_TicketsNotes_TRN_Tickets]
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangePassword]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Megha>
-- Create date: <16/2/2016>
-- Description:	<Change password>
--update :3-2-2016
-- =============================================
CREATE PROCEDURE [dbo].[SP_ChangePassword] 
@UserID int,
@Password varchar(100),
@FirstName varchar(50),
@LastName varchar(50),
@Phone bigint,
@Email varchar(150)	
AS
BEGIN
	
	update MST_Users SET 
	Password=@Password,
	FirstName=@FirstName,
	LastName=@LastName,
	Phone=@Phone,
	Email=@Email
	 where UserID=@UserID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DashBord]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kushal Goswami
-- Create date: 25/02/2016
-- Description:	Get matched daata from Tickets, Projects, Modules
-- Created By Kushal Goswami
-- Exec SP_DashBord   
-- =============================================

CREATE PROCEDURE [dbo].[SP_DashBord]
AS
BEGIN	

	select T.TicketID,
	t.TicketStatusID,
	t.AssignToUserID,
	t.ProjectID,
	t.ModuleID,
	t.Created_By,
	t.Modified_By,
	t.Created_date,
	t.Modified_Date,
	ISNULL(t.Active,0)'Active',
	p.ProjectName,
	m.ModuleName,
	t.TicketSummary 
	from TRN_Tickets T 
	inner join MST_Projects P on t.ProjectID = p.ProjectID
	inner join MST_Modules M on t.ModuleID = m.ModuleID

END

GO
/****** Object:  StoredProcedure [dbo].[SP_deleteFileAttach]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_deleteFileAttach]
@TicketAtchID int
as
begin
delete from TRN_TicketsAttachments where TicketAtchID=@TicketAtchID


end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetIssueTypes]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================              
-- Author: Megha              
-- Create date: 02/04/2016              
-- Description: <Description,,>              
-- =============================================   
CREATE procedure [dbo].[SP_GetIssueTypes]
@IssueTypeID int
--@Active bit=null
as

begin 


			select 
			[IssueType],
			[Active]
			from MST_IssueType where 1=1 and (@IssueTypeID=0 OR IssueTypeID=@IssueTypeID)
			--and (Active =@Active  or @Active is null)



end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kushal Goswami
-- Create date: 10/02/2016
-- Description:	Get All Menus or Menus by MenuId
-- Alter By Kushal Goswami
-- Exec SP_GetMenus 1      
-- =============================================

CREATE PROCEDURE [dbo].[SP_GetMenus] --7
	@MenuID int
AS
BEGIN
	
SELECT  [MenuID],
		[MenuName],
		[ParentID],
		[MenuPage],
		[Active],
		[Created_by],
		[Modified_By],
		[Created_Date],
		[Modified_Date],
		[Sequence]
from MST_Menus where 1=1 and (@MenuID = 0 or MenuID = @MenuID) order by [Sequence]

end

GO
/****** Object:  StoredProcedure [dbo].[SP_GetModules]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kushal Goswami
-- Create date: 05/02/2016
-- Description:	Get All Modules or Modules by Id
-- Alter By Kushal Goswami
-- Exec SP_GetModules 1   
--Modify By: Megha Thakkar
--Description: Add active   
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetModules] 
	@ModuleID int
	--@Active bit=null
AS
BEGIN
			select m.ModuleID,m.ProjectID,p.ProjectName,m.ModuleName,m.ModuleVer,m.Active,m.Created_by,
				m.Modified_By,m.Created_Date,m.Modified_Date from MST_Modules m left join MST_Projects p on m.ProjectID = p.ProjectID
				where 1=1 and (@ModuleID=0 OR m.ModuleID = @ModuleID) 
				--and (m.Active=@Active or @Active is NULL)
		

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetPasswordByUserName_Or_MailID]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Megha
-- Create date: 12/2/2016
-- Description:	forgetPAssword
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetPasswordByUserName_Or_MailID] 
@UserName varchar(30)=null,
@Email varchar(150)=null
AS
BEGIN
	SELECT [UserID]
      ,[UserTypeID]
      ,[UserName]
      ,[Password]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[Active]
      ,[Created_by]
      ,[Modified_By]
      ,[Created_Date]
      ,[Modified_Date]
  from MST_Users where UserName=@UserName or Email=@Email
	





	
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetProjects]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kushal Goswami
-- Create date: 05/02/2016
-- Description:	Get All Projects or Projects by Id
-- Alter By Kushal Goswami
-- Exec SP_GetProjects 1 
-- Modify By:Megha Thakkar
-- Description: add active     
-- =============================================

CREATE PROCEDURE [dbo].[SP_GetProjects]

@ProjectId int
--@Active bit=Null
As
BEGIN

SELECT [ProjectID]
      ,[ProjectName]
      ,[ProjectVer]
      ,[Active]
      ,[Created_by]
      ,[Modified_By]
      ,[Created_Date]
      ,[Modified_Date]
  FROM [MST_Projects] where 1=1 and ((@ProjectId=0 OR ProjectId=@ProjectId))
  -- and (Active=@Active or @Active is NULL)
  --(@Active IS NULL AND Active IS NULL)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetRights]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kushal Goswami
-- Create date: 12/02/2016
-- Description:	Get All Rights or rights by RightsId
-- Alter By Kushal Goswami
-- Exec SP_GetRights 1      
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRights] --0
	@RightsID int = 0
AS
BEGIN	

		select ISNULL([RightsID],0)'RightsID',
		[UserTypeID],
		M.[MenuID],
		M.[MenuName],
		M.[ParentID],
		M.[MenuPage],
		M.[Active] 'MActive',
		R.[Active] 'RActive',
		R.[Created_by],
		R.[Modified_By],
		R.[Created_Date],
		R.[Modified_Date]
		from MST_Menus M left join MST_Rights R on m.MenuID = r.MenuID
		
		where 1=1 and (@RightsID = 0 or RightsID = @RightsID)

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetTicket]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Megha
-- Create date: 17-2-2016
-- Description:	Display in grid
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetTicket] 
@TicketID int	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	select t.TicketID,
	 t.[TicketStatusID]
	,ts.TicketStatus,
	n.TicketNoteID
	,n.NoteDesc
      ,t.[ProjectID]
	  ,p.ProjectName
      ,t.[ModuleID]
	  ,m.ModuleName
      ,t.[IssueTypeID]
	  ,i.IssueType
      ,[Priority]
      ,[AssignToUserID]
      ,[TicketSummary]
      ,[TicketDescription]
      ,t.[Active]
      ,t.[Created_By]
      ,t.[Modified_By]
      ,t.[Created_date]
      ,t.[Modified_Date]
  FROM [TRN_Tickets] t left join MST_TicketStatus ts   on t.TicketStatusID=ts.TicketStatusID
  left join MST_Projects p on t.ProjectID=p.ProjectID
  left join MST_Modules m on t.ModuleID= m.ModuleID
  left join MST_IssueType i on t.IssueTypeID= i.IssueTypeID 
  left join TRN_TicketsNotes n on n.TicketID= t.TicketID
   where 1=1 and ( (@TicketID=0) OR (t.TicketID=@TicketID) )


   
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetTicketfilename]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Megha
-- Create date: 29-2-2016
-- Description:	Display in grid
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetTicketfilename] 
@TicketID int	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	


select * from TRN_TicketsAttachments where( (TicketID=@TicketID) or (@TicketID=0))

 

   


--ID (PK) Name
--1001 Sam




   END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetTicketNote]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Megha
-- Create date: <08/02/2016>
-- Description:	<for get purpose>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetTicketNote]
@TicketNoteID int 
	
	AS
BEGIN
	
	 
	SELECT TicketNoteID,
	TicketID,UserID,
	NoteDesc,
	Active from TRN_TicketsNotes where 1=1 and (@TicketNoteID=0 OR TicketNoteID=@TicketNoteID)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetTicketStatus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Chitranjan Bariya
-- Create date: 05/02/2016
-- Description:	Get All TicketStatus or TicketStatus by Id
-- Alter By Chitranjan Bariya
-- Exec SP_GetTicketStatus 1      
-- =============================================
CREATE procedure [dbo].[SP_GetTicketStatus]
@TicketStatusID int 
as 
begin 

	SELECT [TicketStatusID]
      ,[TicketStatus]
      ,[Active]
      ,[Created_by]
      ,[Modified_By]
      ,[Created_Date]
      ,[Modified_Date]
	FROM [MST_TicketStatus] where 1=1 and (@TicketStatusID=0 OR TicketStatusID=@TicketStatusID)	
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUser]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================              
-- Author: Medha Thakkar            
-- Create date: 05-20-2016             
-- Description: Get All Users OR User By ID 
-- Alter By Jayraj Goswami  
-- exec SP_GetUser 10          
-- =============================================   
CREATE procedure [dbo].[SP_GetUser]  
@UserID int   
as   
begin   

SELECT UserID
		,ut.UserType
      ,u.[UserTypeID]
      ,UserName
      ,Password
      ,FirstName
      ,LastName
      ,Email
      ,Phone
	  ,u. Active
	  , u. Created_by,
	   u. Modified_By,
		u.Created_Date,
		u.Modified_Date
  FROM [MST_Users] u inner join MST_UserType ut on u.UserTypeID=ut.UserTypeID
   where 1=1 and (@UserID=0 OR u.UserID=@UserID)



end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserDetailsByLogin]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Goswami Jayraj 
-- Create date: 23-02-2016
-- Description:	Get Single Data By Login 
-- exec SP_GetUserDetailsByLogin 'Vadminws','Vadmins1'
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUserDetailsByLogin] 
@UserName varchar(20)
,@Password varchar(20)
AS
BEGIN


SELECT top(1) [UserID]
      ,[UserTypeID]
      ,[UserName]
      ,[Password]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[Active]
      ,[Created_by]
      ,[Modified_By]
      ,[Created_Date]
      ,[Modified_Date]
  FROM [MST_Users] where Active=1 and UserName=@UserName and Password=@Password

END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserType]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Chitranjan Bariya
-- Create date: 05/02/2016
-- Description:	Get All UserType or UserType by Id
-- Alter By Chitranjan Bariya
-- Exec SP_GetUserType 1      
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUserType]
@UserTypeID int
AS
BEGIN
	
	SELECT [UserTypeID]
      ,[UserType]
      ,[Active]
      ,[Created_by]
      ,[Modified_By]
      ,[Created_Date]
      ,[Modified_Date]
	FROM [MST_UserType] where 1=1 and (@UserTypeID=0 OR UserTypeID=@UserTypeID)	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateFIleAttchment]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Megha>
-- Create date: <20-2-2016>
-- Description:	<insert update file attachment>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUpdateFIleAttchment] 
	-- Add the parameters for the stored procedure here
@TicketAtchID int=0,
@TicketID int,
@FileName varchar(200),

@UserID int
as
BEGIN

		if (@TicketAtchID=0)
		begin
	insert into TRN_TicketsAttachments
			 (
				TicketID,
				FileName,
				Active,
				Created_by,
				Created_Date
				)
				VALUES
				(@TicketID,
				@FileName,
				1,
				@UserID,
				GETDATE())
				END


				ELSE
				begin
				UPDATE TRN_TicketsAttachments SET
			TicketID=@TicketID,
			FileName=@FileName,
			
			Modified_By=@UserID,
			Modified_Date=GETDATE()
			where  TicketAtchID=@TicketAtchID  and Active=1

			end

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateIssueTypes]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================              
-- Author: Megha              
-- Create date: 02/04/2016              
-- Description: <Description,,>              
-- =============================================
CREATE procedure [dbo].[SP_InsertUpdateIssueTypes]
@IssueTypeID int=0,
@IssueType varchar(50)=null,
@Active bit=false,
@UserID int=0,  
@output varchar(50) = null output  

as
begin
		if(@IssueTypeID=0)
			begin

			if not  exists(select IssueType from MST_IssueType where IssueType=@IssueType and Active=1 )
			begin  
				insert into MST_IssueType
				
				(
				IssueType,
				Active,
				Created_by,
				Created_Date
				) values
				(
				@IssueType,
				@Active,
				@UserID,
				GETDATE()
				)

				 set @output = @@IDENTITY  
			end
				 ELSE  
 begin   
 set @output = '-11'  
 end  
  end 
  
   ELSE  
 begin  
   if  exists(select IssueType from MST_IssueType where IssueType=@IssueType  and Active=1 and IssueTypeID<>@IssueTypeID)   
  begin  
   set @output = '-11'  
     
   END 
   ELSE
   begin  
		update MST_IssueType set 
		IssueType=@IssueType,
		Active=@Active,
		Modified_By=@UserID,
		Modified_Date=Getdate() 

		where IssueTypeID=@IssueTypeID

		set @output ='-22'
				END
END
end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateMenus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kushal Goswami
-- Create date: 10/02/2016
-- Description:	Save and update Menus.
-- Alter By Kushal Goswami
-- Exec SP_InsertUpdateMenus 0,'Menu1',1,'Menupage','true',0
-- =============================================

CREATE PROCEDURE [dbo].[SP_InsertUpdateMenus]
	
@MenuID int = 0,
@MenuName varchar(50) = null,
@ParentID int = 0,
@MenuPage varchar(50) = null,
@Active bit,
@UserId int = 0,
@Sequence int = 0,
@output varchar(50) = null output

AS
BEGIN
		
			if(@MenuID = 0)	
			begin
				if not exists(select MenuName from MST_Menus where MenuName=@MenuName and ParentID = @ParentID)
				begin
						insert into MST_Menus
						(
							MenuName,
							ParentID,
							MenuPage,
							Active,
							Created_by,
							Created_Date,
							[Sequence]
						)
						values
						(
							@MenuName,
							@ParentID,
							@MenuPage,
							@Active,
							@UserId,
							GETDATE(),
							@Sequence
						)
						set @output = SCOPE_IDENTITY();
				end
				else
				begin
					set @output = '-11'
				end
			end
			else
			begin
				
				if exists(select MenuName from MST_Menus where MenuName=@MenuName and MenuID != @MenuID)
				begin
					set @output ='-11'
				end
				else
				begin

				
					declare @OldMenuID as int, @OldSeqID as int
					set @OldMenuID = (select MenuID from MST_Menus where [Sequence] = @Sequence)
					set @OldSeqID = (select [Sequence] from MST_Menus where MenuID = @MenuID)					

					update MST_Menus set
					MenuName = @MenuName,
					ParentID = @ParentID,
					MenuPage = @MenuPage,
					Active = @Active,
					Modified_By = @UserId,
					Modified_Date = GETDATE(),
					[Sequence] = @Sequence					
					where MenuID = @MenuID			


					update MST_Menus set [Sequence] = @OldSeqID where MenuID = @OldMenuID

					set @output ='-22'
				end
					
			end
		
		
		
			
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateModules]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kushal Goswami
-- Create date: 05/02/2016
-- Description:	Save and update Modules.
-- Alter By Kushal Goswami
-- Exec SP_InsertUpdateModules 0,1,'Module22','sdf','True',0
-- =============================================

CREATE PROCEDURE [dbo].[SP_InsertUpdateModules] --0,1,'Module22','sdf','True',0

@ModuleID int,
@ProjectID int, 
@ModuleName varchar(50),
@ModuleVer varchar(50),
@Active bit,
@UserId int,
@output varchar(50) = null output

AS
BEGIN

			if(@ModuleID = 0)
			begin
				if not exists(select ModuleName from MST_Modules where ModuleName=@ModuleName)	
				begin
					insert into MST_Modules
					(	
						ProjectID,
						ModuleName,
						ModuleVer,
						Active,
						Created_by,						
						Created_Date						
					)
					values
					(					
						@ProjectID,
						@ModuleName,
						@ModuleVer,
						@Active,
						@UserId,						
						GETDATE()
					)
					set @output = SCOPE_IDENTITY();
				end
				else
				begin
					set @output = '-11'
				end
			end
			else
			begin
				if exists(select ModuleName from MST_Modules where ModuleName=@ModuleName and ModuleID != @ModuleID)	
				begin								
					set @output = '-11'					
				end
				else
				begin
					
					update MST_Modules set	
					ModuleName=@ModuleName,	
					ProjectID=@ProjectID,									
					ModuleVer = @ModuleVer,
					Active = @Active,					
					Modified_By =@UserId,						
					Modified_Date = GETDATE()
					where ModuleID = @ModuleID	
					set @output = '-22'					
				end
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateProjects]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Kushal Goswami
-- Create date: 05/02/2016
-- Description:	Save and update Projects.
-- Alter By Kushal Goswami
-- Exec SP_InsertUpdateProjects 20,'Project19','asd','True',1     
-- =============================================

CREATE PROCEDURE [dbo].[SP_InsertUpdateProjects] 

@ProjectID int = 0,
@ProjectName varchar(50) = null,
@ProjectVer varchar(10) = null,
@Active bit,
@UserId int = 0,
@output varchar(50) = null output

AS
BEGIN

			if(@ProjectID = 0)
			begin

				if not exists(select ProjectName from MST_Projects where ProjectName=@ProjectName)	
				begin
					insert into MST_Projects
					(					
						ProjectName,
						ProjectVer,
						Active,
						Created_by,						
						Created_Date						
					)
					values
					(					
						@ProjectName,
						@ProjectVer,
						@Active,
						@UserId,						
						GETDATE()
					)
					set @output = SCOPE_IDENTITY();
				end
				else
				begin					
					set @output = '-11'
				end

			end
			else
			begin
				if exists(select ProjectName from MST_Projects where ProjectName=@ProjectName and ProjectID != @ProjectID)	
				begin
					set @output ='-11'
				end
				else 
				begin
					update MST_Projects set
					ProjectName = @ProjectName,								
					ProjectVer = @ProjectVer,									
					Active = @Active,					
					Modified_By =@UserId,
					Modified_Date = GETDATE()
					where ProjectID = @ProjectID		
					set @output ='-22'
				end				
			end	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateRights]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Kushal Goswami
-- Create date: 12/02/2016
-- Description:	Save and update Rights.
-- Alter By Kushal Goswami
-- Exec SP_InsertUpdateRights       
-- =============================================

CREATE PROCEDURE [dbo].[SP_InsertUpdateRights]

@MenuIds varchar(50),
@UserTypeID int = 0,
@MenuID int = 0,
@Active bit,
@UserId int

AS
declare @sql varchar(max)
declare @sql1 varchar(max)
BEGIN
	
if not exists(select MenuID from MST_Rights where MenuID=@MenuID and UserTypeID = @UserTypeID)	
begin

			insert into MST_Rights
			(
				UserTypeID,
				MenuID,
				Active,
				Created_by,
				Created_Date
			)
			values
			(
				@UserTypeID,
				@MenuID,
				@Active,
				@UserId,
				GETDATE()
			)			

end
else
begin
	
	set @sql = 'update MST_Rights set Active = ''true'',Modified_By = '+CAST(@UserId as varchar)+',
	Modified_Date='''+Convert(varchar, GETDATE(),121)+''' where MenuID in('+@MenuIds+') and UserTypeID ='+CAST(@UserTypeID as varchar)+''
	
	exec(@sql);

end
	set @sql1 = 'update MST_Rights set Active = ''false'',Modified_By = '+CAST(@UserId as varchar)+',
	Modified_Date='''+Convert(varchar, GETDATE(),121)+''' where MenuID not in('+@MenuIds+') and UserTypeID ='+CAST(@UserTypeID as varchar)+''
	
	
	exec(@sql1);

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTicket]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Megha>
-- Create date: <18-2-2016>
-- Description:	<insert update Ticket>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUpdateTicket] 
@TicketID int=0,
--@TicketAtchID int =0,
@TicketStatusID int=0,
@ProjectID int=0,
@ModuleID int=0,
@IssueTypeID int=0,
@Priority varchar(10)=null,
@AssignToUserID int=0,
@TicketSummary varchar(200)=null,
@TicketDescription varchar(max)=null,

@UserID int=null,
--@FileName varchar(200)=null,
@output varchar(50)	= null output  
AS
BEGIN
	if(@TicketID = 0)  
   begin    
--if not  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID and IssueTypeID=@IssueTypeID)  
if not  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID)  
begin 
		insert into TRN_Tickets
		(
			TicketStatusID,
			ProjectID,
			ModuleID,
			IssueTypeID,
			Priority,
			AssignToUserID,
			TicketSummary,
			TicketDescription,
			Active,
			Created_By,
			Created_date
			)
			VALUES(

			@TicketStatusID,
			@ProjectID,
			@ModuleID,
			@IssueTypeID,
			@Priority,
			@AssignToUserID,
			@TicketSummary,
			@TicketDescription,
			1,
			@UserID,
			getdate()
			)
			

			 --insert into TRN_TicketsAttachments
			 --(
				--TicketID,
				--FileName,
				--Active,
				--Created_by,
				--Created_Date
				--)
				--VALUES
				--(@@identity,
				--@FileName,
				--@Active,
				--@Created_By,
				--GETDATE())
				 set @output = SCOPE_IDENTITY()  
			  end  
  ELSE  
 begin   
 set @output = '-11'  
 end  
 end
  ELSE  
 begin  
  -- if  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID and IssueTypeID=@IssueTypeID and TicketID<>@TicketID )   
  if  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID and IssueTypeID=@IssueTypeID)   
  begin  
   set @output = '-11'  
     
   END  
  
   else  
   begin  
   update TRN_Tickets SET
   TicketStatusID=@TicketStatusID,
			ProjectID=@ProjectID,
			ModuleID=@ModuleID,
			IssueTypeID=@IssueTypeID,
			Priority=@Priority,
			AssignToUserID=@AssignToUserID,
			TicketSummary=@TicketSummary,
			TicketDescription=@TicketDescription,
		
			Modified_By=@UserID,
			Modified_Date=GETDATE()
			where TicketID=@TicketID and Active=1

			--UPDATE TRN_TicketsAttachments SET
			--TicketID=@TicketID,
			--FileName=@FileName,
			--Active=@Active,
			--Modified_By=@Created_By,
			--Modified_Date=GETDATE()
			--where TicketAtchID = @TicketAtchID and TicketID=@TicketID
			 set @output ='-22' 
			 END
			 end


END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTicketandTicketAttachement]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Megha>
-- Create date: <18-2-2016>
-- Description:	<insert update Ticket>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUpdateTicketandTicketAttachement] 
@TicketID int=0,
@TicketAtchID int =0,
@TicketStatusID int=0,
@ProjectID int=0,
@ModuleID int=0,
@IssueTypeID int=0,
@Priority varchar(10)=null,
@AssignToUserID int=0,
@TicketSummary varchar(200)=null,
@TicketDescription varchar(max)=null,
@Active bit=false,
@Created_By int=null,
@FileName varchar(200)=null,
@output varchar(50)	= null output  
AS
BEGIN
	if(@TicketID = 0)  
   begin    
if not  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID and IssueTypeID=@IssueTypeID)  
begin 
		insert into TRN_Tickets
		(
			TicketStatusID,
			ProjectID,
			ModuleID,
			IssueTypeID,
			Priority,
			AssignToUserID,
			TicketSummary,
			TicketDescription,
			Active,
			Created_By,
			Created_date
			)
			VALUES(

			@TicketStatusID,
			@ProjectID,
			@ModuleID,
			@IssueTypeID,
			@Priority,
			@AssignToUserID,
			@TicketSummary,
			@TicketDescription,
			@Active,
			@Created_By,
			getdate()
			)
			

			 insert into TRN_TicketsAttachments
			 (
				TicketID,
				FileName,
				Active,
				Created_by,
				Created_Date
				)
				VALUES
				(@@identity,
				@FileName,
				@Active,
				@Created_By,
				GETDATE())
				 set @output = @@IDENTITY  
			  end  
  ELSE  
 begin   
 set @output = '-11'  
 end  
 end
  ELSE  
 begin  
   if  exists(select * from TRN_Tickets where ProjectID=@ProjectID and Active=1 and ModuleID=@ModuleID and IssueTypeID=@IssueTypeID and TicketID<>@TicketID )   
  begin  
   set @output = '-11'  
     
   END  
  
   else  
   begin  
   update TRN_Tickets SET
   TicketStatusID=@TicketStatusID,
			ProjectID=@ProjectID,
			ModuleID=@ModuleID,
			IssueTypeID=@IssueTypeID,
			Priority=@Priority,
			AssignToUserID=@AssignToUserID,
			TicketSummary=@TicketSummary,
			TicketDescription=@TicketDescription,
			Active=@Active,
			Modified_By=@Created_By,
			Modified_Date=GETDATE()
			where TicketID=@TicketID

			UPDATE TRN_TicketsAttachments SET
			TicketID=@TicketID,
			FileName=@FileName,
			Active=@Active,
			Modified_By=@Created_By,
			Modified_Date=GETDATE()
			where TicketAtchID = @TicketAtchID and TicketID=@TicketID
			 set @output ='-22' 
			 END
			 end


END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTicketNotes]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertUpdateTicketNotes]
@TicketNoteID int=0,
@TicketID int=0,
@NotesUserID int=0,
@NoteDesc varchar(max)=null,
@UserID int,
@output varchar(50) = null output  
as
begin 
	if(@TicketNoteID=0)
	begin 
	--if not  exists(select UserName from MST_Users where UserName=@UserName and Active=1 and Phone=@Phone) 
	insert into TRN_TicketsNotes(TicketID,
								UserID,
								NoteDesc,
								Active,
								Created_by,
								Created_Date)

								VALUES

								(@TicketID,
								@NotesUserID,
								@NoteDesc,
								1,
								@UserID,
								GETDATE()
								)
						 set @output = scope_identity()  
	--end
	end
	ELSE
	BEGIN

	update TRN_TicketsNotes
	SET

	UserID=@UserID,
	TicketID=@TicketID,
	NoteDesc=@NoteDesc,
		Modified_By=@UserID,
	Modified_Date=GETDATE()
	where TicketNoteID=@TicketNoteID and Active=1
	 set @output ='-22' 
	end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTicketStatus]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Chitranjan Bariya
-- Create date: 05/02/2016
-- Description:	Insert Update TicketStatus
-- Exec SP_InsertUpdateTicketStatus '0','Open','true',''
-- =============================================

CREATE PROCEDURE [dbo].[SP_InsertUpdateTicketStatus]

@TicketStatusID int,
@TicketStatus nvarchar(50),
@Active bit,
@UserID int,
@output nvarchar(50) = null output

AS
BEGIN
		
			if(@TicketStatusID=0)
				begin
					if not exists(select TicketStatus from MST_TicketStatus where TicketStatus=@TicketStatus)	
					begin			
						insert into MST_TicketStatus
							(							
							 TicketStatus
							,Active
							,Created_by
							,Created_Date
							)
						values
							(
							 @TicketStatus
							,@Active
							,@UserID
							,GETDATE()
							)
					end
					else
					begin
						set @output ='-11'
					end
				end
			else
				begin
					if exists(select TicketStatus from MST_TicketStatus where TicketStatus=@TicketStatus and TicketStatusID<>@TicketStatusID)
						begin
							set @output ='-11'   
						end
					else
						begin							
							update MST_TicketStatus set
							TicketStatus=@TicketStatus
							,Active = @Active
							,Modified_By =@UserID					
							,Modified_Date = GETDATE()					
							where TicketStatusID =@TicketStatusID
							
							set @output ='-22'   							
						end					
				end			
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateUsers]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
-- =============================================                
-- Author: Megha                
-- Create date: 02/04/2016                
-- Description: <Description,,>   
  
--updated date:06/02/2016  
-- Aurthor:Megha   
-- Alter By Jayraj Goswami Set Update Logic            
-- =============================================  
CREATE PROCEDURE [dbo].[SP_InsertUpdateUsers]  
@UserIDs int=0,  
@UserTypeID int=0,  
@UserName varchar(30)=null,  
@Password varchar(100)=null,  
@FirstName varchar(50)=null,  
@LastName varchar(50)=null,  
@Email varchar(150)=null,  
@Phone bigint=0,  
@Active bit=false,  
@UserID int,  
@output varchar(50) = null output  
  
  
AS  
BEGIN  
 
   
 if(@UserIDs = 0)  
   begin    
if not  exists(select UserName from MST_Users where UserName=@UserName and Active=1 and Phone=@Phone)  
begin    
     insert into MST_Users  
     (  
     UserTypeID,  
     UserName,  
     Password,  
     FirstName,  
     LastName,  
     Email,  
     Phone,  
     Active,  
     Created_by,  
      Created_Date  
      )  
     values(   
     @UserTypeID,  
     @UserName,  
     @Password,  
     @FirstName,  
     @LastName,  
     @Email,  
     @Phone,  
     @Active,  
     @UserID,  
     GETDATE()  
    )  
    set @output = @@IDENTITY  
   end  
  ELSE  
 begin   
 set @output = '-11'  
 end  
  END  
  ELSE  
 begin  
   if  exists(select UserName from MST_Users where UserName=@UserName  and Active=1 and Phone=@Phone and UserID<>@UserIDs )   
  begin  
   set @output = '-11'  
     
   END  
  
   else  
   begin  
     update MST_Users set    
     UserTypeID=@UserTypeID,     
     UserName = @UserName,  
     Password = @Password,  
     FirstName=@FirstName,  
     LastName=@LastName,  
     Email=@Email,  
     Phone=@Phone,  
     Active=@Active,  
     Modified_By =@UserID,        
     Modified_Date = GETDATE()  
     where UserID = @UserIDs  
   set @output ='-22' 
    end  
 END  

end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateUserType]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author: Chitranjan Bariya    
-- Create date: 05/02/2016    
-- Description: Insert Update TicketStatus    
-- Exec SP_InsertUpdateUserType '1','VendorAdmin','false',''    
-- =============================================    
CREATE PROCEDURE [dbo].[SP_InsertUpdateUserType]    
    
@UserTypeID int,    
@UserType nvarchar(50),    
@Active bit,    
@UserID int,    
@output nvarchar(50) = null output    
    
AS    
BEGIN    
    
 if(@UserTypeID=0)    
   begin    
    if not exists(select UserType from MST_UserType where UserType=@UserType)     
    begin       
     insert into MST_UserType    
      (    
       UserType    
      ,Active    
      ,Created_by    
      ,Created_Date    
      )    
     values    
      (    
       @UserType    
      ,@Active    
      ,@UserID    
      ,GETDATE()    
      )    
      set @output= SCOPE_IDENTITY();  
    end    
    else    
     begin    
      set @output ='-11'    
     end    
   end    
 else    
    begin    
	  if exists(select UserType from MST_UserType where UserType=@UserType and UserTypeID <> @UserTypeID)   
		begin  
			set @output ='-11' 
		end  
	   else  
	   begin
		 update MST_UserType set    
	     UserType=@UserType    
	     ,Active = @Active    
	     ,Modified_By =@UserID         
	     ,Modified_Date = GETDATE()         
	     where  UserTypeID=@UserTypeID   
		 set @output ='-22'  

	   end    
   end    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchIssueType]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchIssueType]
@IssueType varchar(50)
as
begin
select IssueType from MST_IssueType where IssueType like '%' + @IssueType +'%'

--return 0

end

GO
/****** Object:  StoredProcedure [dbo].[SP_SearchTicket]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Chitranjan Bariya
-- Create date: 20/02/2016
-- Description:	Master Search for Ticket by all Criteria
-- Exec SP_SearchTicket null,null,null,null,null,null,null,100,null,0,null
-- =============================================
CREATE PROCEDURE [dbo].[SP_SearchTicket]

@AssignToUserID int=null,
@ProjectID int=null,
@ModuleID int=null,
@TicketStatusID int=null,
@IssueTypeID int=null,
@TicketfromDate datetime=null,
@TicketToDate datetime=null,
@Created_By int,
@Priority varchar(20)=null,
@UserTypeID int,
@TicketID int=null
	
AS
BEGIN
	
	SELECT TicketID
      ,T.TicketStatusID
      ,T.ProjectID
      ,T.ModuleID
      ,T.IssueTypeID
      ,Priority
      ,AssignToUserID
      ,TicketSummary
      ,TicketDescription
      ,T.Active
      ,T.Created_By
      ,T.Modified_By
      ,T.Created_date
      ,T.Modified_Date
	  ,P.ProjectName
	  ,M.ModuleName
	  ,TS.TicketStatus
	  ,IT.IssueType
	  ,U.UserTypeID
	  ,U.UserName	  
	FROM TRN_Tickets T
	left join MST_Projects P on P.ProjectID = T.ProjectID
	left join MST_Modules M on M.ModuleID = T.ModuleID
	left join MST_TicketStatus TS on TS.TicketStatusID = T.TicketStatusID
	left join MST_IssueType IT on IT.IssueTypeID = T.IssueTypeID
	left join MST_Users U on U.UserID = T.Created_By
	left join MST_UserType UT on UT.UserTypeID = U.UserTypeID
	WHERE 1=1	
		 AND (@AssignToUserID is null OR T.AssignToUserID = @AssignToUserID )
		 AND (@ProjectID is null OR T.ProjectID =@ProjectID)
		 AND (@ModuleID is null OR T.ModuleID = @ModuleID)
		 AND (@TicketStatusID is null OR T.TicketStatusID = @TicketStatusID)
		 AND (@IssueTypeID is null OR T.IssueTypeID=@IssueTypeID )		 
		 AND (@Priority is null OR T.Priority = @Priority)
		 AND (@Created_By = 0 OR T.Created_By = @Created_By)
		 --AND (T.Created_By = (case when @UserTypeID = 1 then 0 else @Created_By end))
		 AND (@UserTypeID = 0 OR U.UserTypeID = @UserTypeID)			
		 AND (@TicketID is null OR T.TicketID = @TicketID)
		 AND (@TicketfromDate is null OR T.Created_date >= @TicketfromDate AND CONVERT(varchar, T.Created_date,110) <= @TicketToDate)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_SearchUser]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchUser]
@Search varchar(50)
as 
begin 

select UserName from MST_Users where UserName like '%' +@Search + '%'

end
GO
/****** Object:  StoredProcedure [dbo].[usp_FindTableNameInAllDatabase]    Script Date: 3/29/2017 10:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_FindTableNameInAllDatabase]
@TableName VARCHAR(256)
AS
DECLARE @DBName VARCHAR(256)
DECLARE @varSQL VARCHAR(512)
DECLARE @getDBName CURSOR
SET @getDBName = CURSOR FOR
SELECT name
FROM sys.databases
CREATE TABLE #TmpTable (DBName VARCHAR(256),
SchemaName VARCHAR(256),
TableName VARCHAR(256))
OPEN @getDBName
FETCH NEXT
FROM @getDBName INTO @DBName
WHILE @@FETCH_STATUS = 0
BEGIN
SET @varSQL = 'USE ' + @DBName + ';
INSERT INTO #TmpTable
SELECT '''+ @DBName + ''' AS DBName,
SCHEMA_NAME(schema_id) AS SchemaName,
name AS TableName
FROM sys.tables
WHERE name LIKE ''%' + @TableName + '%'''
EXEC (@varSQL)
FETCH NEXT
FROM @getDBName INTO @DBName
END
CLOSE @getDBName
DEALLOCATE @getDBName
SELECT *
FROM #TmpTable
DROP TABLE #TmpTable

GO
USE [master]
GO
ALTER DATABASE [TicketSystem] SET  READ_WRITE 
GO
