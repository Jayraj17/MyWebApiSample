USE [master]
GO
/****** Object:  Database [Developer]    Script Date: 3/29/2017 6:37:15 PM ******/
CREATE DATABASE [Developer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Developer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Developer.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Developer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Developer_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Developer] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Developer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Developer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Developer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Developer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Developer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Developer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Developer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Developer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Developer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Developer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Developer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Developer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Developer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Developer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Developer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Developer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Developer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Developer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Developer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Developer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Developer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Developer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Developer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Developer] SET RECOVERY FULL 
GO
ALTER DATABASE [Developer] SET  MULTI_USER 
GO
ALTER DATABASE [Developer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Developer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Developer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Developer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Developer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Developer', N'ON'
GO
USE [Developer]
GO
/****** Object:  User [SNB\jairaj]    Script Date: 3/29/2017 6:37:15 PM ******/
CREATE USER [SNB\jairaj] FOR LOGIN [SNB\jairaj] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SNB\chintan]    Script Date: 3/29/2017 6:37:15 PM ******/
CREATE USER [SNB\chintan] FOR LOGIN [SNB\chintan] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SNB\jairaj]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [SNB\jairaj]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SNB\jairaj]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [SNB\jairaj]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SNB\jairaj]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SNB\jairaj]
GO
/****** Object:  UserDefinedFunction [dbo].[EF_Num_Increment]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[EF_Num_Increment] 
(
	@num int = null
)  
returns  int

AS  
begin 	
	return @num + 1
end

GO
/****** Object:  Table [dbo].[Child]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Child](
	[id] [int] IDENTITY(100,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_CityMaster] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactDetail]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactDetail](
	[ContactId] [int] NOT NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[EmailAddress] [varchar](250) NULL,
 CONSTRAINT [PK_ContactDetail] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Demo_Mst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Demo_Mst](
	[PID] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_Demo_Mst] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EduMst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EduMst](
	[EID] [int] NOT NULL,
	[EName] [varchar](50) NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_EduMst] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpNo] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](100) NULL,
	[Salary] [int] NOT NULL,
	[DeptName] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[EmpFile] [varchar](150) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK__Employee__AF2D66D329572725] PRIMARY KEY CLUSTERED 
(
	[EmpNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginMst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginMst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_LoginMst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MST_Modules]    Script Date: 3/29/2017 6:37:15 PM ******/
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
	[Active] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[MST_Projects]    Script Date: 3/29/2017 6:37:15 PM ******/
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
	[Active] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[Parent]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Mst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Mst](
	[ProID] [uniqueidentifier] NOT NULL,
	[ProName] [varchar](50) NULL,
	[ProEpxDate] [datetime] NULL,
	[IsDelete] [bit] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Product_Mst] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistrationMst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistrationMst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Mname] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Education] [int] NULL,
	[FilePath] [varchar](250) NULL,
 CONSTRAINT [PK_RegistrationMst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](500) NULL,
	[Class] [varchar](50) NULL,
	[EnrollYear] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Demo_Mst] ([PID], [FirstName], [LastName]) VALUES (N'90948f26-c895-4f85-98d9-0b429272af0c', N'BB', N'BB')
