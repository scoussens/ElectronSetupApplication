/****** Object:  Table [dbo].[OSDTemplate] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OSDTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OSDTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_NumberSerieID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SiteServerName] [varchar](50) NOT NULL,
	[OUPath] [varchar](255) NOT NULL,
	[CollectionID] [varchar](8) NOT NULL,
	[MDTRoles] [varchar](500) NOT NULL,
	[NamingTemplate] [varchar](100) NOT NULL,
	[SecurityGroupLocked] [varchar](255) NOT NULL,
	[SecurityGroupVisible] [varchar](255) NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_OSDTemplate_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_OSD_Template] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OSDNumberSerie] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OSDNumberSerie]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OSDNumberSerie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[StartNumber] [int] NOT NULL CONSTRAINT [DF_OSDNumberSerie_StartNumber]  DEFAULT ((0)),
	[EndNumber] [int] NOT NULL CONSTRAINT [DF_OSDNumberSerie_EndNumber]  DEFAULT ((0)),
	[Owner] nvarchar(50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_OSDNumberSerie_CreatedDate]  DEFAULT (getdate()),
	
 CONSTRAINT [PK_OSDNumberSerie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrganizationalUnit] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrganizationalUnit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrganizationalUnit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL CONSTRAINT [DF_OrganizationalUnit_Name]  DEFAULT (''),
	[LDAPPath] [varchar](512) NOT NULL,
	[Owner] nvarchar(50) NOT NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_OrganizationalUnit_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_OrganizationalUnit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventLog] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [varchar](20) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Level] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_EventLog_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX_EventLog' AND object_id = OBJECT_ID('dbo.EventLog'))
BEGIN
CREATE NONCLUSTERED INDEX [IX_EventLog] ON [dbo].[EventLog] 
(
	[LogType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
GO
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX_EventLog_CreatedDate' AND object_id = OBJECT_ID('dbo.EventLog'))
BEGIN
CREATE NONCLUSTERED INDEX [IX_EventLog_CreatedDate] ON [dbo].[EventLog] 
(
	[CreatedDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SecurityGroup] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Roles] [varchar](1000) NOT NULL,
	[DistributionMode] [tinyint] NOT NULL CONSTRAINT [DF_SecurityGroup_DistributionMode]  DEFAULT ((0)),
	[ADGroupDistribution] [bit] NULL CONSTRAINT [DF_SecurityGroup_ADGroupDistribution]  DEFAULT ((0)),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_SecurityGroup_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SecurityGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DistributionScope] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistributionScope]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DistributionScope](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CollectionID] [varchar](10) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ResourceType] [int] NULL,
	[Filter] [nvarchar](2048) NOT NULL,
	[Version] [tinyint] NULL,
	[MemberCount] [int] NULL,
	[LastSummarized] [datetime] NULL,
 CONSTRAINT [PK_DistributionScope] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryID] [int] NOT NULL CONSTRAINT [DF_Category_ParentCategoryID]  DEFAULT ((0)),
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OperatingSystem] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OperatingSystem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OperatingSystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SO_Order] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SO_Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[ComputerName] [varchar](50) NOT NULL,
	[Approver] [varchar](30) NOT NULL,
	[Validated] [bit] NOT NULL CONSTRAINT [DF_SO_Order_Validated]  DEFAULT ((0)),
	[ValidatedDate] [datetime] NOT NULL CONSTRAINT [DF_SO_Order_ValidatedDate]  DEFAULT (getdate()),
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_SO_Order_Deleted]  DEFAULT ((0)),
	[DeletedDate] [datetime] NOT NULL CONSTRAINT [DF_SO_Order_DeletedDate]  DEFAULT (getdate()),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_SO_Order_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SO_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Domain] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Domain](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[NetBiosName] [varchar](15) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Domain_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Domain] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemClass] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemClass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Alias] [varchar](30) NOT NULL,
	[ClassPermissions] [int] NOT NULL CONSTRAINT [DF_SystemClass_AvailableClassPermissions]  DEFAULT ((0)),
	[InstancePermissions] [int] NOT NULL CONSTRAINT [DF_SystemClass_AvailableInstancePermissions]  DEFAULT ((0)),
	[PagePermissions] [int] NOT NULL CONSTRAINT [DF_SystemClass_DefaultInstancePermission]  DEFAULT ((0)),
 CONSTRAINT [PK_SystemClass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecurityPagePermission] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityPagePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityPagePermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SystemPageID] [int] NOT NULL,
	[FK_SecurityGroupID] [int] NOT NULL,
	[Permissions] [int] NOT NULL CONSTRAINT [DF_SecurityPagePermission_Permissions]  DEFAULT ((0)),
 CONSTRAINT [PK_SecurityPagePermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SecurityInstancePermission] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityInstancePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityInstancePermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SystemClassID] [int] NOT NULL,
	[FK_SecurityGroupID] [int] NOT NULL,
	[InstanceKey] [varchar](20) NOT NULL CONSTRAINT [DF_SecurityInstancePermission_InstanceKey]  DEFAULT (''),
	[Permissions] [int] NOT NULL CONSTRAINT [DF_SecurityInstancePermission_Permissions]  DEFAULT ((0)),
 CONSTRAINT [PK_SecurityInstancePermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecurityClassPermission] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityClassPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityClassPermission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SystemClassID] [int] NOT NULL,
	[FK_SecurityGroupID] [int] NOT NULL,
	[Permissions] [int] NOT NULL CONSTRAINT [DF_SecurityClassPermission_Permissions]  DEFAULT ((0)),
 CONSTRAINT [PK_SecurityClassPermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SystemPage] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemPage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemPage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentPageID] [int] NOT NULL,
	[FK_SystemClassID] [int] NOT NULL,
	[Alias] [nvarchar](30) NOT NULL,
	[SysFile] [varchar](100) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Icon] [varchar](50) NOT NULL,
	[SortIndex] [int] NOT NULL,
	[Hidden] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_SystemPage_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemPage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/*** [MetaData - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaData](
           [ID] [int] IDENTITY(1,1) NOT NULL,
           [Variable] [nvarchar](256) NOT NULL,
           [ValueType] [nvarchar](50) NOT NULL,
           [DefaultValue] [nvarchar](256) NULL,
           [Required] [bit] NULL,
           [MinLenght] [int] NULL,
           [MaxLenght] [int] NULL,
           [Description] [nvarchar](2048) NULL,
           [ValidationExpression] [nvarchar](2048) NULL,
CONSTRAINT [PK_MetaData] PRIMARY KEY CLUSTERED 
(
           [ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/*** [MetaData - END] ***/

/*** [Software - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Software]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Software](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1024) NOT NULL CONSTRAINT [DF_Software_Name]  DEFAULT (''),
	[Description] [nvarchar](4000) NOT NULL CONSTRAINT [DF_Software_Description]  DEFAULT (''),
	[Price] [int] NOT NULL CONSTRAINT [DF_Software_Price]  DEFAULT ((0)),
	[Owner] [nvarchar](1024) NOT NULL CONSTRAINT [DF_Software_Owner]  DEFAULT (''),
	[SoftwareOrder] [bit] NOT NULL CONSTRAINT [DF_Software_SoftwareOrder]  DEFAULT ((0)),
	[ApprovalMethod] [tinyint] NOT NULL CONSTRAINT [DF_Software_ApprovalMethod]  DEFAULT ((0)),
	[Approver] [varchar](1024) NOT NULL CONSTRAINT [DF_Software_Approver]  DEFAULT (''),
	[PackageTypeID] [int] NOT NULL CONSTRAINT [DF_Software_PackageType]  DEFAULT ((0)),
	[PackageID] [varchar](10) NOT NULL CONSTRAINT [DF_Software_PackageID]  DEFAULT (''),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_Software_UpdatedDate]  DEFAULT (getdate()),
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Software_CreatedDate]  DEFAULT (getdate()),
	[CI_ID] [int] NULL,
	[Version] [nvarchar](1024) NULL,
	[Manufacturer] [nvarchar](1024) NULL,
	[Language] [nvarchar](1024) NULL,
	[Shortname] [nvarchar](1024) NULL,
	[IsSuperseded] [bit] NULL DEFAULT ((0)),
	[IsSuperseding] [bit] NULL DEFAULT ((0)),
	[IsExpired] [bit] NULL DEFAULT ((0)),
	[BootImage] [varchar](1024) NULL,
	[TaskSequenceType] [int] NULL,
	[TaskSequenceCategory] [nvarchar] (1024) NULL,
	[LogonRequirement] [bit] NULL,
 CONSTRAINT [PK_Software] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/*** [Software - END] ***/
/****** Object:  Table [dbo].[SoftwareToCategory] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareToCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoftwareToCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SoftwareID] [int] NOT NULL,
	[FK_CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SoftwareToCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SoftwareToOperatingSystem] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareToOperatingSystem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoftwareToOperatingSystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_SoftwareID] [int] NOT NULL,
	[FK_OperatingSystemID] [int] NOT NULL,
 CONSTRAINT [PK_SoftwareToOperatingSystem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/*** [SoftwareToMetaData - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareToMetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoftwareToMetaData](
           [FK_SoftwareID] [int] NOT NULL,
           [FK_MetaDataID] [int] NOT NULL
) ON [PRIMARY]
END
GO
/*** [SoftwareToMetaData - END] ***/

/*** [Configuration - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Configuration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Configuration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](256) NULL,
	[Variable] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](2048) NULL,
	[DefaultValue] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
 (
	[ID] ASC
 )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/*** [Configuration - END] ***/

/*** [RemoteTools - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoteTools]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RemoteTools](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](128) NOT NULL,
	[URL] [nvarchar](256) NULL,
	[IsTab] [bit] NULL,
 CONSTRAINT [PK_RemoteToools] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
ELSE
IF COL_LENGTH('dbo.RemoteTools', 'IsTab') IS NULL
BEGIN
ALTER TABLE [dbo].[RemoteTools] ADD [IsTab] [bit] NULL
END
GO
/*** [RemoteTools - END] ***/


/*** [LanguageAndCountry - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LanguageAndCountry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LanguageAndCountry]
(
	LACID INT IDENTITY(1,1),
	Value NVARCHAR(50),
	DefaultLAC NVARCHAR(10)
)
ALTER TABLE [dbo].[LanguageAndCountry] ADD CONSTRAINT PK_LanguageAndCountry PRIMARY KEY(LACID)
END
GO
/*** [LanguageAndCountry - END] ***/

/*** [Repository - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Repository]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Repository]
(
	ID INT IDENTITY(1,1),
	Name NVARCHAR(100),
	RepPath NVARCHAR(200),
	DefaultCreate NVARCHAR(10),
	DefaultImport NVARCHAR(10)
)
ALTER TABLE [dbo].[Repository] ADD CONSTRAINT PK_Repository PRIMARY KEY(ID)
END
GO
/*** [Repository - END] ***/


