USE [master]
GO
/****** Object:  Database [shoppingsss]    Script Date: 12/25/2022 2:40:36 PM ******/
CREATE DATABASE [shoppingsss]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoppingsss].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoppingsss] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoppingsss] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoppingsss] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoppingsss] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoppingsss] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoppingsss] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [shoppingsss] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoppingsss] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoppingsss] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoppingsss] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoppingsss] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoppingsss] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoppingsss] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoppingsss] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoppingsss] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shoppingsss] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoppingsss] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoppingsss] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoppingsss] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoppingsss] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoppingsss] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoppingsss] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoppingsss] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoppingsss] SET  MULTI_USER 
GO
ALTER DATABASE [shoppingsss] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoppingsss] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoppingsss] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoppingsss] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoppingsss] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'shoppingss', N'ON'
GO
USE [shoppingsss]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_id] [int] IDENTITY(100,1) NOT NULL,
	[Order_usernameid] [nvarchar](250) NULL,
	[Order_address] [nvarchar](250) NULL,
	[Order_createDate] [datetime] NULL,
	[Order_status] [nvarchar](250) NULL,
	[Order_isDelete] [bit] NULL,
	[Order_fullname] [nvarchar](50) NULL,
	[Order_email] [nvarchar](50) NULL,
	[Order_phone] [nchar](10) NULL,
 CONSTRAINT [PK__Order__F1FF8453C04CDDDE] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[OrDetail_id] [int] IDENTITY(100,1) NOT NULL,
	[OrDetail_quantity] [int] NULL,
	[OrDetail_price] [float] NULL,
	[OrDetail_productid] [int] NULL,
	[OrDetail_orderid] [int] NULL,
	[OrDetail_createDate] [datetime] NULL,
	[OrDetail_status] [nvarchar](50) NULL,
	[OrDetail_isDelete] [bit] NULL,
	[OrDetail_voucherName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order_De__04CE9E64AF934C82] PRIMARY KEY CLUSTERED 
