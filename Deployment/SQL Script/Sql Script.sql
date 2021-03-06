USE [EPIInfo7]
GO
/****** Object:  UserDefinedTableType [dbo].[DatasourceUserTableType]    Script Date: 10/17/2016 1:42:37 PM ******/
CREATE TYPE [dbo].[DatasourceUserTableType] AS TABLE(
	[DatasourceID] [int] NULL,
	[UserID] [int] NULL
)
GO
/****** Object:  Table [dbo].[Canvas]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canvas](
	[CanvasID] [int] IDENTITY(1,1) NOT NULL,
	[CanvasGUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Canvas_CanvasGUID]  DEFAULT (newid()),
	[CanvasName] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[CanvasDescription] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[DatasourceID] [int] NOT NULL,
	[CanvasContent] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Canvas] PRIMARY KEY CLUSTERED 
(
	[CanvasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commands]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands](
	[UniqueKey] [int] IDENTITY(1,1) NOT NULL,
	[RECSTATUS] [smallint] NOT NULL,
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[FirstSaveLogonName] [nvarchar](255) NULL,
	[FirstSaveTime] [datetime] NULL,
	[LastSaveLogonName] [nvarchar](255) NULL,
	[LastSaveTime] [datetime] NULL,
	[FKEY] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UniqueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands1]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands1](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[NumberA] [float] NULL,
	[NumberB] [float] NULL,
	[APlusB] [float] NULL,
	[AMinusB] [float] NULL,
	[ATimesB] [float] NULL,
	[ADividedByB] [float] NULL,
	[TextToAssign] [nvarchar](4000) NULL,
	[AssignText] [nvarchar](4000) NULL,
	[MultilinetoAssign] [ntext] NULL,
	[AssignMultiline] [ntext] NULL,
	[DatetoAssign] [datetime] NULL,
	[AssignedDate] [datetime] NULL,
	[TimetoAssign] [datetime] NULL,
	[AssignTime] [datetime] NULL,
	[CheckboxtoAssign] [bit] NULL,
	[AssignedCheckbox] [bit] NULL,
	[YesNoToAssign] [tinyint] NULL,
	[AssignYesNo] [tinyint] NULL,
	[OptiontoAssign] [smallint] NULL,
	[AssignOption] [smallint] NULL,
	[LegalToAssign] [nvarchar](255) NULL,
	[AssignLegal] [nvarchar](255) NULL,
	[AssignSourceCommentLegal] [nvarchar](255) NULL,
	[AssignTargetCommentLegal] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands10]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands10](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[StrLenToCheck] [nvarchar](4000) NULL,
	[LengthofString] [float] NULL,
	[UpperCase] [nvarchar](4000) NULL,
	[TodaysDate] [datetime] NULL,
	[ChkSysDate] [bit] NULL,
	[CurrentTime] [datetime] NULL,
	[ChkSysTime] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands2]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands2](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[Text1] [nvarchar](4000) NULL,
	[Text2] [nvarchar](4000) NULL,
	[DialogSimpleBefore] [nvarchar](4000) NULL,
	[DialogSimpleAfter] [nvarchar](4000) NULL,
	[DisableSourceText] [nvarchar](4000) NULL,
	[DisableTargetText] [nvarchar](4000) NULL,
	[DisableSourceMulti] [ntext] NULL,
	[DisableTargetMulti] [ntext] NULL,
	[DisableSourceNumber] [float] NULL,
	[DisableTargetNumber] [float] NULL,
	[DisableSourceDate] [datetime] NULL,
	[DisableTargetDate] [datetime] NULL,
	[DisableSourceTime] [datetime] NULL,
	[DisableTargetTime] [datetime] NULL,
	[DisableSourceCheck] [bit] NULL,
	[DisableTargetCheck] [bit] NULL,
	[DisableSourceYesNo] [tinyint] NULL,
	[DisableTargetYesNo] [tinyint] NULL,
	[DisableSourceLegal] [nvarchar](255) NULL,
	[DisableTargetLegal] [nvarchar](255) NULL,
	[DisableSourceCommentLegal] [nvarchar](255) NULL,
	[DisableTargetCommentLegal] [nvarchar](255) NULL,
	[DisableSourceOption] [smallint] NULL,
	[DisableTargetOption] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands3]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands3](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[gtInitialField] [nvarchar](4000) NULL,
	[GoToSourceText] [nvarchar](4000) NULL,
	[GoToTargetText] [nvarchar](4000) NULL,
	[GoToSourceMulti] [ntext] NULL,
	[GoToTargetMulti] [ntext] NULL,
	[GoToSourceNumber] [float] NULL,
	[GoToTargetNumber] [float] NULL,
	[GoToSourceDate] [datetime] NULL,
	[GoToTargetDate] [datetime] NULL,
	[GoToSourceTime] [datetime] NULL,
	[GoToTargetTime] [datetime] NULL,
	[GoToSourceCheck] [bit] NULL,
	[GoToTargetCheck] [bit] NULL,
	[GoToSourceYesNo] [tinyint] NULL,
	[GoToTargetYesNo] [tinyint] NULL,
	[GoToSourceLegal] [nvarchar](255) NULL,
	[GoToTargetLegal] [nvarchar](255) NULL,
	[GoToSourceCommentLegal] [nvarchar](255) NULL,
	[GoTotCommentLegal] [nvarchar](255) NULL,
	[GoToSourceOption] [smallint] NULL,
	[GoToTargetOption] [smallint] NULL,
	[gtTargetCheck1] [bit] NULL,
	[gtTargetText1] [nvarchar](4000) NULL,
	[gtTargetNumber1] [float] NULL,
	[gtTargetOption1] [smallint] NULL,
	[gtTargetDate1] [datetime] NULL,
	[gtTargetTime1] [datetime] NULL,
	[gtTargetYesNo1] [tinyint] NULL,
	[gtTargetLegal1] [nvarchar](255) NULL,
	[gtTargetCommentLegal1] [nvarchar](255) NULL,
	[gtTargetMulti1] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands4]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands4](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[HideSourceText] [nvarchar](4000) NULL,
	[HideTargetText] [nvarchar](4000) NULL,
	[HideSourceMulti] [ntext] NULL,
	[HideTargetMulti] [ntext] NULL,
	[HideSourceNumber] [float] NULL,
	[HideTargetNumber] [float] NULL,
	[HideSourceDate] [datetime] NULL,
	[HideTargetDate] [datetime] NULL,
	[HideSourceTime] [datetime] NULL,
	[HideTargetTime] [datetime] NULL,
	[HideSourceCheck] [bit] NULL,
	[HideTargetCheck] [bit] NULL,
	[HideSourceYesNo] [tinyint] NULL,
	[HideTargetYesNo] [tinyint] NULL,
	[HideSourceLegal] [nvarchar](255) NULL,
	[HideTargetLegal] [nvarchar](255) NULL,
	[HideSourceCommentLegal] [nvarchar](255) NULL,
	[HideTargetCommentLegal] [nvarchar](255) NULL,
	[HideSourceOption] [smallint] NULL,
	[HideTargetOption] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands5]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands5](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[HighlightSourceText] [nvarchar](4000) NULL,
	[HighlightTargetText] [nvarchar](4000) NULL,
	[HighlightSourceMulti] [ntext] NULL,
	[HighlightTargetMulti] [ntext] NULL,
	[HighlightSourceNumber] [float] NULL,
	[HighlightTargetNumber] [float] NULL,
	[HighlightSourceDate] [datetime] NULL,
	[HighlightTargetDate] [datetime] NULL,
	[HighlightSourceTime] [datetime] NULL,
	[HighlightTargetTime] [datetime] NULL,
	[HighlightSourceCheck] [bit] NULL,
	[HighlightTargetCheck] [bit] NULL,
	[HighlightSourceYesNo] [tinyint] NULL,
	[HighlightTargetYesNo] [tinyint] NULL,
	[HighlightSourceLegal] [nvarchar](255) NULL,
	[HighlightTargetLegal] [nvarchar](255) NULL,
	[HighlightSourceCommentLegal] [nvarchar](255) NULL,
	[HighlightTargetCommentLegal] [nvarchar](255) NULL,
	[HighlightSourceOption] [smallint] NULL,
	[HighlightTargetOption] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands6]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands6](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[SetRequiredSourceText] [nvarchar](4000) NULL,
	[SetRequiredTargetText] [nvarchar](4000) NULL,
	[SetRequiredSourceMulti] [ntext] NULL,
	[SetRequiredTargetMulti] [ntext] NULL,
	[SetRequiredSourceNumber] [float] NULL,
	[SetRequiredTargetNumber] [float] NULL,
	[SetRequiredSourceDate] [datetime] NULL,
	[SetRequiredTargetDate] [datetime] NULL,
	[SetRequiredSourceTime] [datetime] NULL,
	[SetRequiredTargetTime] [datetime] NULL,
	[SetRequiredSourceCheck] [bit] NULL,
	[SetRequiredTargetCheck] [bit] NULL,
	[SetRequiredSourceYesNo] [tinyint] NULL,
	[SetRequiredTargetYesNo] [tinyint] NULL,
	[SetRequiredSourceLegal] [nvarchar](255) NULL,
	[SetRequiredTargetLegal] [nvarchar](255) NULL,
	[SetRequiredSourceCommentLegal] [nvarchar](255) NULL,
	[SetRequiredTargetCommentLegal] [nvarchar](255) NULL,
	[SetRequiredSourceOption] [smallint] NULL,
	[SetRequiredTargetOption] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands7]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands7](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[GroupSourceTextDisable] [nvarchar](4000) NULL,
	[GroupTargetTextField] [nvarchar](4000) NULL,
	[GroupSourceMultiEnable] [ntext] NULL,
	[GroupTargetMultiMulti] [ntext] NULL,
	[GroupSourceNumberHiLite] [float] NULL,
	[GroupSourceDateUnHiLite] [datetime] NULL,
	[GroupTargetNumberField] [float] NULL,
	[GroupTargetDateField] [datetime] NULL,
	[GroupSourceTimeHide] [datetime] NULL,
	[GroupTargetTimeField] [datetime] NULL,
	[GroupSourceCheckUnhide] [bit] NULL,
	[GroupSourceCommentLegalClear] [nvarchar](255) NULL,
	[GroupTargetCheckField] [bit] NULL,
	[GroupTargetYesNoField] [tinyint] NULL,
	[GroupTargetLegalField] [nvarchar](255) NULL,
	[GroupSourceYesNoSetRequired] [tinyint] NULL,
	[GroupTargetCommentLegalField] [nvarchar](255) NULL,
	[GroupSourceLegalNotRequired] [nvarchar](255) NULL,
	[GroupTargetOptionField1] [smallint] NULL,
	[GroupSourceOption] [smallint] NULL,
	[GroupTargetOptionField2] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands8]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands8](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[Number1] [float] NULL,
	[ABSofNumber1] [float] NULL,
	[SinNumber2] [float] NULL,
	[Number2] [float] NULL,
	[CosNumber2] [float] NULL,
	[TanNumber2] [float] NULL,
	[SinBNumber1314180] [float] NULL,
	[Date1] [datetime] NULL,
	[Date2] [datetime] NULL,
	[YearDate1] [float] NULL,
	[YearsDate1Date2] [float] NULL,
	[MonthDate1] [float] NULL,
	[MonthsDate1Date2] [float] NULL,
	[DayDate1] [float] NULL,
	[DaysDate1Date2] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Commands9]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commands9](
	[GlobalRecordId] [nvarchar](255) NOT NULL,
	[LandingField] [nvarchar](4000) NULL,
	[Number3] [float] NULL,
	[LNNumber3] [float] NULL,
	[LOGNumber3] [float] NULL,
	[Time1] [datetime] NULL,
	[Time2] [datetime] NULL,
	[HourTime1] [float] NULL,
	[HoursTime1Time2] [float] NULL,
	[MinuteTime1] [float] NULL,
	[MinutesTime1Time2] [float] NULL,
	[SecondTime1] [float] NULL,
	[SecondsTime1Time2] [float] NULL,
	[NumberToRound] [float] NULL,
	[RoundedNumber] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[GlobalRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DataAccessRules]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataAccessRules](
	[RuleId] [int] NOT NULL,
	[RuleName] [varchar](150) NULL,
	[RuleDescription] [varchar](max) NULL,
 CONSTRAINT [PK_DataAccessRules] PRIMARY KEY CLUSTERED 
(
	[RuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Datasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Datasource](
	[DatasourceID] [int] IDENTITY(1,1) NOT NULL,
	[DatasourceName] [nvarchar](300) NULL,
	[OrganizationID] [int] NOT NULL,
	[DatasourceServerName] [varchar](300) NULL,
	[DatabaseType] [varchar](50) NOT NULL,
	[InitialCatalog] [varchar](300) NULL,
	[PersistSecurityInfo] [varchar](50) NULL,
	[EIWSDatasource] [bit] NOT NULL,
	[EIWSSurveyId] [uniqueidentifier] NULL,
	[DatabaseUserID] [varchar](200) NULL,
	[Password] [varchar](200) NULL,
	[DatabaseObject] [varchar](max) NOT NULL,
	[SQLQuery] [bit] NULL,
	[SQLText] [varchar](max) NULL,
	[active] [bit] NOT NULL,
	[portnumber] [varchar](50) NULL,
 CONSTRAINT [PK_Datasource1] PRIMARY KEY CLUSTERED 
(
	[DatasourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatasourceUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatasourceUser](
	[DatasourceID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_DatasourceUser] PRIMARY KEY CLUSTERED 
(
	[DatasourceID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EIDatasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EIDatasource](
	[DatasourceID] [int] IDENTITY(1,1) NOT NULL,
	[DatasourceServerName] [varchar](300) NULL,
	[DatabaseType] [varchar](50) NOT NULL,
	[InitialCatalog] [varchar](300) NULL,
	[PersistSecurityInfo] [varchar](50) NULL,
	[SurveyId] [uniqueidentifier] NULL,
	[DatabaseUserID] [varchar](200) NULL,
	[Password] [varchar](200) NULL,
 CONSTRAINT [PK_Datasource] PRIMARY KEY CLUSTERED 
(
	[DatasourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorDate] [datetime] NOT NULL,
	[SurveyId] [uniqueidentifier] NULL,
	[ResponseId] [uniqueidentifier] NULL,
	[Comment] [nvarchar](50) NULL,
	[ERROR_NUMBER] [int] NULL,
	[ERROR_MESSAGE] [nvarchar](4000) NULL,
	[ERROR_SEVERITY] [int] NULL,
	[ERROR_STATE] [int] NULL,
	[ERROR_PROCEDURE] [nvarchar](1128) NULL,
	[ERROR_LINE] [int] NULL,
	[ErrorText] [nvarchar](max) NULL,
	[ErrorText2] [nvarchar](max) NULL,
	[XML] [xml] NULL
)

GO
/****** Object:  Table [dbo].[familyset]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[familyset](
	[SurveyId] [uniqueidentifier] NOT NULL,
	[OwnerId] [int] NOT NULL,
	[SurveyNumber] [nvarchar](50) NULL,
	[SurveyTypeId] [int] NOT NULL,
	[ClosingDate] [datetime2](7) NOT NULL,
	[SurveyName] [nvarchar](500) NOT NULL,
	[OrganizationName] [nvarchar](500) NULL,
	[DepartmentName] [nvarchar](500) NULL,
	[IntroductionText] [nvarchar](max) NULL,
	[TemplateXML] [xml] NOT NULL,
	[ExitText] [nvarchar](max) NULL,
	[UserPublishKey] [uniqueidentifier] NOT NULL,
	[TemplateXMLSize] [bigint] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[IsDraftMode] [bit] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[ViewId] [int] NULL,
	[IsSQLProject] [bit] NULL
)

GO
/****** Object:  Table [dbo].[lk_RecordSource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lk_RecordSource](
	[RecordSourceId] [int] NOT NULL,
	[RecordSource] [nvarchar](50) NOT NULL,
	[RecordSourceDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_lk_RecordSource] PRIMARY KEY CLUSTERED 
(
	[RecordSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[lk_Status]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lk_Status](
	[StatusId] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_lk_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[lk_SurveyType]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lk_SurveyType](
	[SurveyTypeId] [int] NOT NULL,
	[SurveyType] [varchar](50) NULL,
 CONSTRAINT [PK_lk_SurveyType] PRIMARY KEY CLUSTERED 
(
	[SurveyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[metaBackgrounds]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaBackgrounds](
	[BackgroundId] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NULL,
	[ImageLayout] [nvarchar](10) NULL,
	[Color] [int] NULL,
 CONSTRAINT [PK_BackgroundId_metaBackgrounds] PRIMARY KEY CLUSTERED 
(
	[BackgroundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaDataTypes]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaDataTypes](
	[DataTypeId] [int] NOT NULL,
	[HasPattern] [bit] NOT NULL,
	[HasSize] [bit] NOT NULL,
	[HasRange] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DataTypeId_metaDataTypes] PRIMARY KEY CLUSTERED 
(
	[DataTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaDbInfo]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaDbInfo](
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ProjectLocation] [nvarchar](255) NOT NULL,
	[ProjectName] [nvarchar](64) NOT NULL,
	[EpiVersion] [nvarchar](20) NOT NULL,
	[Purpose] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[metaFields]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaFields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NULL,
	[Name] [nvarchar](64) NOT NULL,
	[PromptText] [ntext] NULL,
	[ControlFontFamily] [nvarchar](127) NULL,
	[ControlFontStyle] [nvarchar](50) NULL,
	[ControlFontSize] [decimal](2, 0) NULL,
	[ControlTopPositionPercentage] [float] NULL,
	[ControlLeftPositionPercentage] [float] NULL,
	[ControlHeightPercentage] [float] NULL,
	[ControlWidthPercentage] [float] NULL,
	[TabIndex] [decimal](18, 0) NULL,
	[HasTabStop] [bit] NULL,
	[PromptFontFamily] [nvarchar](127) NULL,
	[PromptFontStyle] [nvarchar](50) NULL,
	[PromptFontSize] [decimal](2, 0) NULL,
	[PromptScriptName] [nvarchar](20) NULL,
	[PromptTopPositionPercentage] [float] NULL,
	[PromptLeftPositionPercentage] [float] NULL,
	[ControlScriptName] [nvarchar](20) NULL,
	[ShouldRepeatLast] [bit] NULL,
	[IsRequired] [bit] NULL,
	[IsReadOnly] [bit] NULL,
	[ShouldRetainImageSize] [bit] NULL,
	[MaxLength] [smallint] NULL,
	[Lower] [nvarchar](20) NULL,
	[Upper] [nvarchar](20) NULL,
	[Pattern] [nvarchar](50) NULL,
	[ShowTextOnRight] [bit] NULL,
	[CheckCodeBefore] [ntext] NULL,
	[CheckCodeAfter] [ntext] NULL,
	[RelateCondition] [ntext] NULL,
	[ShouldReturnToParent] [bit] NULL,
	[SourceTableName] [nvarchar](255) NULL,
	[CodeColumnName] [nvarchar](255) NULL,
	[TextColumnName] [nvarchar](255) NULL,
	[Sort] [bit] NULL,
	[IsExclusiveTable] [bit] NULL,
	[DataTableName] [nvarchar](64) NULL,
	[SourceFieldId] [int] NULL,
	[FieldTypeId] [int] NOT NULL,
	[RelatedViewId] [int] NULL,
	[List] [ntext] NULL,
	[BackgroundColor] [int] NULL,
	[ViewId] [int] NOT NULL,
	[PageId] [int] NULL,
 CONSTRAINT [PK_FieldId_metaFields] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaFieldTypes]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaFieldTypes](
	[FieldTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HasFont] [bit] NOT NULL,
	[HasRepeatLast] [bit] NOT NULL,
	[HasRequired] [bit] NOT NULL,
	[HasReadOnly] [bit] NOT NULL,
	[HasRetainImageSize] [bit] NOT NULL,
	[IsDropDown] [bit] NOT NULL,
	[IsGridColumn] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[DefaultPatternId] [int] NOT NULL,
	[DataTypeId] [int] NOT NULL,
 CONSTRAINT [PK_FieldTypeId_metaFieldTypes] PRIMARY KEY CLUSTERED 
(
	[FieldTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaGridColumns]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaGridColumns](
	[GridColumnId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Size] [smallint] NULL,
	[Position] [smallint] NOT NULL,
	[Text] [nvarchar](64) NOT NULL,
	[ShouldRepeatLast] [bit] NOT NULL,
	[IsRequired] [bit] NULL,
	[IsReadOnly] [bit] NULL,
	[Pattern] [nvarchar](64) NULL,
	[Upper] [nvarchar](20) NULL,
	[Lower] [nvarchar](20) NULL,
	[Width] [int] NOT NULL,
	[SourceTableName] [nvarchar](50) NULL,
	[CodeColumnName] [nvarchar](50) NULL,
	[TextColumnName] [nvarchar](50) NULL,
	[Sort] [bit] NULL,
	[IsExclusiveTable] [bit] NULL,
	[DataTableName] [nvarchar](64) NULL,
	[FieldId] [int] NOT NULL,
	[FieldTypeId] [int] NOT NULL,
	[IsUniqueField] [bit] NULL,
 CONSTRAINT [PK_GridColumnId_metaGridColumns] PRIMARY KEY CLUSTERED 
(
	[GridColumnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaImages]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [image] NULL,
	[ImageUniqueValue] [int] NULL,
 CONSTRAINT [PK_ImageId_metaImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaLayerRenderTypes]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaLayerRenderTypes](
	[LayerRenderTypeId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LayerRenderTypeId_metaLayerRenderTypes] PRIMARY KEY CLUSTERED 
(
	[LayerRenderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaLayers]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaLayers](
	[LayerId] [int] IDENTITY(1,1) NOT NULL,
	[Gml] [ntext] NULL,
	[GmlSchema] [ntext] NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[FileName] [nvarchar](1) NULL,
 CONSTRAINT [PK_LayerId_metaLayers] PRIMARY KEY CLUSTERED 
(
	[LayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaLinks]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaLinks](
	[LinkId] [int] IDENTITY(1,1) NOT NULL,
	[FromRecordGuid] [nvarchar](255) NOT NULL,
	[ToRecordGuid] [nvarchar](255) NOT NULL,
	[FromViewId] [int] NOT NULL,
	[ToViewId] [int] NOT NULL,
 CONSTRAINT [PK_LinkId_metaLinks] PRIMARY KEY CLUSTERED 
(
	[LinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaMapLayers]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaMapLayers](
	[MapLayerId] [int] IDENTITY(1,1) NOT NULL,
	[RenderField] [nvarchar](64) NULL,
	[MarkerColor] [int] NULL,
	[RampBeginColor] [int] NULL,
	[RampEndColor] [int] NULL,
	[ClassBreaks] [int] NULL,
	[DataTableName] [nvarchar](64) NULL,
	[DataTableKey] [nvarchar](64) NULL,
	[FeatureKey] [nvarchar](64) NULL,
	[LineColor] [int] NULL,
	[FillColor] [int] NULL,
	[PolygonOutlineColor] [int] NULL,
	[MapId] [int] NOT NULL,
	[LayerId] [int] NOT NULL,
	[LayerRenderTypeId] [int] NOT NULL,
 CONSTRAINT [PK_MapLayerId_metaMapLayers] PRIMARY KEY CLUSTERED 
(
	[MapLayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaMapPoints]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaMapPoints](
	[MapPointId] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceTableName] [nvarchar](64) NOT NULL,
	[DataSourceXCoordinateColumnName] [nvarchar](64) NOT NULL,
	[DataSourceYCoordinateColumnName] [nvarchar](64) NOT NULL,
	[DataSourceLabelColumnName] [nvarchar](64) NULL,
	[Size] [int] NOT NULL,
	[Color] [int] NOT NULL,
	[MapId] [int] NOT NULL,
 CONSTRAINT [PK_MapPointId_metaMapPoints] PRIMARY KEY CLUSTERED 
(
	[MapPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaMaps]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaMaps](
	[MapId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Title] [nvarchar](255) NULL,
 CONSTRAINT [PK_MapId_metaMaps] PRIMARY KEY CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaPages]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaPages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Position] [smallint] NOT NULL,
	[CheckCodeBefore] [ntext] NULL,
	[CheckCodeAfter] [ntext] NULL,
	[BackgroundId] [int] NOT NULL,
	[ViewId] [int] NOT NULL,
 CONSTRAINT [PK_PageId_metaPages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaPatterns]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaPatterns](
	[PatternId] [int] NOT NULL,
	[Expression] [nvarchar](30) NOT NULL,
	[Mask] [nvarchar](30) NOT NULL,
	[FormattedExpression] [nvarchar](30) NOT NULL,
	[DataTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PatternId_metaPatterns] PRIMARY KEY CLUSTERED 
(
	[PatternId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaPrograms]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaPrograms](
	[ProgramId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Content] [ntext] NOT NULL,
	[Comment] [ntext] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Author] [nvarchar](64) NULL,
 CONSTRAINT [PK_ProgramId_metaPrograms] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[metaViews]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metaViews](
	[ViewId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsRelatedView] [bit] NOT NULL,
	[CheckCode] [ntext] NULL,
	[CheckCodeBefore] [ntext] NULL,
	[CheckCodeAfter] [ntext] NULL,
	[RecordCheckCodeBefore] [ntext] NULL,
	[RecordCheckCodeAfter] [ntext] NULL,
	[CheckCodeVariableDefinitions] [ntext] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Orientation] [nvarchar](16) NOT NULL,
	[LabelAlign] [nvarchar](16) NOT NULL,
	[EIWSOrganizationKey] [nvarchar](64) NULL,
	[EIWSFormId] [nvarchar](64) NULL,
	[EWEOrganizationKey] [nvarchar](64) NULL,
	[EWEFormId] [nvarchar](64) NULL,
 CONSTRAINT [PK_ViewId_metaViews] PRIMARY KEY CLUSTERED 
(
	[ViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationKey] [nvarchar](500) NOT NULL,
	[Organization] [nvarchar](400) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsHostOrganization] [bit] NOT NULL CONSTRAINT [DF_Organization_IsHostOrganization]  DEFAULT ((0)),
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
UNIQUE NONCLUSTERED 
(
	[Organization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ResponseDisplaySettings]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResponseDisplaySettings](
	[FormId] [uniqueidentifier] NOT NULL,
	[ColumnName] [varchar](200) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ResponseGridcolumns] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC,
	[ColumnName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResponseXml]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseXml](
	[ResponseId] [uniqueidentifier] NOT NULL,
	[Xml] [xml] NOT NULL,
	[UserId] [int] NULL,
	[IsNewRecord] [bit] NULL,
 CONSTRAINT [PK_ResponseXml] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleValue] [int] NOT NULL,
	[RoleDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SecurityLevel] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [IX_SecurityLevel] UNIQUE NONCLUSTERED 
(
	[RoleValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SharedCanvases]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SharedCanvases](
	[CanvasID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CanvasGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CanvasUser] PRIMARY KEY CLUSTERED 
(
	[CanvasID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyMetaData]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyMetaData](
	[SurveyId] [uniqueidentifier] NOT NULL,
	[OwnerId] [int] NOT NULL,
	[SurveyNumber] [nvarchar](50) NULL,
	[SurveyTypeId] [int] NOT NULL,
	[ClosingDate] [datetime2](7) NOT NULL,
	[SurveyName] [nvarchar](500) NOT NULL,
	[OrganizationName] [nvarchar](500) NULL,
	[DepartmentName] [nvarchar](500) NULL,
	[IntroductionText] [nvarchar](max) NULL,
	[TemplateXML] [xml] NOT NULL,
	[ExitText] [nvarchar](max) NULL,
	[UserPublishKey] [uniqueidentifier] NOT NULL,
	[TemplateXMLSize] [bigint] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL CONSTRAINT [DF_SurveyMetaData_DateCreated]  DEFAULT (getdate()),
	[OrganizationId] [int] NOT NULL,
	[IsDraftMode] [bit] NOT NULL CONSTRAINT [DF_SurveyMetaData_IsDraftMode]  DEFAULT ((0)),
	[StartDate] [datetime2](7) NOT NULL CONSTRAINT [DF_SurveyMetaData_StartDate]  DEFAULT (getdate()),
	[ParentId] [uniqueidentifier] NULL,
	[ViewId] [int] NULL,
	[IsSQLProject] [bit] NULL CONSTRAINT [DF_SurveyMetaData_IsSQLProject]  DEFAULT ((0)),
	[IsShareable] [bit] NULL,
	[ShowAllRecords] [bit] NULL CONSTRAINT [DF_SurveyMetaData_ShowAllRecords]  DEFAULT ((0)),
	[DataAccessRuleId] [int] NULL CONSTRAINT [DF_SurveyMetaData_DataAccessRuleId]  DEFAULT ((1)),
 CONSTRAINT [PK_SurveyMetaData] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyMetadataOrganization]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyMetadataOrganization](
	[SurveyId] [uniqueidentifier] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_SurveyMetadataOrganization] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC,
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyMetaDataTransform]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyMetaDataTransform](
	[SurveyId] [uniqueidentifier] NOT NULL,
	[TableName] [nvarchar](500) NOT NULL,
	[BaseTableName] [nvarchar](500) NULL,
	[PageId] [int] NULL,
	[FieldName] [nvarchar](500) NOT NULL,
	[FieldTypeId] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[SurveyMetaDataUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyMetaDataUser](
	[UserId] [int] NOT NULL,
	[FormId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SurveyMetaDataUser_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyMetaDataView]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SurveyMetaDataView](
	[SurveyId] [uniqueidentifier] NOT NULL,
	[ViewTableName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SurveyMetaDataView] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SurveyResponse]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponse](
	[ResponseId] [uniqueidentifier] NOT NULL,
	[SurveyId] [uniqueidentifier] NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[DateCompleted] [datetime2](7) NULL,
	[StatusId] [int] NOT NULL,
	[ResponseXML] [xml] NOT NULL,
	[ResponsePasscode] [nvarchar](30) NULL,
	[ResponseXMLSize] [bigint] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[IsDraftMode] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[ParentRecordId] [uniqueidentifier] NULL,
	[RelateParentId] [uniqueidentifier] NULL,
	[RecordSourceId] [int] NULL,
	[OrganizationId] [int] NULL,
 CONSTRAINT [PK_SurveyResponse] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyResponseTracking]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponseTracking](
	[ResponseId] [uniqueidentifier] NOT NULL,
	[IsSQLResponse] [bit] NOT NULL,
	[IsResponseinsertedToEpi7] [bit] NOT NULL,
 CONSTRAINT [PK_SurveyResponseTracking] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[SurveyResponseUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponseUser](
	[UserId] [int] NOT NULL,
	[ResponseId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SurveyResponseUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](max) NOT NULL,
	[ResetPassword] [bit] NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[UGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserOrganization]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOrganization](
	[UserID] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_UserOrganization] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  View [dbo].[ErrorLogSorted]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ErrorLogSorted]
AS
SELECT     TOP (100) PERCENT ErrorDate, SurveyId, ResponseId, Comment, ErrorText, ErrorText2
FROM         dbo.ErrorLog
ORDER BY ErrorDate DESC



GO
/****** Object:  View [dbo].[vwCanvasShare]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCanvasShare]
AS
SELECT        dbo.[User].UserName, dbo.Datasource.DatasourceName, dbo.Canvas.CanvasID, dbo.Canvas.CanvasName, dbo.Canvas.CanvasDescription, 
                         dbo.Canvas.CreatedDate, dbo.Canvas.ModifiedDate, dbo.Canvas.CanvasContent, dbo.[User].UserID, dbo.[User].FirstName, dbo.[User].LastName, 
                         dbo.Datasource.DatasourceID, dbo.Datasource.OrganizationID, dbo.Canvas.CanvasGUID
FROM            dbo.Canvas INNER JOIN
                         dbo.SharedCanvases ON dbo.Canvas.CanvasID = dbo.SharedCanvases.CanvasID INNER JOIN
                         dbo.[User] ON dbo.SharedCanvases.UserID = dbo.[User].UserID INNER JOIN
                         dbo.Datasource ON dbo.Canvas.DatasourceID = dbo.Datasource.DatasourceID



GO
/****** Object:  View [dbo].[vwCanvasUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCanvasUser]
AS
SELECT        dbo.[User].UserName, dbo.Datasource.DatasourceName, dbo.Canvas.CanvasID, dbo.Canvas.CanvasName, dbo.Canvas.CanvasDescription, 
                         dbo.Canvas.CreatedDate, dbo.Canvas.ModifiedDate, dbo.Canvas.CanvasContent, dbo.[User].UserID, dbo.[User].FirstName, dbo.[User].LastName, 
                         dbo.Datasource.DatasourceID, dbo.Datasource.OrganizationID, dbo.Canvas.CanvasGUID
FROM            dbo.Canvas INNER JOIN
                         dbo.[User] ON dbo.Canvas.UserID = dbo.[User].UserID INNER JOIN
                         dbo.DatasourceUser ON dbo.[User].UserID = dbo.DatasourceUser.UserID INNER JOIN
                         dbo.Datasource ON dbo.Canvas.DatasourceID = dbo.Datasource.DatasourceID AND dbo.DatasourceUser.DatasourceID = dbo.Datasource.DatasourceID



GO
/****** Object:  View [dbo].[vwOrgsForUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOrgsForUser]
AS
SELECT     dbo.UserOrganization.UserID, dbo.Organization.OrganizationID, dbo.Organization.Organization, dbo.UserOrganization.RoleID, 
                      dbo.UserOrganization.Active, dbo.Organization.IsEnabled AS IsOrgActive
FROM         dbo.Organization INNER JOIN
                      dbo.UserOrganization ON dbo.Organization.OrganizationID = dbo.UserOrganization.OrganizationID



GO
/****** Object:  View [dbo].[vwUserDatasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwUserDatasource]
AS
SELECT     dbo.[User].UserID, dbo.[User].UserName, dbo.[User].PasswordHash, dbo.Datasource.DatasourceID, dbo.Datasource.DatasourceName, 
                      dbo.Datasource.DatasourceServerName, dbo.Datasource.DatabaseType, dbo.Datasource.InitialCatalog, dbo.Datasource.PersistSecurityInfo, 
                      dbo.Datasource.Password, dbo.Datasource.DatabaseObject, dbo.Datasource.SQLQuery, dbo.Datasource.SQLText, dbo.Datasource.active AS IsDatasourceActive, 
                      dbo.Datasource.DatabaseUserID, dbo.[User].FirstName, dbo.[User].LastName, dbo.[User].EmailAddress, dbo.[User].PhoneNumber, dbo.[User].ResetPassword, 
                      dbo.Datasource.OrganizationID, dbo.Datasource.portnumber, dbo.Datasource.EIWSDatasource, dbo.Datasource.EIWSSurveyId
FROM         dbo.DatasourceUser INNER JOIN
                      dbo.Datasource ON dbo.DatasourceUser.DatasourceID = dbo.Datasource.DatasourceID INNER JOIN
                      dbo.[User] ON dbo.DatasourceUser.UserID = dbo.[User].UserID



GO
/****** Object:  View [dbo].[vwUserOrganizationUser]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwUserOrganizationUser]
AS
SELECT     TOP (100) PERCENT dbo.[User].UserID, dbo.UserOrganization.RoleID, dbo.[User].EmailAddress, dbo.[User].PhoneNumber, dbo.[User].UserName, 
                      dbo.[User].FirstName, dbo.[User].LastName, dbo.[User].PasswordHash, dbo.[User].ResetPassword, dbo.UserOrganization.OrganizationID, dbo.Role.RoleValue, 
                      dbo.Role.RoleDescription, dbo.UserOrganization.Active, dbo.Organization.IsEnabled AS IsOrgActive
FROM         dbo.UserOrganization INNER JOIN
                      dbo.[User] ON dbo.UserOrganization.UserID = dbo.[User].UserID INNER JOIN
                      dbo.Role ON dbo.UserOrganization.RoleID = dbo.Role.RoleID INNER JOIN
                      dbo.Organization ON dbo.UserOrganization.OrganizationID = dbo.Organization.OrganizationID
ORDER BY dbo.[User].UserID



GO
ALTER TABLE [dbo].[Commands] ADD  DEFAULT ((1)) FOR [RECSTATUS]
GO
ALTER TABLE [dbo].[Canvas]  WITH NOCHECK ADD  CONSTRAINT [FK_Canvas _Datasource] FOREIGN KEY([DatasourceID])
REFERENCES [dbo].[Datasource] ([DatasourceID])
GO
ALTER TABLE [dbo].[Canvas] CHECK CONSTRAINT [FK_Canvas _Datasource]
GO
ALTER TABLE [dbo].[Canvas]  WITH NOCHECK ADD  CONSTRAINT [FK_Canvas_CreatorUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Canvas] CHECK CONSTRAINT [FK_Canvas_CreatorUser]
GO
ALTER TABLE [dbo].[Datasource]  WITH NOCHECK ADD  CONSTRAINT [FK_Datasource_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[Datasource] CHECK CONSTRAINT [FK_Datasource_Organization]
GO
ALTER TABLE [dbo].[DatasourceUser]  WITH NOCHECK ADD  CONSTRAINT [FK_DatasourceUser_Datasource] FOREIGN KEY([DatasourceID])
REFERENCES [dbo].[Datasource] ([DatasourceID])
GO
ALTER TABLE [dbo].[DatasourceUser] CHECK CONSTRAINT [FK_DatasourceUser_Datasource]
GO
ALTER TABLE [dbo].[DatasourceUser]  WITH NOCHECK ADD  CONSTRAINT [FK_DatasourceUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DatasourceUser] CHECK CONSTRAINT [FK_DatasourceUser_User]
GO
ALTER TABLE [dbo].[EIDatasource]  WITH NOCHECK ADD  CONSTRAINT [FK_Datasource_SurveyMetaData] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[SurveyMetaData] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EIDatasource] CHECK CONSTRAINT [FK_Datasource_SurveyMetaData]
GO
ALTER TABLE [dbo].[metaFields]  WITH CHECK ADD FOREIGN KEY([FieldTypeId])
REFERENCES [dbo].[metaFieldTypes] ([FieldTypeId])
GO
ALTER TABLE [dbo].[metaFields]  WITH CHECK ADD FOREIGN KEY([PageId])
REFERENCES [dbo].[metaPages] ([PageId])
GO
ALTER TABLE [dbo].[metaFields]  WITH CHECK ADD FOREIGN KEY([RelatedViewId])
REFERENCES [dbo].[metaViews] ([ViewId])
GO
ALTER TABLE [dbo].[metaFields]  WITH CHECK ADD FOREIGN KEY([ViewId])
REFERENCES [dbo].[metaViews] ([ViewId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[metaFieldTypes]  WITH CHECK ADD FOREIGN KEY([DataTypeId])
REFERENCES [dbo].[metaDataTypes] ([DataTypeId])
GO
ALTER TABLE [dbo].[metaMapLayers]  WITH CHECK ADD FOREIGN KEY([LayerId])
REFERENCES [dbo].[metaLayers] ([LayerId])
GO
ALTER TABLE [dbo].[metaMapLayers]  WITH CHECK ADD FOREIGN KEY([LayerRenderTypeId])
REFERENCES [dbo].[metaLayerRenderTypes] ([LayerRenderTypeId])
GO
ALTER TABLE [dbo].[metaMapLayers]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[metaMaps] ([MapId])
GO
ALTER TABLE [dbo].[metaMapPoints]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[metaMaps] ([MapId])
GO
ALTER TABLE [dbo].[metaPages]  WITH CHECK ADD FOREIGN KEY([ViewId])
REFERENCES [dbo].[metaViews] ([ViewId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[metaPatterns]  WITH CHECK ADD FOREIGN KEY([DataTypeId])
REFERENCES [dbo].[metaDataTypes] ([DataTypeId])
GO
ALTER TABLE [dbo].[ResponseDisplaySettings]  WITH NOCHECK ADD  CONSTRAINT [FK_ResponseGridcolumns_SurveyMetaData] FOREIGN KEY([FormId])
REFERENCES [dbo].[SurveyMetaData] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResponseDisplaySettings] CHECK CONSTRAINT [FK_ResponseGridcolumns_SurveyMetaData]
GO
ALTER TABLE [dbo].[SharedCanvases]  WITH CHECK ADD  CONSTRAINT [FK_CanvasUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SharedCanvases] CHECK CONSTRAINT [FK_CanvasUser_User]
GO
ALTER TABLE [dbo].[SurveyMetadataOrganization]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyMetadataOrganization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[SurveyMetadataOrganization] CHECK CONSTRAINT [FK_SurveyMetadataOrganization_Organization]
GO
ALTER TABLE [dbo].[SurveyMetadataOrganization]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyMetadataOrganization_SurveyMetaData] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[SurveyMetaData] ([SurveyId])
GO
ALTER TABLE [dbo].[SurveyMetadataOrganization] CHECK CONSTRAINT [FK_SurveyMetadataOrganization_SurveyMetaData]
GO
ALTER TABLE [dbo].[SurveyMetaDataTransform]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyMetaDataTransform_SurveyMetaData] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[SurveyMetaData] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyMetaDataTransform] CHECK CONSTRAINT [FK_SurveyMetaDataTransform_SurveyMetaData]
GO
ALTER TABLE [dbo].[SurveyMetaDataUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyMetaDataUser_SurveyMetaData] FOREIGN KEY([FormId])
REFERENCES [dbo].[SurveyMetaData] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyMetaDataUser] CHECK CONSTRAINT [FK_SurveyMetaDataUser_SurveyMetaData]
GO
ALTER TABLE [dbo].[SurveyMetaDataUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyMetaDataUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SurveyMetaDataUser] CHECK CONSTRAINT [FK_SurveyMetaDataUser_User]
GO
ALTER TABLE [dbo].[UserOrganization]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOrganization_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserOrganization] CHECK CONSTRAINT [FK_UserOrganization_Organization]
GO
ALTER TABLE [dbo].[UserOrganization]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOrganization_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserOrganization] CHECK CONSTRAINT [FK_UserOrganization_Role]
GO
ALTER TABLE [dbo].[UserOrganization]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOrganization_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserOrganization] CHECK CONSTRAINT [FK_UserOrganization_User]
GO
/****** Object:  StoredProcedure [dbo].[usp_add_datasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_datasource]
	@DatasourceUser DatasourceUserTableType READONLY, 
	@DatasourceName NVARCHAR (300), 
	@DatasourceServerName NVARCHAR (300), 
	@DatabaseType VARCHAR (50),
	@OrganizationId varchar(10), 
	@InitialCatalog VARCHAR (300), 
	@PersistSecurityInfo VARCHAR (50), 
	@DatabaseUserID VARCHAR (200), 
	@Password VARCHAR (200), 
	@DatabaseObject VARCHAR (MAX), 
	@SQLQuery BIT, 
	@active BIT,
	@pnumber varchar(50),
	@EIWSSurveyId varchar(200)
AS

SET NOCOUNT OFF;

BEGIN TRANSACTION;

--Declare @EIWSSurveyId varchar(200) = '';

--select @EIWSSurveyId = (select SurveyId from EIDatasource where InitialCatalog = @InitialCatalog);

INSERT  INTO [datasource] ([DatasourceName],  [DatasourceServerName], [DatabaseType], [InitialCatalog], [PersistSecurityInfo], [EIWSSurveyId], [DatabaseUserID], [Password], [DatabaseObject ], [SQLQuery], [active], [OrganizationId],[PortNumber])
VALUES                   (@DatasourceName,   @DatasourceServerName, @DatabaseType, @InitialCatalog, @PersistSecurityInfo, @EIWSSurveyId, @DatabaseUserID, @Password, @DatabaseObject, @SQLQuery, @active, @OrganizationId, @pnumber);

declare @usercount  INT    

select @usercount = (select COUNT(* )  )    
 	from @DatasourceUser



if @usercount  >  0
 BEGIN 
	INSERT INTO DatasourceUser (DatasourceID, UserID)
		SELECT SCOPE_IDENTITY(),
			   UserID
		FROM   @DatasourceUser;
  end

IF @@Error > 0
    ROLLBACK;
ELSE
    COMMIT TRANSACTION;



GO
/****** Object:  StoredProcedure [dbo].[usp_add_Epi7DB_record]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_add_Epi7DB_record]  
	@StatusId VARCHAR(50),  
	@ResponseId   uniqueidentifier,   
	@FirstSaveLogonName varchar(50 ),   
	@FirstSaveTime  dateTime, 
	@LastSaveLogonName varchar(50 ), 
	@LastSaveTime   dateTime, 
	@ParentRecordId  uniqueidentifier, 
	@Epi7DBName varchar(50 )         
	    

AS



GO
/****** Object:  StoredProcedure [dbo].[usp_add_organization]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CACI
-- Create date: 4/15/2013
-- Description: This Stored Procedure is created to Add organization in 
-- a the system. The process of adding new organization
-- and admin to the organization will be encapsulated as
-- a one transaction.
-- =============================================
CREATE PROCEDURE [dbo].[usp_add_organization] 
@OrganizationName Varchar(50),
@OrganizationDescription varchar(max),
@UserId varchar(10),
@UserNm varchar(100),
@FirstNm Varchar(100),
@LastNm Varchar(100),
@EmailAdd Varchar(100),
@PhoneNbr Varchar(100),
@PwdHash Varchar(100),
@ResetPwd bit,
@RoleId int,
@IsActive bit,
@IsExistingUser bit,
@OrganizationKey nvarchar(500)



AS
BEGIN

Declare @RETURN_VALUE int = -1 , @OrganizationId int = -1;
Declare @ErrMsg nvarchar(250);
BEGIN TRANSACTION;

-- Adding Organization
	INSERT INTO ORGANIZATION (Organization, IsEnabled, OrganizationKey) VALUES (@OrganizationName, @IsActive, @OrganizationKey);   
	set @OrganizationId =   SCOPE_IDENTITY( )    ;
	
-- Adding User	
	If(@IsExistingUser = 0)
		BEGIN
			IF EXISTS(Select * From [User] Where EmailAddress = @EmailAdd)
				BEGIN
				Set @UserId = (Select UserId from [User] Where EmailAddress = @EmailAdd);
				END
			ELSE
				BEGIN
				INSERT INTO [User] ([UserName], [FirstName], [LastName],  [EmailAddress], [PhoneNumber], [PasswordHash], [ResetPassword]) 
				VALUES (@UserNm, @FirstNm, @LastNm,   @EmailAdd, @PhoneNbr, @PwdHash, @ResetPwd);
				Set @UserId = SCOPE_IDENTITY();
				END
		END
	Else
		Begin
			--EXEC [dbo].[usp_add_user]
			--@UserName = @UserNm,
			--@FirstName = @FirstNm,
			--@LastName = @LastNm,
			--@EmailAddress = @EmailAdd,
			--@PhoneNumber = @PhoneNbr,
			--@PasswordHash = @PwdHash,
			--@ResetPassword = @ResetPwd,
			--@UsrId = @UserId,
			--@OrganizationId = @OrganizationId,
			--@RoleId = @RoleId
			--@RETURN_VALUE = @RETURN_VALUE OUTPUT;
			
			--Set @UserId = @RETURN_VALUE;
			--INSERT INTO [User] ([UserName], [FirstName], [LastName],  [EmailAddress], [PhoneNumber], [PasswordHash], [ResetPassword]) 
			--VALUES (@UserNm, @FirstNm, @LastNm,   @EmailAdd, @PhoneNbr, @PwdHash, @ResetPwd);
			--Set @UserId = SCOPE_IDENTITY();
			Set @UserId = (Select UserId from [User] Where EmailAddress = @EmailAdd);
		End
		
--Adding relationship

INSERT INTO USERORGANIZATION ([UserId], [OrganizationId], [RoleID], [Active])
VALUES (@UserId, @OrganizationId, @RoleID, @IsActive)

IF (@@Error > 0 OR @UserId = -1 OR @OrganizationId = -1)
	Begin
		Set @ErrMsg = 'Adding organization "' + @OrganizationName + '" with Administrator failed.';
		RaisError(@ErrMsg, 10, 1) ;
		ROLLBACK;
    End
ELSE
    COMMIT TRANSACTION;
	
END



GO
/****** Object:  StoredProcedure [dbo].[usp_add_user]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Caci Inc
-- Create date: 4/15/2013
-- Description:	This stored procedure adds a user 
-- in the system. This process involves adding datasources
-- and relationship between user and datasource. 
-- This process is handled in a transaction.
-- =============================================
CREATE PROCEDURE [dbo].[usp_add_user]
@UserName Varchar(50),
@UsrId Varchar(50),
@FirstName Varchar(50),
@LastName Varchar(50),
@EmailAddress Varchar(50),
@PhoneNumber Varchar(50),
@PasswordHash Varchar(50),
@ResetPassword bit,
@DatasourceUser DatasourceUserTableType READONLY,
@OrganizationId varchar(10),
@RoleId varchar(5),
@Active BIT,
@UGuid uniqueidentifier


AS
	
SET NOCOUNT ON;

BEGIN TRANSACTION;
Declare @UserId int;
--Declare @CurrentUserCount int;

IF EXISTS(Select * From [User] Where EmailAddress = @EmailAddress)
BEGIN
Set @UsrId = (Select TOP 1 UserID From [User] Where EmailAddress = @EmailAddress);
END

--IF @CurrentUserCount > 0
--BEGIN
--@UserId = 
--END

IF @UsrId = -1 OR @UsrId = NULL
	Begin
	INSERT INTO [User] ([UserName], [FirstName], [LastName],  [EmailAddress], [PhoneNumber], [PasswordHash], [ResetPassword], [UGuid]) 
	VALUES (@UserName, @FirstName, @LastName,   @EmailAddress, @PhoneNumber, @PasswordHash, @ResetPassword, @UGuid);
	Set @UserId = SCOPE_IDENTITY();
	End
Else
	Begin
	Set @UserId = @UsrId ;
	End

 BEGIN 
	INSERT INTO DatasourceUser (DatasourceID, UserID)
		SELECT DatasourceID , @UserId
		FROM   @DatasourceUser;
 END
 
 INSERT INTO USERORGANIZATION ([UserId], [OrganizationId], [RoleID], [Active])
VALUES (@UserId, @OrganizationId, @RoleID, @Active)

IF @@Error > 0
    ROLLBACK;
ELSE
    COMMIT TRANSACTION;



GO
/****** Object:  StoredProcedure [dbo].[usp_add_user_datasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_add_user_datasource] 
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@DatasourceName varchar(300)
	--@RETURN_VALUE int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
DECLARE @did Numeric = 0
DECLARE @uid Numeric = 0
	
	SET @did = (Select DatasourceID from Datasource where DatasourceName = @DatasourceName)
	Set @uid = (Select UserID from [User] where UserName = @UserName)

    INSERT DatasourceUser ([DatasourceId], [UserID]) VALUES (@did, @uid)
    --set @RETURN_VALUE = SCOPE_IDENTITY();
END



GO
/****** Object:  StoredProcedure [dbo].[usp_AddDatasource]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddDatasource]
	@DatasourceServerName NVARCHAR (300), 
	@DatabaseType VARCHAR (50),
	@InitialCatalog VARCHAR (300), 
	@PersistSecurityInfo VARCHAR (50), 
	@DatabaseUserID VARCHAR (200), 
	@SurveyID Uniqueidentifier , 
	@Password VARCHAR (200)
AS

SET NOCOUNT OFF;

BEGIN TRANSACTION;


INSERT  INTO [EIDatasource] (  [DatasourceServerName], [DatabaseType], [InitialCatalog], [PersistSecurityInfo],[SurveyId], [DatabaseUserID], [Password])
VALUES                   (   @DatasourceServerName, @DatabaseType, @InitialCatalog, @PersistSecurityInfo,@SurveyID, @DatabaseUserID, @Password);

IF @@Error > 0
    ROLLBACK;
ELSE
    COMMIT TRANSACTION;



GO
/****** Object:  StoredProcedure [dbo].[usp_copy_canvas]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[usp_copy_canvas] 

@oldCanvasName varchar(50), 
@newCanvasName varchar(50), 
--@userID int, 
--@datasourceID int      
--@oldDatasourceName varchar(50),
@newDatasourceName varchar(50)

AS 


declare  @newCanvasId  int        ;        
declare @recordCount int ;
declare @newDatasourceId int;

IF((Select Count(*) from canvas where CanvasName = @newCanvasName) > 0)
			BEGIN
			raiserror ('Canvas Name already exists. Select another name.',11,1);
			--select -1;
			return;
			END
			

BEGIN TRANSACTION;			
/**
Copy the existing row that has CanvasContent column into a new row 
**/  
INSERT INTO canvas  ([CanvasName]
           ,[UserID]
           ,[CanvasDescription]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[DatasourceID]
           ,[CanvasContent])
       SELECT  CanvasName
           ,UserID
           ,CanvasDescription
           ,CreatedDate
           ,ModifiedDate
           ,DatasourceID
           ,CanvasContent
       FROM Canvas where CanvasName = @oldCanvasName ;