------------------------------------------------ Start [DatabaseHistory]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatabaseHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DatabaseHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_DatabaseHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO


------------------------------------------------ Start [Filter]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Filter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Filter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Expression] [varchar](max) NULL,
 CONSTRAINT [PK_Filter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END


------------------------------------------------ Start [CachingServiceSyncSchedule]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CachingServiceSyncSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CachingServiceSyncSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[SyncType] [varchar](256) NOT NULL,
	[IntervalType] [varchar](256) NOT NULL,
	[Interval] [bigint] NOT NULL,
 CONSTRAINT [PK_CachingServiceSyncSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO
-----END

------------------------------------------------ Start [Computer]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Computer]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Computer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Number] [int] NULL,
	[Domain] [varchar](256) NULL,
	[ResourceID] [varchar](50) NULL,
	[MACAddress] [varchar](50) NULL,
	[OperatingSystem] [nvarchar](255) NULL,
	[UserName] [nvarchar](256) NULL,
	[ClientType] [int] NULL,
	[CMUniqueIdentifier] [nvarchar](255) NULL,
	[CMCreationDate] [datetime] NULL,
	[SMBIOSGUID] [nvarchar](256) NULL,
	[CMDecommissioned] [int] NULL,
	[LastLogonTime] [datetime] NULL,
	[IsVirtualMachine] [bit] NULL,
	[VirtualMachineHostName] [nvarchar](256) NULL,
	[WTGUniqueKey] [nvarchar](256) NULL,
	[MdtID] [int] NULL,
	[Obsolete] [bit] NULL,
	[SiteCode] [varchar](50) NULL,
	[rowversion] [bigint] NULL,
	[MdtMacAddress] [varchar](50) NULL,
	[MdtOU] [varchar](256) NULL,
	[MdtSMBIOSGUID] [nvarchar](256) NULL,
	[Active] bit not null,
	[PrimaryUser] [nvarchar](64) null,
	[Client] bit null,
	[ClientHealthy] bit null,
	[LastPolicyUpdate] [datetime] NULL,
	[LastDiscoveryUpdate] [datetime] NULL,
	[DistinguishedName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO
-----END

------------------------------------------------ Start [Department]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Type] [int] NOT NULL,
	[Parent] [int] NULL,
	[Description] [nvarchar](1024) NULL,
	[CollectionID] [varchar](20) NULL,
	[FK_FilterID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Department] FOREIGN KEY([Parent])
REFERENCES [dbo].[Department] ([ID])

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Department]

ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Filter] FOREIGN KEY([FK_FilterID])
REFERENCES [dbo].[Filter] ([ID])

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Filter]

end

GO

-----END


------------------------------------------------ Start [ComputerToDepartment]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComputerToDepartment]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[ComputerToDepartment](
	[ComputerId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL
) ON [PRIMARY]


ALTER TABLE [dbo].[ComputerToDepartment]  WITH CHECK ADD  CONSTRAINT [FK_ComputerToDepartment_Computer] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computer] ([ID])

ALTER TABLE [dbo].[ComputerToDepartment] CHECK CONSTRAINT [FK_ComputerToDepartment_Computer]

ALTER TABLE [dbo].[ComputerToDepartment]  WITH CHECK ADD  CONSTRAINT [FK_ComputerToDepartment_department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([ID])

ALTER TABLE [dbo].[ComputerToDepartment] CHECK CONSTRAINT [FK_ComputerToDepartment_department]

end

GO
-----END

------------------------------------------------ Start [SoftwareToDepartment]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareToDepartment]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[SoftwareToDepartment](
	[SoftwareId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[SoftwareToDepartment]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToDepartment_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([ID])

ALTER TABLE [dbo].[SoftwareToDepartment] CHECK CONSTRAINT [FK_SoftwareToDepartment_Software]

END
GO
-----END


------------------------------------------------ Start [HostingService]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HostingService]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[HostingService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](256) NULL,
	[ServerName] [varchar](256) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Version] [varchar](256) NOT NULL,
	[ProductVersion] [varchar](256) NOT NULL,
	[HeartBeat] [datetime] NULL,
	[ConfigLocation] [varchar](512) NOT NULL,
 CONSTRAINT [PK_HostingService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


end

GO
-----END


------------------------------------------------ Start [HostedServices]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HostedServices]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[HostedServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NULL,
	[Version] [varchar](256) NOT NULL,
	[ProductVersion] [varchar](256) NOT NULL,
	[Endpoint] [varchar](512) NOT NULL,
	[HostingService_id] [int] NOT NULL,
 CONSTRAINT [PK_HostedServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[HostedServices]  WITH CHECK ADD  CONSTRAINT [FK_HostedServices_HostingService] FOREIGN KEY([HostingService_id])
REFERENCES [dbo].[HostingService] ([Id])

ALTER TABLE [dbo].[HostedServices] CHECK CONSTRAINT [FK_HostedServices_HostingService]

end

GO
-----END

------------------------------------------------ Start [Approver]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Approver]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Approver](
[Id] INT IDENTITY(1,1),
[Username] VARCHAR(256) NOT NULL,
[FullName] VARCHAR(256) NOT NULL,
[Domain] VARCHAR(256) NOT NULL,
)
ALTER TABLE [dbo].[Approver] ADD CONSTRAINT PK_Approver PRIMARY KEY(ID)

END

go
-----END


------------------------------------------------ Start [SoftwareApprover]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareApprover]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[SoftwareApprover](
[Id] INT IDENTITY(1,1),
[SoftwareId] INT not null,
[ApproverId] INT not null,
[Rank] tinyint not null,		--rækkefølge
)
ALTER TABLE [dbo].[SoftwareApprover] ADD CONSTRAINT PK_SoftwareApprover PRIMARY KEY(ID)
ALTER TABLE [dbo].[SoftwareApprover] ADD CONSTRAINT FK_SoftwareApprover_Software foreign KEY ([SoftwareId]) 
references [dbo].[Software](ID)
ALTER TABLE [dbo].[SoftwareApprover] ADD CONSTRAINT FK_SoftwareApprover_Approver foreign KEY ([ApproverId]) 
references [dbo].[Approver](ID)

END

go
-----END

------------------------------------------------ Start [SO_ExceptionService]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_ExceptionService]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SO_ExceptionService]( 
[ID] [int] IDENTITY(1,1) NOT NULL, 
[ServiceName] [nvarchar](128) NOT NULL, 
[DisplayName] [nvarchar](256) NULL, 
[Enabled] [bit] NULL, 
[Description] [nvarchar](256) NULL, 
CONSTRAINT [PK_SO_ExceptionServices] PRIMARY KEY CLUSTERED 
( 
[ID] ASC 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]

ALTER TABLE [dbo].[SO_ExceptionService] ADD CONSTRAINT [DF_SO_ExceptionServices_Enabled] DEFAULT ((0)) FOR [Enabled]
END

GO

-----END

---------------------------------------------- Start [SoftwareOrderStrings]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareOrderStrings]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[SoftwareOrderStrings](
[ID] [int] IDENTITY(1,1) NOT NULL,
	[LCID] [int] NOT NULL,
	[Page] [nvarchar](100) NOT NULL,
	[StandardString] [nvarchar](512) NOT NULL,
	[LocalizedString] [nvarchar](512) NOT NULL,
)
ALTER TABLE [dbo].[SoftwareOrderStrings] ADD CONSTRAINT PK_SoftwareOrderStrings PRIMARY KEY(ID)

END

go
-------END

------------------------------------------------ Start [ADGroupName]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADGroupName]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[ADGroupName](
[Id] INT IDENTITY(1,1),
[ADGroupName] NVARCHAR(64),
)
ALTER TABLE [dbo].[ADGroupName] ADD CONSTRAINT PK_ADGroupName PRIMARY KEY(ID)
END

go
-----END

------------------------------------------------ Start [Order]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Order](
[Id] INT IDENTITY(1,1),
[UserName] VARCHAR(256) NOT NULL,
[ComputerName] VARCHAR(256) NOT NULL,
[PackageName] varchar(256) not null,
[Status] varchar(256) not null,  --pending, approved, declined
[StatusDate] datetime not null,
[CreatedDate] datetime not null,
[Deleted] bit not null,
[DeletedDate] datetime null,
[DistributeTo] VARCHAR(256) NOT NULL,
[Reason] varchar(256) null,
[SoftwareId] int null,
)
ALTER TABLE [dbo].[Order] ADD CONSTRAINT PK_Order PRIMARY KEY(ID)
ALTER TABLE [dbo].[Order] ADD CONSTRAINT FK_Order_software foreign KEY ([SoftwareId]) 
references [dbo].[Software](ID)
END

go
-----END


------------------------------------------------ Start [OrderLine]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderLine]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[OrderLine](
[Id] INT IDENTITY(1,1),
[ApproverId] INT not null,
[OrderId] INT not null,
[Status] varchar(256) not null, --pending, approved, declined
[StatusDate] datetime not null,
[Reason] varchar(256) null,
[Rank] tinyint not null,		--rækkefølge
)
ALTER TABLE [dbo].[OrderLine] ADD CONSTRAINT PK_Orderline PRIMARY KEY(ID)
ALTER TABLE [dbo].[OrderLine] ADD CONSTRAINT FK_OrderLine_Approver foreign KEY ([ApproverId]) 
references [dbo].[Approver](ID)
ALTER TABLE [dbo].[OrderLine] ADD CONSTRAINT FK_OrderLine_Ordre foreign KEY ([OrderId]) 
references [dbo].[Order](ID)

END

go
-----END

------------------------------------------------ Start [SoftwareToADGroup]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareToADGroup]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[SoftwareToADGroup](
[ADGroupID] INT,
[SoftwareID] INT,
)
ALTER TABLE [dbo].SoftwareToADGroup  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToADGroup_ADGroupName] FOREIGN KEY([ADGroupID])
REFERENCES [dbo].[ADGroupName] ([ID])

ALTER TABLE [dbo].[SoftwareToADGroup] CHECK CONSTRAINT [FK_SoftwareToADGroup_ADGroupName]

ALTER TABLE [dbo].[SoftwareToADGroup]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToADGroup_Software] FOREIGN KEY([SoftwareID])
REFERENCES [dbo].[Software] ([ID])

ALTER TABLE [dbo].[SoftwareToADGroup] CHECK CONSTRAINT [FK_SoftwareToADGroup_Software]

END

go
-----END


