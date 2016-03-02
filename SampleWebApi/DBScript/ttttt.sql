USE [GeesemedLocal]
GO
/****** Object:  Table [dbo].[LoginMst]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Child]    Script Date: 03/02/2016 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Child](
	[id] [int] IDENTITY(100,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EduMst]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactDetail]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAllCountry]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_InsertEduMst]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  Table [dbo].[RegistrationMst]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 03/02/2016 17:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 03/02/2016 17:37:39 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetEmpDetails]    Script Date: 03/02/2016 17:37:41 ******/
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
  FROM [Employee] where 1=1 and (EmpName=@EmpName OR @EmpName='null' OR @EmpName='')
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateCountry]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertCity]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 03/02/2016 17:37:41 ******/
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
/****** Object:  ForeignKey [FK_CityMaster_CountryMaster]    Script Date: 03/02/2016 17:37:39 ******/
ALTER TABLE [dbo].[CityMaster]  WITH CHECK ADD  CONSTRAINT [FK_CityMaster_CountryMaster] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryMaster] ([CID])
GO
ALTER TABLE [dbo].[CityMaster] CHECK CONSTRAINT [FK_CityMaster_CountryMaster]
GO
/****** Object:  ForeignKey [FK_RegistrationMst_EduMst]    Script Date: 03/02/2016 17:37:39 ******/
ALTER TABLE [dbo].[RegistrationMst]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationMst_EduMst] FOREIGN KEY([Education])
REFERENCES [dbo].[EduMst] ([EID])
GO
ALTER TABLE [dbo].[RegistrationMst] CHECK CONSTRAINT [FK_RegistrationMst_EduMst]
GO
