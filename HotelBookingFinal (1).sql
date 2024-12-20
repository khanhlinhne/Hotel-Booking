USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 10/30/2023 12:49:47 PM ******/
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelBooking] SET QUERY_STORE = OFF
GO
USE [HotelBooking]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discount] [float] NULL,
	[paymentDate] [date] NOT NULL,
	[paymentMode] [bit] NOT NULL,
	[total] [float] NOT NULL,
	[booking_id] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image] [varchar](8000) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[rating] [float] NOT NULL,
	[isActive] [bit] NOT NULL,
	[description] [varchar](5000) NULL,
	[feedback] [varchar](5000) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image] [varchar](8000) NOT NULL,
	[userQuantity] [int] NOT NULL,
	[area] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[isActive] [bit] NOT NULL,
	[description] [varchar](3000) NULL,
	[hotel_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeRoom]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeRoom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypeRoom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2023 12:49:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[address] [varchar](200) NULL,
	[username] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'abc', N'123', N'0989346734', N'khanhdvhe151416@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'Anhdt', N'123', N'0989345678', N'Anhdthe151416@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'khanhdv', N'123', N'0989346734', N'khanhdvhe151416@fpt.edu.vn', N'admin')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'khanhdv12', N'123', N'0989346734', N'khanhdvhe151416@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'khanhdv123', N'123', N'0989346734', N'khanhdvhe151416@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'longvv', N'123', N'0989345678', N'longvvhe116@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'Nhom2', N'123', N'098912345', N'g2@fpt.edu.vn', N'user')
INSERT [dbo].[Account] ([username], [password], [phone], [email], [role]) VALUES (N'qwe', N'123', N'0989346734', N'khanhdvhe151416@fpt.edu.vn', N'admin')
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [discount], [paymentDate], [paymentMode], [total], [booking_id]) VALUES (9, 15, CAST(N'2023-10-26' AS Date), 1, 640, 482)
INSERT [dbo].[Bill] ([id], [discount], [paymentDate], [paymentMode], [total], [booking_id]) VALUES (10, 15, CAST(N'2023-10-26' AS Date), 1, 640, 483)
INSERT [dbo].[Bill] ([id], [discount], [paymentDate], [paymentMode], [total], [booking_id]) VALUES (11, 15, CAST(N'2023-10-30' AS Date), 1, 640, 484)
INSERT [dbo].[Bill] ([id], [discount], [paymentDate], [paymentMode], [total], [booking_id]) VALUES (12, 15, CAST(N'2023-10-30' AS Date), 1, 640, 485)
INSERT [dbo].[Bill] ([id], [discount], [paymentDate], [paymentMode], [total], [booking_id]) VALUES (13, 15, CAST(N'2023-10-30' AS Date), 1, 640, 486)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [room_id], [user_id], [startDate], [endDate]) VALUES (482, 4, 1, CAST(N'2023-10-09' AS Date), CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Booking] ([id], [room_id], [user_id], [startDate], [endDate]) VALUES (483, 1, 3, CAST(N'2023-10-08' AS Date), CAST(N'2023-11-08' AS Date))
INSERT [dbo].[Booking] ([id], [room_id], [user_id], [startDate], [endDate]) VALUES (484, 1, 1, CAST(N'2023-10-04' AS Date), CAST(N'2023-10-15' AS Date))
INSERT [dbo].[Booking] ([id], [room_id], [user_id], [startDate], [endDate]) VALUES (485, 1, 1, CAST(N'2023-10-01' AS Date), CAST(N'2023-10-24' AS Date))
INSERT [dbo].[Booking] ([id], [room_id], [user_id], [startDate], [endDate]) VALUES (486, 8, 1, CAST(N'2023-10-11' AS Date), CAST(N'2023-10-21' AS Date))
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [name], [image], [address], [phone], [rating], [isActive], [description], [feedback]) VALUES (1, N'Laka', N'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg', N'Hanoi', N'012345678', 4, 1, NULL, NULL)
INSERT [dbo].[Hotel] ([id], [name], [image], [address], [phone], [rating], [isActive], [description], [feedback]) VALUES (2, N'OhiO', N'https://a25hotel.com/files/images/3(7).jpg', N'Nam Dinh', N'0989346734', 5, 1, N'abc', N'1234asdasd')
INSERT [dbo].[Hotel] ([id], [name], [image], [address], [phone], [rating], [isActive], [description], [feedback]) VALUES (3, N'myOLYA', N'https://saigonamthuc.vn/wp-content/uploads/2023/03/khach-san-gan-day.jpg', N'HaNoi', N'0514131299', 4.4000000953674316, 1, N'123', N'gssdfsdf')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (1, N'A102', N'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg', 4, 25, 1, 45, 1, NULL, 1, 2)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (2, N'A103', N'https://static.independent.co.uk/2023/03/24/09/Best%20New%20York%20boutique%20hotels.jpg?width=1200', 3, 27, 1, 45, 1, NULL, 1, 1)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (3, N'A104', N'https://hoteldel.com/wp-content/uploads/2021/03/hotel-del-coronado-views-suite-K1TOS1-K1TOJ1-1600x1000-1.jpg', 4, 24, 1, 45, 1, NULL, 1, 2)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (4, N'A105', N'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg', 3, 24, 1, 45, 1, NULL, 1, 2)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (5, N'PS1002', N'https://mizuland.vn/wp-content/uploads/2023/08/cho-thue-khach-san-4-sao-duong-hoang-sa.png', 4, 23.5, 1, 38, 0, N'tgfhfgh', 2, 3)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (6, N'PS1003', N'https://dulichmocchau.net/uploads/dichvu/2014_12/khach-san-nhiet-doi-moc-chau-4.jpg', 4, 26, 1, 52, 0, N'gdfgdfg', 2, 2)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (7, N'PS1004', N'https://mizuland.vn/wp-content/uploads/2023/08/cho-thue-khach-san-4-sao-duong-hoang-sa.png', 3, 23.5, 1, 36, 0, N'ghfgh', 2, 3)
INSERT [dbo].[Room] ([id], [name], [image], [userQuantity], [area], [quantity], [price], [isActive], [description], [hotel_id], [type_id]) VALUES (8, N'PK201', N'https://q-xx.bstatic.com/xdata/images/hotel/max500/335127951.jpg?k=33e7e2d51272afe2645242e34ead98724e1265cfe7737db7d35e880b7fca445b&o=', 3, 23.5, 1, 44, 0, N'fghfghfg', 3, 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeRoom] ON 