---------------------------------------------- Start [MailTemplateString]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MailTemplateString]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[MailtemplateString](
[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[LCID] [int] NOT NULL,
	[EnglishString] [nvarchar](512) NOT NULL,
	[LocalizedString] [nvarchar](512) NOT NULL,
)
ALTER TABLE [dbO].[MailTemplateString] ADD CONSTRAINT PK_MailTemplateString PRIMARY KEY(ID)

ALTER TABLE [dbo].[MailTemplateString] ADD  CONSTRAINT [DF_MailTemplateString_LCID]  DEFAULT ((1033)) FOR [LCID]
END

go
-------END

---------------------------------------------- Start [MailTemplateString]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MailTemplateString]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[MailtemplateString](
[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[LCID] [int] NOT NULL,
	[EnglishString] [nvarchar](512) NOT NULL,
	[LocalizedString] [nvarchar](512) NOT NULL,
)
ALTER TABLE [dbO].[MailTemplateString] ADD CONSTRAINT PK_MailTemplateString PRIMARY KEY(ID)

ALTER TABLE [dbo].[MailTemplateString] ADD  CONSTRAINT [DF_MailTemplateString_LCID]  DEFAULT ((1033)) FOR [LCID]
END

go
-------END

---------------------------------------------- Start [DistributionPoint]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistributionPoint]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[DistributionPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DPID] [int] NULL,
	[ServerName] [nvarchar](255) NULL,
	[NALPath] [nvarchar](255) NULL,
	[FriendlyName] [nvarchar](50) NULL,
	[Description] [nvarchar](512) NULL,
	[IsPresent] [bit] NULL,
	[Visible] [bit] NULL,
	[SiteCode] [varchar](10) NULL
)
ALTER TABLE [dbo].[DistributionPoint] ADD CONSTRAINT PK_DistributionPoint PRIMARY KEY(ID)

END

go
-------END

---------------------------------------------- Start [DetectionScript]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetectionScript]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[DetectionScript](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Owner] [nvarchar](50) NULL,
	[Content] [text] NULL
)
ALTER TABLE [dbo].[DetectionScript] ADD CONSTRAINT PK_DetectionScript PRIMARY KEY(ID)

END

go
-------END

---------------------------------------------- Start [PublishingProfile]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublishingProfile]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[PublishingProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Default] [bit] NULL,
	[Priority] [int] NULL,
	[ContentDownload] [int] NULL,
	[MSILoggingOptions] [varchar](50) NULL,
	[Forcex86] [bit] NULL,
	[InstallBehaviour] [int] NULL,
	[LogonBehaviour] [int] NULL,
	[PreDeloy] [bit] NULL,
	[SendWOL] [bit] NULL,
	[AllowMeteredClientDownload] [bit] NULL,
	[UseUTC] [bit] NULL,
	[AllowUninstallAfterDeadline] [bit] NULL,
	[AllowRestartAfterDeadline] [bit] NULL
)
ALTER TABLE [dbo].[PublishingProfile] ADD CONSTRAINT PK_PublishingProfile PRIMARY KEY(ID)

END

go
-------END

---------------------------------------------- Start [PublishingProfileToDistributionPoint]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublishingProfileToDistributionPoint]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[PublishingProfileToDistributionPoint](
	[FK_PublishingProfileID] [int] NOT NULL,
	[FK_DistributionPointID] [int] NOT NULL
)

END

go
-------END

---------------------------------------------- Start [PublishingProfileToReturnCode]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublishingProfileToReturnCode]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[PublishingProfileToReturnCode](
	[FK_PublishingProfileID] [int] NOT NULL,
	[FK_ReturnCodeID] [int] NOT NULL
)

END

go
-------END

---------------------------------------------- Start [ReturnCode]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReturnCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReturnCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[Type] [varchar](16) NULL,
	[Description] [nvarchar](256) NULL
)
ALTER TABLE [dbo].[ReturnCode] ADD CONSTRAINT PK_ReturnCode PRIMARY KEY(ID)
END

go
-------END

---------------------------------------------- Start [DistributionPoint]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistributionPoint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DistributionPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](256) NULL,
	[Description] [nvarchar](256) NULL,
	[DPID] [int] NULL,
	[NALPath] [nvarchar](512) NULL,
	[SiteCode] [varchar](64) NULL,
	[ServerName] [varchar](256) NULL
)
ALTER TABLE [dbo].[DistributionPoint] ADD CONSTRAINT PK_DistributionPoint PRIMARY KEY(ID)
END

go
-------END

---------------------------------------------- Start [DistributionPoint]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistributionPoint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DistributionPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](256) NULL,
	[Description] [nvarchar](256) NULL,
	[DPID] [int] NULL,
	[NALPath] [nvarchar](512) NULL,
	[SiteCode] [varchar](64) NULL,
	[ServerName] [varchar](256) NULL
)
ALTER TABLE [dbo].[DistributionPoint] ADD CONSTRAINT PK_DistributionPoint PRIMARY KEY(ID)
END

go
-------END


------------------------------------------------ Start [ComputerView]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComputerView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ComputerView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[FK_FilterID] [int] NULL,
	[ColumnDataKey] [UniqueIdentifier] NULL,
 CONSTRAINT [PK_ComputerView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [SoftwareView]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwareView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoftwareView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[FK_FilterID] [int] NULL,
	[ColumnDataKey] [UniqueIdentifier] NULL,
 CONSTRAINT [PK_SoftwareView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [UserView]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[FK_FilterID] [int] NULL,
	[ColumnDataKey] [UniqueIdentifier] NULL,
 CONSTRAINT [PK_UserView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [DeviceView]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DeviceView](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[FK_FilterID] [int] NULL,
	[ColumnDataKey] [UniqueIdentifier] NULL,
 CONSTRAINT [PK_DeviceView] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [GridColumnData]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GridColumnData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GridColumnData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [UniqueIdentifier] NOT NULL,
	[ColumnData] [varchar](MAX) NULL,
 CONSTRAINT [PK_GridColumnData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [UserToRole]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserToRole]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[UserToRole](
[UserName] nvarchar(50) not null,
[RoleID] INT not null,
)
ALTER TABLE [dbo].[UserToRole] ADD CONSTRAINT PK_UserToRole PRIMARY KEY(RoleID,UserName);

END

go
-----END

------------------------------------------------ Start [SecurityGroupPermissions]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityGroupPermissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityGroupPermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [int] NULL,
	[FK_SecurityGroupID] [int] NULL,
 CONSTRAINT [PK_SecurityGroupPermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END


------------------------------------------------ Start [PageArea]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageArea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AreaType] [nvarchar](50) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[ParentArea] [int] NOT NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_PageArea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO
-----END


------------------------------------------------ Start [PageAreaToSecurityGroup]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageAreaToSecurityGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageAreaToSecurityGroup](
	[FK_PageAreaID] [int] NOT NULL,
	[FK_SecurityGroupID] [int] NOT NULL
) ON [PRIMARY]

END
GO
-----END

------------------------------------------------ Start [PageAreaToSystemPage]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageAreaToSystemPage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageAreaToSystemPage](
	[FK_PageAreaID] [int] NOT NULL,
	[FK_SystemPageID] [int] NOT NULL
) ON [PRIMARY]

END
GO
-----END

------------------------------------------------ Start [Report]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](512) NOT NULL,
	[Path] [nvarchar](512) NOT NULL,
	[ParentItemID] [uniqueidentifier] NULL,
	[Description] [nvarchar](512) NOT NULL,
	CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-----END

---------------------------------------------- Start [DNSServer]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DNSServer]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[DNSServer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [varchar](256) NOT NULL,
	[DomainName] [varchar](50) NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
)
ALTER TABLE [dbo].[DNSServer] ADD CONSTRAINT PK_DNSServer PRIMARY KEY(ID)
END

go
-------END

---------------------------------------------- Start [ReportingServer]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportingServer]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].ReportingServer(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerURL] [varchar](256) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](500) NOT NULL,
	[AuthenticationMode] [varchar](50) NULL CONSTRAINT [DF_DEV_ReportingServer_AuthenticationMode]  DEFAULT ('IIS'),
)
ALTER TABLE [dbo].[ReportingServer] ADD CONSTRAINT PK_ReportingServer PRIMARY KEY(ID)
END

go
-------END

------------------------------------------------ Start [FolderCollection]----------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FolderCollection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FolderCollection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdentifierName] [varchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[FolderID] [varchar](50) NULL,
	[FolderType] [int] NULL,
	CONSTRAINT [PK_FolderCollection] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-----END
------------------------------------------------ Start [ApplicationTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](100) NOT NULL,
	[TemplateDescription] [varchar](1024) NULL,
    [ApplicationName] [varchar](100) NULL,
    [ApplicationVersion] [varchar](20) NULL,
    [ApplicationManufacturer] [varchar](20) NULL,
    [ApplicationLanguages] [varchar](50) NULL,
    [ApplicationDescription] [varchar](1024) NULL,
    [ApplicationOptionalReference] [varchar] (100) NULL,
    [ApplicationAdministrativeCategories] [varchar] (100) NULL,
    [ApplicationOwners] [varchar] (100) NULL,
    [ApplicationSupportContact] [varchar] (50) NULL,
    [ApplicationSourceFolder] [varchar] (256) NULL,
    [ApplicationUpdateDPOnSchedule] [bit] NULL,
    [ApplicationDPSchedule] [varchar] (100) NULL,
    [ApplicationBinaryReplication] [bit] NULL,
    [ApplicationAllowAsTS] [bit] NULL,
    [ApplicationPriority] [int] NULL,
    [ApplicationDistributeToPreferredDPEnabled] [bit] NULL,
    [ApplicationPrestagedContent] [int] NULL,
    [LimitingCollection] [varchar] (50) NULL,
    [DistributionGroups] [varchar] (500) NULL,
    [DistributionPoints] [varchar] (500) NULL,
    [PackageID] [varchar] (20) NULL,
    [ProgramID] [varchar] (20) NULL,
    [CollectionID] [varchar] (20) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ApplicationTemplate_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ApplicationTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-----END
------------------------------------------------ Start [ApplicationDeploymentTypeTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationDeploymentTypeTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationDeploymentTypeTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationTemplateId] [int] NOT NULL,
	[DeploymentTypeName] [varchar] (100) NOT NULL,
    [DeploymentTypeTechnology] [varchar] (50) NULL,
    [DeploymentTypeAdminComments] [varchar] (1024) NULL,
    [DeploymentTypeLanguages] [varchar] (100) NULL,
    [DeploymentTypePersistContent] [bit] NULL,
    [DeploymentTypeAllowBranchCache] [bit] NULL,
    [DeploymentTypeAllowFallback] [bit] NULL,
    [DeploymentTypeSlowNetworkOption] [int] NULL,
    [DeploymentTypeInstallProgram] [varchar] (100) NULL,
    [DeploymentTypeInstallStartIn] [varchar] (256) NULL,
    [DeploymentTypeUninstallProgram] [varchar] (100) NULL,
    [DeploymentTypeUninstallStartIn] [varchar] (256) NULL,
    [DeploymentTypeAlwaysRun32bit] [bit] NULL,
    [DeploymentTypeInstallationBehavior] [int] NULL,
    [DeploymentTypeLogonRequirement] [int] NULL,
    [DeploymentTypeProgramVisibility] [int] NULL,
    [DeploymentTypeAllowUserInteract] [bit] NULL,
    [DeploymentTypeMaxRunTimeMinutes] [int] NULL,
    [DeploymentTypeEstimatedRunTimeMinutes] [int] NULL,
    [DeploymentTypeEnforcementBehavior] [int] NULL,
    [DeploymentTypeReturnCodes] [varchar] (50) NULL,
    [DeploymentTypeMSIProductGUID] [varchar] (32) NULL,
	[DeploymentTypeRequirements] [varchar] (max) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ApplicationDeploymentTypeTemplate_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ApplicationDeploymentTypeTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[ApplicationDeploymentTypeTemplate] ADD CONSTRAINT FK_ApplicationDeploymentType_ApplicationTemplate foreign KEY ([ApplicationTemplateId]) 
references [dbo].[ApplicationTemplate](ID)
END

-------END
--------------------------------------- DROP SO_OrderLine --------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_OrderLine]') AND type in (N'U'))
BEGIN
drop table SO_OrderLine
END

