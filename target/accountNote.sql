USE [master]
GO
/****** Object:  Database [AccountingNote]    Script Date: 2021/12/19 下午 09:07:12 ******/
CREATE DATABASE [AccountingNote]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'runningacciunt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\runningacciunt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 3072KB )
 LOG ON 
( NAME = N'runningacciunt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\runningacciunt_log.ldf' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 3072KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AccountingNote] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingNote].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingNote] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingNote] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingNote] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingNote] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingNote] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingNote] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingNote] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingNote] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingNote] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingNote] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingNote] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountingNote] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingNote] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingNote] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingNote] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingNote] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingNote] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingNote] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingNote] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountingNote] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingNote] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingNote] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingNote] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingNote] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingNote] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountingNote] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AccountingNote] SET QUERY_STORE = OFF
GO
USE [AccountingNote]
GO
/****** Object:  Table [dbo].[AccountingNote]    Script Date: 2021/12/19 下午 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingNote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Caption] [nvarchar](100) NULL,
	[Amount] [int] NOT NULL,
	[ActType] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Body] [nvarchar](500) NULL,
	[Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountingNote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2021/12/19 下午 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[CreateTime] [datetime] NOT NULL,
	[Body] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2021/12/19 下午 09:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserLevel] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Fixdate] [datetime] NULL,
	[onlyID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[onlyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1088, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'旅費', CAST(N'2021-12-19T20:58:23.263' AS DateTime), N'旅費')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1089, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'飲食費', CAST(N'2021-12-19T20:58:51.010' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1090, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'車馬費', CAST(N'2021-12-19T20:59:02.057' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1091, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'社交費', CAST(N'2021-12-19T20:59:22.263' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1092, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'教育費', CAST(N'2021-12-19T20:59:46.890' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1093, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'娛樂費', CAST(N'2021-12-19T21:00:01.087' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1094, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'購物費', CAST(N'2021-12-19T21:00:12.720' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1095, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'買菜錢', CAST(N'2021-12-19T21:00:28.283' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1096, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'車差費', CAST(N'2021-12-19T21:00:39.050' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (1097, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'快樂費', CAST(N'2021-12-19T21:01:04.417' AS DateTime), N'')
INSERT [dbo].[Category] ([ID], [UserID], [Title], [CreateTime], [Body]) VALUES (81, N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'未分類', CAST(N'2021-12-08T14:21:16.657' AS DateTime), N'未分類')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [Account], [PWD], [Name], [Email], [UserLevel], [CreateDate], [Fixdate], [onlyID]) VALUES (N'2f1be24e-8257-ec11-a4b3-a8ba67c6a071', N'Admin', N'12345678', N'Admin', N'admin@gmail.com', 0, CAST(N'2021-12-08T01:22:53.247' AS DateTime), NULL, 1)
INSERT [dbo].[UserInfo] ([ID], [Account], [PWD], [Name], [Email], [UserLevel], [CreateDate], [Fixdate], [onlyID]) VALUES (N'f2df0fdb-cb60-ec11-a4b5-e092e6859b4b', N'number', N'12345678 ', N'一般會員', N'number@gmail.com', 1, CAST(N'2021-12-19T21:02:02.150' AS DateTime), NULL, 1027)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[AccountingNote] ADD  CONSTRAINT [DF_AccountingNote_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[AccountingNote] ADD  CONSTRAINT [DF_AccountingNote_Category]  DEFAULT (N'未分類') FOR [Category]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Title]  DEFAULT (N'未分類') FOR [Title]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_category_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_ID]  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Create]  DEFAULT (getdate()) FOR [CreateDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountingNote', @level2type=N'COLUMN',@level2name=N'UserID'
GO
USE [master]
GO
ALTER DATABASE [AccountingNote] SET  READ_WRITE 
GO
