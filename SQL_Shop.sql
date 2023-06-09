USE [master]
GO
/****** Object:  Database [Garden_Shop]    Script Date: 05/15/23 11:07:48 PM ******/
CREATE DATABASE [Garden_Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Garden_Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Garden_Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Garden_Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Garden_Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Garden_Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Garden_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Garden_Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Garden_Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Garden_Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Garden_Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Garden_Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Garden_Shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Garden_Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Garden_Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Garden_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Garden_Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Garden_Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Garden_Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Garden_Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Garden_Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Garden_Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Garden_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Garden_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Garden_Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Garden_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Garden_Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Garden_Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Garden_Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Garden_Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Garden_Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Garden_Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Garden_Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Garden_Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Garden_Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Garden_Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Garden_Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Garden_Shop] SET QUERY_STORE = OFF
GO
USE [Garden_Shop]
GO
/****** Object:  User [sa]    Script Date: 05/15/23 11:07:48 PM ******/
CREATE USER [sa] FOR LOGIN [sa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 05/15/23 11:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [nvarchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05/15/23 11:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 05/15/23 11:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05/15/23 11:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 05/15/23 11:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (1, N'admin@gmail.com', N'admin', N'Admin', N'123456', 1, N'AD')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (2, N'test@gmail.com', N'test', N'TEST', N'0123456789', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (3, N'bb@gmail.com', N'bb', N'bb', N'12345', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (4, N'cc@gmail.com', N'cc', N'cc', N'123', 0, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (5, N'nn@gmail.com', N'nn', N'nn', N'5555', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (7, N'WS1@gmail.com', N'ws1', N'ws1', N'00112233', 0, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (8, N'aaaaaa@gmail.com', N'aaaaaa', N'aaaaaa', N'444444', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (9, N'llllll@gmail.com', N'admin', N'oo', N'45', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (10, N'check@gmail.com', N'check', N'check', N'123', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (11, N'lalala@gmail.com', N'lalala', N'lalala', N'123', 1, N'US')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (12, N'quang@gmail.com', N'quang', N'quang', N'123', 1, N'US')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'roses')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'hoa gia')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'other')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N's')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 2, 1, 4)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 2, 2, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 2, 3, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (5, 3, 1, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (6, 3, 3, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (7, 4, 1, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (8, 4, 3, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (9, 5, 3, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (10, 5, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2023-04-24' AS Date), NULL, 3, 2)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2023-04-18' AS Date), NULL, 3, 2)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2023-04-24' AS Date), NULL, 3, 10)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2023-04-24' AS Date), NULL, 1, 2)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2023-04-24' AS Date), NULL, 3, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 

INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'Hoa Hồng Đỏ', 100, N'img/hoahongdo.jfif', N'This is Hoa Hong', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'Hoa Mộc Lan Giả', 200, N'img/hoamoclangia.jfif', N'This is Hoa Moc Lan Gia', 1, 2)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'Hoa Hồng Cam', 150, N'img/hoahongtrang.jfif', N'This í Hoa Hong Trang', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'Hoa Tulip', 320, N'img/hoatulip.jfif', N'This is hoa tulip', 1, 1)
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E616488F920D4]    Script Date: 05/15/23 11:07:49 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Plants] ([PID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]='AD' OR [role]='US'))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [Garden_Shop] SET  READ_WRITE 
GO