go
--------------------------------------- DROP SO_Order --------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SO_Order]') AND type in (N'U'))
BEGIN
drop table SO_Order
END

go


/****** Object:  View [dbo].[vSoftware] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(SELECT* FROM sys.views where object_id = OBJECT_ID('[dbo].[vSoftware]'))
BEGIN
DROP VIEW [dbo].[vSoftware]
END
GO
CREATE VIEW [dbo].[vSoftware]
AS
SELECT     dbo.Software.ID, dbo.Software.Name, dbo.Software.Description, dbo.Software.Price, dbo.Software.Owner, dbo.Software.SoftwareOrder, dbo.Software.ApprovalMethod, 
                      dbo.Software.PackageTypeID, dbo.Software.PackageID, dbo.Software.UpdatedDate, dbo.Software.CreatedDate, 
                      dbo.SoftwareToOperatingSystem.FK_OperatingSystemID, dbo.OperatingSystem.Name AS OperatingSystem, dbo.SoftwareToCategory.FK_CategoryID, 
                      dbo.Category.Name AS Category
FROM         dbo.OperatingSystem INNER JOIN
                      dbo.SoftwareToOperatingSystem ON dbo.OperatingSystem.ID = dbo.SoftwareToOperatingSystem.FK_OperatingSystemID RIGHT OUTER JOIN
                      dbo.Software ON dbo.SoftwareToOperatingSystem.FK_SoftwareID = dbo.Software.ID LEFT OUTER JOIN
                      dbo.Category INNER JOIN
                      dbo.SoftwareToCategory ON dbo.Category.ID = dbo.SoftwareToCategory.FK_CategoryID ON dbo.Software.ID = dbo.SoftwareToCategory.FK_SoftwareID
GO
/****** Object:  StoredProcedure [dbo].[usp_SoftwareOrder_MailInfo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF object_id(N'[dbo].[usp_SoftwareOrder_MailInfo]') IS NOT NULL
BEGIN
DROP PROCEDURE [dbo].[usp_SoftwareOrder_MailInfo]
END
GO
CREATE PROCEDURE [dbo].[usp_SoftwareOrder_MailInfo] 
		@OrderID int = 0
	AS

	SELECT A.ID AS OrderID,
		B.ID AS OrderLineID,
		A.UserName,
		A.ComputerName, 
		A.PackageName AS [Name],
		B.Reason,
		ISNULL(C.Description, '') AS [Description],
		ISNULL(C.Price, 0) AS Price,
		A.Deleted,
		A.CreatedDate
	FROM dbo.[Order] AS A WITH (NOLOCK)
		INNER JOIN dbo.OrderLine AS B WITH (NOLOCK) ON A.ID = B.OrderID
		LEFT JOIN dbo.Software AS C WITH (NOLOCK) ON A.SoftwareID = C.ID
	WHERE A.ID = @OrderID
GO
/****** Object:  ForeignKey [FK_SecurityClassPermission_SecurityGroup] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityClassPermission_SecurityGroup]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityClassPermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityClassPermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityClassPermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityClassPermission] CHECK CONSTRAINT [FK_SecurityClassPermission_SecurityGroup]
GO
/****** Object:  ForeignKey [FK_SecurityClassPermission_SystemClass] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityClassPermission_SystemClass]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityClassPermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityClassPermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityClassPermission_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityClassPermission] CHECK CONSTRAINT [FK_SecurityClassPermission_SystemClass]
GO
/****** Object:  ForeignKey [FK_SecurityInstancePermission_SecurityGroup] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityInstancePermission_SecurityGroup]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityInstancePermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityInstancePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityInstancePermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityInstancePermission] CHECK CONSTRAINT [FK_SecurityInstancePermission_SecurityGroup]
GO
/****** Object:  ForeignKey [FK_SecurityInstancePermission_SystemClass] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityInstancePermission_SystemClass]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityInstancePermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityInstancePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityInstancePermission_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityInstancePermission] CHECK CONSTRAINT [FK_SecurityInstancePermission_SystemClass]
GO
/****** Object:  ForeignKey [FK_SecurityPagePermission_SecurityGroup] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityPagePermission_SecurityGroup]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityPagePermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityPagePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityPagePermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityPagePermission] CHECK CONSTRAINT [FK_SecurityPagePermission_SecurityGroup]
GO
/****** Object:  ForeignKey [FK_SecurityPagePermission_SystemPage] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityPagePermission_SystemPage]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityPagePermission]'))
BEGIN
ALTER TABLE [dbo].[SecurityPagePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityPagePermission_SystemPage] FOREIGN KEY([FK_SystemPageID])
REFERENCES [dbo].[SystemPage] ([ID])
END
GO
ALTER TABLE [dbo].[SecurityPagePermission] CHECK CONSTRAINT [FK_SecurityPagePermission_SystemPage]
GO
/****** Object:  ForeignKey [FK_Software_Category_Category] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_Software_Category_Category]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToCategory]'))
BEGIN
ALTER TABLE [dbo].[SoftwareToCategory]  WITH CHECK ADD  CONSTRAINT [FK_Software_Category_Category] FOREIGN KEY([FK_CategoryID])
REFERENCES [dbo].[Category] ([ID])
END
GO
ALTER TABLE [dbo].[SoftwareToCategory] CHECK CONSTRAINT [FK_Software_Category_Category]
GO
/****** Object:  ForeignKey [FK_Software_Category_Software] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_Software_Category_Software]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToCategory]'))
BEGIN
ALTER TABLE [dbo].[SoftwareToCategory]  WITH CHECK ADD  CONSTRAINT [FK_Software_Category_Software] FOREIGN KEY([FK_SoftwareID])
REFERENCES [dbo].[Software] ([ID])
END
GO
ALTER TABLE [dbo].[SoftwareToCategory] CHECK CONSTRAINT [FK_Software_Category_Software]
GO
/****** Object:  ForeignKey [FK_SoftwareToOperatingSystem_OperatingSystem] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwareToOperatingSystem_OperatingSystem]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToOperatingSystem]'))
BEGIN
ALTER TABLE [dbo].[SoftwareToOperatingSystem]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToOperatingSystem_OperatingSystem] FOREIGN KEY([FK_OperatingSystemID])
REFERENCES [dbo].[OperatingSystem] ([ID])
END
GO
ALTER TABLE [dbo].[SoftwareToOperatingSystem] CHECK CONSTRAINT [FK_SoftwareToOperatingSystem_OperatingSystem]
GO
/****** Object:  ForeignKey [FK_SoftwareToOperatingSystem_Software] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwareToOperatingSystem_Software]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToOperatingSystem]'))
BEGIN
ALTER TABLE [dbo].[SoftwareToOperatingSystem]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToOperatingSystem_Software] FOREIGN KEY([FK_SoftwareID])
REFERENCES [dbo].[Software] ([ID])
END
GO
ALTER TABLE [dbo].[SoftwareToOperatingSystem] CHECK CONSTRAINT [FK_SoftwareToOperatingSystem_Software]
GO
/****** Object:  ForeignKey [FK_SystemPage_SystemClass] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SystemPage_SystemClass]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SystemPage]'))
BEGIN
ALTER TABLE [dbo].[SystemPage]  WITH CHECK ADD  CONSTRAINT [FK_SystemPage_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
END
GO
ALTER TABLE [dbo].[SystemPage] CHECK CONSTRAINT [FK_SystemPage_SystemClass]
GO
/****** Object:  Default [FK_DistributionScope] ******/
IF NOT EXISTS (
    SELECT *
      FROM sys.all_columns c
      JOIN sys.tables t on t.object_id = c.object_id
      JOIN sys.schemas s on s.schema_id = t.schema_id
      JOIN sys.default_constraints d on c.default_object_id = d.object_id
    WHERE t.name = 'DistributionScope'
      AND c.name = 'Type'
      AND s.name = 'dbo')
BEGIN
ALTER TABLE [dbo].[DistributionScope] ADD  CONSTRAINT [DF_DistributionScope_Type]  DEFAULT (N'Collection') FOR [Type]
END
GO