set @newCanvasId  = @@identity ;


set @newDatasourceId = (Select DatasourceId from Datasource Where DatasourceName = @newDatasourceName);
/**
Update Canvas name to new name.
Update the old DatasourceId column to new DatasourceId with same columns and schema.
Update createdDate column to latest date in order to see the canvas on the top of the list in Open Canvas
**/

UPDATE [Canvas]
   SET [CanvasName] = @newCanvasName
      ,[CreatedDate] =  GETDATE( )
      ,[DatasourceID] =  @newDatasourceId
 WHERE CanvasID = @newCanvasId ;
 
-- set @userID = (Select UserID from CanvasId = @newCanvasId);

--set @recordCount =   ( select COUNT(*) from DatasourceUser
--	where UserID = @userID and
--	DatasourceID = @datasourceID );

--IF ( @recordCount = 0  )
--BEGIN
--	INSERT INTO [DatasourceUser]
--			   ([DatasourceID]
--			   ,[UserID])
--		 VALUES
--			   (@datasourceID
--			   ,@userID)
--END
	

IF @@Error > 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;



GO
/****** Object:  StoredProcedure [dbo].[usp_create_epi7_sql_statements]    Script Date: 10/17/2016 1:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_create_epi7_sql_statements]
	@PageXml XML, 
	@SurveyId UNIQUEIDENTIFIER, 
	@ResponseId VARCHAR (50), 
	@InsertText VARCHAR (MAX) OUTPUT, 
	@UpdateText VARCHAR (MAX) OUTPUT
AS

DECLARE @PageId AS DECIMAL;
DECLARE @TabName AS VARCHAR (MAX);


--  EXEC xp_logevent  70000,  'started core proc   ', informational     



-- Force GlobalRecordId     
SET @PageXml.modify(  'insert <ResponseDetail QuestionName="GlobalRecordId"> {sql:variable("@ResponseId")}  </ResponseDetail > 
				 into 	(/Page)[1]' )  



-- Cleanup    
IF OBJECT_ID('tempdb..#temp') IS NOT NULL
    DROP TABLE #temp;    


-- Get PageId from xml               
SET @PageId = (SELECT doc.col.value('@MetaDataPageId', 'decimal') AS p
               FROM   @PageXml.nodes('/Page ') AS doc(col));
               -- FROM   @xml.nodes('/SurveyResponse/Page ') AS doc(col));    


-- Get TabName from metadata         
SET @TabName = (SELECT TOP 1 TABLEName
                FROM   SurveyMetaDataTransform
                WHERE  SurveyId = @SurveyId
                       AND PageId = @PageId);

select @PageXml  as SourceXML    
select @SurveyId as SurveyId, @PageId as PageId  


-- Create a work  TABLE                                 
SELECT doc.col.value('@QuestionName', 'varchar(70)') AS FieldName,
       doc.col.value('. ', 'varchar(70)') AS Fieldvalue,
       doc.col.value('. ', 'varchar(70)') AS FieldvalueForInsert, 
       (SELECT fieldtypeid
        FROM   SurveyMetaDataTransform
        WHERE  fieldname = doc.col.value('@QuestionName', 'varchar(70)')
               AND SurveyId = @SurveyId
               AND PageId = @PageId) AS FieldTypeId 
INTO   #temp
FROM   @PageXml.nodes('/Page/ResponseDetail') AS doc(col);    
-- FROM   @xml.nodes('/SurveyResponse/Page/ResponseDetail  ') AS doc(col);    


-- Force GlobalRecordId         
UPDATE  #temp
SET FieldTypeId = 99
WHERE   fieldName = 'GlobalRecordId';

-- Add a new column for UPDATE statement parse         
ALTER TABLE #temp
ADD SqlText VARCHAR (MAX);

--  adjust values for boolean FieldTypes     
update  #temp 
set  Fieldvalue = '0' 
where  Fieldvalue = 'NO'    
and FieldTypeId = 10  

--  adjust values for boolean FieldTypes  
update  #temp 
set  Fieldvalue = '1' 
where  Fieldvalue = 'YES'    
and FieldTypeId = 10  

--  adjust values for boolean FieldvalueForInsert     
update  #temp 
set  FieldvalueForInsert = '0' 
where  FieldvalueForInsert = 'NO'    
and FieldTypeId = 10  

--  adjust values for boolean FieldvalueForInsert  
update  #temp 
set  FieldvalueForInsert = '1' 
where  FieldvalueForInsert = 'YES'    
and FieldTypeId = 10  

update #temp 
set Fieldvalue = NULL 
where Fieldvalue = '' 



 -- Create text for SET clause     
-- UPDATE  #temp
--  SET SqlText =  QUOTENAME(FieldName) + ' = ' + QUOTENAME( Fieldvalue , '''')


update #temp 
set SqlText = 
	( case when  Fieldvalue is null  
		then QUOTENAME(FieldName) + ' = '  +  ISNULL(Fieldvalue, 'NULL' ) 
		else QUOTENAME(FieldName) + ' = ' + QUOTENAME( Fieldvalue , '''')
		end  
	)  		


 select * from #temp    
 


DECLARE @cols AS VARCHAR (MAX);
DECLARE @values AS VARCHAR (MAX);
-- DECLARE @statement AS VARCHAR (MAX);
--  DECLARE @update  AS VARCHAR (MAX);                 

-- Concat text for column list for  INSERT    
SET @cols = STUFF((SELECT ',' + QUOTENAME(FieldName)
                   FROM   #temp
                   WHERE  FieldTypeId NOT IN (2, 3, 20, 21) --  , 2, 3, 17, 21   )    
                   FOR    XML PATH (''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '');


-- Concat text for  VALUES list        
SET @values = STUFF((SELECT ',' + QUOTENAME(FieldvalueForInsert, '''')
                     FROM   #temp 
                     WHERE  FieldTypeId NOT IN (2, 3, 20, 21) --   2, 3, 17, 21   )        
                     FOR    XML PATH (''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '');


select   @values  as    [values]  

-- Concat text  for SET clause     
--  dont update  GlobalRecordId    
SET @UpdateText = STUFF((SELECT ',' + SqlText
                         FROM   #temp
                         WHERE  FieldTypeId NOT IN (2, 3, 20, 21) --   2, 3, 17, 21   )        
                                AND FieldName != 'GlobalRecordId' --  dont update  GlobalRecordId                    
                         FOR    XML PATH (''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '');

select @UpdateText  as [UpdateText]        




DECLARE @Epi7DBName VARCHAR(50); 
DECLARE  @xx VARCHAR(500 )      
          
SELECT @Epi7DBName = initialcatalog 
FROM   eidatasource 
WHERE  surveyid = @SurveyId; 


set @TabName =  '[' +  @Epi7DBName  +  '].[dbo].['  +  @TabName +  ']'    

--  Bake the cake     
SET @InsertText = 'INSERT  INTO ' + @TabName +    
					' ( ' + @cols + ' ) 
				  VALUES  
					  ( ' + @values + ') ';

--  Bake the cake        
SET @UpdateText =  N' UPDATE ' + @TabName + 
				  ' SET ' + @UpdateText + ' 
				    WHERE GlobalRecordId =  ' + QUOTENAME(@ResponseId, '''');       


--  select @InsertText, @UpdateText        

--INSERT INTO [EWELiteIntegration].[dbo].[ErrorLog]
--           (    [SurveyId], [ResponseId],   [ErrorText]  )
--     VALUES
--           (  @SurveyId, @ResponseId,   @InsertText )            


--INSERT INTO [EWELiteIntegration].[dbo].[ErrorLog]
--           (    [SurveyId], [ResponseId],   [ErrorText]  )
--     VALUES
--           (  @SurveyId, @ResponseId,   @UpdateText  )



--  EXEC xp_logevent  70000,  'core proc done '    , informational    


      				    
-- Cleanup!
DROP TABLE #temp;



GO
/****** Object:  StoredProcedure [dbo].[usp_create_epi7_sql_statements_driver  ]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[usp_create_epi7_sql_statements_driver  ]         
	@xml XML, 
	@SurveyId UNIQUEIDENTIFIER, 
	@ResponseId  UNIQUEIDENTIFIER,    
	@Mode varchar(50 ),  
	@Epi7DBName varchar(50 )     
AS


--  EXEC xp_logevent  70000,  'start driver ', informational 
  
declare @InsertText   as varchar(max)        
declare @ResultText    as varchar(max)    
declare @UpdateText    as varchar(max)    
declare @InsertResultText  as varchar(max)    
declare @UpdateResultText  as varchar(max)    
declare @UseDBText as varchar(max)    
declare @PageXml   as XML    
declare @PageId  as  int   

  
    
IF OBJECT_ID('tempdb..#temp_outer') IS NOT NULL
    DROP TABLE #temp_outer        

 
 SELECT doc.col.value ('@MetaDataPageId ',  'int'      )  as  PageId     

  INTO    #temp_outer    
 FROM   @xml.nodes('/SurveyResponse/Page ') AS doc(col);    

select *  from #temp_outer 


 DECLARE PAGE_ID  CURSOR FAST_FORWARD FOR
    SELECT  PageId FROM #temp_outer 
OPEN PAGE_ID  
FETCH NEXT FROM PAGE_ID INTO  @PageId        
 WHILE (@@FETCH_STATUS = 0)
        BEGIN
			SELECT @PageXml =  doc.col.query('Page[@MetaDataPageId=sql:variable("@PageId") ]' ) --    , 'varchar(70)')    
			FROM   @xml.nodes('/SurveyResponse ') AS doc(col);    


			-- select @PageXml   as  PageXml    
			    
								
			exec  usp_create_epi7_sql_statements   
					@PageXml,  
					@SurveyId, 
					@ResponseId, 
					@InsertText  =  @ResultText  OUTPUT,            
					@UpdateText   =  @UpdateResultText   OUTPUT                      
					
										

                      set @UseDBText =  'use ' + QUOTENAME(@Epi7DBName)   
                    
                --      execute (@UseDBText) 


				
                BEGIN TRY
                        
                        
                    if @Mode = 'i'  
							execute (@ResultText)   
					else 
						execute (@UpdateResultText )  		
										
				END TRY
				BEGIN CATCH    
						select 'error'  as Error  
					declare @ErrorNumber int  
					declare @ErrorSeverity int 
					declare @ErrorState int 
					declare @ErrorProcedure nvarchar(128) 
					declare @ErrorLine int  
					declare @ErrorMessage nvarchar(4000)     

					---- may nwed to select to tahle then 
					--SELECT
					--	 @ErrorNumber =  ERROR_NUMBER() --  AS ErrorNumber
					--	,@ErrorSeverity =  ERROR_SEVERITY() --  AS ErrorSeverity
					--	,@ErrorState =  ERROR_STATE()  --  AS ErrorState
					--	,@ErrorProcedure =  ERROR_PROCEDURE()  --  AS ErrorProcedure
					--	,@ErrorLine =  ERROR_LINE()  --   AS ErrorLine
					--	,@ErrorMessage =  ERROR_MESSAGE()  --   AS ErrorMessage;
					  
  
					exec usp_log_to_errorlog  
						@SurveyId, 
						@ResponseId,   
						@ResultText, 
						'error text Jose', 
						'error text2 Jose ',
						@ErrorNumber, 
						@ErrorSeverity, 
						@ErrorState, 
						@ErrorProcedure, 
						@ErrorLine, 
						@ErrorMessage    
						
						
				END CATCH  
				
 select @ResultText, @UpdateResultText        

 		
--INSERT INTO [EWELiteIntegration].[dbo].[ErrorLog]
--           (    [SurveyId], [ResponseId],   [ErrorText]  )
--     VALUES
--           (  @SurveyId, @ResponseId,   @ResultText )            


--INSERT INTO [EWELiteIntegration].[dbo].[ErrorLog]
--           (    [SurveyId], [ResponseId],   [ErrorText]  )
--     VALUES
--           (  @SurveyId, @ResponseId,   @UpdateResultText   )



					
			FETCH NEXT FROM PAGE_ID INTO  @PageId  
		END    
		
 CLOSE PAGE_ID    
 DEALLOCATE PAGE_ID



GO
/****** Object:  StoredProcedure [dbo].[usp_delete_canvas]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_delete_canvas]
	-- Add the parameters for the stored procedure here
	@canvasId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   if(@canvasId <> -1)
   begin
   Delete From SharedCanvases where CanvasId = @canvasId;
   
   Delete from Canvas where CanvasId = @canvasId;
   end
END



GO
/****** Object:  StoredProcedure [dbo].[usp_forgot_password]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_forgot_password]
	-- Add the parameters for the stored procedure here
	@EmailAddress varchar(50),
	@HashedPassword varchar(max)
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [User] SET PasswordHash = @HashedPassword, ResetPassword = 1 Where EmailAddress = @EmailAddress
END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_datasources]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_get_all_datasources]    

AS
BEGIN


	select * from Datasource    



END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_datasourcesxx]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_get_all_datasourcesxx]    

AS
BEGIN


	select * from Datasource    



END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_canvas_share_status]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--   exec usp_get_canvas_share_status  69,  2  
   CREATE   PROCEDURE  [dbo].[usp_get_canvas_share_status] 
	@CanvasID int, 
	@OrganizationID  int    
	
AS
BEGIN

SELECT dbo.Organization.Organization,
       dbo.[User].UserName,
       dbo.[User].FirstName,
       dbo.[User].LastName,
       dbo.Organization.OrganizationID,
       dbo.[User].UserID,
       CASE 
			WHEN dbo.[User].UserID IN
			(
				SELECT dbo.[User].UserID AS u2
				FROM   dbo.SharedCanvases
					   INNER JOIN
					   dbo.[User]
					   ON dbo.SharedCanvases.UserID = dbo.[User].UserID
					   INNER JOIN
					   dbo.UserOrganization
					   ON dbo.[User].UserID = dbo.UserOrganization.UserID
			   WHERE  (dbo.SharedCanvases.CanvasID = @CanvasID)    /*   AND (dbo.UserOrganization.OrganizationID = 1) */
			) 
			THEN  CAST(1 AS bit)  
			ELSE  CAST(0 AS bit)   
		END     
		AS Shared