INSERT [dbo].[TypeRoom] ([id], [name]) VALUES (1, N'A')
INSERT [dbo].[TypeRoom] ([id], [name]) VALUES (2, N'B')
INSERT [dbo].[TypeRoom] ([id], [name]) VALUES (3, N'C')
INSERT [dbo].[TypeRoom] ([id], [name]) VALUES (4, N'D')
SET IDENTITY_INSERT [dbo].[TypeRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [dob], [gender], [address], [username]) VALUES (1, N'Khanh', CAST(N'2001-09-01' AS Date), 1, N'Nam Dinh', N'khanhdv')
INSERT [dbo].[User] ([id], [name], [dob], [gender], [address], [username]) VALUES (2, N'Minh', CAST(N'2002-08-06' AS Date), 1, N'Nam Dinh', N'abc')
INSERT [dbo].[User] ([id], [name], [dob], [gender], [address], [username]) VALUES (3, N'Lan', CAST(N'2003-04-23' AS Date), 0, N'HaNoi', N'qwe')
INSERT [dbo].[User] ([id], [name], [dob], [gender], [address], [username]) VALUES (4, N'Khanh Doan', CAST(N'2001-09-02' AS Date), 1, N'Nam Dinh', N'khanhdv123')
INSERT [dbo].[User] ([id], [name], [dob], [gender], [address], [username]) VALUES (5, NULL, NULL, 0, NULL, N'Nhom2')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Booking]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Room]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_TypeRoom] FOREIGN KEY([type_id])
REFERENCES [dbo].[TypeRoom] ([id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_TypeRoom]
GO
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