/****** Object:  ForeignKey [FK_SecurityGroupPermissions_SecurityGroup] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityGroupPermissions_SecurityGroup]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityGroupPermissions]'))
BEGIN
ALTER TABLE [dbo].[SecurityGroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK_SecurityGroupPermissions_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
END
GO

/****** Object:  ForeignKey [FK_PageArea_PageArea] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_PageArea_PageArea]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[PageArea]'))
BEGIN
ALTER TABLE [dbo].[PageArea]  WITH CHECK ADD CONSTRAINT [FK_PageArea_PageArea] FOREIGN KEY([ID])
REFERENCES [dbo].[PageArea] ([ID])
END
GO

/****** Object:  ForeignKey [FK_PageAreaToSecurityGroup_PageArea] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_PageAreaToSecurityGroup_PageArea]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[PageAreaToSecurityGroup]'))
BEGIN
ALTER TABLE [dbo].[PageAreaToSecurityGroup]  WITH CHECK ADD CONSTRAINT [FK_PageAreaToSecurityGroup_PageArea] FOREIGN KEY([FK_PageAreaID])
REFERENCES [dbo].[PageArea] ([ID])
END
GO

/****** Object:  ForeignKey [FK_PageAreaToSecurityGroup_SecurityGroup] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_PageAreaToSecurityGroup_SecurityGroup]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[PageAreaToSecurityGroup]'))
BEGIN
ALTER TABLE [dbo].[PageAreaToSecurityGroup]  WITH CHECK ADD CONSTRAINT [FK_PageAreaToSecurityGroup_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
END
GO

/****** Object:  ForeignKey [FK_PageAreaToSystemPage_PageArea] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_PageAreaToSystemPage_PageArea]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[PageAreaToSystemPage]'))
BEGIN
ALTER TABLE [dbo].[PageAreaToSystemPage]  WITH CHECK ADD CONSTRAINT [FK_PageAreaToSystemPage_PageArea] FOREIGN KEY([FK_PageAreaID])
REFERENCES [dbo].[PageArea] ([ID])
END
GO

/****** Object:  ForeignKey [FK_PageAreaToSystemPage_SystemPage] ******/
IF NOT EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'[dbo].[FK_PageAreaToSystemPage_SystemPage]')
           AND parent_object_id = OBJECT_ID(N'[dbo].[PageAreaToSystemPage]'))
BEGIN
ALTER TABLE [dbo].[PageAreaToSystemPage]  WITH CHECK ADD CONSTRAINT [FK_PageAreaToSystemPage_SystemPage] FOREIGN KEY([FK_SystemPageID])
REFERENCES [dbo].[SystemPage] ([ID])
END
GO

/*** [ALTER HostingService - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'ProductVersion' ) AND name = 'HostingService')
ALTER TABLE [dbo].[HostingService] ADD [ProductVersion] [nvarchar](256) NULL
GO

/*** [ALTER HostedService - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'ProductVersion' ) AND name = 'HostedServices')
ALTER TABLE [dbo].[HostedServices] ADD [ProductVersion] [nvarchar](256) NULL
GO

/*** [ALTER ApplicationTemplate - BEGIN] ***/
IF EXISTS (SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ApplicationTemplate' AND COLUMN_NAME = 'ApplicationPrestagedContent' AND DATA_TYPE = 'bit')
BEGIN
ALTER TABLE [ApplicationTemplate] ALTER COLUMN [ApplicationPrestagedContent] INT
UPDATE [ApplicationTemplate] SET [ApplicationPrestagedContent] = ISNULL([ApplicationPrestagedContent],-1) WHERE [ApplicationPrestagedContent] is NULL
END
GO

/*** [ALTER DistributionScope - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'TYPE' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [TYPE] [nvarchar](50) NULL
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'Filter' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [FILTER] [nvarchar](2048) NULL
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'ResourceType' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [ResourceType] [int] NOT NULL CONSTRAINT [DF_DistributionScope_ResourceType]  DEFAULT (5) WITH VALUES
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'Version' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [Version] [tinyint] NULL 
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'MemberCount' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [MemberCount] [int] NULL 
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'LastSummarized' ) AND name = 'DistributionScope')
ALTER TABLE [dbo].[DistributionScope] ADD [LastSummarized] [datetime] NULL 
GO

/*** [ALTER RemoteTools - BEGIN] ***/
IF EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'IconName' ) AND name = 'RemoteTools')
ALTER TABLE dbo.RemoteTools DROP COLUMN IconName; 
GO
GO
IF EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'CommandLine' ) AND name = 'RemoteTools')
EXEC sp_rename 'dbo.RemoteTools.CommandLine', 'URL', 'COLUMN';
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Filter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Filter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Expression] [varchar](max) NULL,
 CONSTRAINT [PK_Filter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


END
GO
-----END

------------------------------------------------ Start [LanguageAndCountry]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LanguageAndCountry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LanguageAndCountry]
(
	LACID INT IDENTITY(1,1),
	Value NVARCHAR(50),
	DefaultLAC NVARCHAR(10)
)
ALTER TABLE [dbo].[LanguageAndCountry] ADD CONSTRAINT PK_LanguageAndCountry PRIMARY KEY(LACID)
END
GO
-----END

------------------------------------------------ Start [Repository]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Repository]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Repository]
(
	ID INT IDENTITY(1,1),
	Name NVARCHAR(100),
	RepPath NVARCHAR(200),
	DefaultCreate NVARCHAR(10),
	DefaultImport NVARCHAR(10)
)
ALTER TABLE [dbo].[Repository] ADD CONSTRAINT PK_Repository PRIMARY KEY(ID)
END
GO
-----END

---------------------------------------------- Start [ComputerFilter]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComputerFilter]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[ComputerFilter](
[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (128) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[FK_FilterID] [int] NULL,
)
ALTER TABLE [dbo].[ComputerFilter] ADD CONSTRAINT PK_ComputerFilter PRIMARY KEY(ID)
ALTER TABLE [dbo].[ComputerFilter]  WITH CHECK ADD  CONSTRAINT [FK_ComputerFilter_Filter] FOREIGN KEY([FK_FilterID])
REFERENCES [dbo].[Filter] ([ID])

END

go
-------END

---------------------------------------------- Start [GridColumn]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GridColumn]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[GridColumn](
[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (128) NOT NULL,
)
ALTER TABLE [dbo].[GridColumn] ADD CONSTRAINT PK_GridColumn PRIMARY KEY(ID)

END

go
-------END

---------------------------------------------- Start [ComputerFilterToGridColumn]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComputerFilterToGridColumn]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[ComputerFilterToGridColumn](
[FK_ComputerFilterID] [int] NOT NULL,
	[FK_GridColumnID] [int] NOT NULL,
)
ALTER TABLE [dbo].[ComputerFilterToGridColumn]  WITH CHECK ADD CONSTRAINT [FK_ComputerFilterToGridColumn_ComputerFilter] FOREIGN KEY([FK_ComputerFilterID])
REFERENCES [dbo].[ComputerFilter] ([ID])
ALTER TABLE [dbo].[ComputerFilterToGridColumn]  WITH CHECK ADD CONSTRAINT [FK_ComputerFilterToGridColumn_GridColumn] FOREIGN KEY([FK_GridColumnID])
REFERENCES [dbo].[GridColumn] ([ID])

END

go
-------END

---------------------------------------------- Start [User]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Domain] [nvarchar](256) NULL,
	[ResourceID] [varchar](50) NULL,
	[UPN] [nvarchar](256) NULL,
	[UniqueName] [nvarchar](256) NULL,
	[SID] [varchar](256) NULL,
	[FullName] [nvarchar](256) NULL,
	[DistinguishedName] [nvarchar](max) NULL,
	[Mail] [nvarchar](256) NULL,
	[CloudUserID] [uniqueidentifier] NULL,
	[PrimaryComputer] [nvarchar](256) NULL,
) 
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY(ID)
END
GO
-------END

---------------------------------------------- Start [UserToRole]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserToRole]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[UserToRole](
	[UserName] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
)
END
GO
-------END


---------------------------------------------- Start [PackageTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackageTemplate]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].PackageTemplate(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](256) NOT NULL,
	[TemplateDescription] [nvarchar](1024) NULL,
	[PackageDescription] [nvarchar](1024) NULL,
	[PackageUpdateDPOnSchedule] [bit] NULL,
	[PackagePersistContent] [bit] NULL,
	[PackageBinaryReplication] [bit] NULL,
	[PackageCopyToShare] [bit] NULL,	        
	[PackageCustomShareNameEnabled] [bit] NULL,	        
    [PackageCustomShareName] [nvarchar](128) NULL,
    [PackageDisconnectUsers] [bit] NULL,	        
	[PackageDisconnectRetries] [int] NULL,	        
	[PackageDisconnectInterval] [int] NULL,	        
	[PackagePriority] [int] NULL,	        
    [PackageDistributeToPreferredDPEnabled] [bit] NULL,	        
	[PackagePrestagedContent] [int] NULL,	        
	[PackageWinPEMulticast] [bit] NULL,	        
	[PackageWinPEEncrypt] [bit] NULL,	        
	[PackageWinPETranferMulticastOnly] [bit] NULL,	        
	[LimitingCollection] [nvarchar](512) NULL,
	[DistributionGroups] [varchar](512) NULL,
	[DistributionPoints] [varchar](512) NULL,
	[ProgramName] [nvarchar](256) NULL,
	[ProgramDescription] [nvarchar](1024) NULL,
	[ProgramCommandLine] [nvarchar](512) NULL,
	[ProgramStartIn] [nvarchar](512) NULL,
	[ProgramRunType] [int] NULL,
	[ProgramAfterRunAction] [int] NULL,
	[ProgramCategory] [nvarchar](256) NULL,
	[ProgramEstimatedDiskSpace] [bigint] NULL,
	[ProgramEstimatedRunTimeMinutes] [int] NULL,
	[ProgramPlatforms] [nvarchar](512) NULL,
	[ProgramLogonRequirement] [int] NULL,
	[ProgramRunMode] [int] NULL,
	[ProgramDriveMode] [int] NULL,
	[ProgramDriveLetter] [varchar](10) NULL,
	[ProgramPreRun] [bit] NULL,
	[ProgramPreRunPackageID] [nvarchar](256) NULL,
	[ProgramPreRunProgramName] [nvarchar](256) NULL,
	[ProgramAlwaysRunPreRun] [bit] NULL,
	[ProgramRunBehavior] [int] NULL,
	[ProgramSuppressNotifications] [bit] NULL,
	[ProgramAllowAsTS] [bit] NULL,
	[ProgramDisableOpsMgrAlerts] [bit] NULL,
	[ProgramOpsMgrAlertOnFailure] [bit] NULL,
) 
ALTER TABLE [dbo].[PackageTemplate] ADD CONSTRAINT [PK_PackageTemplate] PRIMARY KEY(ID)
END
GO
-------END

