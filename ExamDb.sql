USE [master]
GO
/****** Object:  Database [Exam]    Script Date: 18.12.2024 21:10:40 ******/
CREATE DATABASE [Exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Exam_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Exam_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Exam.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Exam] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Exam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Exam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Exam] SET RECOVERY FULL 
GO
ALTER DATABASE [Exam] SET  MULTI_USER 
GO
ALTER DATABASE [Exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Exam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Exam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Exam', N'ON'
GO
ALTER DATABASE [Exam] SET QUERY_STORE = ON
GO
ALTER DATABASE [Exam] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Exam]
GO
/****** Object:  Table [dbo].[ExamManufacturer]    Script Date: 18.12.2024 21:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamManufacturer](
	[MunufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ExamManufacturer] PRIMARY KEY CLUSTERED 
(
	[MunufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamOrder]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderPickupCode] [int] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAFC7CC9AED] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamOrderProduct]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A266255BBC081] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamPickupPoint]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamPickupPoint](
	[OrderPickupPoint] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamProduct]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamProduct](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ManufacturerId] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamProd__2EA7DCD5BF55BCD9] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRole]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamRole](
	[RoleID] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__ExamRole__8AFACE3AA2D40FB8] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamUser]    Script Date: 18.12.2024 21:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [tinyint] NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamUser__1788CCAC0829F7A9] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ExamManufacturer] ON 

INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (2, N'Giorgio Armani S.p.A.')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (3, N'Lacoste')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (4, N'Marc')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (5, N'Bugatti')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (6, N'Gucci')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (7, N'Victoria''s Secret')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (8, N'Belor Design')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (9, N'Urban Decay')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (10, N'Influence Beauty')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (11, N'Студия Рандом')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (12, N'By Terry')
INSERT [dbo].[ExamManufacturer] ([MunufacturerId], [Name]) VALUES (13, N'Chanel ')
SET IDENTITY_INSERT [dbo].[ExamManufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamOrder] ON 

INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1, 1, N'Новый', CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2024-11-22T00:00:00.000' AS DateTime), 24, 201)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (2, NULL, N'Новый ', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 25, 202)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (3, 2, N'Завершен', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2024-06-06T00:00:00.000' AS DateTime), 26, 203)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (4, NULL, N'Новый ', CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, 204)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (5, 3, N'Новый ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, 205)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (6, NULL, N'Завершен', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 29, 206)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (7, NULL, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, 207)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (8, NULL, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, 208)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (9, 4, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 32, 209)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (10, NULL, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, 210)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (17, NULL, N'Новый', CAST(N'2024-06-22T20:05:28.863' AS DateTime), CAST(N'2024-06-26T20:05:28.863' AS DateTime), 23, 222)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (18, NULL, N'Новый', CAST(N'2024-06-22T20:10:45.823' AS DateTime), CAST(N'2024-06-28T20:10:45.823' AS DateTime), 36, 223)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (19, NULL, N'Новый', CAST(N'2024-06-22T20:25:11.190' AS DateTime), CAST(N'2024-06-26T20:25:11.190' AS DateTime), 17, 224)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (20, NULL, N'Новый', CAST(N'2024-06-22T20:25:29.650' AS DateTime), CAST(N'2024-06-25T20:25:29.650' AS DateTime), 16, 225)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (21, NULL, N'Новый', CAST(N'2024-06-22T22:08:49.527' AS DateTime), CAST(N'2024-06-27T22:08:49.527' AS DateTime), 30, 226)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (22, NULL, N'Новый', CAST(N'2024-06-22T22:12:44.847' AS DateTime), CAST(N'2024-06-26T22:12:44.847' AS DateTime), 2, 227)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (23, NULL, N'Новый', CAST(N'2024-06-22T22:13:45.833' AS DateTime), CAST(N'2024-06-27T22:13:45.833' AS DateTime), 25, 228)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (24, NULL, N'Новый', CAST(N'2024-06-22T22:15:56.330' AS DateTime), CAST(N'2024-07-29T00:00:00.000' AS DateTime), 2, 229)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (25, NULL, N'Новый', CAST(N'2024-06-22T22:42:07.133' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 12, 230)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (26, NULL, N'Новый', CAST(N'2024-06-22T22:42:37.980' AS DateTime), CAST(N'2024-06-27T22:42:37.980' AS DateTime), 8, 1907)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (27, 2, N'Новый', CAST(N'2024-06-22T22:45:41.293' AS DateTime), CAST(N'2024-06-28T22:45:41.293' AS DateTime), 9, 240)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (28, NULL, N'Новый', CAST(N'2024-06-22T22:48:11.793' AS DateTime), CAST(N'2024-06-25T22:48:11.793' AS DateTime), 14, 241)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (29, NULL, N'Новый', CAST(N'2024-06-22T23:02:44.557' AS DateTime), CAST(N'2024-06-26T23:02:44.557' AS DateTime), 2, 242)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (30, NULL, N'Новый', CAST(N'2024-06-23T11:23:49.117' AS DateTime), CAST(N'2024-06-28T11:23:49.117' AS DateTime), 36, 243)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (31, 25, N'Завершен', CAST(N'2024-06-23T11:24:44.207' AS DateTime), CAST(N'2024-06-27T00:00:00.000' AS DateTime), 29, 244)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (32, 1, N'Новый', CAST(N'2024-06-23T11:33:20.737' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 2, 245)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (33, NULL, N'Завершен', CAST(N'2024-06-23T12:14:32.067' AS DateTime), CAST(N'2024-06-28T00:00:00.000' AS DateTime), 20, 246)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1032, NULL, N'Новый', CAST(N'2024-06-28T17:16:16.033' AS DateTime), CAST(N'2024-07-04T17:16:16.033' AS DateTime), 23, 247)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1033, NULL, N'Новый', CAST(N'2024-09-03T14:58:25.007' AS DateTime), CAST(N'2024-09-09T14:58:25.007' AS DateTime), 23, 248)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1034, 53, N'Новый', CAST(N'2024-12-18T14:11:55.660' AS DateTime), CAST(N'2024-12-25T14:11:55.660' AS DateTime), 3, 249)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1035, 53, N'Новый', CAST(N'2024-12-18T16:48:32.307' AS DateTime), CAST(N'2024-12-24T16:48:32.307' AS DateTime), 1, 392)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1039, NULL, N'Новый', CAST(N'2024-12-18T18:06:14.810' AS DateTime), CAST(N'2024-12-23T18:06:14.810' AS DateTime), 1, 541)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1040, NULL, N'Новый', CAST(N'2024-12-18T18:08:00.083' AS DateTime), CAST(N'2024-12-25T18:08:00.083' AS DateTime), 16, 280)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1041, 53, N'Новый', CAST(N'2024-12-18T18:19:36.933' AS DateTime), CAST(N'2024-12-24T18:19:36.933' AS DateTime), 35, 899)
INSERT [dbo].[ExamOrder] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1042, 53, N'Новый', CAST(N'2024-12-18T18:22:02.783' AS DateTime), CAST(N'2024-12-23T18:22:02.783' AS DateTime), 1, 703)
SET IDENTITY_INSERT [dbo].[ExamOrder] OFF
GO
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'F893T5', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'E530Y6', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F346G5', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D344Y7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J432E4', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D378D3', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'E245R5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'H732R5', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'R464G6', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'E573G6', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K535G6', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'F344S4', 6)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G532R5', 5)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'D526R4', 5)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'S753T5', 4)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'A436H7', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'V472S3', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'E479G6', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'O875F6', 4)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (17, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (18, N'A436H7', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (19, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (20, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (21, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (21, N'S753T5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (22, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (23, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (24, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (25, N'D344Y7', 4)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (25, N'J432E4', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (26, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (26, N'D526R4', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (26, N'S753T5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (27, N'A436H7', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (27, N'D526R4', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (27, N'S753T5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (28, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (28, N'E479G6', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (29, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (29, N'S753T5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (30, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (31, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (31, N'J432E4', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (32, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (32, N'А112Т4', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (33, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1032, N'А112Т4', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1033, N'A436H7', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1034, N'A436H7', 2)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1034, N'D344Y7', 3)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1035, N'A436H7', 5)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1039, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1040, N'A436H7', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1041, N'G532R5', 1)
INSERT [dbo].[ExamOrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1042, N'A436H7', 1)
GO
SET IDENTITY_INSERT [dbo].[ExamPickupPoint] ON 

INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (1, N'344288, г. Ангарск, ул. Чехова, 1')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (2, N'614164, г.Ангарск,  ул. Степная, 30')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (3, N'394242, г. Ангарск, ул. Коммунистическая, 43')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (4, N'660540, г. Ангарск, ул. Солнечная, 25')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (5, N'125837, г. Ангарск, ул. Шоссейная, 40')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (6, N'125703, г. Ангарск, ул. Партизанская, 49')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (7, N'625283, г. Ангарск, ул. Победы, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (8, N'614611, г. Ангарск, ул. Молодежная, 50')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (9, N'454311, г.Ангарск, ул. Новая, 19')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (10, N'660007, г.Ангарск, ул. Октябрьская, 19')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (11, N'603036, г. Ангарск, ул. Садовая, 4')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (12, N'450983, г.Ангарск, ул. Комсомольская, 26')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (13, N'394782, г. Ангарск, ул. Чехова, 3')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (14, N'603002, г. Ангарск, ул. Дзержинского, 28')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (15, N'450558, г. Ангарск, ул. Набережная, 30')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (16, N'394060, г.Ангарск, ул. Фрунзе, 43')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (17, N'410661, г. Ангарск, ул. Школьная, 50')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (18, N'625590, г. Ангарск, ул. Коммунистическая, 20')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (19, N'625683, г. Ангарск, ул. 8 Марта')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (20, N'400562, г. Ангарск, ул. Зеленая, 32')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (21, N'614510, г. Ангарск, ул. Маяковского, 47')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (22, N'410542, г. Ангарск, ул. Светлая, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (23, N'620839, г. Ангарск, ул. Цветочная, 8')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (24, N'443890, г. Ангарск, ул. Коммунистическая, 1')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (25, N'603379, г. Ангарск, ул. Спортивная, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (26, N'603721, г. Ангарск, ул. Гоголя, 41')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (27, N'410172, г. Ангарск, ул. Северная, 13')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (28, N'420151, г. Ангарск, ул. Вишневая, 32')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (29, N'125061, г. Ангарск, ул. Подгорная, 8')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (30, N'630370, г. Ангарск, ул. Шоссейная, 24')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (31, N'614753, г. Ангарск, ул. Полевая, 35')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (32, N'426030, г. Ангарск, ул. Маяковского, 44')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (33, N'450375, г. Ангарск ул. Клубная, 44')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (34, N'625560, г. Ангарск, ул. Некрасова, 12')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (35, N'630201, г. Ангарск, ул. Комсомольская, 17')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (36, N'190949, г. Ангарск, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[ExamPickupPoint] OFF
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A436H7', N'Тени Giorgio Armani Business', N'Мягкий и нежный 27 оттенок.', N'Косметика', N'pack://application:,,,/Images/тени_GiorgioArmani.jpg', 2, CAST(2399.0000 AS Decimal(19, 4)), 99, 16, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D344Y7', N'Парфюм Lacoste Classic', N'Насыщенный запах кофе и пчелинного мёда.', N'Парфюмерия', N'pack://application:,,,/Images/парфюм_Lacoste.jpg', 3, CAST(31999.0000 AS Decimal(19, 4)), 13, 47, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D378D3', N'Парфюм Mark Jacobs eXecutive', N'Утонченный древесный аромат.', N'Парфюмерия', N'pack://application:,,,/Images/парфюм_MarcJacobs.jpg', 4, CAST(12799.0000 AS Decimal(19, 4)), 18, 266, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D526R4', N'Парфюм Bugatti Dinamic Blue water', N'Сладкий и дерзкий лайм', N'Парфюмерия', N'pack://application:,,,/Images/парфюм_Bugatti.jpg', 5, CAST(1499.0000 AS Decimal(19, 4)), 45, 84, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E245R5', N'Парфюм Gucci Miu', N'Вдохновленный летом, запах росы и Жень Шень.', N'Парфюмерия', N'pack://application:,,,/Images/парфюм_Gucci.jpg', 6, CAST(16099.0000 AS Decimal(19, 4)), 18, 100, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E479G6', N'Помада Victoria''s Secret GIA', N'Водостойкая помада привлекательного, манящего красного цвета.', N'Косметика', N'pack://application:,,,/Images/помада_Victoria''sSecret.jpg', 7, CAST(1099.0000 AS Decimal(19, 4)), 0, 0, N'Нет в наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E530Y6', N'Belor Design Nude', N'Делает вашу кожу совершенной.', N'Косметика', N'pack://application:,,,/Images/тональныйкрем_BelorDesignNude.jpg', 8, CAST(4899.0000 AS Decimal(19, 4)), 7, 20, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Тени Urban wth Beidge', N'Теплый цвет, напоминающий начной Лондон', N'Косметика', N'pack://application:,,,/Images/тени_urban.jpg', 9, CAST(41999.0000 AS Decimal(19, 4)), 40, 41, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Тушь L''Oreal Paris FE', N'Уверенный взгляд кошки.', N'Косметика', N'pack://application:,,,/Images/тушь_L''OrealParis.jpg', 2, CAST(9999.0000 AS Decimal(19, 4)), 25, 18, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'Помада Dior DB', N'Роскошный бордовый цвет.', N'Косметика', N'pack://application:,,,/Images/помада_Dior.jpg', 3, CAST(1499.0000 AS Decimal(19, 4)), 11, 45, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'Парфюм Dior Sauvage', N'Раскрытие нот амброксана и сливочной ванили.', N'Парфюмерия', N'pack://application:,,,/Images/парфюм_Dior.jpg', 4, CAST(6499.0000 AS Decimal(19, 4)), 6, 19, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Парфюм Tom Ford OMBRE LEATHER', N'Цепляющий запах мяты и лимона.', N'Парфюмерия', N'pack://application:,,,/Images/Парфюм_TomFord.jpg', 5, CAST(47199.0000 AS Decimal(19, 4)), 40, 56, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'Блеск для губ Beauty Bomb Pinq', N'Ультраглянцевый блезк нежно-розового цвета', N'Косметика', N'pack://application:,,,/Images/Блескдлягуб_BeautyBomb.jpg', 6, CAST(32199.0000 AS Decimal(19, 4)), 18, 410, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Парфюм Chloe Chloe CG', N'Аромат отборных роз и лилий.', N'Парфюмерия', N'pack://application:,,,/Images/Парфюм_ChloeChloe.jpg', 7, CAST(4899.0000 AS Decimal(19, 4)), 12, 150, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Парфюм Maison Margiela Lovely', N'Свежий и насыщенный аромат Парижа на рассвете.', N'Парфюмерия', N'pack://application:,,,/Images/Парфюм_MaisonMargiela.jpg', 8, CAST(65099.0000 AS Decimal(19, 4)), 20, 88, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'Помада Vivienne Sabo DF', N'Увлажняющая матовая помада бежевого цвета.', N'Косметика', N'pack://application:,,,/Images/Помада_VivienneSabo.png', 9, CAST(2799.0000 AS Decimal(19, 4)), 30, 41, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'Консиллер Influence Beauty BM23', N'Легкий тон для всех типов кожи.', N'Косметика', N'pack://application:,,,/Images/Консиллер_InfluenceBeauty.jpg', 10, CAST(12599.0000 AS Decimal(19, 4)), 18, 11, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'Бронзер By Terry SE', N'Питательный для лица и тела.', N'Косметика', N'pack://application:,,,/Images/Бронзер_ByTerry.jpg', 11, CAST(1099.0000 AS Decimal(19, 4)), 45, 83, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'Крем Бархатные ручки', N'Увлажняющий, с запахом Лаванды.', N'Косметика', N'pack://application:,,,/Images/Крем_Бархатныеручки.jpeg', 12, CAST(1999.0000 AS Decimal(19, 4)), 45, 75, N'В наличии')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ManufacturerId], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Парфюм COCO Chanel Venecia', N'Яркий запах сирени, только для уверенных женщин.', N'Парфюмерия', N'pack://application:,,,/Images/Парфюм_COCOChanel.jpg', 13, CAST(1299.0000 AS Decimal(19, 4)), 5, 10, N'В наличии')
GO
SET IDENTITY_INSERT [dbo].[ExamRole] ON 

INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (1, N'Менеджер
')
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[ExamRole] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamUser] ON 

INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'Карпов ', N'Улеб', N' Леонидович', N'loginDEcph2018', N'7YpE0p')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'Юдин ', N'Герман', N' Кондратович', N'loginDEwjg2018', N'9UfqWQ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 3, N'Беляева ', N'Анна', N' Вячеславовна', N'loginDEjbz2018', N'xIAWNI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 1, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 1, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 2, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (11, 2, N'Власов ', N'Вадим', N' Васильевич', N'loginDEtfj2018', N'{{ksPn')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (12, 3, N'Савельев ', N'Арсений', N' Авксентьевич', N'loginDEpnb2018', N'{ADBdc')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (13, 3, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (14, 2, N'Бурова ', N'Марфа', N' Федотовна', N'loginDEiin2018', N'y9l*b}')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (15, 2, N'Селезнёв ', N'Александр', N' Никитевич', N'loginDEqda2018', N'|h+r}I')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (16, 2, N'Кулакова ', N'Виктория', N' Георгьевна', N'loginDEbnj2018', N'12345')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (17, 2, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (18, 2, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (19, 2, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (20, 1, N'Медведев ', N'Ириней', N' Геннадьевич', N'loginDEjis2018', N'A9K++2')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (21, 1, N'Суханова ', N'Евгения', N' Улебовна', N'loginDExvv2018', N'R1zh}|')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (22, 1, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (23, 2, N'Ефремов ', N'Христофор', N' Владиславович', N'loginDEyzn2018', N'P1v24R')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (24, 2, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (25, 3, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (26, 1, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (27, 3, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (28, 2, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (29, 1, N'Лыткин ', N'Ким', N' Алексеевич', N'loginDEwqc2018', N'vRtAP*')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (30, 1, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (31, 1, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (32, 3, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (33, 2, N'Поляков ', N'Анатолий', N' Игоревич', N'loginDEtfz2018', N'uQY0ZQ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (34, 3, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (35, 2, N'Воробьёв ', N'Герман', N' Романович', N'loginDEdmi2018', N'HOGFbU')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (36, 3, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (37, 3, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (38, 3, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (39, 2, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (40, 2, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (41, 1, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (42, 2, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (43, 1, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (44, 2, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (45, 3, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (46, 2, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (47, 1, N'Коновалова ', N'Агафья', N' Митрофановна', N'loginDEisp2018', N'dfz5Ii')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (48, 1, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (49, 2, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (50, 2, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (53, 3, N'Сам', N'Сам', N'Сам', N'1', N'1')
SET IDENTITY_INSERT [dbo].[ExamUser] OFF
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[ExamPickupPoint] ([OrderPickupPoint])
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[ExamUser] ([UserID])
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ExamOrder] ([OrderID])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__403A8C7D]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[ExamProduct] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[ExamProduct]  WITH CHECK ADD  CONSTRAINT [FK_ExamProduct_ExamManufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[ExamManufacturer] ([MunufacturerId])
GO
ALTER TABLE [dbo].[ExamProduct] CHECK CONSTRAINT [FK_ExamProduct_ExamManufacturer]
GO
ALTER TABLE [dbo].[ExamUser]  WITH CHECK ADD  CONSTRAINT [FK_ExamUser_ExamRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ExamRole] ([RoleID])
GO
ALTER TABLE [dbo].[ExamUser] CHECK CONSTRAINT [FK_ExamUser_ExamRole]
GO
USE [master]
GO
ALTER DATABASE [Exam] SET  READ_WRITE 
GO
