IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Hshop2025')
BEGIN
  CREATE DATABASE Hshop2025;
END;
GO

USE [Hshop2025]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 12/1/2023 7:35:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1001, N'Aniseed Syrup 123', N'1001-aniseed-syrup-123', 1000, N'10 boxes x 20 bags', 190, N'41MJUdI2jdL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' value="EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors"', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1002, N'Change', N'1002-change', 1000, N'10 boxes x 20 bags', 19, N'41TexqWVkHL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1562, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1003, N'Tên mới sửa', N'1003-aniseed-syrup', 1001, N'12 - 550 ml bottles', 1001, N'31EPGSm2s1L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 491, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1004, N'Chef Anton''s Cajun Seasoning', N'1004-chef-antons-cajun-seasoning', 1001, N'48 - 6 oz jars', 22, N'41CIcYRxJKL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 216, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1005, N'Chef Anton''s Gumbo Mix', N'1005-chef-antons-gumbo-mix', 1001, N'36 boxes', 21.35, N'41G38jC0ajL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 134, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1006, N'Grandma''s Boysenberry Spread', N'1006-grandmas-boysenberry-spread', 1001, N'12 - 8 oz jars', 25, N'41iDo0HDhbL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 153, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1007, N'Uncle Bob''s Organic Dried Pears', N'1007-uncle-bobs-organic-dried-pears', 1006, N'12 - 1 lb pkgs.', 30, N'81k1XbQ6nQL._SL1500_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 5006, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1008, N'Northwoods Cranberry Sauce', N'1008-northwoods-cranberry-sauce', 1001, N'12 - 12 oz jars', 40, N'41LMouG6j7L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1009, N'Mishi Kobe Niku', N'1009-mishi-kobe-niku', 1005, N'18 - 500 g pkgs.', 97, N'21meTyhQebL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1010, N'Ikura', N'1010-ikura', 1007, N'12 - 200 ml jars', 31, N'31hCgES5GXL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1011, N'Queso Cabrales', N'1011-queso-cabrales', 1003, N'1 kg pkg.', 21, N'31jsjfVfH9L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1012, N'Queso Manchego La Pastora', N'1012-queso-manchego-la-pastora', 1003, N'10 - 500 g pkgs.', 38, N'41BiMx1FKyL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1013, N'Konbu', N'1013-konbu', 1007, N'2 kg box', 6, N'31ioCUUFnoL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1014, N'Tofu', N'1014-tofu', 1006, N'40 - 100 g pkgs.', 23.25, N'81Q1DvOnnoL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1015, N'Genen Shouyu', N'1015-genen-shouyu', 1001, N'24 - 250 ml bottles', 15.5, N'41qlcUEhNmL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1016, N'Pavlova', N'1016-pavlova', 1002, N'32 - 500 g boxes', 17.45, N'41iji4-9UsL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 329, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1017, N'Alice Mutton', N'1017-alice-mutton', 1005, N'20 - 1 kg tins', 39, N'31LAnW1JFqL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1018, N'Carnarvon Tigers', N'1018-carnarvon-tigers', 1007, N'16 kg pkg.', 62.5, N'31yxRemzRLL._SS350_ (1).jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1019, N'Teatime Chocolate Biscuits', N'1019-teatime-chocolate-biscuits', 1002, N'10 boxes x 12 pieces', 9.2, N'41KALboJKuL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 12, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1020, N'Sir Rodney''s Marmalade', N'1020-sir-rodneys-marmalade', 1002, N'30 gift boxes', 81, N'41sl3FN6NpL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1021, N'Sir Rodney''s Scones', N'1021-sir-rodneys-scones', 1002, N'24 pkgs. x 4 pieces', 10, N'41w4TlVPhGL.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1022, N'Gustaf''s KnÃ¤ckebrÃ¶d', N'1022-gustafs-knckebrd', 1004, N'24 - 500 g pkgs.', 21, N'31pT+SdvQXL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 40, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1023, N'TunnbrÃÂ¶d', N'1023-tunnbrd', 1004, N'12 - 250 g pkgs.', 9, N'31YOss-gC-L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 762, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1024, N'GuaranÃ¡ FantÃ¡stica', N'1024-guaran-fantstica', 1000, N'12 - 355 ml cans', 4.5, N'41V4Ds2PtZL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 96, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1025, N'NuNuCa NuÃÂ-Nougat-Creme', N'1025-nunuca-nu-nougat-creme', 1002, N'20 - 450 g glasses', 14, N'41XX7Pi240L.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1026, N'GumbÃ¤r GummibÃ¤rchen', N'1026-gumbr-gummibrchen', 1002, N'100 - 250 g bags', 31.23, N'41-yvkFqVZL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1027, N'Schoggi Schokolade', N'1027-schoggi-schokolade', 1002, N'100 - 100 g pieces', 43.9, N'41ZE9SmWdzL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1028, N'RÃ¶ssle Sauerkraut', N'1028-rssle-sauerkraut', 1006, N'25 - 825 g cans', 45.6, N'91FM0Hog9FL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1029, N'ThÃ¼ringer Rostbratwurst', N'1029-thringer-rostbratwurst', 1005, N'50 bags x 30 sausgs.', 123.79, N'31ncPnMYCxL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 2, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1030, N'Nord-Ost Matjeshering', N'1030-nord-ost-matjeshering', 1007, N'10 - 200 g glasses', 25.89, N'41lffECD-sL._SY445_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1031, N'Gorgonzola Telino', N'1031-gorgonzola-telino', 1003, N'12 - 100 g pkgs', 12.5, N'41IPLmZIKhL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1032, N'Mascarpone Fabioli', N'1032-mascarpone-fabioli', 1003, N'24 - 200 g pkgs.', 32, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1033, N'Geitost', N'1033-geitost', 1003, N'500 g', 2.5, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1034, N'Sasquatch Ale', N'1034-sasquatch-ale', 1000, N'24 - 12 oz bottles', 14, N'41WvZnGYUkL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 7, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1035, N'Steeleye Stout', N'1035-steeleye-stout', 1000, N'24 - 12 oz bottles', 18, N'41yh1vBmqsL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1036, N'Inlagd Sill', N'1036-inlagd-sill', 1007, N'24 - 250 g  jars', 19, N'41sw9ASUvBL._SX342_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1037, N'Gravad lax', N'1037-gravad-lax', 1007, N'12 - 500 g pkgs.', 26, N'41Z43OmFHjL._SX342_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1038, N'CÃ´te de Blaye', N'1038-cte-de-blaye', 1000, N'12 - 75 cl bottles', 263.5, N'41Ymq8fjbOL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1039, N'Chartreuse verte', N'1039-chartreuse-verte', 1000, N'750 cc per bottle', 18, N'51GBNkHO6vL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1040, N'Boston Crab Meat', N'1040-boston-crab-meat', 1007, N'24 - 4 oz tins', 18.4, N'51JhyHtnEgL._SL1001_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1041, N'Jack''s New England Clam Chowder', N'1041-jacks-new-england-clam-chowder', 1007, N'12 - 12 oz cans', 9.65, N'71bJrFAys9L._SL1280_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1042, N'Singaporean Hokkien Fried Mee', N'1042-singaporean-hokkien-fried-mee', 1004, N'32 - 1 kg pkgs.', 14, N'41A9R5KXCXL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1043, N'Ipoh Coffee', N'1043-ipoh-coffee', 1000, N'16 - 500 g tins', 46, N'51czOOat0OL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 2, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1044, N'Gula Malacca', N'1044-gula-malacca', 1001, N'20 - 2 kg bags', 19.45, N'41riQRGf-6L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1045, N'Rogede sild', N'1045-rogede-sild', 1007, N'1k pkg.', 9.5, N'71cBwWAgvIL._SL1430_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1046, N'Spegesild', N'1046-spegesild', 1007, N'4 - 450 g glasses', 12, N'91T2BjUkYmL._SL1500_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1047, N'Zaanse koeken', N'1047-zaanse-koeken', 1002, N'10 - 4 oz boxes', 9.5, N'51s6pbRlNyL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1048, N'Chocolade', N'1048-chocolade', 1002, N'10 pkgs.', 12.75, N'91JUBDf1jTL._AA1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1049, N'Maxilaku', N'1049-maxilaku', 1002, N'24 - 50 g pkgs.', 20, N'51w+JqOnmSL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1050, N'Valkoinen suklaa', N'1050-valkoinen-suklaa', 1002, N'12 - 100 g bars', 16.25, N'51yomC0EodL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1051, N'Manjimup Dried Apples', N'1051-manjimup-dried-apples', 1006, N'50 - 300 g pkgs.', 53, N'416pdroSEkL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1052, N'Filo Mix', N'1052-filo-mix', 1004, N'16 - 2 kg boxes', 7, N'41Pg1ahql8L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1053, N'Perth Pasties', N'1053-perth-pasties', 1005, N'48 pieces', 32.8, N'31pAGovVENL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1054, N'TourtiÃ¨re', N'1054-tourtire', 1005, N'16 pies', 7.45, N'31TB6tC6BOL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1055, N'PÃ¢tÃ© chinois', N'1055-pt-chinois', 1005, N'24 boxes x 2 pies', 24, N'41brDHtPY9L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1056, N'Gnocchi di nonna Alice', N'1056-gnocchi-di-nonna-alice', 1004, N'24 - 250 g pkgs.', 38, N'51nukXFJLJL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1057, N'Ravioli Angelo', N'1057-ravioli-angelo', 1004, N'24 - 250 g pkgs.', 19.5, N'410PjzqoC8L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1058, N'Escargots de Bourgogne', N'1058-escargots-de-bourgogne', 1007, N'24 pieces', 13.25, N'91T2BjUkYmL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1059, N'Raclette Courdavault', N'1059-raclette-courdavault', 1003, N'5 kg pkg.', 55, N'41sdBTtnUDL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1060, N'Camembert Pierrot', N'1060-camembert-pierrot', 1003, N'15 - 300 g rounds', 34, N'41zxxR71G+L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1061, N'Sirop d''Ã©rable', N'1061-sirop-drable', 1001, N'24 - 500 ml bottles', 28.5, N'41RxtSQOd2L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1062, N'Tarte au sucre', N'1062-tarte-au-sucre', 1002, N'48 pies', 49.3, N'415cOCbeyML.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1063, N'Vegie-spread', N'1063-vegie-spread', 1001, N'15 - 625 g jars', 43.9, N'41sd2DTD8EL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1064, N'Wimmers gute SemmelknÃ¶del', N'1064-wimmers-gute-semmelkndel', 1004, N'20 bags x 4 pieces', 33.25, N'419WCoqfamL._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1065, N'Louisiana Fiery Hot Pepper Sauce', N'1065-louisiana-fiery-hot-pepper-sauce', 1001, N'32 - 8 oz bottles', 21.05, N'41wHu2N4tVL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1066, N'Louisiana Hot Spiced Okra', N'1066-louisiana-hot-spiced-okra', 1001, N'24 - 8 oz jars', 17, N'416OcTXFfeL._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1067, N'Laughing Lumberjack Lager', N'1067-laughing-lumberjack-lager', 1000, N'24 - 12 oz bottles', 14, N'51GBNkHO6vL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1068, N'Scottish Longbreads', N'1068-scottish-longbreads', 1002, N'10 boxes x 8 pieces', 12.5, N'Camera1.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1069, N'Gudbrandsdalsost', N'1069-gudbrandsdalsost', 1003, N'10 kg pkg.', 36, N'51+4d3VBFvL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1070, N'Outback Lager', N'1070-outback-lager', 1000, N'24 - 355 ml bottles', 15, N'51Lj5bxbNtL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1071, N'Flotemysost', N'1071-flotemysost', 1003, N'10 - 500 g pkgs.', 21.5, N'51l46qQB50L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1072, N'Mozzarella di Giovanni', N'1072-mozzarella-di-giovanni', 1003, N'24 - 200 g pkgs.', 34.8, N'5195-l+nflL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1073, N'RÃ¶d Kaviar', N'1073-rd-kaviar', 1007, N'24 - 150 g jars', 15, N'513UnnRfFML._SL1001_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1074, N'Longlife Tofu', N'1074-longlife-tofu', 1006, N'5 kg pkg.', 10, N'816zGZv1ORL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1075, N'RhÃ¶nbrÃ¤u Klosterbier', N'1075-rhnbru-klosterbier', 1000, N'24 - 0.5 l bottles', 7.75, N'51uJ-pWfc9L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1076, N'LakkalikÃ¶Ã¶ri', N'1076-lakkalikri', 1000, N'500 ml', 18, N'51vxcBS1sQL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1077, N'Original Frankfurter grÃ¼ne SoÃe', N'1077-original-frankfurter-grne-soe', 1001, N'12 boxes', 13, N'1009.gif', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1081, N'Chai88888888', N'1081-chai88888888', 1000, N'10 boxes x 20 bags', 19, N'51y46IslQkL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 4, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1083, N'Mishi Kobe Niku', N'1083-mishi-kobe-niku', 1005, N'18 - 500 g pkgs.', 97, N'41GVLtgNngL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1084, N'Change-New', N'1084-change-new', 1000, N'10 boxes x 20 bags', 19, N'51Z9tfgl4aL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1085, N'Tên mới thêm', N'1003-aniseed-syrup', 1001, N'12 - 550 ml bottles', 1001, N'31EPGSm2s1L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 491, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1000, N'Đồng hồ', N'dong-ho', N'Soft drinks, coffees, teas, beers, and ales', N'Best.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1001, N'Laptop', N'lap-top', N'Sweet and savory sauces, relishes, spreads, and seasonings', N'Certificate.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1002, N'Máy ảnh', N'may-anh', N'Desserts, candies, and sweet breads', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1003, N'Điện thoại', N'dien-thoai', N'Cheeses', N'Bell.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1004, N'Nước hoa', N'nuoc-hoa', N'Breads, crackers, pasta, and cereal', N'Favourites.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1005, N'Trang sức', N'trang-suc', N'Prepared meats', N'Dice.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1006, N'Giày', N'giay', N'Dried fruit and bean curd', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1007, N'Vali', N'vali', N'Seaweed and fish', N'Microsoft.png')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'AP', N'Apple', N'apple.gif', N'Petter Pike', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Moble Device')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'MO', N'Motorola', N'motorola.gif', N'John David', N'john@gmail.com', N'0918456987', N'22 Rose, Messachuset, United States', N'Communication Company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NK', N'Nokia', N'Nokia.gif', N'Okawa', N'okawa@gmail.com', N'0913745789', N'123 Revenue, Tokyo, Japan', N'Famous company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SM', N'Seamen', N'semen.gif', N'David Brown', N'brown@gmail.com', N'0987456876', N'23 New World, Texas, United Kindom', N'Digital device company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SS', N'Samsung', N'samsung.gif', N'LeeSongChai', N'lee@yahoo.com', N'0913745789', N'456 Romario, Seaul, Korea', N'The best company')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (1, N'lvc', N'BGD', CAST(N'2017-12-17T10:10:06.877' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (4, N'nva', N'BGD', CAST(N'2017-12-17T10:15:51.333' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (5, N'nva', N'PKT', CAST(N'2017-12-17T10:16:19.203' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (6, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:19.213' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', NULL)
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
GO
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