---------------------------------------------- Start [TaskSequenceTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskSequenceTemplate]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].TaskSequenceTemplate(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](256) NOT NULL,
	[TemplateDescription] [nvarchar](1024) NULL,
	[TaskSequenceName] [nvarchar](256) NULL,
	[TaskSequenceDescription] [nvarchar](1024) NULL,
    [BootImageID] [nvarchar](128) NULL,
	[OSImageID] [nvarchar](128) NULL,
	[OSImageIndex] [int] NULL,
    [Organization] [nvarchar] (256) NULL,	        
	[OrganizationUserName] [nvarchar] (256) NULL,	        
	[FormatTarget] [bit] NULL,
	[UseBitLocker] [bit] NULL,	        
	[WindowsProductKey] [nvarchar](256) NULL,
	[ServerLicensingMode] [int] NULL,
	[MaxServerConnections] [int] NULL,
	[RandomizeLocalAdmin] [bit] NULL,
	[LocalAdminPassword] [nvarchar](1024) NULL,
	[JoinWorkgroup] [bit] NULL,
	[WorkgroupName] [nvarchar](256) NULL,
	[JoinDomain] [bit] NULL,
	[DomainName] [nvarchar](256) NULL,
	[DomainOU] [nvarchar](2048) NULL,
	[DomainJoinUserName] [nvarchar](256) NULL,
	[DomainJoinUserPassword] [nvarchar](1024) NULL,
	[ConfigMgrClientPackageID] [nvarchar](128) NULL,
	[ConfigMgrClientPackageProperties] [nvarchar](256) NULL,
	[CaptureUSMT] [bit] NULL,
	[USMTPackageID] [nvarchar](128) NULL,
	[CaptureSavePointType] [int] NULL,
	[CaptureLinks] [bit] NULL,
	[CaptureNetwork] [bit] NULL,
	[CaptureWindowsSettings] [bit] NULL,
	[UpdateInstallMode] [int] NULL,
	[UseUpdatesCache] [bit] NULL, 
	[ApplicationList] [nvarchar] (max) NULL,
	[PackageList] [nvarchar] (max) NULL,
) 
ALTER TABLE [dbo].[TaskSequenceTemplate] ADD CONSTRAINT [PK_TaskSequenceTemplate] PRIMARY KEY(ID)
END
GO
-------END
  
---------------------------------------------- Start [PackageDeploymentTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackageDeploymentTemplate]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].PackageDeploymentTemplate(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](256) NOT NULL,
	[TemplateDescription] [nvarchar](1024) NULL,
	[Action] [int] NULL,
	[Purpose] [int] NULL,
	[RequireAdminApproval] [bit] NULL,
	[RequiredEventSchedules] [varchar](512) NULL,
	[RerunBehavior] [int] NULL,
	[Predeploy] [bit] NULL,
	[SendWOL] [bit] NULL,
	[AllowMeteredInternetClients] [bit] NULL,	
	[AllowUserInstallation] [bit] NULL,
	[AllowInstallOutsideMW] [bit] NULL,
	[AllowRestartOutsideMW] [bit] NULL,
	[FastNetworkOption] [int] NULL,
	[SlowNetworkOption] [int] NULL,
	[AllowBranchCache] [bit] NULL,
	[AllowFallback] [bit] NULL,
) 
ALTER TABLE [dbo].[PackageDeploymentTemplate] ADD CONSTRAINT [PK_PackageDeploymentTemplate] PRIMARY KEY(ID)
END
GO
-------END


---------------------------------------------- Start [ApplicationDeploymentTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationDeploymentTemplate]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].ApplicationDeploymentTemplate(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](256) NOT NULL,
	[TemplateDescription] [nvarchar](1024) NULL,
	[Action] [int] NULL,
	[Purpose] [int] NULL,
	[RequireAdminApproval] [bit] NULL,
	[AsapDeployment] [bit] NULL,
	[Predeploy] [bit] NULL,
	[SendWOL] [bit] NULL,
	[AllowMeteredInternetClients] [bit] NULL,	
	[UserNotification] [int] NULL,
	[AllowInstallOutsideMW] [bit] NULL,
	[AllowRestartOutsideMW] [bit] NULL,
	[AlertLowSuccessThresholdEnabled] [bit] NULL,
	[AlertLowSuccessThresholdDate] [datetime] NULL,
	[AlertLowSuccessThresholdPercent] [int] NULL,
	[AlertFailedThresholdEnabled] [bit] NULL,
	[AlertFailedThresholdPercent] [int] NULL,
	[EnableOpsMgrMaintMode] [bit] NULL,
	[OpsMgrAlertOnFailure] [bit] NULL,	
) 
ALTER TABLE [dbo].ApplicationDeploymentTemplate ADD CONSTRAINT [PK_ApplicationDeploymentTemplate] PRIMARY KEY(ID)
END
GO
-------END

---------------------------------------------- Start [TaskSequenceDeploymentTemplate]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskSequenceDeploymentTemplate]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].TaskSequenceDeploymentTemplate(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](256) NOT NULL,
	[TemplateDescription] [nvarchar](1024) NULL,
	[Purpose] [int] NULL,
	[RequiredEventSchedules] [varchar](512) NULL,
	[RerunBehavior] [int] NULL,
	[SendWOL] [bit] NULL,
	[AllowMeteredInternetClients] [bit] NULL,	
	[AvailableTo] [int] NULL,
	[AllowUserInstallation] [bit] NULL,
	[AllowInstallOutsideMW] [bit] NULL,
	[AllowRestartOutsideMW] [bit] NULL,
	[ShowTSProgress] [bit] NULL,
	[AllowTSForInternetClients] [bit] NULL,
	[DeploymentDownloadOptions] [int] NULL,		
	[AllowRemoteDP] [bit] NULL,
	[AllowBranchCache] [bit] NULL,
	[AllowBoundaryGroupDP] [bit] NULL,
) 
ALTER TABLE [dbo].[TaskSequenceDeploymentTemplate] ADD CONSTRAINT [PK_TaskSequenceDeploymentTemplate] PRIMARY KEY(ID)
END
GO
-------END

---------------------------------------------- Start [NavigationNode]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NavigationNode]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].NavigationNode(
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Definition] [varchar](max) NULL,
	[Ordinal] [int] NOT NULL,
	[Sealed] [bit] NOT NULL,
	[Icon] [image] NULL,
	[IsPublic] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getutcdate()),
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NOT NULL DEFAULT (getutcdate()),
	[LastModifiedBy] [int] NULL,
	[IsVisible] [bit] NOT NULL,
	[Location] [uniqueidentifier] NOT NULL DEFAULT ('6cfc4d00-d8eb-4f51-b63d-f776576cf25a'),
	[IconClass] [nvarchar](50) NULL,
	[IsLicensed] [bit] NOT NULL DEFAULT ((1)),
	[LicenseRequired] [nvarchar](50) NULL,
) 
ALTER TABLE [dbo].[NavigationNode] ADD CONSTRAINT [PK_NavigationNode] PRIMARY KEY(Id)
END
GO
-------END

---------------------------------------------- Start [DataSource Configuration]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSourceConfiguration]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].DataSourceConfiguration(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ProviderName] [nvarchar](255) NULL,
	[ConnectionString] [nvarchar](max) NULL,
	[Enabled] [bit] NULL,
	[Sealed] [bit] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[LastModifiedDate] [date] NULL,
	[LastModifiedBy] [uniqueidentifier] NULL,
) 
ALTER TABLE [dbo].[DataSourceConfiguration] ADD CONSTRAINT [PK_DataSourceConfiguration] PRIMARY KEY(Id)
END
GO
-------END

---------------------------------------------- Start [DataSource]----------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].DataSource(
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ConnectionString] [nvarchar](1000) NULL,
	[Query] [nvarchar](max) NULL,
	[DataSourceId] [int] NULL
) 
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [PK_DataSource] PRIMARY KEY(Id)
END
GO
-------END


--------------------------------------- DROP Approver in  software --------------------------------------------
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[DF_Software_Approver]') AND parent_object_id = OBJECT_ID(N'[dbo].[software]'))
begin
alter table [dbo].[Software] drop constraint DF_Software_Approver
ALTER TABLE [dbo].[Software] DROP COLUMN Approver 
END

go


--------------------------------------- Expand Log Message --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'EventLog' AND COLUMN_NAME = 'Message') > -1 
BEGIN
ALTER TABLE [dbo].[EventLog] ALTER COLUMN [Message] nvarchar(max)
END

go

--------------------------------------- Expand SystemClass Name --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SystemClass' AND COLUMN_NAME = 'Name') < 64
BEGIN
ALTER TABLE [dbo].[SystemClass] ALTER COLUMN [Name] nvarchar(64)
END

go

--------------------------------------- Alter existing tables --------------------------------------------

 ------------------------ Software table - UserCollection ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'UserCollectionID')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [UserCollectionID] VARCHAR(10) NULL
 END
 
 GO

 ------------------------ Software table - DeviceCollection ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'DeviceCollectionID')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [DeviceCollectionID] VARCHAR(10) NULL
 END
 
 GO

 ------------------------ Computer table - MACAddress ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'MACAddress')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [MACAddress] VARCHAR(50) NULL
 END
 
 GO

 ------------------------ Computer table - PrimaryUser ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'PrimaryUser')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [PrimaryUser] NVARCHAR(64) NULL
 END
 
 GO

 ------------------------ Computer table - Client ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'Client')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [Client] bit NULL
 END
 
 GO

------------------------ Software table - PackageTypeID ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'PackageTypeID')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ALTER COLUMN [PackageTypeID] int
 END
 
 GO

 ------------------------ Software table - CI_ID ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'CI_ID')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [CI_ID] int NULL
 END
 
 GO


 ------------------------ Software table - Version ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Version')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [Version] nvarchar(1024) NULL
 END
 
 GO

 ------------------------ Software table - Manufacturer ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Manufacturer')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [Manufacturer] nvarchar(1024) NULL
 END
 
 GO

 ------------------------ Software table - Shortname ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Shortname')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [Shortname] nvarchar(1024) NULL
 END
 
 GO

 ------------------------ Software table - Language ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Language')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [Language] nvarchar(1024) NULL
 END
 
 GO

 ------------------------ Software table - IsSuperseded ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'IsSuperseded')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [IsSuperseded] int NULL DEFAULT ((0))
 END
 
 GO

 ------------------------ Software table - IsSuperseding ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'IsSuperseding')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [IsSuperseding] int NULL DEFAULT ((0))
 END
 
 GO

 ------------------------ Software table - IsExpired ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'IsExpired')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [IsExpired] int NULL DEFAULT ((0))
 END
 
 GO

 ------------------------ Software table - BootImage ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'BootImage')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD [BootImage] varchar(1024) NULL
 END
 
 GO

  ------------------------ Software table - TaskSequenceType ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'TaskSequenceType')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD TaskSequenceType int NULL
 END
 
 GO

 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'LogonRequirement')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD LogonRequirement bit NULL
 END
 
 GO

 ------------------------ Software table - TaskSequenceCategory ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'TaskSequenceCategory')
 BEGIN
  ALTER TABLE [dbo].[Software]
  ADD TaskSequenceCategory [nvarchar] (1024) NULL
 END
 
 GO

 --------------------------------------- Software table Expand Name --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Name') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Name] nvarchar(1024)
END

go

 --------------------------------------- Software table Expand Description --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Description') < 4000
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Description] nvarchar(4000)
END

go

 --------------------------------------- Software table Expand Owner --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Owner') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Owner] nvarchar(1024)
END

go

 --------------------------------------- Software table Expand Approver --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Approver') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Approver] varchar(1024)
END

go