(
	[OrDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [nvarchar](250) NULL,
	[Product_price] [float] NULL,
	[ProBrand_id] [int] NULL,
	[Product_img] [nvarchar](250) NULL,
	[Product_desc] [nvarchar](255) NULL,
	[Product_quantity] [int] NULL,
	[Product_isDelete] [bit] NULL,
 CONSTRAINT [PK__Product__9833FF92E1C943C1] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Brand]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Brand](
	[ProBrand_id] [int] IDENTITY(1,1) NOT NULL,
	[ProBrand_name] [nvarchar](250) NULL,
	[ProBrand_isDelete] [bit] NULL,
 CONSTRAINT [PK__Product___CEC638D2CE46E41C] PRIMARY KEY CLUSTERED 
(
	[ProBrand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [nvarchar](10) NOT NULL,
	[Role_name] [nvarchar](20) NULL,
	[Role_isDelete] [bit] NULL,
 CONSTRAINT [PK__Role__D80BB0930AB7B8C5] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_username] [nvarchar](250) NOT NULL,
	[User_fullname] [nvarchar](250) NULL,
	[User_password] [nvarchar](250) NULL,
	[User_img] [nvarchar](250) NULL,
	[User_mail] [nvarchar](250) NULL,
	[User_phone] [nvarchar](50) NULL,
	[User_roleId] [nvarchar](10) NULL,
	[User_isDelete] [bit] NULL,
 CONSTRAINT [PK__User__206A9DF8007DA5EA] PRIMARY KEY CLUSTERED 
(
	[User_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Voucher_name] [nvarchar](50) NOT NULL,
	[Voucher_desc] [nvarchar](250) NULL,
	[Voucher_isDelete] [bit] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Voucher_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher_Data]    Script Date: 12/25/2022 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher_Data](
	[Vdata_id] [int] IDENTITY(100,1) NOT NULL,
	[Product_id] [int] NULL,
	[Voucher_isDelete] [bit] NULL,
	[Voucher_createDate] [datetime] NULL,
	[Voucher_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Voucher___7E2103A9F3B7D46E] PRIMARY KEY CLUSTERED 
(
	[Vdata_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (100, N'bangphi', N'31 đường số 2 Phường An Lộc TP.Thủ Dầu Một', CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Ðã giao', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (101, N'maithai', N'22 Tôn Thất Tùng Phường 10 Quận 5 TP.Hồ Chí Minh', CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Ðã giao', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (102, N'quocminh', N'85 Phan Huy Ích Phường 12 Quận Gò Vấp TP.Hồ Chí Minh', CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Ðã giao', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (109, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-13 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (110, N'CUSDOhD', N'Quận 7 TPHCM', CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi 3', N'bangphin3@gmail.com', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (111, N'CUS2to0', N'', CAST(N'2022-12-07 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'', N'', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (112, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-07 00:00:00.000' AS DateTime), N'Đang giao', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (113, N'bangphi', N'Quận 1 TPHCM', CAST(N'2022-12-07 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (114, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-07 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', NULL)
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (115, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (116, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (117, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (118, N'bangphi', N'Quận 13 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (119, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (120, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (121, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (122, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (123, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (124, N'bangphi', N'Quận 12 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (125, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (126, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (127, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (128, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (129, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (130, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (131, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (132, N'bangphi', N'', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'          ')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (133, N'bangphi', N'Quận 1 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (134, N'bangphi', N'', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'          ')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (135, N'bangphi', N'Quận 1 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (136, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (137, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (138, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (139, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (140, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (141, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (142, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (143, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (144, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (145, N'bangphi', N'', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (146, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (147, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (148, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (149, N'bangphi', N'Quận 1 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (150, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (151, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (152, N'bangphi', N'42/2A tổ 28 KP2,hẻm Hà Thị Khiêm, Phường Trung Mỹ Tây, Quận 12, TP. Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (153, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (154, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (155, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (156, N'bangphi', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (157, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (158, N'CUSJHHS', N'Quận 12 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Văn Tèoo', N'bangphin3@gmail.com', N'0368114077')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (159, N'CUSfGLM', N'Quận 7 TPHCM', CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Chờ xác nhận', 0, N'Nguyễn Văn Tèoooo', N'bangphin3@gmail.com', N'0368114078')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (160, N'bangphi', N'số nhà 63,Tổ NDTQ số 3, ấp Thạnh Tây,xã Hương Mỹ,huyện Mỏ Cày Nam_Bến Tre', CAST(N'2022-12-09 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (161, N'bangphi', N'76/5 Đường Lê Thị Nho, Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh', CAST(N'2022-12-12 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Bằng Phi', N'bangphi@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (162, N'CUSDkJV', N'Quận 12 TPHCM', CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Bằng Phi 4', N'bangphin1@gmail.com', N'0368114073')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (163, N'quocminh', N'Quận 7 TPHCM', CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Trịnh Quốc Minh', N'quocminh@gmail.com', N'0368114078')
INSERT [dbo].[Order] ([Order_id], [Order_usernameid], [Order_address], [Order_createDate], [Order_status], [Order_isDelete], [Order_fullname], [Order_email], [Order_phone]) VALUES (164, N'CUSPiWk', N'Quận 1 TPHCM', CAST(N'2022-12-24 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'Nguyễn Văn Tèuu', N'bangphin1@gmail.com', N'0368114073')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (100, 2, 30000000, 1, 100, CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Đã xác Nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (101, 1, 37000000, 10, 102, CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Đã xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (102, 1, 25000000, 2, 109, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (103, 1, 15000000, 1, 109, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (104, 1, 25000000, 2, 110, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (105, 1, 5500000, 12, 110, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (110, 2, 30000000, 1, 100, CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Đã xác Nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (111, 1, 37000000, 10, 102, CAST(N'2022-10-21 00:00:00.000' AS DateTime), N'Đã xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (112, 1, 25000000, 2, 109, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (113, 1, 15000000, 1, 109, CAST(N'2022-12-06 00:00:00.000' AS DateTime), N'', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (146, 2, 25000000, 2, 133, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (147, 2, 25000000, 2, 137, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (148, 2, 25000000, 2, 138, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (149, 2, 25000000, 2, 139, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (150, 2, 25000000, 2, 140, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (151, 2, 25000000, 2, 147, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (152, 1, 15000000, 1, 148, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (153, 1, 23990000, 3, 148, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (154, 1, 15000000, 1, 149, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (155, 1, 23990000, 3, 149, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (156, 1, 15000000, 1, 150, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (157, 1, 23990000, 3, 150, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (158, 1, 15000000, 1, 151, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (159, 1, 23990000, 3, 151, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (160, 1, 15000000, 1, 152, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (161, 2, 23990000, 3, 152, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (162, 1, 25000000, 2, 152, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (163, 1, 15000000, 1, 153, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (164, 1, 15000000, 1, 154, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (165, 1, 15000000, 1, 155, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (166, 1, 15000000, 1, 156, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (167, 1, 25000000, 2, 157, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (168, 1, 25000000, 2, 158, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (169, 1, 36990000, 9, 159, CAST(N'2022-12-08 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (170, 1, 15000000, 1, 160, CAST(N'2022-12-09 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (171, 2, 22500000, 2, 160, CAST(N'2022-12-09 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'713GIAM10PT')
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (172, 2, 25000000, 2, 161, CAST(N'2022-12-12 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (173, 1, 15000000, 1, 162, CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (174, 1, 25000000, 2, 162, CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (175, 1, 23990000, 3, 162, CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (176, 1, 22500000, 2, 163, CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, N'713GIAM10PT')
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (177, 1, 26900000, 7, 163, CAST(N'2022-12-14 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
INSERT [dbo].[Order_Details] ([OrDetail_id], [OrDetail_quantity], [OrDetail_price], [OrDetail_productid], [OrDetail_orderid], [OrDetail_createDate], [OrDetail_status], [OrDetail_isDelete], [OrDetail_voucherName]) VALUES (178, 3, 25000000, 2, 164, CAST(N'2022-12-24 00:00:00.000' AS DateTime), N'Đang xác nhận', 0, NULL)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (1, N'Iphone 11 Pro 256GB ', 15000000, 1, N'Iphone11Pro256GB.png', N'Màn hình:

OLED5.8"Super Retina XDR
Hệ điều hành:

iOS 14
Camera sau:

3 camera 12 MP
Camera trước:

12 MP
Chip:

Apple A13 Bionic
RAM:

4 GB
Dung lượng lưu trữ:

256 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 4G
Pin, Sạc:

3046 mAh', 50, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (2, N'Iphone 11 Pro max 256GB', 25000000, 1, N'Iphone11Promax256GB.png', N'Công nghệ màn hình OLED Kích thước màn hình (inch) 6.5 Độ phân giải camera sau Wide 12 MP, Ultra Wide 12 MP & Tele 12 MP Độ phân giải camera trước (MP) 12 Dung lượng RAM 4Gb Bộ nhớ trong 256Gb', 14, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (3, N'Iphone 12 Pro 256GB', 23990000, 1, N'Iphone12Pro256GB.png', N'Màn hình:

OLED6.1"Super Retina XDR
Hệ điều hành:

iOS 15
Camera sau:

3 camera 12 MP
Camera trước:

12 MP
Chip:

Apple A14 Bionic
RAM:

6 GB
Dung lượng lưu trữ:

256 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 5G
Pin, Sạc:

2815 mAh20 W', 0, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (4, N'Iphone 12 Promax 256GB', 27590000, 1, N'Iphone12Promax256GB.png', N'Kích thước màn hình

6.7 inches
Độ phân giải màn hình

1284 x 2778 pixels
Hệ điều hành

iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)
Pin

Li-Ion, sạc nhanh 18W, sạc không dây 15W, USB Power Delivery 2.0', 11, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (5, N'Iphone 13 Pro 256GB', 27990000, 1, N'Iphone13Pro256GB.png', N'Kích thước màn hình

6.1 inches
Độ phân giải màn hình

1170 x 2532 pixels
Hệ điều hành

iOS15
Pin

3,095mAh
Trọng lượng

204g
Công nghệ màn hình

OLED', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (6, N'Iphone 13 Promax 256GB', 30600000, 1, N'Iphone13Promax256GB.png', N'Kích thước màn hình

6.7 inches
Độ phân giải màn hình

2778 x 1284 pixel
Hệ điều hành

iOS15
Pin

4,325mAh
Trọng lượng

240g
Công nghệ màn hình

OLED', 12, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (7, N'Iphone 14', 26900000, 1, N'Iphone14.png', N'Màn hình:

OLED6.7"Super Retina XDR
Hệ điều hành:

iOS 16
Camera sau:

2 camera 12 MP
Camera trước:

12 MP
Chip:

Apple A15 Bionic
RAM:

6 GB
Dung lượng lưu trữ:

128 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 5G
Pin, Sạc:

4325 mAh20 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (8, N'Iphone 14 Pro 256GB', 27900000, 1, N'Iphone14Pro256GB.png', N'Màn hình:

OLED6.7"Super Retina XDR
Hệ điều hành:

iOS 16
Camera sau:

2 camera 12 MP
Camera trước:

12 MP
Chip:

Apple A15 Bionic
RAM:

6 GB
Dung lượng lưu trữ:

128 GB
SIM:

1 Nano SIM & 1 eSIMHỗ trợ 5G
Pin, Sạc:

4325 mAh20 W', 14, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (9, N'Iphone 14 Promax 256GB', 36990000, 1, N'Iphone14Promax256GB.png', N'Màn hình: OLED6.7"Super Retina XDR Hệ điều hành: iOS 16 Camera sau: Chính 48 MP & Phụ 12 MP, 12 MP Camera trước: 12 MP Chip: Apple A16 Bionic 6 nhân RAM: 6 GB Dung lượng lưu trữ: 256 GB SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc: 4323 mAh20 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (10, N'Huawei P30Pro', 3700000, 9, N'HuaweiP30Pro.png', N'Màn hình: OLED6.47"Full HD+ Hệ điều hành: Android 9 (Pie) Camera sau: Chính 40 MP & Phụ 20 MP, 8 MP, TOF 3D Camera trước: 32 MP Chip: Kirin 980 RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G Pin, Sạc: 4200 mAh', 13, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (11, N'Huawei Mate 20 Pro', 2190000, 5, N'HuaweiMate20Pro.png', N'Màn hình: OLED6.39"Quad HD+ (2K+) Hệ điều hành: Android 9 (Pie) Camera sau: Chính 40 MP & Phụ 20 MP, 8 MP Camera trước: 24 MP Chip: Kirin 980 RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G Pin, Sạc: 4200 mAh', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (12, N'Huawei Nova 3i', 5500000, 5, N'HuaweiNova3i.png', N'Màn hình: LTPS LCD6.3"Full HD+ Camera sau: Chính 16 MP & Phụ 2 MP Camera trước: Chính 24 MP & Phụ 2 MP Chip: Kirin 710 RAM: 4 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G Pin, Sạc: 3340 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (13, N'Huawei Y9', 5000000, 8, N'HuaweiY9.png', N'Màn hình: LTPS LCD6.5"Full HD+ Camera sau: Chính 13 MP & Phụ 2 MP Camera trước: Chính 16 MP & Phụ 2 MP Chip: Kirin 710 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (14, N'LG G7 ThinQ', 3190000, 4, N'LGG7ThinQ.png', N'Màn hình: IPS LCD6.1"Quad HD+ (2K+) Hệ điều hành: Android 8 (Oreo) Camera sau: Chính 16 MP & Phụ 16 MP Camera trước: 5 MP Chip: Snapdragon 845 RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 3000 mAh', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (15, N'LG G8x ThinQ', 3490000, 4, N'LGG8xThinQ.png', N'Màn hình	P-OLED 6.1 inch, độ phân giải 1440 x 3120 pixels Camera	Camera chính 12 MP, f/1.5, Dual pixel PDAF, OIS Camera siêu rộng 16 MP, f/1.9 Chipset	Qualcomm SM8150 Snapdragon 855 (7 nm) Bộ nhớ	RAM 6GB Bộ nhớ trong 128GB Pin	3500 mAh hỗ trợ sạc nhanh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (16, N'LG Stylo 6', 4700000, 4, N'LGStylo6.png', N'Màn hình: IPS LCD6.8"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 13 MP & Phụ 5 MP, 5 MP Camera trước: 13 MP Chip: MediaTek Helio P35 RAM: 3 GB Dung lượng lưu trữ: 64 GB SIM: 2 Micro SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (17, N'LG V60 ThinQ', 6199000, 4, N'LGV60ThinQ.png', N'Màn hình: P-OLED6.8"Quad HD+ (2K+) Hệ điều hành: Android 10 Camera sau: Chính 64 MP & Phụ 13 MP, TOF 3D Camera trước: 10 MP Chip: Snapdragon 865 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G Pin, Sạc: 5000 mAh', 11, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (18, N'LG Velvet', 4190000, 4, N'LGVelvet.png', N'Màn hình: P-OLED, 6.8", Full HD+ Hệ điều hành: Android 10 Camera: Chính 48 MP & Phụ 8 MP, 5 MP CPU:Snapdragon 765G 8 nhân RAM: 6GB/ROM :128GB Dung lượng pin:4300 mAh 2 Sim Nano sim', 31, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (19, N'Nokia 2.3', 2590000, 4, N'Nokia2-3.png', N'Màn hình: TFT LCD6.2"HD+ Hệ điều hành: Android 10 (Android One) Camera sau: Chính 13 MP & Phụ 2 MP Camera trước: 5 MP Chip: MediaTek MT6761 (Helio A22) RAM: 2 GB Dung lượng lưu trữ: 32 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (20, N'Nokia 3.4', 3000000, 4, N'Nokia3-4.png', N'Màn hình: IPS LCD6.39"HD+ Hệ điều hành: Android 10 (Android One) Camera sau: Chính 13 MP & Phụ 5 MP, 2 MP Camera trước: 8 MP Chip: Snapdragon 460 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh10 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (21, N'Nokia 5.3', 3990000, 4, N'Nokia5-3.png', N'Màn hình: IPS LCD6.55"HD+ Hệ điều hành: Android 10 Camera sau: Chính 13 MP & Phụ 5 MP, 2 MP, 2 MP Camera trước: 8 MP Chip: Snapdragon 665 RAM: 3 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (22, N'Nokia 7.2', 7700000, 4, N'Nokia7-2.png', N'Màn hình:

IPS LCD6.3"Full HD+
Hệ điều hành:

Android 9 (Android One)
Camera sau:

Chính 48 MP & Phụ 8 MP, 5 MP
Camera trước:

20 MP
Chip:

Snapdragon 660
RAM:

4 GB
Dung lượng lưu trữ:

64 GB
SIM:

2 Nano SIM
Pin, Sạc:

3500 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (23, N'Nokia C1', 2000000, 4, N'NokiaC1.png', N'Màn hình: IPS LCD5.45"FWVGA+ Camera sau: 5 MP Camera trước: 5 MP Chip: Spreadtrum SC7731E RAM: 1 GB Dung lượng lưu trữ: 16 GB SIM: 2 Nano SIMHỗ trợ 3G Pin, Sạc: 2500 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (24, N'Nokia C2', 1400000, 4, N'NokiaC2.png', N'Màn hình: IPS LCD5.7"HD+ Hệ điều hành: Android 9 (Go Edition) Camera sau: 5 MP Camera trước: 5 MP Chip: Spreadtrum SC9832E RAM: 1 GB Dung lượng lưu trữ: 16 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 2800 mAh5 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (25, N'Nokia C21 Plus', 2390000, 4, N'NokiaC21Plus.png', N'Màn hình: TFT LCD6.5"HD+ Hệ điều hành: Android 11 (Go Edition) Camera sau: Chính 13 MP & Phụ 2 MP Camera trước: 5 MP Chip: Spreadtrum SC9863A RAM: 3 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5050 mAh10 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (26, N'Nokia C30', 2550000, 4, N'NokiaC30.png', N'Màn hình: IPS LCD6.82"HD+ Hệ điều hành: Android 11 (Go Edition) Camera sau: Chính 13 MP & Phụ 2 MP Camera trước: 5 MP Chip: Spreadtrum SC9863A RAM: 3 GB Dung lượng lưu trữ: 32 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 6000 mAh10 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (27, N'Nokia C31', 3190000, 4, N'NokiaC31.png', N'Màn hình: TFT LCD6.7"HD+ Hệ điều hành: Android 12 Camera sau: Chính 13 MP & Phụ 2 MP, 2 MP Camera trước: 5 MP Chip: Unisoc SC9863A1 RAM: 4 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5050 mAh10 W', 4, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (28, N'Nokia G10', 3300000, 4, N'NokiaG10.png', N'Màn hình: TFT LCD6.5"HD+ Hệ điều hành: Android 11 Camera sau: Chính 13 MP & Phụ 2 MP, 2 MP Camera trước: 8 MP Chip: MediaTek Helio G25 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5050 mAh10 W', 5, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (29, N'Nokia G11 Plus', 2500000, 4, N'NokiaG11Plus.png', N'Màn hình: TFT LCD6.51"HD+ Hệ điều hành: Android 12 Camera sau: Chính 50 MP & Phụ 2 MP Camera trước: 8 MP Chip: Unisoc T606 RAM: 3 GB Dung lượng lưu trữ: 32 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh10 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (30, N'Nokia G50', 8000000, 4, N'NokiaG50.png', N'Màn hình: IPS LCD6.82"HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 5 MP, 2 MP Camera trước: 8 MP Chip: Snapdragon 480 5G RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh18 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (31, N'OPPO A16K', 2750000, 3, N'OPPOA16K.png', N'Màn hình: IPS LCD6.52"HD+ Hệ điều hành: Android 11 Camera sau: 13 MP Camera trước: 5 MP Chip: MediaTek Helio G35 RAM: 3 GB Dung lượng lưu trữ: 32 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4230 mAh10 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (32, N'OPPO A53', 1490000, 3, N'OPPOA53.png', N'Màn hình: IPS LCD6.5"HD+ Hệ điều hành: Android 10 Camera sau: Chính 13 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 460 RAM: 4 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh18 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (33, N'OPPO A55', 3790000, 3, N'OPPOA55.png', N'Màn hình: IPS LCD6.5"HD+ Hệ điều hành: Android 11 Camera sau: Chính 50 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Helio G35 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh18 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (34, N'OPPO A74', 2500000, 3, N'OPPOA74.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 662 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh33 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (35, N'OPPO A76', 5290000, 3, N'OPPOA76.png', N'Màn hình: IPS LCD6.56"HD+ Hệ điều hành: Android 11 Camera sau: Chính 13 MP & Phụ 2 MP Camera trước: 8 MP Chip: Snapdragon 680 RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh33 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (36, N'OPPO A93', 5500000, 3, N'OPPOA93.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: Chính 16 MP & Phụ 2 MP Chip: MediaTek Helio P95 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh18 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (37, N'OPPO A96', 7000000, 3, N'OPPOA96.png', N'Màn hình: IPS LCD6.59"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 50 MP & Phụ 2 MP Camera trước: 16 MP Chip: Snapdragon 680 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh33 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (38, N'OPPO A745G', 800000, 3, N'OPPOA745G.png', N'Màn hình: IPS LCD6.5"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 480 5G RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh18 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (39, N'OPPOFind X2Pro', 3125000, 3, N'OPPOFind X2Pro.png', N'Màn hình: AMOLED6.78"Quad HD+ (2K+) Hệ điều hành: Android 10 Camera sau: Chính 48 MP & Phụ 48 MP, 13 MP Camera trước: 32 MP Chip: Snapdragon 865 RAM: 12 GB Dung lượng lưu trữ: 512 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4260 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (40, N'OPPO Reno2F', 700000, 3, N'OPPOReno2F.png', N'Màn hình: AMOLED6.5"Full HD+ Hệ điều hành: Android 9 (Pie) Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Helio P70 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 5, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (41, N'OPPO Reno4', 5500000, 3, N'OPPOReno4.png', N'Màn hình: AMOLED6.5"Full HD+ Hệ điều hành: Android 9 (Pie) Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Helio P70 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (42, N'OPPO Reno 4 Pro', 2000000, 3, N'OPPOReno4Pro.png', N'Màn hình: AMOLED6.5"Full HD+ Hệ điều hành: Android 10 Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 32 MP Chip: Snapdragon 720G RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4000 mAh65 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (43, N'OPPO Reno 5 Version Marvel', 9800000, 3, N'OPPOReno5VersionMarvel.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 44 MP Chip: Snapdragon 720G RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4310 mAh50 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (44, N'OPPO Reno 6 Pro 5G', 1899000, 3, N'OPPOReno6Pro5G.png', N'Màn hình: AMOLED6.55"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 50 MP & Phụ 16 MP, 13 MP, 2 MP Camera trước: 32 MP Chip: Snapdragon 870 5G RAM: 12 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh65 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (45, N'OPPO Reno7 Z 5G', 8790000, 3, N'OPPOReno7Z5G.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 695 5G RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 5G Pin, Sạc: 4500 mAh33 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (46, N'OPPO Reno 8', 1049000, 3, N'OPPOReno8.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 12 Camera sau: Chính 64 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 695 5G RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh33 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (47, N'OPPO Reno 6 5G', 990000, 3, N'OPPOReno65G.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 32 MP Chip: MediaTek Dimensity 900 5G RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4300 mAh65 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (48, N'OPPO Reno 7 5G', 649000, 3, N'OPPOReno75G.png', N'Màn hình: AMOLED6.4"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 32 MP Chip: MediaTek Dimensity 900 5G RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh65 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (49, N'OPPO Reno Pro 5G', 800000, 3, N'OPPORenoPro5G.png', N'Màn hình: OLED6.55"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 32 MP Chip: MediaTek Dimensity 1000+ RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4350 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (50, N'Realme GT2 Pro 5G', 1649000, 8, N'RealmeGT2Pro5G.png', N'Màn hình: Super AMOLED6.7"Full HD+ Hệ điều hành: Android 12 Camera sau: Chính 50 MP & Phụ 48 MP, 2 MP Camera trước: 32 MP Chip: Snapdragon 8 Gen 1 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh65 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (51, N'RealmeGT25G', 919000, 8, N'RealmeGT25G.png', N'Màn hình: Super AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 888 RAM: 12 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (52, N'Realme GTExplorantion', 1045000, 8, N'RealmeGTExplorantion.png', N'Màn hình: Super AMOLED6.55"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 50 MP & Phụ 16 MP, 2 MP Camera trước: 32 MP Chip: Snapdragon 870 5G RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh65 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (53, N'Realme GTNEO 2T', 929000, 8, N'RealmeGTNEO2T.png', N'Màn hình: Super AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 1200 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh65 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (54, N'Realme GTNEO 3', 729000, 8, N'RealmeGTNEO3.png', N'Màn hình: AMOLED6.7" Hệ điều hành: Android 12 Camera sau: Chính 50 MP & Phụ 8 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 8100 RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh80 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (55, N'Realme GTNEO Flash 5G', 510000, 8, N'RealmeGTNEOFlash5G.png', N'Màn hình: Super AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 1200 RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh65 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (56, N'Realme Q3 Pro', 560000, 8, N'RealmeQ3Pro.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 1100 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh30 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (57, N'Realme Q5 Pro', 699000, 8, N'RealmeQ5Pro.png', N'Màn hình: IPS LCD6.3"Full HD+ Hệ điều hành: Android 9 (Pie) Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 16 MP Chip: Snapdragon 712 RAM: 4 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 4035 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (58, N'Realme Q5 5G', 799000, 8, N'RealmeQ55G.png', N'Màn hình: IPS LCD6.5"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 700 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh18 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (59, N'Redmi Note', 800000, 8, N'RedmiNote.png', N'Công nghệ màn hình IPS LCD Độ phân giải HD (720 x 1280 Pixels) Kích thước màn hình 5.5" Mặt kính cảm ứng Kính cường lực Corning Gorilla Glass 3 Độ phân giải 13 MP Quay phim FullHD 1080p@30fps Đèn Flash Có Độ phân giải 5 MP', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (60, N'Samsung Galaxy A22', 500000, 6, N'SamsungGalaxyA22.png', N'Màn hình: Super AMOLED6.4"HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 13 MP Chip: MediaTek MT6769V (Helio G80) RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh15 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (61, N'Samsung Galaxy A32', 560000, 6, N'SamsungGalaxyA32.png', N'Màn hình: Super AMOLED6.4"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 64 MP & Phụ 8 MP, 5 MP, 5 MP Camera trước: 20 MP Chip: MediaTek Helio G80 RAM: 6 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh15 W', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (62, N'SamsungGalaxy A03 4GB', 300000, 6, N'SamsungGalaxyA034GB.png', N'Màn hình: PLS LCD6.5"HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 2 MP Camera trước: 5 MP Chip: Unisoc T606 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh7.8 W', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (63, N'Samsung Galaxy A53 5G', 550000, 6, N'SamsungGalaxyA535G.png', N'Màn hình: PLS TFT LCD5"qHD Camera sau: 8 MP Camera trước: 5 MP Chip: MediaTek MT6737 RAM: 1.5 GB Dung lượng lưu trữ: 8 GB SIM: 2 Micro SIM Pin, Sạc: 2600 mAh', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (64, N'Samsung Galaxy S21 FE 5G', 139900, 6, N'SamsungGalaxyS21FE5G.png', N'Màn hình: Dynamic AMOLED 2X6.4"Full HD+ Hệ điều hành: Android 12 Camera sau: Chính 12 MP & Phụ 12 MP, 8 MP Camera trước: 32 MP Chip: Exynos 2100 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 4500 mAh25 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (65, N'SamsungGalaxy S22 6GB', 1600000, 6, N'SamsungGalaxyS22+5G256GB.png', N'Model:	SAMSUNGS22ULTRA(12+256GB) Màu sắc:	Xanh lá Nhà sản xuất:	Samsung Xuất xứ:	Việt Nam Năm ra mắt :	2022 Thời gian bảo hành:	12 Tháng', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (66, N'Samsung Galaxy S22 256GB', 27990000, 6, N'SamsungGalaxyS22256GB.png', N'Màn hình: IPS LCD6.5"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 48 MP & Phụ 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Dimensity 700 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 5G Pin, Sạc: 5000 mAh18 W', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (67, N'Samsung Galaxy Z Flip 128GB', 29900000, 6, N'SamsungGalaxyZFlip128GB.png', N'Kích thước màn hình 6.7 inches Hệ điều hành Android 11 Pin 3300 mAh Trọng lượng 183g Công nghệ màn hình Super AMOLED', 7, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (68, N'Samsung Galaxy Z Flip 256GB', 35000000, 6, N'SamsungGalaxyZFlip256GB.png', N'Màn hình: Dynamic AMOLED 2XChính 6.7" & Phụ 1.9"Full HD+ Hệ điều hành: Android 11 Camera sau: 2 camera 12 MP Camera trước: 10 MP Chip: Snapdragon 888 RAM: 8 GB Dung lượng lưu trữ: 256 GB SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G Pin, Sạc: 3300 mAh15 W', 9, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (69, N'Samsung GalaxyZ Fold 4 256GB', 37990000, 6, N'SamsungGalaxyZFold4256GB.png', N'Kích thước màn hình 6.1 inches Độ phân giải màn hình 1080 x 2340 pixels (FullHD+) Hệ điều hành Android 12, One UI 4.1 Pin 3700 mAh Trọng lượng 167 g', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (70, N'Xiaomi Mi A', 5000000, 2, N'XiaomiMiA.png', N'Màn hình: LTPS LCD5.5"Full HD Camera sau: 2 camera 12 MP Camera trước: 5 MP Chip: Snapdragon 625 RAM: 4 GB Dung lượng lưu trữ: 64 GB SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ) Pin, Sạc: 3080 mAh', 6, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (71, N'Xiaomi Mi Max', 4990000, 2, N'XiaomiMiMax.png', N'Màn hình: IPS LCD6.4"Full HD Camera sau: 16 MP Camera trước: 5 MP Chip: Snapdragon 652 RAM: 4 GB Dung lượng lưu trữ: 128 GB SIM: 1 Nano SIM & 1 Micro SIM Pin, Sạc: 4850 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (72, N'Xiaomi Mi Mix 5 Pro', 2000000, 2, N'XiaomiMiMix5Pro.png', N'Kích thước màn hình 6.39 inches Độ phân giải màn hình 1080 x 2340 pixels (FullHD+) Pin 6.190 mAh', 8, 0)
INSERT [dbo].[Product] ([Product_id], [Product_name], [Product_price], [ProBrand_id], [Product_img], [Product_desc], [Product_quantity], [Product_isDelete]) VALUES (73, N'Xiaomi Mi Note 11S', 5990000, 2, N'XiaomiMiNote11S.png', N'Màn hình: AMOLED6.43"Full HD+ Hệ điều hành: Android 11 Camera sau: Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP Camera trước: 16 MP Chip: MediaTek Helio G96 RAM: 8 GB Dung lượng lưu trữ: 128 GB SIM: 2 Nano SIMHỗ trợ 4G Pin, Sạc: 5000 mAh33 W', 9, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Product_Brand] ON 

INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (1, N'Iphone', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (2, N'Xiaomi', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (3, N'Oppo', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (4, N'Lg', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (5, N'Huawei', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (6, N'Samsung', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (7, N'Nokia', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (8, N'Realme', 0)
INSERT [dbo].[Product_Brand] ([ProBrand_id], [ProBrand_name], [ProBrand_isDelete]) VALUES (9, N'Vivo', 0)
SET IDENTITY_INSERT [dbo].[Product_Brand] OFF
INSERT [dbo].[Role] ([Role_id], [Role_name], [Role_isDelete]) VALUES (N'101', N'admin', 0)
INSERT [dbo].[Role] ([Role_id], [Role_name], [Role_isDelete]) VALUES (N'102', N'sale', 0)
INSERT [dbo].[Role] ([Role_id], [Role_name], [Role_isDelete]) VALUES (N'103', N'customer', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'abc', N'Nguyễn Bằng Phi', N'123456', NULL, N'bangphin1@gmail.com', N'0368114073', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'anhkiet', N'Lê Văn Anh Kiệt', N'123Abcde', N'lvak.jpg', N'anhkiet@gmail.com', N'0123665588', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'bangphi', N'Nguyễn Bằng Phi', N'123Bangphi', N'3db91835.jpg', N'bangphi@gmail.com', N'0368114073', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'bangphi22', N'Nguyễn Bằng Phi', NULL, NULL, N'bangphin1@gmail.com', N'0368114073', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'congquan', N'Trần Công Quân', N'123Abcde', N'tcq.jpg', N'congquan@gmail.com', N'0123698547', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUS2to0', N'', N'123456', N'temp.png', N'', N'', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSDkJV', N'Nguyễn Bằng Phi 4', N'123456', N'temp.png', N'bangphin1@gmail.com', NULL, N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSDOhD', N'Nguyễn Bằng Phi 3', N'123456', N'temp.png', N'bangphin3@gmail.com', N'0368114073', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSfGLM', N'Nguyễn Văn Tèoooo', N'123456', N'temp.png', N'bangphin3@gmail.com', NULL, N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSJHHS', N'Nguyễn Văn Tèoo', N'123456', N'temp.png', N'bangphin3@gmail.com', NULL, N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSPiWk', N'Nguyễn Văn Tèuu', N'123456', N'temp.png', N'bangphin1@gmail.com', NULL, N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'CUSTyZU', N'Nguyễn Bằng Phi 2', N'123456', N'temp.png', N'bangphin2@gmail.com', N'0368114073', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'd', N'rr', NULL, NULL, N'bangphin1@gmail.com', N'0368114073', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'dangphat', N'Nguyễn Đăng Phát', N'123Abcd', N'dangphat.jpg', N'dangphat@gamil.com', N'0147845963', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'duyhoang', N'Hoàng Minh Duy', N'123Abcde', N'duyhoang.jpg', N'uyhoang@gmail.com', N'0369857665', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'duylap', N'Trần Duy Lập', N'123Abcde', N'duylap.jpg', N'duylap@gmail.com', N'0325874914', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'hunglam', N'Nguyễn Hùng Lâm', N'123Abcde', N'nhl.jpg', N'hunglam@gmail.com', N'0125478935', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'levanvu', N'Lê Văn Vũ', N'123Abcde', N'vanvu.jpg', N'vanvu@gmail.com', N'0236547889', N'102', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'maithai', N'Mai Xuân Thái', N'123Thaimai', N'mxt.jpg', N'xuanthai@gmail.com', N'0945990677', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'nhuttan', N'Lâm Nhựt Tân', N'123Abcde', N'lnt.jpg', N'nhuttan@gmail.com', N'0125874963', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'phi1234', N'Nguyễn Phi', N'12345678', NULL, N'bangphin3@gmail.com', N'0368114073', N'103', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'quocminh', N'Trịnh Quốc Minh', N'123Quocminh', N'tqm.jpg', N'quocminh@gmail.com', N'0886313113', N'101', 0)
INSERT [dbo].[User] ([User_username], [User_fullname], [User_password], [User_img], [User_mail], [User_phone], [User_roleId], [User_isDelete]) VALUES (N'vanhoai', N'Hoàng Văn Hoài', N'123Abcde', N'hvh.jpg', N'vanhoai@gmail.com', N'0147852369', N'101', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'712GIAM5PT', N'5', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'713GIAM10PT', N'10', 1)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'714GIAM15PT', N'15', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'715GIAM20PT', N'20', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'716GIAM25PT', N'25', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'717GIAM30PT', N'30', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'718GIAM35PT', N'35', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'719GIAM40PT', N'40', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'720GIAM45PT', N'45', 0)
INSERT [dbo].[Voucher] ([Voucher_name], [Voucher_desc], [Voucher_isDelete]) VALUES (N'721GIAM50PT', N'50', 0)
SET IDENTITY_INSERT [dbo].[Voucher_Data] ON 

INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (100, 2, 0, CAST(N'2023-01-15 00:00:00.000' AS DateTime), N'713GIAM10PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (101, 8, 0, CAST(N'2023-01-20 00:00:00.000' AS DateTime), N'716GIAM25PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (102, 14, 0, CAST(N'2023-01-10 00:00:00.000' AS DateTime), N'715GIAM20PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (103, 24, 0, CAST(N'2023-01-01 00:00:00.000' AS DateTime), N'721GIAM50PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (104, 28, 0, CAST(N'2023-01-10 00:00:00.000' AS DateTime), N'715GIAM20PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (105, 19, 0, CAST(N'2023-01-15 00:00:00.000' AS DateTime), N'713GIAM10PT')
INSERT [dbo].[Voucher_Data] ([Vdata_id], [Product_id], [Voucher_isDelete], [Voucher_createDate], [Voucher_name]) VALUES (106, 15, 1, CAST(N'2022-12-30 00:00:00.000' AS DateTime), N'719GIAM40PT')
SET IDENTITY_INSERT [dbo].[Voucher_Data] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_order_user] FOREIGN KEY([Order_usernameid])
REFERENCES [dbo].[User] ([User_username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_order_user]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [fk_ordetails_order] FOREIGN KEY([OrDetail_orderid])
REFERENCES [dbo].[Order] ([Order_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [fk_ordetails_order]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [fk_ordetails_pro] FOREIGN KEY([OrDetail_productid])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [fk_ordetails_pro]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [fk_Vou_OrDetails] FOREIGN KEY([OrDetail_voucherName])
REFERENCES [dbo].[Voucher] ([Voucher_name])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [fk_Vou_OrDetails]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_pro_probrand] FOREIGN KEY([ProBrand_id])
REFERENCES [dbo].[Product_Brand] ([ProBrand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_pro_probrand]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [fk_user_role] FOREIGN KEY([User_roleId])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [fk_user_role]
GO
ALTER TABLE [dbo].[Voucher_Data]  WITH CHECK ADD  CONSTRAINT [fk_VouData_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO
ALTER TABLE [dbo].[Voucher_Data] CHECK CONSTRAINT [fk_VouData_Product]
GO
ALTER TABLE [dbo].[Voucher_Data]  WITH CHECK ADD  CONSTRAINT [fk_VouData_Vou] FOREIGN KEY([Voucher_name])
REFERENCES [dbo].[Voucher] ([Voucher_name])
GO
ALTER TABLE [dbo].[Voucher_Data] CHECK CONSTRAINT [fk_VouData_Vou]
GO
USE [master]
GO
ALTER DATABASE [shoppingsss] SET  READ_WRITE 
GO