FROM   dbo.[User]
       INNER JOIN
       dbo.UserOrganization
       ON dbo.[User].UserID = dbo.UserOrganization.UserID
       INNER JOIN
       dbo.Organization
       ON dbo.UserOrganization.OrganizationID = dbo.Organization.OrganizationID
WHERE  (dbo.Organization.OrganizationID = @OrganizationID    );        




END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_datasource]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
  CREATE    PROCEDURE [dbo].[usp_get_datasource] 
	-- Add the parameters for the stored procedure here
	@datasourceId int    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		Select * from Datasource where DatasourceID =  @datasourceId    

END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_form_family]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  exec  usp_get_form_family     'D6CB7DFA-255E-4BC7-9042-1E40A0B10564'       '4AD66995-6665-4C8D-9882-05995818BC01'    
--select *  from SurveyMetaData    
--where  SurveyName like 'emr2'    
        
CREATE PROCEDURE [dbo].[usp_get_form_family]
	@SurveyId VARCHAR (50)
AS

DECLARE @topNode AS VARCHAR (50);

WITH   CteAlias2
AS     (SELECT SurveyId,
               SurveyName AS Path,
               ParentId
        FROM   SurveyMetaData
        WHERE  SurveyId = @SurveyId
        UNION ALL
        SELECT SurveyMetaData.SurveyId AS topNode,
               CAST (SurveyMetaData.SurveyName + '\' + CteAlias2.Path AS NVARCHAR (500)) AS SPath,
               SurveyMetaData.parentid
        FROM   SurveyMetaData
               INNER JOIN
               CteAlias2
               ON SurveyMetaData.SurveyId = CteAlias2.ParentId)    
               
SELECT @topNode = CteAlias2.SurveyId
FROM   CteAlias2;    
    
WITH   CteAlias
AS     (SELECT s.[SurveyName] AS Path,
               s.SurveyId, --    [SurveyId] 
               s.OwnerId,
               s.SurveyNumber,
               s.[SurveyTypeId],
               s.[SurveyName],
               s.[TemplateXML],
               s.[UserPublishKey],
               s.[DateCreated],
               s.[IsDraftMode],
               s.[StartDate],
               s.[ParentId],
               s.[ViewId],
               s.[IsSQLProject]
        FROM   SurveyMetaData AS s
        WHERE  SurveyId = @topNode
        UNION ALL
        SELECT CAST (CteAlias.Path + '\' + s.SurveyName AS NVARCHAR (500)) AS SPath,
               s.[SurveyId] AS topNode,
               s.OwnerId,
               s.SurveyNumber,
               s.[SurveyTypeId],
               s.[SurveyName],
               s.[TemplateXML],
               s.[UserPublishKey],
               s.[DateCreated],
               s.[IsDraftMode],
               s.[StartDate],
               s.[ParentId],
               s.[ViewId],
               s.[IsSQLProject]
        FROM   SurveyMetaData AS s
               INNER JOIN
               CteAlias
               ON s.parentid = CteAlias.SurveyId)
SELECT *
FROM   CteAlias;

-- select *           into  familyset      
--from SurveyMetaData 
--where SurveyId in    
--(
--select   SurveyId     
--from CteAlias    
--)
--use EWELiteIntegration    
--select * from   familyset



GO
/****** Object:  StoredProcedure [dbo].[usp_get_shared_canvases]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE  [dbo].[usp_get_shared_canvases]    
	@CanvasID int, 
	@OrganizationID  int    
	
AS
BEGIN

SELECT dbo.Organization.Organization,
       dbo.[User].UserName,
       dbo.[User].FirstName,
       dbo.[User].LastName,
       dbo.Organization.OrganizationID,
       dbo.[User].UserID,
       CASE 
			WHEN dbo.[User].UserID IN
			(
				SELECT dbo.[User].UserID AS u2
				FROM   dbo.SharedCanvases
					   INNER JOIN
					   dbo.[User]
					   ON dbo.SharedCanvases.UserID = dbo.[User].UserID
					   INNER JOIN
					   dbo.UserOrganization
					   ON dbo.[User].UserID = dbo.UserOrganization.UserID
			   WHERE  (dbo.SharedCanvases.CanvasID = @CanvasID)    /*   AND (dbo.UserOrganization.OrganizationID = 1) */
			) 
			THEN  CAST(1 AS bit)  
			ELSE  CAST(0 AS bit)   
		END     
		AS Shared
FROM   dbo.[User]
       INNER JOIN
       dbo.UserOrganization
       ON dbo.[User].UserID = dbo.UserOrganization.UserID
       INNER JOIN
       dbo.Organization
       ON dbo.UserOrganization.OrganizationID = dbo.Organization.OrganizationID
WHERE  (dbo.Organization.OrganizationID = @OrganizationID    );        




END



GO
/****** Object:  StoredProcedure [dbo].[usp_get_shared_canvases_guid]    Script Date: 10/17/2016 1:42:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        PROCEDURE  [dbo].[usp_get_shared_canvases_guid]        
	@canvasGuid   uniqueidentifier   
	

AS
BEGIN

SELECT 
       dbo.[User].UserName,
       dbo.[User].FirstName,
       dbo.[User].LastName,
       dbo.[User].UserID,
       CASE 
			WHEN dbo.[User].UserID IN
			(
				SELECT dbo.[User].UserID AS u2
				FROM   dbo.SharedCanvases
					   INNER JOIN
					   dbo.[User]
					   ON dbo.SharedCanvases.UserID = dbo.[User].UserID				
			   WHERE  (dbo.SharedCanvases.CanvasGUID = @canvasGuid  )    /*   AND (dbo.UserOrganization.OrganizationID = 1) */
			) 
			THEN  CAST(1 AS bit)  
			ELSE  CAST(0 AS bit)   
		END     
		AS Shared