--------------------------------------- Software table Expand Version --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Version') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Version] nvarchar(1024)
END

go

--------------------------------------- Software table Expand Manufacturer --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Manufacturer') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Manufacturer] nvarchar(1024)
END

go

--------------------------------------- Software table Expand Language --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'Language') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [Language] nvarchar(1024)
END

go

--------------------------------------- Software table Expand ShortName --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'ShortName') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [ShortName] nvarchar(1024)
END

go

--------------------------------------- Software table Expand BootImage --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'BootImage') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [BootImage] varchar(1024)
END

go


--------------------------------------- Software table Expand TaskSequenceCategory --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Software' AND COLUMN_NAME = 'TaskSequenceCategory') < 1024 
BEGIN
ALTER TABLE [dbo].[Software] ALTER COLUMN [TaskSequenceCategory] nvarchar(1024)
END

go



 /*** [LOG UPDATES - BEGIN] ***/
 IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'ThreadID' ) AND name = 'EventLog')
ALTER TABLE [dbo].[EventLog] ADD [ThreadID] [nvarchar](128) NULL
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'ThreadFunction' ) AND name = 'EventLog')
ALTER TABLE [dbo].[EventLog] ADD [ThreadFunction] [nvarchar](50) NULL
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'IsService' ) AND name = 'EventLog')
ALTER TABLE [dbo].[EventLog] ADD [IsService] [int] NULL
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id IN ( SELECT id FROM syscolumns WHERE name = 'Origin' ) AND name = 'EventLog')
ALTER TABLE [dbo].[EventLog] ADD [Origin] [nvarchar](50) NULL
GO
/*** [LOG UPDATES - END] ***/
 ------------------------ Computer table - OperatingSystem ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'OperatingSystem')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [OperatingSystem] NVARCHAR(256) NULL
 END
 
 GO


 ------------------------ Computer table - UserName ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'UserName')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [UserName] NVARCHAR(256) NULL
 END
 
 GO

 ------------------------ Computer table - ClientType ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'ClientType')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [ClientType] int NULL
 END
 
 GO

 ------------------------ Computer table - CMUniqueIdentifier ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'CMUniqueIdentifier')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [CMUniqueIdentifier] NVARCHAR(255) NULL
 END
 
 GO

 ------------------------ Computer table - CMCreationDate ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'CMCreationDate')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [CMCreationDate] datetime NULL
 END
 
 GO

 ------------------------ Computer table - SMBIOSGUID ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'SMBIOSGUID')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [SMBIOSGUID] nvarchar(256) NULL
 END
 
 GO

 ------------------------ Computer table - CMDecommissioned ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'CMDecommissioned')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [CMDecommissioned] int NULL
 END
 
 GO

 ------------------------ Computer table - LastLogonTime ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'LastLogonTime')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [LastLogonTime] datetime NULL
 END
 
 GO

 ------------------------ Computer table - IsVirtualMachine ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'IsVirtualMachine')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [IsVirtualMachine] bit NULL
 END
 
 GO

 ------------------------ Computer table - VirtualMachineHostName ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'VirtualMachineHostName')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [VirtualMachineHostName] nvarchar(256) NULL
 END
 
 GO

 ------------------------ Computer table - WTGUniqueKey ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'WTGUniqueKey')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [WTGUniqueKey] nvarchar(256) NULL
 END
 
 GO

 ------------------------ Computer table - MdtSMBIOSGUID ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'MdtSMBIOSGUID')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [MdtSMBIOSGUID] nvarchar(256) NULL
 END
 
 GO

 ------------------------ Computer table - CMPresent ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'CMPresent')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [CMPresent] bit NULL
 END
 
 GO

 ------------------------ Computer table - State ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'State')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [State] varchar(64) NULL
 END
 
 GO

  ------------------------ Naming Templates table - Owner ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'OSDTemplate' AND COLUMN_NAME = 'Owner')
 BEGIN
  ALTER TABLE [dbo].[OSDTemplate]
  ADD [Owner] NVARCHAR (50) NULL
 END
 
 GO

  ------------------------ OU table - Owner ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'OrganizationalUnit' AND COLUMN_NAME = 'Owner')
 BEGIN
  ALTER TABLE [dbo].[OrganizationalUnit]
  ADD [Owner] NVARCHAR (50) NULL
 END
 
 GO

  ------------------------ Number Serie table - Owner ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'OSDNumberSerie' AND COLUMN_NAME = 'Owner')
 BEGIN
  ALTER TABLE [dbo].[OSDNumberSerie]
  ADD [Owner] NVARCHAR (50) NULL
 END
 
 GO


--------------------------------------- Expand MAC Addresses --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'MACAddress') < 1024 AND (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'MACAddress') != -1
BEGIN
ALTER TABLE [dbo].[Computer] ALTER COLUMN [MACAddress] varchar(1024)
END

go

------------------------ Security Group table - ADGroupDistribution ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SecurityGroup' AND COLUMN_NAME = 'ADGroupDistribution')
 BEGIN
  ALTER TABLE [dbo].[SecurityGroup]
  ADD [ADGroupDistribution] bit NULL
 END
 
 GO

  ------------------------ Computer table - ClientHealthy ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'ClientHealthy')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [ClientHealthy] bit NULL
 END
 
 GO

  ------------------------ Computer table - LastPolicyUpdate ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'LastPolicyUpdate')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [LastPolicyUpdate] [datetime] NULL
 END
 
 GO

  ------------------------ Computer table - LastDiscoveryUpdate ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'LastDiscoveryUpdate')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [LastDiscoveryUpdate] [datetime] NULL
 END
 
 GO

   ------------------------ Computer table - DistinguishedName ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Computer' AND COLUMN_NAME = 'DistinguishedName')
 BEGIN
  ALTER TABLE [dbo].[Computer]
  ADD [DistinguishedName] [nvarchar](max) NULL
 END
 
 GO

 --------------------------------------- Rename User - DistinguisedName to DistinguishedName -----------------------------------------
   IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'User' AND COLUMN_NAME = 'DistinguisedName')
BEGIN
  EXEC sp_RENAME '[dbo].[User].DistinguisedName', 'DistinguishedName', 'COLUMN'
END

GO


 --------------------------------------- Expand User - DistinguishedName --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'User' AND COLUMN_NAME = 'DistinguishedName') > -1 
BEGIN
ALTER TABLE [dbo].[User] ALTER COLUMN [DistinguishedName] nvarchar(max)
END

GO

   ------------------------ TaskSequenceTemplate table - Organization ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TaskSequenceTemplate' AND COLUMN_NAME = 'Organization')
 BEGIN
  ALTER TABLE [dbo].[TaskSequenceTemplate]
  ADD [Organization] [nvarchar] (256) NULL
 END
 
 GO

   ------------------------ TaskSequenceTemplate table - OrganizationUserName ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TaskSequenceTemplate' AND COLUMN_NAME = 'OrganizationUserName')
 BEGIN
  ALTER TABLE [dbo].[TaskSequenceTemplate]
  ADD [OrganizationUserName] [nvarchar] (256) NULL
 END
 
 GO

    ------------------------ TaskSequenceTemplate table - UseUpdatesCache ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TaskSequenceTemplate' AND COLUMN_NAME = 'UseUpdatesCache')
 BEGIN
  ALTER TABLE [dbo].[TaskSequenceTemplate]
  ADD [UseUpdatesCache] [bit] NULL
 END
 
 GO

   ------------------------ TaskSequenceTemplate table - ApplicationList ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TaskSequenceTemplate' AND COLUMN_NAME = 'ApplicationList')
 BEGIN
  ALTER TABLE [dbo].[TaskSequenceTemplate]
  ADD [ApplicationList] [nvarchar] (max) NULL
 END
 
 GO

 ------------------------ TaskSequenceTemplate table - PackageList ----------------------------
 IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TaskSequenceTemplate' AND COLUMN_NAME = 'PackageList')
 BEGIN
  ALTER TABLE [dbo].[TaskSequenceTemplate]
  ADD [PackageList] [nvarchar] (max) NULL
 END
 
 GO

 --------------------------------------- Expand encrypted password field - Domain --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Domain' AND COLUMN_NAME = 'UserPwd') > -1 
BEGIN
ALTER TABLE [dbo].[Domain] ALTER COLUMN [UserPwd] nvarchar(max)
END

go

