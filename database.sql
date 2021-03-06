USE [master]
GO
/****** Object:  Database [SE140882]    Script Date: 30-Sep-20 12:48:37 PM ******/
CREATE DATABASE [SE140882]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SE140882', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SE140882.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SE140882_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SE140882_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SE140882] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE140882].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE140882] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE140882] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE140882] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE140882] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE140882] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE140882] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE140882] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE140882] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE140882] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE140882] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE140882] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE140882] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE140882] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE140882] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE140882] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE140882] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE140882] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE140882] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE140882] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE140882] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE140882] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE140882] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE140882] SET RECOVERY FULL 
GO
ALTER DATABASE [SE140882] SET  MULTI_USER 
GO
ALTER DATABASE [SE140882] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE140882] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE140882] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE140882] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE140882] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SE140882]
GO
/****** Object:  Table [dbo].[tblArticle]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblArticle](
	[postID] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](100) NULL,
	[date] [datetime] NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblArticle] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[postID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[comment] [nvarchar](500) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblComment_1] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmotion]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmotion](
	[emotionID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[emotionDate] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblEmotion] PRIMARY KEY CLUSTERED 
(
	[emotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[receiver] [nvarchar](50) NULL,
	[sender] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[postID] [nvarchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblNofitication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](5) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 30-Sep-20 12:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[statusID] [nvarchar](5) NOT NULL,
	[activeCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'D05', N'sdvsd', N'adssd', NULL, CAST(N'2020-09-23 23:57:41.163' AS DateTime), N'h@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P01', N'thoi tiet', N'hom nay troi dep qua', N'', CAST(N'2020-09-20 00:00:00.000' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P02', N'nha cua', N'nha dep ghe', N'./img/1-hinh-anh-nha-1-tret-1-lau-dep-120m2.jpg', CAST(N'2020-09-19 00:00:00.000' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P03', N'huhu', N'huhuhuhu', NULL, CAST(N'2020-09-17 00:00:00.000' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P04', N'hihi', N'hihihihihi', NULL, CAST(N'2020-09-20 00:00:00.000' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P10', N'test', N'paging', N'', CAST(N'2020-09-24 01:46:20.207' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P11', N'hieu', N'ahihihihihihi', N'hinhnenanime2-749x499.jpg', CAST(N'2020-09-26 00:39:56.973' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P12', N'hieu', N'ahihihihihihi', N'', CAST(N'2020-09-26 10:55:38.597' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P13', N'hieu', N'ahihihihihihi', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-26 10:57:54.980' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P14', N'test', N'upfile', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-27 15:37:53.583' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P15', N'hieu', N'ahihihihihihi', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-28 09:30:03.450' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P16', N'hello', N'i am a member', N'./img/', CAST(N'2020-09-28 10:08:57.530' AS DateTime), N'hieu03012000@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P17', N'hieu', N'ahihihihihihi', N'./img/', CAST(N'2020-09-29 01:28:50.043' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P18', N'hieu', N'ahihihihihihi', N'./img/', CAST(N'2020-09-29 01:29:06.123' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P19', N'hieu', N'ahihihihihihi', N'./img/', CAST(N'2020-09-29 01:29:13.350' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P21', N'hieu', N'ahihihihihihi', N'./img/', CAST(N'2020-09-29 01:35:07.540' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P22', N'hieu', N'ahihihihihihi', N'./img/', CAST(N'2020-09-29 01:36:11.360' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P25', N'test', N'test post', N'./img/', CAST(N'2020-09-29 08:07:32.403' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P26', N'test', N'test', N'', CAST(N'2020-09-29 08:08:55.467' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P27', N'hello', N'hello', N'', CAST(N'2020-09-30 01:32:04.010' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P28', N'123', N'123', N'', CAST(N'2020-09-30 09:56:05.550' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P29', N'123', N'123', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-30 09:59:23.177' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P30', N'123', N'123', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-30 10:04:15.270' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P31', N'123', N'123', N'', CAST(N'2020-09-30 10:06:36.500' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P32', N'123123', N'123', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-30 10:07:53.480' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P33', N'123', N'1232', N'', CAST(N'2020-09-30 10:10:36.087' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P34', N'123', N'123', N'', CAST(N'2020-09-30 10:10:43.527' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P35', N'123', N'123', N'', CAST(N'2020-09-30 10:10:54.193' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P36', N'123', N'123', N'', CAST(N'2020-09-30 10:13:55.620' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P37', N'123', N'123', N'', CAST(N'2020-09-30 10:14:34.157' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P38', N'123', N'123', N'', CAST(N'2020-09-30 10:15:32.460' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P39', N'123', N'123', N'', CAST(N'2020-09-30 10:17:50.290' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P40', N'123', N'123', N'', CAST(N'2020-09-30 10:19:01.060' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P41', N'123', N'123', N'', CAST(N'2020-09-30 10:19:26.087' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P42', N'test', N'123', N'', CAST(N'2020-09-30 10:24:44.447' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P43', N'hieu', N'VÄn há»c theo cÃ¡ch nÃ³i chung nháº¥t, lÃ  báº¥t ká»³ tÃ¡c pháº©m nÃ o báº±ng vÄn báº£n. Hiá»u theo nghÄ©a háº¹p hÆ¡n, thÃ¬ vÄn há»c lÃ  dáº¡ng vÄn báº£n ÄÆ°á»£c coi lÃ  má»t hÃ¬nh thá»©c nghá» thuáº­t, hoáº·c báº¥t ká»³ má»t bÃ i viáº¿t nÃ o ÄÆ°á»£c coi lÃ  cÃ³ giÃ¡ trá» nghá» thuáº­t hoáº·c trÃ­ tuá», thÆ°á»ng lÃ  do cÃ¡ch thá»©c triá»n khai ngÃ´n ngá»¯ theo nhá»¯ng cÃ¡ch khÃ¡c vá»i cÃ¡ch sá»­ dá»¥ng bÃ¬nh thÆ°á»ng. Trong cÃ¡c Äá»nh nghÄ©a hiá»n Äáº¡i hÆ¡n, vÄn há»c bao hÃ m cáº£ cÃ¡c vÄn báº£n ÄÆ°á»£c nÃ³i ra hoáº·c ÄÆ°á»£c hÃ¡t lÃªn (vÄn há»c truyá»n miá»ng). Sá»± phÃ¡t triá»n trong cÃ´ng nghá» in áº¥n ÄÃ£ cho phÃ©p phÃ¢n phá»i vÃ  phÃ¡t triá»n cÃ¡c tÃ¡c pháº©m chá»¯ viáº¿t, vÃ  táº¡o ra loáº¡i vÄn há»c Äiá»n tá»­.', N'', CAST(N'2020-09-30 10:46:45.757' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P44', N'hieu', N'Literature broadly refers to any collection of written or oral work, but it more commonly and narrowly refers to writings specifically considered to be an art form, especially prose fiction, drama, and poetry, in contrast to academic writing and newspapers.[1] In recent centuries, the definition has expanded to now include oral literature, much of which has been transcribed.[2]

Literature, as an art form, can also include works in various non-fiction genres, such as autobiography, diaries, memoir, letters, and the essay, as well as in the disciplines of history and philosophy.[3]

Its Latin root literatura/litteratura (from littera: letter of the alphabet or handwriting) was used to refer to all written accounts. Developments in print technology have allowed an ever-growing distribution and proliferation of written works, which now includes electronic literature.', N'', CAST(N'2020-09-30 10:47:33.670' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P45', N'hieu', N'Literature broadly refers to any collection of written or oral work, but it more commonly and narrowly refers to writings specifically considered to be an art form, especially prose fiction, drama, and poetry, in contrast to academic writing and newspapers.[1] In recent centuries, the definition has expanded to now include oral literature, much of which has been transcribed.[2]

Literature, as an art form, can also include works in various non-fiction genres, such as autobiography, diaries, memoir, letters, and the essay, as well as in the disciplines of history and philosophy.[3]

Its Latin root literatura/litteratura (from littera: letter of the alphabet or handwriting) was used to refer to all written accounts. Developments in print technology have allowed an ever-growing distribution and proliferation of written works, which now includes electronic literature.', N'', CAST(N'2020-09-30 10:53:18.227' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P46', N'hieu', N'Literature broadly refers to any collection of written or oral work, but it more commonly and narrowly refers to writings specifically considered to be an art form, especially prose fiction, drama, and poetry, in contrast to academic writing and newspapers.[1] In recent centuries, the definition has expanded to now include oral literature, much of which has been transcribed.[2]

Literature, as an art form, can also include works in various non-fiction genres, such as autobiography, diaries, memoir, letters, and the essay, as well as in the disciplines of history and philosophy.[3]

Its Latin root literatura/litteratura (from littera: letter of the alphabet or handwriting) was used to refer to all written accounts. Developments in print technology have allowed an ever-growing distribution and proliferation of written works, which now includes electronic literature.', N'', CAST(N'2020-09-30 10:53:34.463' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P47', N'123', N'huhu', N'', CAST(N'2020-09-30 10:54:39.223' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P48', N'123', N'huhu', N'', CAST(N'2020-09-30 10:54:42.623' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P49', N'123', N'huhu', N'', CAST(N'2020-09-30 10:54:44.870' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P5', N'hieu', N'ahihihihihihi', N'', CAST(N'2020-09-24 01:39:30.307' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P50', N'123', N'huhu', N'', CAST(N'2020-09-30 10:54:46.177' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P51', N'123', N'Literature broadly refers to any collection of written or oral work, but it more commonly and narrowly refers to writings specifically considered to be an art form, especially prose fiction, drama, and poetry, in contrast to academic writing and newspapers.[1] In recent centuries, the definition has expanded to now include oral literature, much of which has been transcribed.[2]

Literature, as an art form, can also include works in various non-fiction genres, such as autobiography, diaries, memoir, letters, and the essay, as well as in the disciplines of history and philosophy.[3]

Its Latin root literatura/litteratura (from littera: letter of the alphabet or handwriting) was used to refer to all written accounts. Developments in print technology have allowed an ever-growing distribution and proliferation of written works, which now includes electronic literature.', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-30 10:57:22.583' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P52', N'hieu', N'Literature broadly refers to any collection of written or oral work, but it more commonly and narrowly refers to writings specifically considered to be an art form, especially prose fiction, drama, and poetry, in contrast to academic writing and newspapers.[1] In recent centuries, the definition has expanded to now include oral literature, much of which has been transcribed.[2]

Literature, as an art form, can also include works in various non-fiction genres, such as autobiography, diaries, memoir, letters, and the essay, as well as in the disciplines of history and philosophy.[3]

Its Latin root literatura/litteratura (from littera: letter of the alphabet or handwriting) was used to refer to all written accounts. Developments in print technology have allowed an ever-growing distribution and proliferation of written works, which now includes electronic literature.', N'', CAST(N'2020-09-30 10:57:44.467' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P53', N'hieu', N'123', N'', CAST(N'2020-09-30 11:16:54.023' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P54', N'123', N'123', N'./img/hinhnenanime2-749x499.jpg', CAST(N'2020-09-30 11:18:23.827' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P55', N'123', N'123', N'', CAST(N'2020-09-30 11:18:35.170' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P56', N'123', N'123', N'', CAST(N'2020-09-30 11:18:41.460' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P57', N'123', N'123', N'', CAST(N'2020-09-30 11:19:31.460' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P58', N'123123', N'123', N'', CAST(N'2020-09-30 11:19:39.143' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P59', N'123123', N'123', N'', CAST(N'2020-09-30 11:19:51.977' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P6', N'hieu', N'ahihihihihihi', N'', CAST(N'2020-09-24 01:39:39.797' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P60', N'123123', N'123', N'', CAST(N'2020-09-30 11:21:17.317' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P61', N'123123', N'123123', N'', CAST(N'2020-09-30 11:22:35.897' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P62', N'123123', N'123123123', N'', CAST(N'2020-09-30 11:22:48.637' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P63', N'12', N'123', N'', CAST(N'2020-09-30 11:23:08.497' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P64', N'12', N'12', N'', CAST(N'2020-09-30 11:23:17.503' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P65', N'12', N'12', N'', CAST(N'2020-09-30 11:23:37.297' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P66', N'123', N'123', N'', CAST(N'2020-09-30 11:26:03.463' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P67', N'123', N'123', N'', CAST(N'2020-09-30 11:26:06.533' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P68', N'123', N'123123', N'', CAST(N'2020-09-30 11:29:25.377' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P69', N'test', N'123', N'', CAST(N'2020-09-30 11:32:08.727' AS DateTime), N'hieu@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P7', N'hieu', N'ahihihihihihi', N'', CAST(N'2020-09-24 01:40:10.113' AS DateTime), N'hieu@gmail.com', 0)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P8', N'chao moi nguoi', N'tui la Phuong', N'', CAST(N'2020-09-24 01:41:42.003' AS DateTime), N'phuong@gmail.com', 1)
INSERT [dbo].[tblArticle] ([postID], [title], [description], [image], [date], [mail], [status]) VALUES (N'P9', N'chao moi nguoi', N'ahihihihihihi', N'', CAST(N'2020-09-24 01:44:08.740' AS DateTime), N'phuong@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (1, N'hieu@gmail.com', N'P01', CAST(N'2020-09-20 00:00:00.000' AS DateTime), N'ahihi', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (2, N'hieu@gmail.com', N'P01', CAST(N'2020-09-20 00:00:00.000' AS DateTime), N'comment', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (3, N'hieu@gmail.com', N'P04', CAST(N'2020-09-21 00:00:00.000' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (4, N'phuong@gmail.com', N'P04', CAST(N'2020-09-22 00:00:00.000' AS DateTime), N'tui cung comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (5, N'hieu@gmail.com', N'P03', CAST(N'2020-09-22 00:00:00.000' AS DateTime), N'huhuhu', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (6, N'hieu@gmail.com', N'P02', CAST(N'2020-09-23 00:00:00.000' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (7, N'hieu@gmail.com', N'P02', CAST(N'2020-09-23 00:00:00.000' AS DateTime), N'nha dep that', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (8, N'hieu@gmail.com', N'P03', CAST(N'2020-09-23 23:57:41.163' AS DateTime), N'tui comment ne', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (9, N'hieu@gmail.com', N'P03', CAST(N'2020-09-23 23:57:43.653' AS DateTime), N'sdfsdfsdfdsfsdfsdfsdfsdfsfsdfsdf', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (10, N'phuong@gmail.com', N'P9', CAST(N'2020-09-24 01:44:19.043' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (11, N'phuong@gmail.com', N'P9', CAST(N'2020-09-24 01:44:25.677' AS DateTime), N'huhuhu', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (12, N'hieu@gmail.com', N'P10', CAST(N'2020-09-25 00:07:02.800' AS DateTime), N'sdfsdfsdfdsfsdfsdfsdfsdfsfsdfsdf', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (13, N'hieu@gmail.com', N'P6', CAST(N'2020-09-25 00:29:25.653' AS DateTime), N'sdfsdfsdfdsfsdfsdfsdfsdfsfsdfsdf', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (14, N'hieu@gmail.com', N'P6', CAST(N'2020-09-25 00:29:28.767' AS DateTime), N'tui comment ne', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (15, N'hieu@gmail.com', N'P6', CAST(N'2020-09-25 00:29:32.997' AS DateTime), N'huhuhu', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (16, N'hieu@gmail.com', N'P9', CAST(N'2020-09-25 22:28:51.973' AS DateTime), N'chao ban', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (17, N'hieu@gmail.com', N'P13', CAST(N'2020-09-26 10:58:27.043' AS DateTime), N'de thun qua ', 0)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (19, N'hieu@gmail.com', N'P14', CAST(N'2020-09-27 15:44:27.303' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (20, N'h@gmail.com', N'P02', CAST(N'2020-09-27 21:56:30.593' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (21, N'h@gmail.com', N'P04', CAST(N'2020-09-27 21:58:02.977' AS DateTime), N'huhuhu', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (22, N'h@gmail.com', N'P10', CAST(N'2020-09-27 22:02:07.570' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (23, N'h@gmail.com', N'P12', CAST(N'2020-09-27 22:09:41.043' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (24, N'h@gmail.com', N'P10', CAST(N'2020-09-27 22:13:32.720' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (25, N'h@gmail.com', N'P01', CAST(N'2020-09-27 22:24:13.687' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (26, N'h@gmail.com', N'P02', CAST(N'2020-09-27 22:35:06.430' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (27, N'hieu@gmail.com', N'D05', CAST(N'2020-09-27 23:51:23.400' AS DateTime), N'test noti', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (28, N'hieu@gmail.com', N'P26', CAST(N'2020-09-29 08:25:27.887' AS DateTime), N'tui comment ne', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (29, N'phuong@gmail.com', N'P02', CAST(N'2020-09-30 00:03:07.123' AS DateTime), N'test', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (30, N'phuong@gmail.com', N'P8', CAST(N'2020-09-30 00:04:01.740' AS DateTime), N'test', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (31, N'phuong@gmail.com', N'P12', CAST(N'2020-09-30 00:04:52.017' AS DateTime), N'test', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (32, N'phuong@gmail.com', N'P01', CAST(N'2020-09-30 00:13:31.740' AS DateTime), N'yessss', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (33, N'hieu@gmail.com', N'P02', CAST(N'2020-09-30 00:31:25.347' AS DateTime), N'hihi', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (34, N'hieu@gmail.com', N'P02', CAST(N'2020-09-30 00:31:32.073' AS DateTime), N'haha', 1)
INSERT [dbo].[tblComment] ([commentID], [email], [postID], [date], [comment], [status]) VALUES (35, N'hieu@gmail.com', N'P02', CAST(N'2020-09-30 00:36:33.403' AS DateTime), N'test sc', 1)
SET IDENTITY_INSERT [dbo].[tblComment] OFF
SET IDENTITY_INSERT [dbo].[tblEmotion] ON 

INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (1, N'P01', N'hieu@gmail.com', N'Like', CAST(N'2020-09-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (2, N'P01', N'h@gmail.com', N'Dislike', CAST(N'2020-09-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (3, N'P01', N'phuong@gmail.com', N'Like', CAST(N'2020-09-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (25, N'P14', N'hieu@gmail.com', N'Like', CAST(N'2020-09-27 17:41:22.077' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (26, N'P14', N'h@gmail.com', N'Like', CAST(N'2020-09-27 23:51:44.137' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (32, N'P9', N'hieu@gmail.com', N'Like', CAST(N'2020-09-30 00:13:51.527' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (33, N'P26', N'phuong@gmail.com', N'Dislike', CAST(N'2020-09-30 00:14:53.773' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (34, N'P10', N'hieu@gmail.com', N'Like', CAST(N'2020-09-30 00:57:47.267' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (38, N'P12', N'hieu@gmail.com', N'Like  0', CAST(N'2020-09-30 01:03:08.460' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (39, N'P26', N'hieu@gmail.com', N'Like', CAST(N'2020-09-30 01:04:10.157' AS DateTime), 1)
INSERT [dbo].[tblEmotion] ([emotionID], [postID], [email], [type], [emotionDate], [status]) VALUES (40, N'P02', N'hieu@gmail.com', N'Dislike', CAST(N'2020-09-30 01:04:21.093' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmotion] OFF
SET IDENTITY_INSERT [dbo].[tblNotification] ON 

INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (3, N'hieu@gmail.com', N'h@gmail.com', N'comment', N'P02', CAST(N'2020-09-27 22:35:06.437' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (4, N'h@gmail.com', N'hieu@gmail.com', N'comment', N'D05', CAST(N'2020-09-27 23:51:23.410' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (5, N'hieu@gmail.com', N'h@gmail.com', N'like', N'P14', CAST(N'2020-09-27 23:51:44.140' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (6, N'hieu@gmail.com', N'phuong@gmail.com', N'comment', N'P02', CAST(N'2020-09-30 00:03:07.133' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (7, N'hieu@gmail.com', N'phuong@gmail.com', N'comment', N'P12', CAST(N'2020-09-30 00:04:52.020' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (8, N'hieu@gmail.com', N'phuong@gmail.com', N'comment', N'P01', CAST(N'2020-09-30 00:13:31.747' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (9, N'phuong@gmail.com', N'hieu@gmail.com', N'like', N'P9', CAST(N'2020-09-30 00:13:51.530' AS DateTime))
INSERT [dbo].[tblNotification] ([ID], [receiver], [sender], [type], [postID], [date]) VALUES (10, N'hieu@gmail.com', N'phuong@gmail.com', N'dislike', N'P26', CAST(N'2020-09-30 00:14:53.780' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblNotification] OFF
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'A', N'Active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'D', N'Delete')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'N', N'New')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'h@gmail.com', N'hieu', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'A', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'hieu@gmail.com', N'HieuNguyen', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'A', NULL)
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'hieu03012000@gmail.com', N'hieu', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'A', N'bJuupyWiCk')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'hihi@abc.com', N'sdf', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'N', N'EGMPezeC9Y')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'hihi@gmail.com', N'123', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'N', N'vTaxMMXe01')
INSERT [dbo].[tblUser] ([email], [name], [password], [role], [statusID], [activeCode]) VALUES (N'phuong@gmail.com', N'phuongpham', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'Member', N'A', NULL)
ALTER TABLE [dbo].[tblArticle]  WITH CHECK ADD  CONSTRAINT [FK_tblArticle_tblUser] FOREIGN KEY([mail])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblArticle] CHECK CONSTRAINT [FK_tblArticle_tblUser]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblArticle1] FOREIGN KEY([postID])
REFERENCES [dbo].[tblArticle] ([postID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblArticle1]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser1] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUser1]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblArticle1] FOREIGN KEY([postID])
REFERENCES [dbo].[tblArticle] ([postID])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblArticle1]
GO
ALTER TABLE [dbo].[tblEmotion]  WITH CHECK ADD  CONSTRAINT [FK_tblEmotion_tblUser1] FOREIGN KEY([email])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblEmotion] CHECK CONSTRAINT [FK_tblEmotion_tblUser1]
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD  CONSTRAINT [FK_tblNofitication_tblArticle] FOREIGN KEY([postID])
REFERENCES [dbo].[tblArticle] ([postID])
GO
ALTER TABLE [dbo].[tblNotification] CHECK CONSTRAINT [FK_tblNofitication_tblArticle]
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD  CONSTRAINT [FK_tblNofitication_tblUser] FOREIGN KEY([receiver])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblNotification] CHECK CONSTRAINT [FK_tblNofitication_tblUser]
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD  CONSTRAINT [FK_tblNofitication_tblUser1] FOREIGN KEY([sender])
REFERENCES [dbo].[tblUser] ([email])
GO
ALTER TABLE [dbo].[tblNotification] CHECK CONSTRAINT [FK_tblNofitication_tblUser1]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [SE140882] SET  READ_WRITE 
GO