FROM   dbo.[User]



END




GO
/****** Object:  StoredProcedure [dbo].[usp_GetDatasourceConnectionString]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_GetDatasourceConnectionString]    
@FormId varchar(100) = ''
AS
BEGIN

	Select 'Data Source=' + DatasourceServerName  
	+ ';Persist Security Info=' + PersistSecurityInfo + ';User ID=' + DatabaseUserID + '; Password='
	+ [Password] + ';Initial Catalog=' + InitialCatalog
	 from EIDatasource where Cast(SurveyId as varchar(100)) = @FormId;-- '05c7ff68-4feb-4e54-a620-8670dadf7590'   ; --CONVERT(UNIQUEIDENTIFIER, @FormId);

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetEIRecord]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[usp_GetEIRecord]  
@FormId varchar(100) = '',
@ViewTableName varchar(100) = ''
AS
BEGIN
set  @ViewTableName =(	select ViewTableName from SurveyMetaDataView where SurveyId = @FormId) --  '14eaa835-9c33-4c7d-81a3-41ce0e122784'

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetErrorInfo]
AS
SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;



GO
/****** Object:  StoredProcedure [dbo].[usp_GetFormFieldsInfo]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_GetFormFieldsInfo]    
@FormId VARCHAR (1000) = ''
AS
BEGIN


	select ColumnName, TableName, SortOrder from ResponseDisplaySettings inner join SurveyMetaDataTransform  ON 
	ResponseDisplaySettings.FormId = SurveyMetaDataTransform.SurveyId 
	Where  Cast(ResponseDisplaySettings.FormId as varchar(100)) = @FormId
	And ResponseDisplaySettings.ColumnName = SurveyMetaDataTransform.FieldName
	AND FieldTypeId Not in (20, 2, 3, 21 ) -- Neglecting non data fields.
    Order by SortOrder

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetResponseAllFieldsInfo]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_GetResponseAllFieldsInfo]    
@FormId VARCHAR (1000) = ''
AS
BEGIN

 
 --select FieldName, TableName, ViewTableName from SurveyMetaDataTransform  
 --inner join SurveyMetaDataView On
	--SurveyMetaDataTransform.SurveyId = SurveyMetaDataView.SurveyId
	--Where  Cast(SurveyMetaDataTransform.SurveyId as varchar(100)) = @FormId
	--AND FieldTypeId Not in (20, 2, 3, 17, 21 )
	
	select FieldName, TableName from SurveyMetaDataTransform  
	Where  Cast(SurveyMetaDataTransform.SurveyId as varchar(100)) = @FormId
	AND FieldTypeId Not in (20, 2, 3, 21 )

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetResponseFieldsInfo]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_GetResponseFieldsInfo]    
@FormId VARCHAR (1000) = ''
AS
BEGIN


	--select ColumnName, TableName, SortOrder from ResponseDisplaySettings inner join SurveyMetaDataTransform  ON 
	--ResponseDisplaySettings.FormId = SurveyMetaDataTransform.SurveyId 
	--Where  Cast(ResponseDisplaySettings.FormId as varchar(100)) = @FormId
	--And ResponseDisplaySettings.ColumnName = SurveyMetaDataTransform.FieldName
	--AND FieldTypeId Not in (20, 2, 3, 17, 21 ) -- Neglecting non data fields.
 --   Order by SortOrder
 
 select ColumnName, TableName, SortOrder, FieldTypeID, ViewTableName from ResponseDisplaySettings 
 	inner join SurveyMetaDataTransform  ON 
	ResponseDisplaySettings.FormId = SurveyMetaDataTransform.SurveyId 
	inner join SurveyMetaDataView On
	ResponseDisplaySettings.FormId = SurveyMetaDataView.SurveyId
	Where  Cast(ResponseDisplaySettings.FormId as varchar(100)) = @FormId
	And ResponseDisplaySettings.ColumnName = SurveyMetaDataTransform.FieldName
	AND FieldTypeId Not in (20, 2, 3, 21 )
    Order by SortOrder

END



GO
/****** Object:  StoredProcedure [dbo].[usp_IsSQLProject]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_IsSQLProject]    
@FormId varchar(100) = ''
AS
BEGIN

	Select IsSQLProject
	 from SurveyMetaData where Cast(SurveyId as varchar(100)) = @FormId;-- '05c7ff68-4feb-4e54-a620-8670dadf7590'   ; --CONVERT(UNIQUEIDENTIFIER, @FormId);

END



GO
/****** Object:  StoredProcedure [dbo].[usp_load_user]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_load_user] 
	-- Add the parameters for the stored procedure here
	@UserName Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @UserId Varchar(50);
    Set @UserId = (SELECT  UserId   FROM   [User]  WHERE    ( UserName = @UserName  )  )
    
    Select *, (Select Count(*) from DatasourceUser where DatasourceUser.UserId =  @UserId ) as 
    DatasourceCount from vwUserOrganizationUser where vwUserOrganizationUser.UserId = @UserId and Active = 'True' and IsorgActive = 'True' ;
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_log_to_errorlog]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_log_to_errorlog]  
	@SurveyId AS UNIQUEIDENTIFIER, 
	@ResponseId AS UNIQUEIDENTIFIER, 
	@Comment as VARCHAR(100) =  'no comment', 
	@ErrorText as VARCHAR(100) = 'no error text',   
	@ErrorText2	as   VARCHAR(100) = 'no error text2',           
	@ErrorNumber int = 0,    
	@ErrorSeverity int = 0, 
	@ErrorState int = 0, 
	@ErrorProcedure nvarchar(128) = NULL, 
	@ErrorLine int = 0, 
	@ErrorMessage nvarchar(Max) = NULL  ,       
	@Xml  xml = null
AS  


INSERT INTO [ErrorLog]
           ([SurveyId]
           ,[ResponseId]
           ,[Comment]
           ,[ERROR_NUMBER]
           ,[ERROR_MESSAGE]
           ,[ERROR_SEVERITY]
           ,[ERROR_STATE]
           ,[ERROR_PROCEDURE]
           ,[ERROR_LINE]
           ,[ErrorText]
           ,[ErrorText2]
		   ,[XML])
     VALUES
           ( @SurveyId
           , @ResponseId
           , @comment 
           , @ErrorNumber  
		   , @ErrorMessage           
           , @ERRORSEVERITY
           , @ERRORSTATE
           , @ERRORPROCEDURE
           , @ERRORLINE
		   , @ErrorText
           , @ErrorText2 
		   ,@Xml    )


 --INSERT INTO ErrorLog  
 --          (  [SurveyId], 
	--		  [ResponseId],
	--		  [Comment],   
	--		  [ErrorText]
	--		)
 --    VALUES
 --          (  @SurveyId, @ResponseId, @Comment, @ErrorText  )




GO
/****** Object:  StoredProcedure [dbo].[usp_process_sql_server_project_response]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc   [dbo].[usp_process_sql_server_project_response]
  @ResponseId AS UNIQUEIDENTIFIER,
  @SurveyId AS UNIQUEIDENTIFIER,
  @ResponseXML AS XML,
  @IsSQLProject AS bit,      
  @IsDraftMode AS BIT,
  @StatusId as int,    
  @IsSQLResponse AS BIT,
  @FirstSaveLogonName AS VARCHAR (10) 
  
    AS BEGIN
           -- SET NOCOUNT ON added to prevent extra result sets from 
           -- interfering with SELECT statements. 
           SET NOCOUNT ON;    
                      

           DECLARE @InsertText AS VARCHAR (MAX);
           DECLARE @Epi7DBName AS VARCHAR (50);
           DECLARE @UpdateText AS VARCHAR (MAX);
           DECLARE @ResultText AS VARCHAR (MAX);
           DECLARE @UpdateResultText AS VARCHAR (MAX);
           DECLARE @RecordsourceId AS VARCHAR (50);                                 
                      
                      
           -- If Response is not finalized then return    
           IF @StatusId =  1
               BEGIN
                   -- EXEC xp_logevent  70000, 'exited for @statusid != 2',  informational 
                   RETURN;
               END
           
			IF @StatusId =  0    
               BEGIN

                   RETURN;
               END
                      
           
           -- Get the Epi7 proects's DB name      
           SELECT @Epi7DBName = initialcatalog
           FROM   eidatasource
           WHERE  surveyid = @SurveyId;
           
           -- Get project's SQL status        
           SELECT @IsSQLProject = issqlproject
           FROM   surveymetadata
           WHERE  surveyid = @SurveyId;
           
           -- Get record source                    
           SELECT @RecordsourceId = recordsourceid
           FROM   surveyresponse
           WHERE  responseid = @ResponseId;
                                 
     
           
                   -- STEP 1   
                   -- call usp_create_Epi7_views_statement   
                   DECLARE @ViewTableName AS VARCHAR (50);
                   
                   SELECT @ViewTableName = viewtablename
                   FROM   surveymetadataview
                   WHERE  surveyid = @SurveyId;
               
                   DECLARE @InsertviewText AS VARCHAR (500);
                
						    SET @InsertviewText = 'INSERT  INTO  [' + @Epi7DBName + '].dbo.[' + @ViewTableName + ']' + ' ([RECSTATUS]    ,
										[GlobalRecordId]    ,
										[FirstSaveLogonName]    ,
										[FirstSaveTime]    ,
										[LastSaveLogonName]    ,
										[LastSaveTime]  )
										values   ' + 
										'(  ' + 
											'1 ,  ' + 
											quotename(CAST (@ResponseId AS VARCHAR (100)), '''') + ', ' + 
											quotename('EWE', '''') + ', ' + 
											quotename(CAST (Getdate() AS VARCHAR (100)), '''') + ', ' + 
											quotename('EWE', '''') + ', ' + 
											quotename(CAST (Getdate() AS VARCHAR (100)), '''')  +   
											') ';
      

      
                   EXECUTE (@InsertviewText);
               
                   -- STEP 2    
                   EXECUTE usp_create_epi7_sql_statements_driver 
							@ResponseXml, 
							@SurveyId,  
							@ResponseId, 
							'i', 
							@Epi7DBName;                                      
                   EXECUTE (@InsertText);  --  returned from  sp                     
      
       END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_admins]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_admins] 
	@orgId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Create Table #TempTable(userId varchar(20), datasourceCount varchar(20))
	
	IF @orgId <> -1 
		BEGIN
				Insert Into #TempTable(userId, datasourceCount)
				SELECT UserID, Count(DatasourceId )
				FROM DatasourceUser --On [User].UserId = DatasourceUser.UserId WHERE [USER].ORGANIZATIONID = 1 AND [USER].ROLEID <> 4
				Group By UserID 

				Select vwUserOrganizationUser.USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, EMAILADDRESS,PasswordHash, ROLEID, DatasourceCount
				FROM vwUserOrganizationUser Left Join #TempTable on vwUserOrganizationUser.UserId = #TempTable.UserID WHERE ORGANIZATIONID = @ORGID AND ROLEID = 2
				Order By FirstName

		END
	ELSE
		BEGIN
				Insert Into #TempTable(userId, datasourceCount)
				SELECT UserID, Count(DatasourceId )
				FROM DatasourceUser --On [User].UserId = DatasourceUser.UserId WHERE [USER].ORGANIZATIONID = 1 AND [USER].ROLEID <> 4
				Group By UserID 

				Select vwUserOrganizationUser.USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, EMAILADDRESS,PasswordHash, ROLEID, DatasourceCount
				FROM vwUserOrganizationUser Left Join #TempTable on vwUserOrganizationUser.UserId = #TempTable.UserID  AND ROLEID = 2
				Order By FirstName

		END
				Drop Table #TempTable
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_all_canvases]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_all_canvases]
	 ( @userID int )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- comment  
    -- Insert statements for procedure here 
	select   'Owned' As IsShared,   *  from vwCanvasUser where UserID =   @userID  UNION 
	select   'Shared' As IsShared,   * from vwCanvasShare  where UserID = @userID  Order By CreatedDate DESC
	 
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_all_datasources ]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_all_datasources ]
	-- Add the parameters for the stored procedure here
	@UserName VARCHAR (50) = '',
	@DatabaseObject Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare @SqlString Varchar(1000) = '';
   IF(@UserName = '*')
	   Begin
	   Set @SqlString  = 'SELECT * FROM ' + @DatabaseObject + ' As A Left join vwUserOrganizationUser On 
	   A.UserID = vwUserOrganizationUser.UserID and A.OrganizationId =  vwUserOrganizationUser.OrganizationId   
	   WHERE IsDatasourceactive =  ''True''  and Active = ''True'' And IsOrgActive =''True'' Order By A.DatasourceName';
	   End
	ELSE
		Begin
		Set @SqlString = 'SELECT * FROM ' + @DatabaseObject + ' As A Left join vwUserOrganizationUser 
		On A.UserID = vwUserOrganizationUser.UserID and A.OrganizationId =  vwUserOrganizationUser.OrganizationId   
		WHERE IsDatasourceactive = ''True'' And   vwUserOrganizationUser.username =  ''' + @UserName + ''' and Active = ''True'' And IsOrgActive =''True'' Order By A.DatasourceName';
		End
		
	exec(@SqlString	)
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_all_organization_for_user]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_all_organization_for_user] 
@UserName Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select * From   vwOrgsforUser  Where RoleId > 1 AND UserId  =  @UserName AND Active = 1 AND IsOrgActive = 1
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_all_organization_tallys]    Script Date: 10/17/2016 1:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE   [dbo].[usp_read_all_organization_tallys]     

AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT OrganizationID,
       [Organization],
       [IsEnabled],
       -- Get  DatasourceCount         
       (SELECT COUNT(*)
        FROM   Datasource
        WHERE  Datasource.OrganizationID = Organization.OrganizationID) AS DatasourceCount,    
		-- Get  TotalUserCount         
       (SELECT COUNT(*)
        FROM   [UserOrganization] 
        WHERE  [UserOrganization].OrganizationID = Organization.OrganizationID) AS TotalUserCount,    
		-- Get  AdminCount                  
       (SELECT COUNT(*)
        FROM   UserOrganization 
        WHERE UserOrganization.OrganizationID =  Organization.OrganizationID AND
				UserOrganization.RoleID =  2 
		) AS AdminCount,        
		-- Get  AnalystCount         
       (SELECT COUNT(*)
		FROM   UserOrganization 
        WHERE UserOrganization.OrganizationID =  Organization.OrganizationID AND
				UserOrganization.RoleID =  1    
				) AS AnalystCount,  
		-- Get  SuperAdminCount                                 
       (SELECT COUNT(*)
		FROM   UserOrganization 
        WHERE UserOrganization.OrganizationID =  Organization.OrganizationID AND
				UserOrganization.RoleID =  4 
		  ) AS    SuperAdminCount             
               
FROM   [dbo].[Organization] Order by Organization;    


END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_by_username]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_by_username] 
@UserName Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from [User] left join UserOrganization on [User].UserId = UserOrganization.UserId Where UserName = @UserName
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_canvases_for_lite]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohammad Usman
-- Create date: 6/8/2015
-- Description:	This stored proc returns list of all the canvases associated with given datasource for a given user. 
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_canvases_for_lite] 
	@FormId VARCHAR (1000) = '',
	@UserId Varchar(50) = ''
AS
BEGIN
declare @ewavdsid  INT 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 -- set @ewavdsid = (Select TOP 1 DatasourceId  from DataSource where EIWSSurveyId ='' + @FormId + '');
  
 -- 	Select Count(*) from (select   'Owned' As IsShared,   *  from vwCanvasUser where UserID =   @UserId and DatasourceID = @ewavdsid UNION 
	--select   'Shared' As IsShared,   * from vwCanvasShare  where UserID = @UserId 
	--and DatasourceID = @ewavdsid) as UnionTable
	
	
	
Create Table #T(DatasourceId int)

--Reading all the active datasources for the given form, this User has access to.  
Insert into #T
Select  DataSource.DataSourceID  from DataSource join DatasourceUser on Datasource.DatasourceId = DatasourceUser.Datasourceid 
where EIWSSurveyId ='' + @FormId + '' and UserId = @UserId and active = 1

--Reading count for all the canvases, for all the datasources read above, for this user. 
Select *  from (select   'Owned' As IsShared,   *  from vwCanvasUser where UserID =   @UserId  UNION 
	select   'Shared' As IsShared,   * from vwCanvasShare  where UserID = @UserId 
	) as UnionTable join #T on UnionTable.DatasourceId = #T.DatasourceId
	
Drop Table #T
  
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_canvasInfo]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_canvasInfo]
@canvasId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	--if(@canvasId = -1)
	--	begin
	--	--raiserror('',1,1);
	--	end
	--else
		begin
		SELECT UserId, CanvasID, CanvasGUID, CanvasName,    CanvasContent,  DatasourceId,    
			(select count(*) from SharedCanvases where CanvasId = @canvasId) as IsShared 
		From vwCanvasUser 
		where CanvasId = @canvasId;
		end
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_canvasInfoGUID         ]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[usp_read_canvasInfoGUID         ]
@canvasGUID  uniqueidentifier    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



		begin
		SELECT UserId, CanvasID, CanvasGUID,  DatasourceId,  canvasname,    CanvasContent, DatasourceName  /*  , 
			(select count(*) from SharedCanvases where CanvasId = @canvasId) as IsShared   */    
		From vwCanvasUser 
		where canvasGUID = @canvasGUID;
		end
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_database_type]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_database_type]
	-- Add the parameters for the stored procedure here
	@DatabaseObject Varchar(200) = '',
	@TableName Varchar(200) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare @SqlString Varchar(200) = '';

   set @SqlString = 'SELECT * FROM ' + @TableName + ' WHERE DataSourceName =  ''' + @DatabaseObject + '''';
   exec(@SqlString);
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_datasource]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_datasource] 
	-- Add the parameters for the stored procedure here
	--@creatorId int = -1,
	@orgId int = -1, 
	@userId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @userId = -1
		begin
		Select * from Datasource where OrganizationId = @orgId Order by DatasourceName--and CreatorId = @creatorId
		end
	else
		begin
		Select * from Datasource left join DatasourceUser on Datasource.DatasourceId = DatasourceUser.DatasourceId
where OrganizationId = @orgId --and CreatorId = @creatorId 
and UserId = @userId  Order by DatasourceName
		end
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_external_connec_str]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_external_connec_str]
	-- Add the parameters for the stored procedure here
	@ViewName VARCHAR (50) = '',
	@DSName Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @sqlString Varchar(100)
	set @sqlString = 'SELECT *  FROM ' + @ViewName + ' WHERE DatasourceName =  ''' + @DSName + '''';
	
	exec(@sqlString)
	
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_records_count ]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_records_count ]
	-- Add the parameters for the stored procedure here
	@DatabaseObject VARCHAR (50) = '',
	@SqlTest bit = 0,
	@WhereClause Varchar(200) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @sqlString Varchar(100)
    IF(@SqlTest = 0)
		Begin
		set @sqlString = 'select Count(*)  from  ' + @DatabaseObject
		End
	Else
		Begin
		set @sqlString = 'SELECT Count(*) FROM  ( ' + @DatabaseObject + ' ) as table1 ';
		End
		
	IF(@WhereClause <> '')
	Begin
		
	set @sqlString = @sqlString + @WhereClause;

	End
		
	exec(@sqlString);
	
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_super_admin_from_ewav]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_super_admin_from_ewav] 
--@UserName Varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select TOP 1 EmailAddress From vwUserOrganizationuser Where RoleID = 4 
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_user]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_user] 
@orgid int = -1,
@userid int = -1,
@email varchar(50) =  NULL, 
@roleid int = -1--,
--@datasourceid int = -1  


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	


	Create Table #TempTable(userId varchar(20), datasourceCount varchar(20))
	
	IF @email <> ''
	BEGIN
	SELECT USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID, ROLEDESCRIPTION, ACTIVE, 
	(Select Count(*) from DatasourceUser where UserId= (Select UserID from [User] where EmailAddress = @email)) As DatasourceCount  FROM vwUserOrganizationUser WHERE EMAILADDRESS = @email
	Order by FIRSTNAME
	END
	
	ELSE
		IF @USERID <> -1
		BEGIN
		SELECT USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID, ROLEDESCRIPTION,  ACTIVE,
			(Select Count(*) from DatasourceUser where UserId= @userid) As DatasourceCount  FROM vwUserOrganizationUser WHERE ORGANIZATIONID = @ORGID AND USERID = @USERID
			 Order by FIRSTNAME
		END
		ELSE
		BEGIN
			IF @roleid <> -1
				BEGIN
				--SELECT USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID 
				--	FROM vwUserOrganizationUser WHERE ORGANIZATIONID = @ORGID AND ROLEID <> 4
				Insert Into #TempTable(userId, datasourceCount)
				SELECT UserID,  Count(DatasourceId )
				FROM DatasourceUser --On vwUserOrganizationUser.UserId = DatasourceUser.UserId WHERE vwUserOrganizationUser.ORGANIZATIONID = 1 AND vwUserOrganizationUser.ROLEID <> 4

				Group By UserID 

				Select vwUserOrganizationUser.USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID, ROLEDESCRIPTION, ACTIVE, DatasourceCount
				FROM vwUserOrganizationUser Left Join #TempTable on vwUserOrganizationUser.UserId = #TempTable.UserID WHERE ORGANIZATIONID = @ORGID AND ROLEID = @roleid
				Order by FIRSTNAME;


				Drop Table #TempTable
				END
			ELSE
				BEGIN
				--SELECT USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID FROM vwUserOrganizationUser WHERE ORGANIZATIONID = @ORGID  --AND ROLEID <> 4 AND ROLEID = 2
				--SELECT USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID FROM vwUserOrganizationUser WHERE ROLEID = 2
				--Create Table #TempTable(userId varchar(20), datasourceCount varchar(20))
				Insert Into #TempTable(userId, datasourceCount)
				SELECT UserID, Count(DatasourceUser.DatasourceId ) as DatasourceCount
				FROM DatasourceUser left join Datasource on 
				Datasource.DatasourceId = DatasourceUser.DatasourceId
				Where OrganizationId = @ORGID --On vwUserOrganizationUser.UserId = DatasourceUser.UserId WHERE vwUserOrganizationUser.ORGANIZATIONID = 1 AND vwUserOrganizationUser.ROLEID <> 4
				Group By UserID

				Select vwUserOrganizationUser.USERID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID, ROLEDESCRIPTION, ACTIVE, DatasourceCount
				FROM vwUserOrganizationUser Left Join #TempTable on vwUserOrganizationUser.UserId = #TempTable.UserID WHERE ORGANIZATIONID = @ORGID 
				Order by FIRSTNAME

				Drop Table #TempTable

			END
	END
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_user_bypass_authentication]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_read_user_bypass_authentication] 
	-- Add the parameters for the stored procedure here
	@UGuid uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select * FROM [User] Where (UGuid = @UGuid)
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_user_for_authentication]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_user_for_authentication] 
	-- Add the parameters for the stored procedure here
	@UserName Varchar(50) = '',
	@PwdHash Varchar(500) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select * FROM [User] Where (UserName = @UserName) And (PasswordHash = @PwdHash);
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_usernames]    Script Date: 10/17/2016 1:42:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_usernames] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select UserName from [User];
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_read_users_for_datasource]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_read_users_for_datasource] 
@orgid int = -1,
@datasourceid int = -1  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	if @datasourceid <>  -1
	begin
	 SELECT vwUserOrganizationUser.UserID, USERNAME, FIRSTNAME, LASTNAME, ORGANIZATIONID, PHONENUMBER, PASSWORDHASH , EMAILADDRESS, ROLEID, ROLEDESCRIPTION, ACTIVE 
		FROM vwUserOrganizationUser Left join DatasourceUser on vwUserOrganizationUser.UserId = DatasourceUser.UserId Where DatasourceID =  @datasourceid and organizationid = @orgid Order by FIRSTNAME
		
		return  
	end
END



GO
/****** Object:  StoredProcedure [dbo].[usp_remove_organization]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_remove_organization]
	-- Add the parameters for the stored procedure here
	@orgId int = -1,
	@userId varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --DELETE FROM ORGANIZATION WHERE ORGANIZATIONID = @orgId 
END



GO
/****** Object:  StoredProcedure [dbo].[usp_remove_user_datasource]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_remove_user_datasource] 
@UserId Numeric,
@OrganizationId varchar(10)
--@CreatorId Numeric--,
--@RETURN_VALUE int OUTPUT
AS
BEGIN
--DECLARE @uid Numeric = 0
--Set @uid = (Select UserID from [User] where UserName = @UserName)
--DELETE DatasourceUser WHERE UserId = @uid;
--set @RETURN_VALUE = SCOPE_IDENTITY();
Delete DatasourceUser from DatasourceUser left join Datasource 
on DatasourceUser.DatasourceId = Datasource.DatasourceId 
where --creatorId = @CreatorId and 
DatasourceUser.UserId = @UserId and Datasource.OrganizationId = @OrganizationId
END



GO
/****** Object:  StoredProcedure [dbo].[usp_save_canvas]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_save_canvas] 
	@CANVASNAME VARCHAR(50) = '',
	@USERID INT = -1,
	@CANVASDESC VARCHAR(MAX) = '',
	@CREATEDDATE DATETIME = '1/1/1900',
	@MODIFIEDDATE DATETIME= '1/1/1900',
	@DATASOURCEID INT = '-1',
	@ISNEWCANVAS BIT = 0,
	@CANVASID INT = -1,
	@XMLCONTENT VARCHAR(MAX) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF(@ISNEWCANVAS = 1)
	BEGIN
	Create Table #CountTable(count int);
		
	Insert into #CountTable
   		SELECT   count(*)  FROM CANVAS WHERE CANVASNAME = @CANVASNAME --UNION 
		--SELECT   count(*) FROM VWCANVASSHARE  WHERE CANVASNAME = @CANVASNAME  --ORDER BY CREATEDDATE DESC
		
		-- If true there is an existing canvas  
		IF((Select max(count) from #CountTable) > 0)
			BEGIN
			--raiserror ('Canvas Name already exists. Select another name.',11,1);
			select -1;
			END
		-- If not insert new record and return canvasID	
		Else
			Begin
			INSERT INTO CANVAS ([CANVASNAME] ,[USERID],[CANVASDESCRIPTION],[CREATEDDATE],[MODIFIEDDATE],
			[DATASOURCEID],[CANVASCONTENT])
			VALUES (''+ @CANVASNAME +'','' + @USERID + '', '' + @CANVASDESC + '', '' + @CREATEDDATE + '', '' + @MODIFIEDDATE + '',
			'' + @DATASOURCEID + '', '' + @XMLCONTENT + '');
		    
			Select (SELECT CANVASID FROM CANVAS WHERE CANVASNAME = '' + @CANVASNAME + '')
			End
		Drop Table #CountTable;
	END
-- If not then update canvas  	
ELSE
	BEGIN
	UPDATE CANVAS SET MODIFIEDDATE = '' + @MODIFIEDDATE + '', CANVASCONTENT = '' + @XMLCONTENT + '' WHERE CANVASID=@CANVASID;
	Select @CANVASID;
	return;
	END	
	
END



GO
/****** Object:  StoredProcedure [dbo].[usp_sharecanvas]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_sharecanvas] 
@canvasId int = -1,
@userId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	IF NOT Exists(Select * from SharedCanvases where UserId = @userId and CanvasId = @canvasId)
	 INSERT INTO SharedCanvases    ([CanvasID] ,[UserID]) VALUES (@canvasId,@userId) ;
END



GO
/****** Object:  StoredProcedure [dbo].[usp_soft_delete_Epi7_record]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC  [dbo].[usp_soft_delete_Epi7_record]         
	@ResponseId as uniqueidentifier,
	@SurveyId as uniqueidentifier,   
	@IsResponsePresent as bit 
AS 

DECLARE @IsSQLResponse as BIT  
DECLARE @IsResponseinsertedToEpi7 AS BIT    
DECLARE @ViewTableName AS VARCHAR (50);
DECLARE @UpdateSQL AS VARCHAR(MAX) ;
DECLARE @Epi7DBName AS VARCHAR(50) ;
DECLARE @RECSTATUS  as SMALLINT =  0  ; 
DECLARE @IsSQLProject AS BIT;

-- exec  usp_log_to_errorlog  @SurveyId, @ResponseId, 'soft delete testHello world ', 'text'  
	
-- Get the Epi7 proects's DB name      
SELECT @Epi7DBName = initialcatalog
FROM   eidatasource
WHERE  surveyid = @SurveyId;
							     
IF @IsResponsePresent = 1  
	BEGIN
	
    	-- Get IsSqlResponse from SurveyResponseTracking  
		SELECT	@IsSQLResponse = issqlresponse, 
				@IsResponseinsertedToEpi7 = isresponseinsertedtoepi7                   
		FROM   surveyresponsetracking
		WHERE  responseid = @ResponseId;

		IF	@IsSQLResponse = 1 
			and @IsResponseinsertedToEpi7 = 1 
			BEGIN  
                   SELECT @ViewTableName = viewtablename
                   FROM   surveymetadataview
                   WHERE  surveyid = @SurveyId;
                   
                   SET @UpdateSQL =   'UPDATE  [' + @Epi7DBName + '].dbo.[' + @ViewTableName + '] ' + 
											' SET RECSTATUS = ' + CAST (@RECSTATUS AS VARCHAR(10)) + ' ' + 
											' WHERE GlobalRecordId = ' + QUOTENAME(CAST (@ResponseId as VARCHAR(100)), '''')										

					EXECUTE (@UpdateSQL ) ; 
					RETURN ; 											
			END         
			
	END 