--------------------------------------- Expand encrypted password field - DNSServer --------------------------------------------
IF (SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DNSServer' AND COLUMN_NAME = 'UserPwd') > -1 
BEGIN
ALTER TABLE [dbo].[DNSServer] ALTER COLUMN [UserPwd] nvarchar(max)
END

go


/*** [TABLE CONSTRAINTS - BEGIN] ***/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityClassPermission_SecurityGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityClassPermission]'))
ALTER TABLE [dbo].[SecurityClassPermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityClassPermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
GO
ALTER TABLE [dbo].[SecurityClassPermission] CHECK CONSTRAINT [FK_SecurityClassPermission_SecurityGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityClassPermission_SystemClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityClassPermission]'))
ALTER TABLE [dbo].[SecurityClassPermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityClassPermission_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
GO
ALTER TABLE [dbo].[SecurityClassPermission] CHECK CONSTRAINT [FK_SecurityClassPermission_SystemClass]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityInstancePermission_SecurityGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityInstancePermission]'))
ALTER TABLE [dbo].[SecurityInstancePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityInstancePermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
GO
ALTER TABLE [dbo].[SecurityInstancePermission] CHECK CONSTRAINT [FK_SecurityInstancePermission_SecurityGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityInstancePermission_SystemClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityInstancePermission]'))
ALTER TABLE [dbo].[SecurityInstancePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityInstancePermission_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
GO
ALTER TABLE [dbo].[SecurityInstancePermission] CHECK CONSTRAINT [FK_SecurityInstancePermission_SystemClass]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityPagePermission_SecurityGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityPagePermission]'))
ALTER TABLE [dbo].[SecurityPagePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityPagePermission_SecurityGroup] FOREIGN KEY([FK_SecurityGroupID])
REFERENCES [dbo].[SecurityGroup] ([ID])
GO
ALTER TABLE [dbo].[SecurityPagePermission] CHECK CONSTRAINT [FK_SecurityPagePermission_SecurityGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SecurityPagePermission_SystemPage]') AND parent_object_id = OBJECT_ID(N'[dbo].[SecurityPagePermission]'))
ALTER TABLE [dbo].[SecurityPagePermission]  WITH CHECK ADD  CONSTRAINT [FK_SecurityPagePermission_SystemPage] FOREIGN KEY([FK_SystemPageID])
REFERENCES [dbo].[SystemPage] ([ID])
GO
ALTER TABLE [dbo].[SecurityPagePermission] CHECK CONSTRAINT [FK_SecurityPagePermission_SystemPage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SystemPage_SystemClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[SystemPage]'))
ALTER TABLE [dbo].[SystemPage]  WITH CHECK ADD  CONSTRAINT [FK_SystemPage_SystemClass] FOREIGN KEY([FK_SystemClassID])
REFERENCES [dbo].[SystemClass] ([ID])
GO
ALTER TABLE [dbo].[SystemPage] CHECK CONSTRAINT [FK_SystemPage_SystemClass]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwareToMetaData_MetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToMetaData]'))
ALTER TABLE [dbo].[SoftwareToMetaData]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToMetaData_MetaData] FOREIGN KEY([FK_MetaDataID])
REFERENCES [dbo].[MetaData] ([ID])
GO
ALTER TABLE [dbo].[SoftwareToMetaData] CHECK CONSTRAINT [FK_SoftwareToMetaData_MetaData]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwareToMetaData_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwareToMetaData]'))
ALTER TABLE [dbo].[SoftwareToMetaData]  WITH CHECK ADD  CONSTRAINT [FK_SoftwareToMetaData_Software] FOREIGN KEY([FK_SoftwareID])
REFERENCES [dbo].[Software] ([ID])
GO
ALTER TABLE [dbo].[SoftwareToMetaData] CHECK CONSTRAINT [FK_SoftwareToMetaData_Software]
GO
/****** Object:  Default [FK_DistributionScope] ******/
IF NOT EXISTS(select * from sys.default_constraints where name = 'DF_DistributionScope_Type' AND definition IS NOT NULL)
ALTER TABLE [dbo].[DistributionScope] ADD  CONSTRAINT [DF_DistributionScope_Type]  DEFAULT (N'Collection') FOR [Type]
GO
IF NOT EXISTS(select * from sys.default_constraints where name = 'DF_DistributionScope_ResourceType' AND definition IS NOT NULL)
ALTER TABLE [dbo].[DistributionScope] ADD CONSTRAINT [DF_DistributionScope_ResourceType]  DEFAULT (5) FOR [ResourceType]
GO
IF NOT EXISTS(select * from sys.default_constraints where name = 'DF_EventLog_Origin' AND definition IS NOT NULL)
ALTER TABLE [dbo].[EventLog] ADD  CONSTRAINT [DF_EventLog_Origin]  DEFAULT (N'Boost') FOR [Origin]
GO
IF NOT EXISTS(select * from sys.default_constraints where name = 'DF_SecurityGroup_ADGroupDistribution' AND definition IS NOT NULL)
ALTER TABLE [dbo].[SecurityGroup] ADD  CONSTRAINT [DF_SecurityGroup_ADGroupDistribution]  DEFAULT ((0)) FOR [ADGroupDistribution]
GO

/*** [TABLE CONSTRAINTS - END] ***/


/*** Views ***/
ALTER VIEW [dbo].[vSoftware]
AS
SELECT     dbo.Software.ID, dbo.Software.Name, dbo.Software.Description, dbo.Software.Price, dbo.Software.Owner, dbo.Software.SoftwareOrder, dbo.Software.ApprovalMethod, 
                      dbo.Software.PackageTypeID, dbo.Software.PackageID, dbo.Software.UpdatedDate, dbo.Software.CreatedDate, 
                      dbo.SoftwareToOperatingSystem.FK_OperatingSystemID, dbo.OperatingSystem.Name AS OperatingSystem, dbo.SoftwareToCategory.FK_CategoryID, 
                      dbo.Category.Name AS Category
FROM         dbo.OperatingSystem INNER JOIN
                      dbo.SoftwareToOperatingSystem ON dbo.OperatingSystem.ID = dbo.SoftwareToOperatingSystem.FK_OperatingSystemID RIGHT OUTER JOIN
                      dbo.Software ON dbo.SoftwareToOperatingSystem.FK_SoftwareID = dbo.Software.ID LEFT OUTER JOIN
                      dbo.Category INNER JOIN
                      dbo.SoftwareToCategory ON dbo.Category.ID = dbo.SoftwareToCategory.FK_CategoryID ON dbo.Software.ID = dbo.SoftwareToCategory.FK_SoftwareID

GO


/*** stored Procedure ***/
ALTER PROCEDURE [dbo].[usp_SoftwareOrder_MailInfo] 
		@OrderID int = 0
	AS

	SELECT A.ID AS OrderID,
		B.ID AS OrderLineID,
		A.UserName,
		A.ComputerName, 
		A.PackageName AS [Name],
		B.Reason,
		ISNULL(C.Description, '') AS [Description],
		ISNULL(C.Price, 0) AS Price,
		A.Deleted,
		A.CreatedDate
	FROM dbo.[Order] AS A WITH (NOLOCK)
		INNER JOIN dbo.OrderLine AS B WITH (NOLOCK) ON A.ID = B.OrderID
		LEFT JOIN dbo.Software AS C WITH (NOLOCK) ON A.SoftwareID = C.ID
	WHERE A.ID = @OrderID
GO

IF object_id('spGet_NavigationNodeById') IS NOT NULL
    DROP PROCEDURE [dbo].[spGet_NavigationNodeById]
GO

CREATE PROCEDURE [dbo].[spGet_NavigationNodeById]
	@Id uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	SELECT n.Id, 
		   n.ParentId, 
		   n.[Definition],
		   n.DisplayName, 
		   n.Ordinal, 
		   n.Sealed, 
		   n.IsVisible, 
		   n.IsPublic, 
		   n.LastModifiedDate, 
		   CASE 
			 WHEN n.Icon IS NULL THEN Cast(0 AS BIT) 
			 ELSE Cast(1 AS BIT) 
		   END AS HasIcon, 
		   n.[Location],
		   n.IconClass
	FROM   NavigationNode AS n 
	WHERE Id = @Id

END
GO

IF object_id('spUpdate_NavigationNodeDefinition') IS NOT NULL
    DROP PROCEDURE [dbo].[spUpdate_NavigationNodeDefinition]
GO

CREATE PROCEDURE spUpdate_NavigationNodeDefinition 
	@Id uniqueidentifier, 
	@Definition nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE NavigationNode
	SET [Definition] = @Definition
	WHERE Id = @Id

END
GO

IF object_id('spGet_DashboardQueryById') IS NOT NULL
    DROP PROCEDURE [dbo].[spGet_DashboardQueryById]
GO

CREATE PROCEDURE [dbo].[spGet_DashboardQueryById]
	@Id uniqueidentifier
AS
BEGIN
    SET NOCOUNT ON;
       
     SELECT d.Id, d.Title as Name, d.Query, IsNull(d.DataSourceId,1) as DataSourceId, IsNull(ds.Name,'ConfigMgrPortal') as DataSourceName,  ds.ConnectionString
    FROM DataSource d
	LEFT JOIN DataSourceConfiguration ds on d.DataSourceId = ds.Id
	WHERE d.Id = @Id
END
GO

IF object_id('spGet_DashboardQueryAll') IS NOT NULL
    DROP PROCEDURE [dbo].[spGet_DashboardQueryAll]
GO

CREATE PROCEDURE [dbo].[spGet_DashboardQueryAll]
AS
BEGIN
    SET NOCOUNT ON;
       
    SELECT d.Id, d.Title as Name, d.Query, IsNull(d.DataSourceId,1) as DataSourceId, IsNull(ds.Name,'ConfigMgrPortal') as DataSourceName, ds.ConnectionString
    FROM DataSource d
	LEFT JOIN DataSourceConfiguration ds on d.DataSourceId = ds.Id
END
GO

IF object_id('spGet_DataSourceConfigurationAll') IS NOT NULL
    DROP PROCEDURE [dbo].[spGet_DataSourceConfigurationAll]
GO

CREATE PROCEDURE [dbo].[spGet_DataSourceConfigurationAll]
	@includeSealed bit,
	@onlyEnabled bit
AS
BEGIN
    SET NOCOUNT ON;

	IF @includeSealed = 1
		(
			SELECT d.Id, d.Name, d.ProviderName, d.ConnectionString, d.Enabled, d.Sealed, d.CreatedBy, d.CreatedDate, d.LastModifiedBy, d.LastModifiedDate
			FROM DataSourceConfiguration d
			WHERE (@onlyEnabled=0 OR d.Enabled=@onlyEnabled)
		)
	ELSE
		(
			SELECT d.Id, d.Name, d.ProviderName, d.ConnectionString, d.Enabled, d.Sealed, d.CreatedBy, d.CreatedDate, d.LastModifiedBy, d.LastModifiedDate
			FROM DataSourceConfiguration d
			WHERE (@onlyEnabled=0 OR d.Enabled=@onlyEnabled) AND d.Sealed = 0
		)
END
GO

IF object_id('spGet_DataSourceConfiguration') IS NOT NULL
    DROP PROCEDURE [dbo].[spGet_DataSourceConfiguration]
GO

CREATE PROCEDURE [dbo].[spGet_DataSourceConfiguration]
	@dsName nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
       
    SELECT d.Id, d.Name, d.ProviderName, d.ConnectionString, d.Enabled, d.Sealed, d.CreatedBy, d.CreatedDate, d.LastModifiedBy, d.LastModifiedDate
    FROM DataSourceConfiguration d
    WHERE d.Name = @dsName
END
GO

IF object_id('spAdd_NavigationNode') IS NOT NULL
    DROP PROCEDURE [dbo].[spAdd_NavigationNode]
GO

CREATE PROCEDURE [dbo].[spAdd_NavigationNode] 
	 @ID uniqueidentifier,
	 @ParentId uniqueidentifier,
	 @DisplayName nvarchar(50),
	 @Definition varchar(MAX),
	 @Ordinal int,
	 @Sealed bit,
	 @IsPublic bit,
	 @CreatedBy int,
	 @IsVisible bit,
	 @DisplayString nvarchar(4000),
	 @Locale nvarchar(3),
	 @IconClass nvarchar(50),
	 @LicenseRequired nvarchar(50)
AS

INSERT INTO NavigationNode(Id, ParentId, DisplayName, [Definition], Ordinal, Sealed, IsPublic, CreatedBy, LastModifiedBy, IsVisible, IconClass, LicenseRequired)
	VALUES (@Id, @ParentId, @DisplayName, @Definition, @Ordinal, @Sealed, @IsPublic, @CreatedBy, @CreatedBy, @IsVisible, @IconClass,  @LicenseRequired);
GO


/*** Set timestamp ***/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatabaseHistory]') AND type in (N'U'))
BEGIN
  INSERT INTO [dbo].[DatabaseHistory] (Name,[Timestamp]) VALUES ('dbTables.sql',getdate())
END

/*** FINALIZE ***/
SET ANSI_PADDING OFF