INSERT [dbo].[Demo_Mst] ([PID], [FirstName], [LastName]) VALUES (N'b2530fce-8065-4629-ab00-43d5ca19a58d', N'CCCCCCCCC', N'CCCCCCCCC')
INSERT [dbo].[Demo_Mst] ([PID], [FirstName], [LastName]) VALUES (N'ac96dc2d-2936-468a-ba67-9170c341f225', N'A', N'A')
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpNo], [EmpName], [Salary], [DeptName], [Designation], [EmpFile], [UserName], [Password], [IsActive]) VALUES (1, N'JAYRAJ', 20, N'test', N'test', NULL, N'JAY', N'123', 1)
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [Salary], [DeptName], [Designation], [EmpFile], [UserName], [Password], [IsActive]) VALUES (2, N'Sagar', 10, N'Test', N'test', NULL, N'Sagar', N'123', 1)
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [Salary], [DeptName], [Designation], [EmpFile], [UserName], [Password], [IsActive]) VALUES (3, N'Jigar', 30, N'test', N'test', NULL, N'jigar', N'123', 1)
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [Salary], [DeptName], [Designation], [EmpFile], [UserName], [Password], [IsActive]) VALUES (4, N'Darshan', 40, N'test', N'test', NULL, N'darshan', N'123', 1)
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [Salary], [DeptName], [Designation], [EmpFile], [UserName], [Password], [IsActive]) VALUES (5, N'Maulik', 50, N'test', N'test', NULL, N'maulik', N'123', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Product_Mst] ([ProID], [ProName], [ProEpxDate], [IsDelete], [UserID]) VALUES (N'b6d0e1d6-c82f-4255-ab65-3fc62940563c', N'test', NULL, 0, 1)
INSERT [dbo].[Product_Mst] ([ProID], [ProName], [ProEpxDate], [IsDelete], [UserID]) VALUES (N'6de57b96-8bf7-44a4-81e5-926d1844d15f', N'test77', NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [Name], [Email], [Class], [EnrollYear], [City], [Country]) VALUES (1, N'Ganesh', N'ddd', N'dd', N'dddd', N'dd', N'dd')
INSERT [dbo].[Student] ([StudentID], [Name], [Email], [Class], [EnrollYear], [City], [Country]) VALUES (2, N'sagar', N'sa', N'sa', N'sa', N'sa', N'sa')
INSERT [dbo].[Student] ([StudentID], [Name], [Email], [Class], [EnrollYear], [City], [Country]) VALUES (3, N'suresh', N'su', N'su', N'su', N'su', N'su')
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[MST_Modules] ADD  CONSTRAINT [DF__MST_Modul__Activ__060DEAE8]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MST_Projects] ADD  CONSTRAINT [DF__MST_Proje__Activ__014935CB]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[CityMaster]  WITH CHECK ADD  CONSTRAINT [FK_CityMaster_CountryMaster] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryMaster] ([CID])
GO
ALTER TABLE [dbo].[CityMaster] CHECK CONSTRAINT [FK_CityMaster_CountryMaster]
GO
ALTER TABLE [dbo].[RegistrationMst]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationMst_EduMst] FOREIGN KEY([Education])
REFERENCES [dbo].[EduMst] ([EID])
GO
ALTER TABLE [dbo].[RegistrationMst] CHECK CONSTRAINT [FK_RegistrationMst_EduMst]
GO
/****** Object:  StoredProcedure [dbo].[EP_Uniq_ID_suffix_under_prefix_compute]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================
-- Author:		JigarP
-- Create date: 20080603
-- Description:	This is used to generate a Child Uniq key.




--declare @UniqIDStr varchar(20)    
--declare @return_value int  
-------Generate Code

--  EXEC @return_value = [dbo].[EP_Uniq_ID_suffix_under_prefix_compute]      
--       @Prefix = 'DR',      
--       @Prefix_Type = 'AN',      
--       @TableName = 'ET_C_DiagnosticResults',      
--       @UniqColName = 'DR_ResultUniqID',      
--       @Suffix_Length = 8,      
--       @Suffix_Type = 'AN',      
--       @sPK = @UniqIDStr OUTPUT 
       

--       print @UniqIDStr 
-- ===============================================================

CREATE PROC [dbo].[EP_Uniq_ID_suffix_under_prefix_compute]
(
	@Prefix varchar(25)=null,
	@Prefix_Type varchar(2)=null,
	@TableName varchar(70)=null,
	@UniqColName varchar(70)=null,
	@Suffix_Length int = 0,
	@Suffix_Type varchar(2) =null,
	@nPK bigint = 0 output,
	@sPK varchar(25)=null output
)
as
begin 
		
	declare @Debug bit
	set @Debug=0

	if(@Prefix_Type ='N')
	begin
	
		declare @nLbound bigint
		declare @nUbound bigint 
		declare @sLboundT varchar(25)
		declare @sUboundT varchar(25)
		
		set @nLbound=0
		set @nUbound=0	
		--prepare Lbound and Ubound
		if(@Suffix_Type ='N')
		begin	
				EXEC [dbo].[EP_UniqID_Low_Upp_bound_prepare]
				@Suffix_Type = @Suffix_Type,
				@Prefix_type = @Prefix_Type,
				@Prefix = @Prefix,
				@LengthOfSuffix =@Suffix_Length,
				@nLbound = @nLbound OUTPUT,
				@nUbound = @nUbound OUTPUT

				--print '@Suffix_Type N (EP_UniqID_Low_Upp_bound_prepare : finished): EP_Uniq_ID_suffix_under_prefix_compute'
				--Find maximum
				if((@nLbound >0) and (@nUbound >0))
				begin
						
					set @sLboundT = cast(@nLbound as varchar)
					set @sUboundT = cast(@nUbound as varchar)					

					EXEC [dbo].[EP_UniqID_Max_Val_Fetch]
					@PK_Type = @Prefix_Type,
					@Table_Name =@TableName,
					@Col_Name = @UniqColName,
					@Lbound = @sLboundT,
					@Ubound = @sUboundT,
					@nPK = @nPK output
					if(@Debug =1 ) print  ' @nPK is '+isnull(@nPK ,' NULLLLLLLLLLL')

					--print '@Suffix_Type N (EP_UniqID_Max_Val_Fetch : finished): EP_Uniq_ID_suffix_under_prefix_compute'					
					--increment -put condition for null
					if(@nPK > 0)
					begin
						set @nPK=dbo.EF_Num_Increment(@nPK)
					end
					else
					begin
						set @nPK=dbo.EF_Num_Increment(@nLbound)
					end
				end
		end
		else --suffix not N
		begin
				return -2
		end
	end
	else if(@Prefix_Type ='AN')
	begin
	
		if(@Debug =1 ) print  '@Prefix_Type '+@Prefix_Type
		declare @sLbound varchar(25)
		declare @sUbound varchar(25) 	
		declare @UniqKInc bigint
		declare @UniqKIncAN varchar(25)

		set @sLbound=null
		set @sUbound=null
		set @UniqKInc=0

		if (@TableName='ET_C_Chart_Notes')
		begin
			set @UniqKIncAN='A1'	
		end
		else if (@TableName='ET_B_Chart_Notes')
		begin
			set @UniqKIncAN='A1'	
		end
		else
		begin	
			if(@Debug =1 )print 'REPLICATION - @UniqKIncAN - '
			if(@Debug =1 )PRINT @UniqKIncAN
			if(@Debug =1 )PRINT @Suffix_Length	 
			set @UniqKIncAN = replicate('1',@Suffix_Length)				
			if(@Debug =1 )PRINT 'AFTER REPLICATE'
			if(@Debug =1 )PRINT @UniqKIncAN
		end
		--prepare Lbound and Ubound	
						EXEC [dbo].[EP_UniqID_Low_Upp_bound_prepare]
						@Suffix_Type = @Suffix_Type,
						@Prefix_type = @Prefix_Type,
						@Prefix = @Prefix,
						@LengthOfSuffix =@Suffix_Length,
						@sLbound = @sLbound OUTPUT,
						@sUbound = @sUbound OUTPUT	
		if(@Debug =1 ) print  '@sLbound '+@sLbound
		if(@Debug =1 ) print  '@sUbound '+@sUbound

		print '@Prefix_Type =AN (EP_UniqID_Low_Upp_bound_prepare : finished): EP_Uniq_ID_suffix_under_prefix_compute'					
		--Find maximum
			if((@sLbound is not null) and (@sUbound is not null))
			begin
				EXEC [dbo].[EP_UniqID_Max_Val_Fetch]
				@PK_Type = @Prefix_Type,
				@Table_Name =@TableName,
				@Col_Name = @UniqColName,
				@Lbound = @sLbound,
				@Ubound = @sUbound,
				@sPK = @sPK OUTPUT	

				print '@Prefix_Type =AN (EP_UniqID_Max_Val_Fetch : finished): EP_Uniq_ID_suffix_under_prefix_compute'					
				if(@Suffix_Type='N')
				begin
					if(@sPK is null)
					begin
						if(@Debug =1 ) print ' @sPK is null'
						set @UniqKIncAN='1'
						set @UniqKIncAN=dbo.GF_String_LPAD(@Suffix_Length,@UniqKIncAN,'0')
						if(@Debug =1 ) print ' @UniqKIncAN '+isnull(@UniqKIncAN,' is null ')
						--set @sPK = @Prefix + @UniqKIncAN	
					end
					else
					begin
						if(@Debug =1 )
						begin						
							PRINT '@sPK is not null'
							print @UniqKIncAN
							print @sPK
							print @Suffix_Length
						end
						set @UniqKIncAN=right(@sPK,@Suffix_Length)
						if(@Debug =1 )print 'right finished'
						if(@Debug =1 )print @UniqKIncAN

--						declare @varInt bigint
--						print '-----'
--						set @varInt =  cast(@UniqKIncAN as bigint)
--						print '-----'	
						--required to change---------------------------
						--set @UniqKInc=cast('JU001' as bigint) 
						--set @UniqKInc=cast(@UniqKIncAN as numeric(20,0))
						--set @UniqKInc=convert(numeric(20,0),'11111')
						--set @UniqKIncAN = @varInt
						--set @UniqKInc=convert(bigint,@UniqKIncAN)
						set @UniqKInc=cast(@UniqKIncAN as bigint) --originally			
						--set @UniqKInc=cast(@UniqKIncAN as nvarchar(max))			
						-----------------------------------------------
						if(@Debug =1 )print 'cast finished'
						
						set @UniqKInc=dbo.EF_Num_Increment(@UniqKInc)
	
						if(@Debug =1 )print 'fn finished'
						set @UniqKIncAN=cast(@UniqKInc as varchar)	
						if(@Debug =1 )print 'cast finished'
						set @UniqKIncAN=dbo.GF_String_LPAD(@Suffix_Length,@UniqKIncAN,'0')

						if(@Debug =1 )print 'fn2 finished'
						if(@Debug =1 ) PRINT '@UniqKIncAN '+str(@UniqKIncAN)
						--set @sPK = @Prefix + @UniqKIncAN	
					end
				end
				else if(@Suffix_Type='AN')
				begin
					if(@Debug =1 ) print  '@Suffix_Type '+@Suffix_Type
					if(@sPK is not null)	
					begin
						if(@Debug =1 ) print ' @sPK '+@sPK
						if(@Debug =1 )print ' @Suffix_Length ' +isnull(STR(@Suffix_Length),'@Suffix_Length is null')
						set @UniqKIncAN=right(@sPK,@Suffix_Length)
						if(@Debug =1 )print ' before @UniqKIncAN ' +@UniqKIncAN		
						exec EP_UniqID_CharStr_Increment 
							 @last_uniq_id_char =  @UniqKIncAN OUTPUT

						print '@Suffix_Type=AN : EP_UniqID_CharStr_Increment finished'
						if(@Debug =1 )print ' alter EP_UniqID_CharStr_Increment -> @UniqKIncAN ' +@UniqKIncAN	
							 
							--set @UniqKIncAN = replicate('1',@Suffix_Length)
							--set @sPK = @Prefix + @UniqKIncAN
					end
				end	
			end
			set @sPK = @Prefix + @UniqKIncAN
			if(@Debug =1 )print '@sPK '+@sPK
		end
end

GO
/****** Object:  StoredProcedure [dbo].[EP_UniqID_CharStr_Increment]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext [EP_UniqID_CharStr_Increment]

 

CREATE proc [dbo].[EP_UniqID_CharStr_Increment]    
(    
 @last_uniq_id_char varchar(25) output,    
 @Err_msg varchar(500) = null output    
)    
as    
begin    
    
 declare @rightchar varchar(25)    
 declare @vlen varchar(25)     
 declare @last_one_char varchar(1)    
 declare @next_pos varchar(5)    
 declare @cnt int    
 declare @next_val varchar(25)     
 declare @right_string varchar(25)    
 declare @left_string varchar(25)    
 declare @vinput varchar(25)    
 declare @Z_string varchar(25)    
 declare @debug_on bit     
 declare @first_pass bit    
 declare @sp_return_value int    
 set @first_pass = 1    
 set @debug_on = 1    
 set @right_string = ''     
 declare @temp_last_uniq_id_char varchar(25)    
 declare @temp_leftstring varchar(25)     
 declare @temp_rightstring varchar(25)     
 declare @static_val varchar(2)    
 set @temp_leftstring = ''    
 set @temp_rightstring = ''    
 set @static_val='11'    
    
 set @next_pos = 'true'    
--SV-Currently Our system considers only UPPERCASE Primary keys    
 set @last_uniq_id_char = upper(@last_uniq_id_char)    
 if(@debug_on=1) print  '@last_uniq_id_char '+@last_uniq_id_char    
 IF(len(@last_uniq_id_char) >1)    
 BEGIN    
  set @temp_leftstring = substring(@last_uniq_id_char,1,len(@last_uniq_id_char)-2)    
  if(@debug_on=1) print  '@temp_leftstring '+@temp_leftstring    
  set @temp_rightstring = substring(@last_uniq_id_char,len(@last_uniq_id_char)-1,len(@last_uniq_id_char)-1)    
  if(@debug_on=1) print  '@temp_rightstring '+@temp_rightstring    
 END    
    
 if(@temp_rightstring='0Z')            
 begin      
  set @last_uniq_id_char = @temp_leftstring + @static_val    
--  return @last_uniq_id_char    
 end    
 else    
    
 begin    
      
   set @vlen = len(@last_uniq_id_char)    
   set @cnt =  @vlen    
    
  --SV-20080611 Here 'X','Y','Z' are reserved for future use and last possible allowed value e.g. 'ZZZZW'    
   set @Z_string = replicate('Z',@vlen - 1)    
   set @Z_string = @Z_string + 'W'    

	if(@debug_on=1) print @Z_string
    
   if(@Z_string = @last_uniq_id_char)    
   begin    
		if(@debug_on = 1)    
		begin       
		 print 'Over flow exception'     
		end    
		set @Err_msg = 'Over flow exception in GP_UniqID_CharStr_Increment'      
		return -2      
   end    
  --SV-20080511 No need of checking condition already checked in GP_UniqID_Char_1plus    
  -- if(@first_pass = 1)    
  -- begin    
    while(@cnt>0 and @next_pos = 'true')    
    begin    
		 if(@debug_on = 1)  print ' @cnt '+ cast(@cnt as varchar(2))
		if(@debug_on = 1)  print ' @next_pos '+ @next_pos
		set @last_one_char = substring(@last_uniq_id_char,@cnt,1)      
	      if(@debug_on = 1)  print '@last_one_char ' +@last_one_char
		 exec  @sp_return_value = GP_UniqID_Char_1plus       
		  @first_pass = @first_pass,    
		  @last_one_char = @last_one_char output,      
		  @next_pos = @next_pos output,    
		  @Err_msg = @Err_msg output    
		if(@debug_on = 1)  print '@last_one_char after '+@last_one_char
		 if(@sp_return_value<0)    
		 begin    
		  return @sp_return_value    
		 end    
    
		 if(@first_pass = 1)    
			 begin    
			  set @first_pass = 0    
			 end    
			 set @left_string = substring(@last_uniq_id_char,1,@cnt-1)    
			if(@debug_on = 1) print '@left_string ' +@left_string
			 set @right_string = @last_one_char + @right_string  
			if(@debug_on = 1) print '@right_string ' +@right_string    
			set @cnt = @cnt - 1
			if(@debug_on = 1)  print ' @cnt inside first_pass '+ cast(@cnt as varchar(2))
		end    
		
		set @last_uniq_id_char = @left_string + @right_string      
		if(@debug_on = 1) print 'set @last_uniq_id_char = @left_string + @right_string     '
	
	   if(@debug_on = 1)    
	   begin    
		print '@last_uniq_id_char '+ @last_uniq_id_char      
	   end    
	end    
     
end

GO
/****** Object:  StoredProcedure [dbo].[EP_UniqID_Low_Upp_bound_prepare]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================
-- Author:		JigarP
-- Create date: 20080603
-- Description:	This is used to generate a LowerBound & UpperBound
-- ===============================================================

CREATE PROC [dbo].[EP_UniqID_Low_Upp_bound_prepare]
(
	@Suffix_Type varchar(4) = null,
	@Prefix_type varchar(4) = null,
	@Prefix varchar(25)= null,
	@LengthOfSuffix int =null,
	@nLbound bigint =null output,
	@nUbound bigint =null output,
	@sLbound varchar(25)=null output,
	@sUbound varchar(25)=null output
)
as
begin 
	declare @MultiplierN int
	declare @nPrefix bigint
--declare @PrefixLen int


	if(@Prefix_type = 'N')
	begin
		set @MultiplierN = power(10, @LengthOfSuffix)
		
		--set @PrefixLen = len(@Prefix)
		set @nPrefix=cast(@Prefix as bigint)		
		set @nLbound = @nprefix * @MultiplierN
		set @nUbound = (@prefix+1)* @MultiplierN
	end
	else if(@Prefix_type = 'AN')
	begin
		if(@Suffix_Type = 'N')
		begin
			
			set @sLbound = @Prefix + replicate('0',@LengthOfSuffix)
			set @sUbound = @Prefix + replicate('9',@LengthOfSuffix)
		end
		else if(@Suffix_Type = 'AN')
		begin
			
			set @sLbound = @Prefix + replicate('1',@LengthOfSuffix)
			set @sUbound = @Prefix + replicate('Z',@LengthOfSuffix)			
			
		end
	end
end

GO
/****** Object:  StoredProcedure [dbo].[EP_UniqID_Max_Val_Fetch]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================
-- Author:		JigarP
-- Create date: 20080603
-- Description:	This is used to find max value from particular
--				table name and column name.
-- ===============================================================

CREATE PROC [dbo].[EP_UniqID_Max_Val_Fetch]
(
	@PK_Type varchar(2) = null,
	@Table_Name varchar(70) = null,
	@Col_Name varchar(70) = null,
	@Lbound varchar(25)=null,
	@Ubound varchar(25)=null,
	@nPK bigint=0 output,
	@sPK varchar(25)=null output
)
as
begin 
declare @dQuery nvarchar(4000)
declare @nLbound bigint
declare @nUbound bigint
declare @Debug bit
set @Debug=0

	if((@Table_Name is not null) and (@Col_Name is not null))
	begin
		if(@PK_type = 'N')
		begin
		
				set @nLbound=cast(@Lbound as bigint)
				set @nUbound=cast(@Ubound as bigint)

				SET @dQuery = 'select @nPK = max(' +  @Col_Name + ')
				 from ' + @Table_Name + ' where ' + @Col_Name + ' >= ' + 
				'@nLbound' + ' and ' + @Col_Name + ' < ' + '@nUbound'


		
				exec sp_executesql @dQuery,
				@params = N'@nLbound bigint,@nUbound bigint,@nPK bigint output'
				,@nLbound = @nLbound
				,@nUbound = @nUbound
				,@nPK = @nPK output
				if(@Debug=1) print '@nPK '+isnull(@nPK, 'is NUll')				
	
		end
		else if(@PK_type = 'AN')
		begin 

				SET @dQuery = 'select @sPK = max(' +  @Col_Name + ') from ' 
				+ @Table_Name + ' where ' + @Col_Name + ' >= ' + 
				'@Lbound' + ' and ' + @Col_Name + ' < ' + '@Ubound'

				exec sp_executesql @dQuery,
				@params = N'@Lbound varchar(25),@Ubound varchar(25),@sPK varchar(25) output'
				,@Lbound = @Lbound
				,@Ubound = @Ubound
				,@sPK = @sPK output				

			if(@Debug=1) print '@sPK '+isnull(@sPK, 'is NUll')
		end
	end
end

GO
/****** Object:  StoredProcedure [dbo].[GetAllCountry]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCountry]
@CID int
AS
BEGIN
	
	
	SELECT  [CID]
      ,[CountryName]
      ,[IsActive]
  FROM [CountryMaster] where 1=1 and (CID=@CID OR @CID=0)
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetCity]  
 @CID int  
AS  
BEGIN  
 SELECT ct.[CID]  
 ,ct.CountryID 
 ,co.CountryName 
      ,ct.[CityName]  
      ,ct.[IsActive]  
  FROM [CityMaster] ct inner join  CountryMaster co on (ct.CountryID=co.CID)
  where 1=1 and (ct.[CID]=@CID OR @CID=0)  
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmpDetails]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmpDetails]
	@EmpName varchar(100)=null
	as
BEGIN

	SELECT [EmpNo]
      ,[EmpName]
      ,[Salary]
      ,[DeptName]
      ,[Designation]
	  ,UserName
	  ,Password
  FROM [Employee] where 1=1 and (EmpName=@EmpName OR @EmpName='null' OR @EmpName='')
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCity]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertCity]
@CID int
,@CountryID int
,@City	 varchar(50)
AS
BEGIN
if @CID=0
begin
insert into CityMaster(CountryID,CityName,IsActive) VALUES (@CountryID,@City,1)
end
else
begin
update CityMaster
set
CityName=@City
where CID=@CID

end
	
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployee]
	        @EmpNo int
	       ,@EmpName varchar(100)
           ,@Salary int
           ,@DeptName varchar(50)
           ,@Designation varchar(50)
           ,@EmpFile varchar(150)=null
           ,@UserName varchar(50)
           ,@Password varchar(50)
           ,@Result varchar(10)=null output
          
AS
BEGIN
	
	if @EmpNo=0 
	begin
	
	
	IF ((SELECT
	COUNT(*)
FROM Employee
WHERE UserName = @UserName)
> 0) BEGIN
SET @Result = '-11'
RETURN
END


INSERT INTO [Employee] ([EmpName]
, [Salary]
, [DeptName]
, [Designation]
, EmpFile
,UserName
,Password
,IsActive
)
	VALUES (@EmpName, @Salary, @DeptName, @Designation, @EmpFile,@UserName,@Password,1)
SET @Result = SCOPE_IDENTITY();


END
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCountry]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateCountry]
	@CID int
	,@CountryName varchar(50)
AS
BEGIN
	if @CID=0
	begin
	insert into CountryMaster(CountryName,IsActive)VALUES(@CountryName,1)
	end
	else
	begin
	update CountryMaster 
	set
	CountryName=@CountryName	
	where
	CID=@CID
	
	end
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetProduct]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetProduct]
@ProName VARCHAR(50)
AS
BEGIN
	SELECT [ProID]
      ,[ProName]
      ,[ProEpxDate]
      ,[IsDelete]
      ,[UserID]
  FROM [Product_Mst] WHERE (@ProName='' OR ProName=@ProName)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertEduMst]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertEduMst]
	@EID int
	,@EName varchar(50)
	,@IsActive int
	
	
AS
BEGIN
	INSERT INTO [EduMst]
           ([EID]
           ,[EName]
           ,[IsActive])
     VALUES
           (
           @EID
           ,@EName
           ,@IsActive)
           
           print @@identity

end

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertUpdateProduct]    Script Date: 3/29/2017 6:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertUpdateProduct]
@ProID VARCHAR(50)
,@ProName VARCHAR(50)
,@ProExpDate DATETIME
,@UserID int
AS
BEGIN


INSERT INTO [dbo].[Product_Mst] ([ProID],[ProName],[ProEpxDate],[IsDelete],[UserID])VALUES(NEWID(),@ProName,@ProExpDate,0,@UserID)
	
END

GO
USE [master]
GO
ALTER DATABASE [Developer] SET  READ_WRITE 
GO