ELSE
	BEGIN
	
		-- exec  usp_log_to_errorlog  @SurveyId, @ResponseId, 'soft delete test from APP 1 ', 'text'  
					
	   -- Get project's SQL status                   
	   SELECT @IsSQLProject = issqlproject
	   FROM   surveymetadata
	   WHERE  surveyid = @SurveyId;

		IF @IsSQLProject = 1  
			BEGIN  
				   SELECT @ViewTableName = viewtablename
                   FROM   surveymetadataview
                   WHERE  surveyid = @SurveyId;
            
					SET @UpdateSQL =   'UPDATE  [' + @Epi7DBName + '].dbo.[' + @ViewTableName + '] ' + 
											' SET RECSTATUS = ' + CAST (@RECSTATUS AS VARCHAR(10)) + ' ' + 
											' WHERE GlobalRecordId = ' + QUOTENAME(CAST (@ResponseId as VARCHAR(100)) , '''')  
											
		--  exec  usp_log_to_errorlog  @SurveyId, @ResponseId, 'soft delete test from APP 2 ',  @UpdateSQL  
		
					EXECUTE (@UpdateSQL ) ; 
					RETURN ; 											            
			END  
			           
	END



GO
/****** Object:  StoredProcedure [dbo].[usp_update_datasource]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_datasource]
(
	  @DatasourceUser DatasourceUserTableType READONLY,          
	@DatasourceName nvarchar(300),
	@DatasourceServerName nvarchar(300),
	@DatabaseType varchar(50),
	@InitialCatalog varchar(300),
	@PersistSecurityInfo varchar(50),
	@DatabaseUserID varchar(200),
	@Password varchar(200),
	@DatabaseObject   varchar(MAX),
    -- @SQLQuery bit,
	-- @SQLText varchar(MAX),
	@active bit,
	@DatasourceID int,
	@pnumber varchar(50),
	@EIWSSurveyId varchar(200)
)
AS
	SET NOCOUNT OFF;    
	
	BEGIN TRANSACTION;

--Declare @EIWSSurveyId varchar(200) = '';

--select @EIWSSurveyId = (select SurveyId from EIDatasource where InitialCatalog = @InitialCatalog);

 declare @usercount  INT    
		
UPDATE [datasource] 
SET [DatasourceName] = @DatasourceName,  [DatasourceServerName] = @DatasourceServerName, [DatabaseType] = @DatabaseType, 
[InitialCatalog] = @InitialCatalog, [PersistSecurityInfo] = @PersistSecurityInfo, [EIWSSurveyId] = @EIWSSurveyId, [DatabaseUserID] = @DatabaseUserID, 
[Password] = @Password,   DatabaseObject = @DatabaseObject,    [active] = @active, [portnumber]=@pnumber WHERE (([DatasourceID] =  @DatasourceID));

delete from DatasourceUser where DatasourceID 	=  @DatasourceID                              

select @usercount = (select COUNT(* )  )    
 	from @DatasourceUser



if @usercount  >  0
 BEGIN 
	INSERT INTO DatasourceUser (DatasourceID, UserID)
		SELECT @DatasourceID,      
			   UserID
		FROM   @DatasourceUser;
  end



IF @@Error > 0
    ROLLBACK;
ELSE
    COMMIT TRANSACTION;



GO
/****** Object:  StoredProcedure [dbo].[usp_update_organization]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_organization]
	-- Add the parameters for the stored procedure here
	@orgId int = -1,
	@orgName varchar(50) ,     
	@active bit    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE ORGANIZATION SET  Organization = @orgName, IsEnabled = @active  WHERE ORGANIZATIONID = @orgId;    
	
END



GO
/****** Object:  StoredProcedure [dbo].[usp_update_password]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_password] 
	-- Add the parameters for the stored procedure here
	@UserId varchar(10),
	@HashedPassword varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update [User] Set PasswordHash = @HashedPassword, ResetPassword = 0 Where UserId = @UserId
END



GO
/****** Object:  StoredProcedure [dbo].[usp_update_sharedcanvases]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--   exec  usp_update_sharedcanvases    
CREATE PROCEDURE [dbo].[usp_update_sharedcanvases]
	@OrganizationID INT  , 
	@canvasId INT , 
	@UsersToShare VARCHAR (50)  -- ='11, 4, ' --     24, 17,  26,     14'

AS

-- Clean up work tabs      
IF OBJECT_ID('tempdb..#UNShare') IS NOT NULL
    DROP TABLE #UNShare;
IF OBJECT_ID('tempdb..#MIGHTShare') IS NOT NULL
    DROP TABLE #MIGHTShare;
IF OBJECT_ID('tempdb..#ToShare') IS NOT NULL
    DROP TABLE #ToShare;
IF OBJECT_ID('tempdb..#ToEmail') IS NOT NULL
    DROP TABLE #ToEmail;

-- =============================================
-- select the users from the organization 
-- that are NOT to be shared with.  Also if these 
-- users are shared currently they will get UN-shared   
--
SELECT UserID
INTO   #UNShare
FROM   UserOrganization
WHERE  OrganizationID = @OrganizationID
       AND UserID NOT IN (SELECT Item
                          FROM   dbo.SplitInts (@UsersToShare, ',')); --   (11, 14 )       
-- =============================================
-- Takes the comma separated list argument @UsersToShare
-- amd creates a selected set                                                        
-- select the users from the organization 
-- that are MAY get shared if not shared already  
--      
SELECT UserID
INTO   #MIGHTShare
FROM   UserOrganization
WHERE  OrganizationID =  @OrganizationID    
       AND UserID IN (SELECT item
                      FROM   SplitInts (@UsersToShare, ',')); --   (11, 14 )    
-- =============================================    
-- create share tahle with the as 
-- one column and userid as the other       
--     
SELECT @canvasId AS CanvasID,
       UserId
INTO   #ToShare
FROM   #mightshare;    

BEGIN TRANSACTION;
BEGIN TRY

    -- Unshare these fools!          
    DELETE SharedCanvases
    WHERE  UserID IN (SELECT UserID
                      FROM   #unshare)
           AND CanvasID = @canvasId; --      = 17   AND  CanvasID =   @canvasId              
                      
    -- Save the newly shared to a list for emails    
    SELECT *
    INTO   #ToEmail
    FROM   #toshare
    WHERE  UserID NOT IN (SELECT UserID
                          FROM   SharedCanvases
                          WHERE  CanvasID = @canvasId);    
                                                    
    -- Share with anyone from the share list that is 
    -- NOT ALREADY shared witth  
    INSERT INTO SharedCanvases
    SELECT *
    FROM   #toshare
    WHERE  UserID NOT IN (SELECT UserID
                          FROM   SharedCanvases
                          WHERE  CanvasID = @canvasId);

	-- Return results                              
    SELECT *
    FROM   #toemail;
    
    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    SELECT ERROR_NUMBER() AS ErrorNumber,
           ERROR_SEVERITY() AS ErrorSeverity,
           ERROR_STATE() AS ErrorState,
           ERROR_PROCEDURE() AS ErrorProcedure,
           ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage;
    -- in case of an error, ROLLBACK the transaction    
    ROLLBACK;
        
END CATCH 


GO
/****** Object:  StoredProcedure [dbo].[usp_update_user]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CACI Inc.
-- Create date: 4/16/2013
-- Description:	This Stored procedure handles the updation
-- of the User . The process of the updation is encapsulated
-- in one single transaction.
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_user] 
	@FirstName Varchar(100),
	@LastName Varchar(100),
	@EmailAddress Varchar(100),
	@PhoneNumber Varchar(100),
	@UserId varchar(50),
	--@IsUserActive BIT,
	
	@OrganizationId Varchar(100),
	@IsUserOrgActive BIT,
	@RoleId int,
	@DatasourceUser DatasourceUserTableType READONLY 
	
	
AS
BEGIN

-- Update User
BEGIN TRANSACTION;
Update [User] Set FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, PhoneNumber = @PhoneNumber--, IsActive = @IsUserActive 
WHERE UserId = @UserId;

-- Update User Organization

EXEC usp_update_user_organization @Active = @IsUserOrgActive, @RoleId = @RoleId, @UserId = @UserId , @OrganizationId = @OrganizationId;


-- remove all datasources of user for this specific organization

EXEC usp_remove_user_datasource @UserId = @UserId, @OrganizationId = @OrganizationId;

-- add given datasources for the user

INSERT INTO DatasourceUser (DatasourceID, UserID)
		SELECT DatasourceID,
			   UserID
		FROM   @DatasourceUser;


IF @@Error > 0
Begin
	Raiserror('Updating User failed' , 10 , 1);
    ROLLBACK;
End
ELSE
    COMMIT TRANSACTION;

END



GO
/****** Object:  StoredProcedure [dbo].[usp_update_user_organization]    Script Date: 10/17/2016 1:42:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_user_organization] 
@UserId varchar(50),
@OrganizationId varchar(10),
@RoleId varchar(3),
@Active bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   UPDATE [UserOrganization] SET [ROLEID] = @RoleId, [Active] = @Active
WHERE UserId = @UserId and OrganizationId = @OrganizationId
END



BEGIN TRY

    BEGIN TRANSACTION 

		INSERT INTO [dbo].[User] Values ('sysadmin@csra.com','Sys','Admin','',1,'sysadmin@csra.com','121341234',NEWID())

		INSERT INTO  [dbo].[Role] Values (1,'User')
		INSERT INTO  [dbo].[Role] Values (2,'OrgAdministrator')
		INSERT INTO  [dbo].[Role] Values (3,'Administrator')

		--INSERT INTO [dbo].[Organization] VALUES ([OrganizationId],,[OrganizationKey],[Organization],[IsEnabled],[IsHostOrganization])
		--INSERT INTO [dbo].[UserOrganization] VALUES (1065,1,1,1)
		

    COMMIT
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK
END CATCH



GO
