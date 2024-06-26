USE [master]
GO
/****** Object:  Database [quanlynhahang]    Script Date: 10/06/2024 17:50:27 ******/
CREATE DATABASE [quanlynhahang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlynhahang', FILENAME = N'D:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quanlynhahang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanlynhahang_log', FILENAME = N'D:\App\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quanlynhahang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quanlynhahang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanlynhahang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanlynhahang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanlynhahang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanlynhahang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanlynhahang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanlynhahang] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanlynhahang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quanlynhahang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanlynhahang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanlynhahang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanlynhahang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanlynhahang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanlynhahang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanlynhahang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanlynhahang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanlynhahang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanlynhahang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanlynhahang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanlynhahang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanlynhahang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanlynhahang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanlynhahang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanlynhahang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanlynhahang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quanlynhahang] SET  MULTI_USER 
GO
ALTER DATABASE [quanlynhahang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanlynhahang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanlynhahang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanlynhahang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanlynhahang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanlynhahang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quanlynhahang] SET QUERY_STORE = OFF
GO
USE [quanlynhahang]
GO
/****** Object:  Table [dbo].[tblBanAn]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanAn](
	[MaBan] [nvarchar](10) NOT NULL,
	[SoGhe] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblBanAn] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDatBan]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDatBan](
	[MaDatBan] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[MaBan] [nvarchar](10) NOT NULL,
	[TenNguoiDat] [nvarchar](50) NOT NULL,
	[SoNguoi] [int] NOT NULL,
	[GhiChu] [nvarchar](200) NULL,
	[ThoiGian] [datetime] NOT NULL,
	[ThongTinLienHe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DatBan] PRIMARY KEY CLUSTERED 
(
	[MaDatBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBanDat]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBanDat]
AS
SELECT ba.MaBan,
       ba.SoGhe,
       ba.TrangThai,
       db.TenNguoiDat,
       db.ThoiGian,
       db.SoNguoi,
       db.GhiChu,
       db.ThongTinLienHe
FROM   tblDatBan AS db
       RIGHT OUTER JOIN
       tblBanAn AS ba
       ON db.MaBan = ba.MaBan;

GO
/****** Object:  Table [dbo].[tblChiTietHDTT]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHDTT](
	[MaHD] [int] NOT NULL,
	[MaMon] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblChiTietHDTT] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChiTietPhieuNhapHang]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieuNhapHang](
	[MaPhieuNhap] [int] NOT NULL,
	[MaHang] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[HanSuDung] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChucVu]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChucVu](
	[MaCV] [nvarchar](10) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHangHoa]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHangHoa](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
	[HanSuDung] [date] NOT NULL,
	[DonViTinh] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHoaDonThanhToan]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDonThanhToan](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaBan] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[PhuongThucTT] [nvarchar](50) NULL,
	[NgayThanhToan] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HoaDonThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiMon]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiMon](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonAn]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonAn](
	[MaMon] [int] IDENTITY(1,1) NOT NULL,
	[TenMon] [nvarchar](50) NOT NULL,
	[DonGia] [int] NOT NULL,
	[DonViTinh] [nvarchar](15) NOT NULL,
	[MoTa] [nvarchar](200) NULL,
	[MaLoai] [int] NOT NULL,
 CONSTRAINT [PK_ThucDon] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[SDT] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[MaCV] [nvarchar](10) NOT NULL,
	[MatKhau] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieuNhapHang]    Script Date: 10/06/2024 17:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuNhapHang](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_PhieuNhapKho_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 23', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 24', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 25 ', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban01', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban02', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban03', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban04', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban05', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban06', 4, N'Đang sử dụng')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban07', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban08', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban09', 4, N'Đang sử dụng')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban10', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban11', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban12', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban13', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban14', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban15', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban16', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban17', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban18', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban19', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban20', 6, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban21', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban22', 10, N'Trống')
GO
SET IDENTITY_INSERT [dbo].[tblChiTietHDTT] ON 

INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 6, 5, 40)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 1, 5, 41)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 24, 5, 42)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 20, 5, 43)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 36, 1, 44)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 40, 5, 45)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (30, 44, 5, 46)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (31, 31, 4, 47)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (31, 42, 4, 48)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (31, 29, 4, 49)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (32, 25, 4, 50)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (32, 26, 4, 51)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (32, 46, 4, 52)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (33, 37, 1, 53)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (33, 8, 8, 54)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (33, 55, 8, 55)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (34, 20, 4, 56)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (35, 20, 4, 57)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (35, 22, 4, 58)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (35, 41, 4, 59)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (35, 36, 4, 60)
SET IDENTITY_INSERT [dbo].[tblChiTietHDTT] OFF
GO
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (15, 1, 20, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (15, 3, 10, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (15, 8, 10, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (15, 9, 5, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (16, 1, 22, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (16, 8, 20, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (16, 11, 20, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (17, 10, 10, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[tblChiTietPhieuNhapHang] ([MaPhieuNhap], [MaHang], [SoLuong], [HanSuDung]) VALUES (18, 6, 20, CAST(N'2024-07-04' AS Date))
GO
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV01', N'Nhân viên phục vụ')
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV02', N'Nhân viên thu ngân')
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV03', N'Nhân viên bếp')
GO
SET IDENTITY_INSERT [dbo].[tblHangHoa] ON 

INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (1, N'Gà', 72, 150000, CAST(N'2024-07-04' AS Date), N'Con')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (2, N'Gạo tẻ', 19, 30000, CAST(N'2024-06-06' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (3, N'Gạo nếp', 32, 30000, CAST(N'2024-07-04' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (5, N'Nước tương', 20, 20000, CAST(N'2024-06-06' AS Date), N'Chai')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (6, N'Sốt xào cay', 30, 20000, CAST(N'2024-07-04' AS Date), N'Can')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (7, N'Nấm các loại', 20, 50000, CAST(N'2025-06-08' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (8, N'Rau củ tổng hợp', 50, 50000, CAST(N'2024-07-04' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (9, N'Gia vị tổng hợp', 25, 30000, CAST(N'2024-07-04' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (10, N'Dầu ăn', 30, 30000, CAST(N'2024-07-04' AS Date), N'Can')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (11, N'Gia vị củ', 40, 30000, CAST(N'2024-07-04' AS Date), N'Kg')
INSERT [dbo].[tblHangHoa] ([MaHang], [TenHang], [SoLuong], [DonGia], [HanSuDung], [DonViTinh]) VALUES (12, N'Hoa quả các loại', 10, 50000, CAST(N'2025-02-02' AS Date), N'Kg')
SET IDENTITY_INSERT [dbo].[tblHangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[tblHoaDonThanhToan] ON 

INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (30, N'Bàn 24', N'nv01', N'tiền mặt', CAST(N'2024-06-07T01:47:31.010' AS DateTime), 1, 4686500)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (31, N'Ban05', N'nv01', N'tiền mặt', CAST(N'2024-06-09T01:03:11.417' AS DateTime), 1, 1092000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (32, N'Ban08', N'nv01', N'tiền mặt', CAST(N'2024-06-09T01:03:15.310' AS DateTime), 1, 1680000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (33, N'Bàn 25 ', N'nv01', N'tiền mặt', CAST(N'2024-06-09T01:03:07.330' AS DateTime), 1, 1848000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (34, N'Ban09', N'nv01', NULL, NULL, 0, 0)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (35, N'Ban06', N'nv01', NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[tblHoaDonThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLoaiMon] ON 

INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (1, N'Khai vị')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (2, N'Súp')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (3, N'Món chính')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (4, N'Đặc biệt')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (5, N'Cơm/Mỳ')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (6, N'Chay')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (7, N'Lẩu')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (8, N'Tráng miệng')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (9, N'Nước ép')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (10, N'Trà')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (11, N'Nước ngọt')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (12, N'Đồ uống có cồn')
INSERT [dbo].[tblLoaiMon] ([MaLoai], [TenLoai]) VALUES (13, N'Salad')
SET IDENTITY_INSERT [dbo].[tblLoaiMon] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMonAn] ON 

INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (1, N'Súp gà nấm', 50000, N'tô', NULL, 2)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (2, N'Súp cua gà', 70000, N'tô', NULL, 2)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (3, N'Súp tom yum', 90000, N'tô', NULL, 2)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (4, N'Canh gà nấm đông trùng', 70000, N'tô', NULL, 2)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (5, N'Cánh gà lắc phô mai', 140000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (6, N'Cánh gà xì dầu mật ong', 140000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (8, N'Cánh gà chiên mắm', 140000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (10, N'Trứng non hấp', 140000, N'tô', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (11, N'Chân gà bóp thính', 100000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (12, N'Salad cá hồi', 150000, N'đĩa', NULL, 13)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (13, N'Salad Kampong', 150000, N'đĩa', NULL, 13)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (14, N'Salad gà giòn sốt mật ong', 120000, N'đĩa', NULL, 13)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (15, N'Nộm chân gà sốt chanh leo', 100000, N'đĩa', NULL, 13)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (16, N'Khoai tây lắc phô mai', 60000, N'phần', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (17, N'Sụn gà rang muối', 100000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (18, N'Ngô chiên bơ', 60000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (19, N'Nem gà nấm', 60000, N'đĩa', NULL, 1)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (20, N'Gà quay Kampong', 250000, N'con', NULL, 3)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (21, N'Gà bỏ lò Kampong', 250000, N'con', NULL, 3)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (22, N'Gà chiên mắm', 250000, N'con', NULL, 3)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (23, N'Cơm/Xôi gà Hải nam', 100000, N'phần', NULL, 3)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (24, N'Gà quay rút xương', 250000, N'con', NULL, 4)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (25, N'Gà hấp xì dầu', 250000, N'con', NULL, 4)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (26, N'Mỳ udon xào gà', 120000, N'đĩa', NULL, 5)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (27, N'Miến xào gà niêu đất', 120000, N'niêu', NULL, 5)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (28, N'Gà bó xôi', 120000, N'phần', NULL, 5)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (29, N'Cơm chiên Hải nam', 120000, N'đĩa', NULL, 5)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (30, N'Nấm xào cháy tỏi', 100000, N'đĩa', NULL, 6)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (31, N'Cà tím xào gà chay', 90000, N'đĩa', NULL, 6)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (32, N'Cải ngồng xào nấm', 60000, N'đĩa', NULL, 6)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (33, N'Rau củ luộc chấm kho quẹt', 70000, N'đĩa', NULL, 6)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (34, N'Rau muống xào tỏi', 60000, N'đĩa', NULL, 6)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (36, N'Lẩu gà nấm Kampong', 350000, N'nồi', NULL, 7)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (37, N'Lẩu gà kiểu thái', 400000, N'nồi', NULL, 7)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (38, N'Lẩu cua gà', 400000, N'nồi', NULL, 7)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (39, N'Hoa quả mix theo mùa', 100000, N'đĩa', NULL, 8)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (40, N'Kem ngũ vị', 100000, N'tô', NULL, 8)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (41, N'Nước cam', 50000, N'cốc', NULL, 9)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (42, N'Nước dưa hấu', 50000, N'cốc', NULL, 9)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (43, N'Nước dừa không đường', 50000, N'cốc', NULL, 9)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (44, N'Nước ép dứa', 50000, N'cốc', NULL, 9)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (45, N'Trà chanh mật ong', 30000, N'cốc', NULL, 10)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (46, N'Trà đào cam sả', 30000, N'cốc', NULL, 10)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (47, N'Trà tắc xí muội', 30000, N'cốc', NULL, 10)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (48, N'Trà vải hoa hồng', 30000, N'cốc', NULL, 10)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (49, N'Pepsi', 15000, N'lon', NULL, 11)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (50, N'Red bull', 15000, N'lon', NULL, 11)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (51, N'Aquafina', 10000, N'chai', NULL, 11)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (52, N'7 up', 15000, N'lon', NULL, 11)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (53, N'Twister cam', 15000, N'lon', NULL, 11)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (54, N'Bia hà nội', 20000, N'chai', NULL, 12)
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (55, N'Bia heineken', 30000, N'chai', NULL, 12)
SET IDENTITY_INSERT [dbo].[tblMonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNhaCungCap] ON 

INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (1, N'Trang trại Kampong', N'Hà Nội', NULL, N'0123456789')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (4, N'Công Ty Cổ Phần Lương Thực Phương Nam', N'TP HCM', NULL, N'0245784568')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (5, N'Công Ty TNHH Conamo Việt Nam', N'Hà Nội', NULL, N'0784569877')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (6, N'Công Ty Cổ Phần Nông Sản Thực Phẩm Thành Nam', N'Bình Dương', NULL, N'0754868577')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SDT]) VALUES (7, N'Tổng công ty Cổ phần Bia - Rượu - Nước giải khát Hà Nội', N'Hà Nội', NULL, N'0457125784')
SET IDENTITY_INSERT [dbo].[tblNhaCungCap] OFF
GO
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV01', N'Nguyễn Duy Hưng', CAST(N'2003-11-08' AS Date), N'0986435177', NULL, N'Nam', N'CV01', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV02', N'Hà Trọng Cường', CAST(N'2001-11-04' AS Date), N'0475125896', NULL, N'Nam', N'CV02', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV03', N'Dương Ngọc Cảnh', CAST(N'2003-07-05' AS Date), N'0123645678', NULL, N'Nam', N'CV03', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV04', N'Lê Đình Dương', CAST(N'2000-04-08' AS Date), N'0158746958', NULL, N'Nam', N'CV02', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV05', N'Hà Đức Anh', CAST(N'2000-04-08' AS Date), N'0458768514', NULL, N'Nam', N'CV01', N'1111')
GO
SET IDENTITY_INSERT [dbo].[tblPhieuNhapHang] ON 

INSERT [dbo].[tblPhieuNhapHang] ([MaPhieuNhap], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (15, N'nv03', CAST(N'2024-06-09T01:27:25.830' AS DateTime), 1, 3950000)
INSERT [dbo].[tblPhieuNhapHang] ([MaPhieuNhap], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (16, N'nv03', CAST(N'2024-06-09T01:35:36.970' AS DateTime), 1, 4900000)
INSERT [dbo].[tblPhieuNhapHang] ([MaPhieuNhap], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (17, N'nv03', CAST(N'2024-06-09T01:36:18.530' AS DateTime), 1, 300000)
INSERT [dbo].[tblPhieuNhapHang] ([MaPhieuNhap], [MaNV], [NgayNhap], [MaNCC], [TongTien]) VALUES (18, N'nv03', CAST(N'2024-06-09T01:36:30.457' AS DateTime), 1, 400000)
SET IDENTITY_INSERT [dbo].[tblPhieuNhapHang] OFF
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] ADD  CONSTRAINT [df_NgayTTHD]  DEFAULT (getdate()) FOR [NgayThanhToan]
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] ADD  CONSTRAINT [DF_tblHoaDonThanhToan_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] ADD  CONSTRAINT [DF_tblHoaDonThanhToan_TongTien]  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[tblPhieuNhapHang] ADD  CONSTRAINT [df_NgayLapPNKho]  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[tblChiTietHDTT]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHDTT_tblHoaDonThanhToan] FOREIGN KEY([MaHD])
REFERENCES [dbo].[tblHoaDonThanhToan] ([MaHD])
GO
ALTER TABLE [dbo].[tblChiTietHDTT] CHECK CONSTRAINT [FK_tblChiTietHDTT_tblHoaDonThanhToan]
GO
ALTER TABLE [dbo].[tblChiTietHDTT]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHDTT_tblMonAn] FOREIGN KEY([MaMon])
REFERENCES [dbo].[tblMonAn] ([MaMon])
GO
ALTER TABLE [dbo].[tblChiTietHDTT] CHECK CONSTRAINT [FK_tblChiTietHDTT_tblMonAn]
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieuNhapHang_tblHangHoa] FOREIGN KEY([MaHang])
REFERENCES [dbo].[tblHangHoa] ([MaHang])
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang] CHECK CONSTRAINT [FK_tblChiTietPhieuNhapHang_tblHangHoa]
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietPhieuNhapHang_tblPhieuNhapHang] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[tblPhieuNhapHang] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang] CHECK CONSTRAINT [FK_tblChiTietPhieuNhapHang_tblPhieuNhapHang]
GO
ALTER TABLE [dbo].[tblDatBan]  WITH CHECK ADD  CONSTRAINT [FK_tblDatBan_tblBanAn] FOREIGN KEY([MaBan])
REFERENCES [dbo].[tblBanAn] ([MaBan])
GO
ALTER TABLE [dbo].[tblDatBan] CHECK CONSTRAINT [FK_tblDatBan_tblBanAn]
GO
ALTER TABLE [dbo].[tblDatBan]  WITH CHECK ADD  CONSTRAINT [FK_tblDatBan_tblNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblDatBan] CHECK CONSTRAINT [FK_tblDatBan_tblNhanVien]
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonThanhToan_tblBanAn] FOREIGN KEY([MaBan])
REFERENCES [dbo].[tblBanAn] ([MaBan])
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] CHECK CONSTRAINT [FK_tblHoaDonThanhToan_tblBanAn]
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonThanhToan_tblNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] CHECK CONSTRAINT [FK_tblHoaDonThanhToan_tblNhanVien]
GO
ALTER TABLE [dbo].[tblMonAn]  WITH CHECK ADD  CONSTRAINT [FK_tblMonAn_tblLoaiMon] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[tblLoaiMon] ([MaLoai])
GO
ALTER TABLE [dbo].[tblMonAn] CHECK CONSTRAINT [FK_tblMonAn_tblLoaiMon]
GO
ALTER TABLE [dbo].[tblNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tblNhanVien_tblChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[tblChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[tblNhanVien] CHECK CONSTRAINT [FK_tblNhanVien_tblChucVu]
GO
ALTER TABLE [dbo].[tblPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_tblPhieuNhapHang_tblNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tblNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tblPhieuNhapHang] CHECK CONSTRAINT [FK_tblPhieuNhapHang_tblNhaCungCap]
GO
ALTER TABLE [dbo].[tblPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_tblPhieuNhapHang_tblNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblPhieuNhapHang] CHECK CONSTRAINT [FK_tblPhieuNhapHang_tblNhanVien]
GO
ALTER TABLE [dbo].[tblBanAn]  WITH CHECK ADD CHECK  (([TrangThai]=N'Đã đặt trước' OR [TrangThai]=N'Đang sử dụng' OR [TrangThai]=N'Trống'))
GO
/****** Object:  StoredProcedure [dbo].[GetLichSuNhapHang]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLichSuNhapHang]
@ngaybd datetime, @ngaykt datetime
AS
BEGIN
    SELECT 
        pn.NgayNhap,
        nv.TenNV,
        ncc.TenNCC,
        pn.TongTien
    FROM 
        tblPhieuNhapHang pn
    JOIN 
        tblNhanVien nv ON pn.MaNV = nv.MaNV
    JOIN 
        tblNhaCungCap ncc ON pn.MaNCC = ncc.MaNCC
    where NgayNhap between @ngaybd and @ngaykt
END;
GO
/****** Object:  StoredProcedure [dbo].[ProcInsertChiTietPhieuNhap]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcInsertChiTietPhieuNhap]
    @MaPhieuNhap INT,
    @MaHang NVARCHAR(10),
    @SoLuong INT,
    @HanSuDung DATE
AS
BEGIN
    -- Kiểm tra xem mã hàng và mã phiếu nhập đã tồn tại trong bảng chi tiết phiếu nhập hay chưa
    IF EXISTS (
        SELECT 1 
        FROM tblChiTietPhieuNhapHang 
        WHERE MaPhieuNhap = @MaPhieuNhap 
          AND MaHang = @MaHang
    )
    BEGIN
        -- Nếu tồn tại, thực hiện cập nhật số lượng và hạn sử dụng
        UPDATE tblChiTietPhieuNhapHang
        SET SoLuong = SoLuong + @SoLuong, 
            HanSuDung = @HanSuDung
        WHERE MaPhieuNhap = @MaPhieuNhap 
          AND MaHang = @MaHang;
    END
    ELSE
    BEGIN
        -- Nếu không tồn tại, thực hiện chèn mới
        INSERT INTO tblChiTietPhieuNhapHang (MaPhieuNhap, MaHang, SoLuong, HanSuDung)
        VALUES (@MaPhieuNhap, @MaHang, @SoLuong, @HanSuDung);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[ProcInsertPhieuNhap]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcInsertPhieuNhap]
    @MaNV NVARCHAR(10),
    @MaNCC NVARCHAR(10)
AS
BEGIN
	INSERT INTO tblPhieuNhapHang (MaNV, NgayNhap, MaNCC)
    VALUES (@MaNV, GETDATE(), @MaNCC);
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DangNhap]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DangNhap]
@manv NVARCHAR (50), @mk NVARCHAR (50)
AS
BEGIN
    IF EXISTS (SELECT *
               FROM   tblNhanVien
               WHERE  MaNV = @manv
                      AND MatKhau = @mk
                      AND macv = 'cv01')
        SELECT 1;
    ELSE
        IF EXISTS (SELECT *
                   FROM   tblNhanVien
                   WHERE  MaNV = @manv
                          AND MatKhau = @mk
                          AND macv = 'cv02')
            SELECT 2;
        ELSE
            IF EXISTS (SELECT *
                       FROM   tblNhanVien
                       WHERE  MaNV = @manv
                              AND MatKhau = @mk
                              AND macv = 'cv03')
                SELECT 3;
            ELSE
                SELECT 0;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDSBan]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LayDSBan]
AS
SELECT *
FROM   tblBanAn;

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDSDat]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LayDSDat]
AS
BEGIN
    SELECT ba.MaBan,
           ba.SoGhe,
           ba.TrangThai,
           db.TenNguoiDat,
           db.ThoiGian,
           db.SoNguoi,
           db.GhiChu,
           db.ThongTinLienHe
    FROM   tblDatBan AS db
           RIGHT OUTER JOIN
           tblBanAn AS ba
           ON db.MaBan = ba.MaBan;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDSHD]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_LayDSHD]
@ngaybd datetime, @ngaykt datetime
as
begin
	select b.MaBan, h.TongTien, h.NgayThanhToan, h.TongTien
	from tblHoaDonThanhToan as h, tblBanAn as b
	where NgayThanhToan between @ngaybd and @ngaykt and h.TrangThai = 1
	and h.MaBan = b.MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemCTHD]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemCTHD]
@mahd int, @mamon int, @sl int 
AS
BEGIN
	declare @cthdTonTai int
	declare @demMon int = 1
	
	select @cthdTonTai = c.mact, @demMon = c.SoLuong 
	from tblChiTietHDTT as c 
	where c.MaHD = @mahd and mamon = @mamon

	if(@cthdTonTai > 0)

	begin
		declare @newDem int = @demMon + @sl
		if (@newDem > 0)
 			update tblChiTietHDTT set SoLuong = @demMon + @sl 
			WHERE MaMon = @mamon
		else
			delete tblChiTietHDTT where MaHD = @mahd and MaMon = @mamon
	end
	else
	begin
		INSERT tblChiTietHDTT(mahd, mamon, soluong)
		VALUES (@mahd, @mamon, @sl)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemHD]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemHD]
@maban nvarchar(50),
@manv nvarchar(50)
AS
BEGIN
    INSERT tblHoaDonThanhToan (maban, manv, phuongthuctt, ngaythanhtoan, trangthai)
	VALUES (@maban, @manv, NULL, NULL, 0)
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSoLuongHangHoa]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSoLuongHangHoa]
    @MaHang int,
    @Sudung INT
AS
BEGIN
	UPDATE tblHangHoa
    SET SoLuong = CASE 
					WHEN (SoLuong - @Sudung) < 0 THEN 0 
					ELSE (SoLuong - @Sudung) 
				end
    WHERE MaHang = @MaHang;
END;
GO
/****** Object:  Trigger [dbo].[TG_trangthaiban]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_trangthaiban]
    ON [dbo].[tblDatBan]
    AFTER INSERT
    AS BEGIN
           UPDATE tblBanAn
           SET    TrangThai = N'Đã đặt trước'
           FROM   tblBanAn
                  INNER JOIN
                  inserted AS i
                  ON tblBanAn.MaBan = i.MaBan;
       END

GO
ALTER TABLE [dbo].[tblDatBan] ENABLE TRIGGER [TG_trangthaiban]
GO
/****** Object:  Trigger [dbo].[TG_sudungban]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_sudungban]
    ON [dbo].[tblHoaDonThanhToan]
    AFTER INSERT, UPDATE
    AS BEGIN
           UPDATE tblbanan
           SET    TrangThai = N'Đang sử dụng'
           FROM   tblBanAn AS b
                  INNER JOIN
                  inserted AS i
                  ON b.MaBan = i.MaBan
           WHERE  i.TrangThai = 0;
       END
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] ENABLE TRIGGER [TG_sudungban]
GO
/****** Object:  Trigger [dbo].[TG_thanhtoan]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_thanhtoan]
ON [dbo].[tblHoaDonThanhToan]
FOR UPDATE
AS
BEGIN
	declare @mahd int
	select @mahd = mahd from inserted

	declare @maban nvarchar(50)
	select @maban = maban from tblHoaDonThanhToan where MaHD = @mahd

	declare @dem int = 0
	select @dem = count(*) from tblHoaDonThanhToan where MaBan = @maban and TrangThai = 0
    
	if(@dem = 0)
		UPDATE tblBanAn SET TrangThai = N'Trống' where Maban = @maban	
END
GO
ALTER TABLE [dbo].[tblHoaDonThanhToan] ENABLE TRIGGER [TG_thanhtoan]
GO
/****** Object:  Trigger [dbo].[trg_UpdateHangHoaOnUpdate]    Script Date: 10/06/2024 17:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateHangHoaOnUpdate]
ON [dbo].[tblPhieuNhapHang]
AFTER UPDATE
AS
BEGIN
    -- Kiểm tra xem tổng tiền đã được cập nhật hay không
    IF UPDATE(TongTien)
    BEGIN
        -- Cập nhật số lượng và hạn sử dụng trong bảng HangHoa
        UPDATE hh
        SET 
            hh.SoLuong = hh.SoLuong + ctpnh.SoLuong, 
            hh.HanSuDung = ctpnh.HanSuDung
        FROM 
            tblHangHoa hh
        INNER JOIN 
            tblChiTietPhieuNhapHang ctpnh ON hh.MaHang = ctpnh.MaHang
        INNER JOIN 
            inserted i ON ctpnh.MaPhieuNhap = i.MaPhieuNhap
        WHERE 
            i.TongTien IS NOT NULL; -- Chỉ cập nhật nếu tổng tiền không null
    END
END;
GO
ALTER TABLE [dbo].[tblPhieuNhapHang] ENABLE TRIGGER [trg_UpdateHangHoaOnUpdate]
GO
USE [master]
GO
ALTER DATABASE [quanlynhahang] SET  READ_WRITE 
GO
