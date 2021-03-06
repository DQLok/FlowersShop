USE [master]
GO
/****** Object:  Database [FlowersShop]    Script Date: 4/26/2021 5:38:30 PM ******/
CREATE DATABASE [FlowersShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlowersShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FlowersShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlowersShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FlowersShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FlowersShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowersShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowersShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowersShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowersShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowersShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowersShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowersShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowersShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowersShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowersShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowersShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowersShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowersShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowersShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowersShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowersShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlowersShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowersShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowersShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowersShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowersShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowersShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowersShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowersShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FlowersShop] SET  MULTI_USER 
GO
ALTER DATABASE [FlowersShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowersShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowersShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowersShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlowersShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlowersShop', N'ON'
GO
ALTER DATABASE [FlowersShop] SET QUERY_STORE = OFF
GO
USE [FlowersShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [FlowersShop]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOderDetails]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOderDetails](
	[quantityOD] [int] NULL,
	[productID] [nvarchar](10) NOT NULL,
	[orderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOders]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[total] [float] NULL,
	[isPay] [bit] NULL,
	[userID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[categoryID] [nvarchar](10) NULL,
	[img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[rolename] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 4/26/2021 5:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](10) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [int] NULL,
	[address] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'c1', N'Hoa Vườn')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'c2', N'Hoa Cắm Bình')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'c3', N'Hoa Tết')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'c4', N'Hoa Nước Ngoài')
GO
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (11, N'p1', 1)
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (4, N'p10', 3)
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (7, N'p2', 11)
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (6, N'p4', 5)
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (2, N'p8', 28)
INSERT [dbo].[tblOderDetails] ([quantityOD], [productID], [orderID]) VALUES (1, N'p9', 9)
GO
SET IDENTITY_INSERT [dbo].[tblOders] ON 

INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (1, CAST(N'2021-04-30' AS Date), 20, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (2, CAST(N'2021-04-29' AS Date), 20, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (3, CAST(N'2021-04-30' AS Date), 17, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (4, CAST(N'2021-04-30' AS Date), 20, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (5, CAST(N'2021-04-30' AS Date), 38, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (6, CAST(N'2021-04-30' AS Date), 20, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (7, CAST(N'2021-04-30' AS Date), 20, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (8, CAST(N'2021-04-30' AS Date), 17, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (9, CAST(N'2021-04-30' AS Date), 70, 1, N'se4')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (10, CAST(N'2021-04-29' AS Date), 19, 1, N'se4')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (11, CAST(N'2021-04-29' AS Date), 15, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (16, CAST(N'2021-04-30' AS Date), 17, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (24, CAST(N'2021-04-30' AS Date), 19, 1, N'se3')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (27, CAST(N'2021-04-29' AS Date), 19, 1, N'se17')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (28, CAST(N'2021-04-29' AS Date), 12, 1, N'se1713')
INSERT [dbo].[tblOders] ([orderID], [date], [total], [isPay], [userID]) VALUES (29, CAST(N'2021-04-29' AS Date), 12, 1, N'se3')
SET IDENTITY_INSERT [dbo].[tblOders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p1', N'Hoa Hồng', 102, 20, N'c1', N'img/hoahong.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p10', N'Hoa Anh Dào', 196, 17, N'c4', N'img/hoaanhdao.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p2', N'Hoa Huệ', 143, 15, N'c2', N'img/hoahue.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p4', N'Hoa Sen', 184, 19, N'c2', N'img/hoasen.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p5', N'Hoa Cẩm Tú Cầu', 111, 14, N'c1', N'img/hoacamtucau.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p6', N'Hoa Phong Lan', 221, 14, N'c2', N'img/hoaphonglan.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p7', N'Hoa Hướng Dương', 333, 22, N'c1', N'img/hoahuongduong.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p8', N'Hoa Cúc', 498, 12, N'c3', N'img/hoacuc.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [quantity], [price], [categoryID], [img]) VALUES (N'p9', N'Hoa Tulip', 49, 30, N'c4', N'img/hoatulip.jpg')
GO
INSERT [dbo].[tblRoles] ([roleID], [rolename]) VALUES (0, N'admin')
INSERT [dbo].[tblRoles] ([roleID], [rolename]) VALUES (1, N'user')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se', N'dddddddd', 456456, N'quan 10', N'456', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se1', N'diepquocloc', 123456, N'thu duc', N'123', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se10', N'nguyenvanaa', 954234, N'quan 1', N'666', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se12', N'aaaaaaaaaa', 123456, N'quan 7', N'123', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se15', N'bbbbbbb', 153789, N'quan 8', N'456', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se17', N'locdqse141081@fpt.edu.vn', 0, N'HCM', N'***', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se1713', N'locdqse141081@fpt.edu.vn', 0, N'HCM', N'***', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se2', N'banhduchieu', 876466, N'quan 9', N'456', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se3', N'tranphamgiabao', 159753, N'go vap', N'789', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se4', N'le phuoc duy', 357951, N'quan 9 ', N'000', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se5', N'phamminhtien', 974649, N'quan 9', N'111', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se6', N'phammanhtoan', 516447, N'quan 9', N'888', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se7', N'phantantrung', 897646, N'binh thanh', N'333', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se8', N'phanlegiahuy', 654876, N'binh tan', N'444', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [password], [roleID]) VALUES (N'se9', N'nguyenquocanh', 348488, N'quan 9', N'222', 1)
GO
ALTER TABLE [dbo].[tblOderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOders] ([orderID])
GO
ALTER TABLE [dbo].[tblOderDetails]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [FlowersShop] SET  READ_WRITE 
GO
