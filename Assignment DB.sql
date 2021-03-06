USE [Assignment]
GO
/****** Object:  Table [dbo].[ContactDetail]    Script Date: 05/09/2021 22:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDetail](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactType] [nvarchar](200) NULL,
	[ContactName] [nvarchar](200) NULL,
	[DateofBirth] [datetime] NULL,
	[Gender] [nvarchar](200) NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[ContactNumbers] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationLogs]    Script Date: 05/09/2021 22:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationLogs](
	[LeadID] [int] NOT NULL,
	[CommunicationDate] [datetime] NULL,
	[CommunicationMode] [nvarchar](200) NULL,
	[Status] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadInformation]    Script Date: 05/09/2021 22:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadInformation](
	[LeadID] [int] IDENTITY(1,1) NOT NULL,
	[LoanAmount] [nvarchar](200) NULL,
	[LeadSource] [nvarchar](200) NULL,
	[CommunicationMode] [nvarchar](200) NULL,
	[CurrentStatus] [nvarchar](200) NULL,
	[ContactDetailID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LeadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[LeadInformationInsert]    Script Date: 05/09/2021 22:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeadInformationInsert]  
@LoanAmount nvarchar(200),  
@LeadSource nvarchar(200),  
@CommunicationMode nvarchar(200),  
@CurrentStatus nvarchar(200),  
@ContactDetailID int,
@CommunicationDate datetime
as  
Declare @LeadID int
Insert into LeadInformation (LoanAmount, LeadSource, CommunicationMode, CurrentStatus, ContactDetailID)   
values(@LoanAmount, @LeadSource, @CommunicationMode, @CurrentStatus, @ContactDetailID)  
set @LeadID = SCOPE_IDENTITY()
Insert into CommunicationLogs (LeadId, CommunicationDate, CommunicationMode, Status)   
values(@LeadID, @CommunicationDate, @CommunicationMode, @CurrentStatus)
GO
/****** Object:  StoredProcedure [dbo].[ContactDetailInsert]    Script Date: 05/09/2021 22:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ContactDetailInsert]
@ContactType nvarchar(200),
@ContactName nvarchar(200),
@DateofBirth datetime,
@Gender nvarchar(200),
@EmailAddress nvarchar(200),
@ContactNumbers nvarchar(200)
as
Insert into ContactDetail (ContactType, ContactName, DateofBirth, Gender, EmailAddress, ContactNumbers) 
values(@ContactType, @ContactName, @DateofBirth, @Gender, @EmailAddress, @ContactNumbers)
select SCOPE_IDENTITY() as ContactID
GO

