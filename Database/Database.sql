USE [master]
GO
/****** Object:  Database [quanlynhahang]    Script Date: 26/05/2024 03:08:32 ******/
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
ALTER DATABASE [quanlynhahang] SET AUTO_CLOSE OFF 
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
/****** Object:  Table [dbo].[tblBanAn]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblDatBan]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  View [dbo].[vwBanDat]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblChiTietHDTT]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblChiTietPhieuNhapHang]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieuNhapHang](
	[MaPhieuNhap] [nvarchar](10) NOT NULL,
	[MaHang] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[HanSuDung] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChucVu]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblHangHoa]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHangHoa](
	[MaHang] [nvarchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[tblHoaDonThanhToan]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblLoaiMon]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblMonAn]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Table [dbo].[tblPhieuNhapHang]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuNhapHang](
	[MaPhieuNhap] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[MaNCC] [nvarchar](10) NOT NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_PhieuNhapKho_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 23', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 24', 10, N'Đã đặt trước')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Bàn 25 ', 10, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban01', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban02', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban03', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban04', 4, N'Đã đặt trước')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban05', 4, N'Đã đặt trước')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban06', 4, N'Đã đặt trước')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban07', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban08', 4, N'Trống')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban09', 4, N'Đã đặt trước')
INSERT [dbo].[tblBanAn] ([MaBan], [SoGhe], [TrangThai]) VALUES (N'Ban10', 4, N'Đang sử dụng')
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

INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (3, 4, 2, 1)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (3, 5, 1, 2)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (3, 37, 1, 3)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (6, 5, 3, 5)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (7, 25, 4, 6)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (7, 32, 4, 7)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (6, 8, 2, 8)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (8, 5, 1, 9)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (9, 31, 8, 10)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (10, 40, 4, 11)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (11, 49, 2, 12)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (12, 14, 4, 13)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (4, 32, 4, 14)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (5, 25, 4, 15)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (13, 2, 3, 16)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (13, 24, 3, 17)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (13, 45, 3, 18)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (14, 3, 1, 19)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (15, 38, 3, 20)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (16, 22, 4, 21)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (17, 40, 4, 22)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (17, 25, 4, 23)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (20, 2, 4, 25)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (21, 24, 3, 26)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (21, 36, 3, 27)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (22, 25, 4, 28)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (22, 31, 8, 29)
INSERT [dbo].[tblChiTietHDTT] ([MaHD], [MaMon], [SoLuong], [MaCT]) VALUES (22, 42, 8, 30)
SET IDENTITY_INSERT [dbo].[tblChiTietHDTT] OFF
GO
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV01', N'Nhân viên phục vụ')
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV02', N'Nhân viên thu ngân')
INSERT [dbo].[tblChucVu] ([MaCV], [TenCV]) VALUES (N'CV03', N'Nhân viên bếp')
GO
SET IDENTITY_INSERT [dbo].[tblDatBan] ON 

INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (14, N'nv01', N'Ban06', N'Duy hưng', 3, N'', CAST(N'2044-02-03T08:14:00.000' AS DateTime), N'sdddssd')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (15, N'nv01', N'Ban09', N'Hà Cường', 3, N'', CAST(N'2040-07-12T04:30:00.000' AS DateTime), N'@gmail')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (16, N'nv01', N'Bàn 24', N'Cảnh', 8, N'', CAST(N'2019-06-21T02:20:00.000' AS DateTime), N'05445')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (22, N'nv01', N'Ban04', N'êdre', 3, N'', CAST(N'2000-01-01T12:00:00.000' AS DateTime), N'eqqe')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (26, N'nv01', N'Ban10', N'Long', 3, N'', CAST(N'2000-01-01T12:00:00.000' AS DateTime), N'045775')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (27, N'nv01', N'Ban05', N'hfhfhf', 1, N'', CAST(N'2024-01-01T12:18:00.000' AS DateTime), N'fffff')
INSERT [dbo].[tblDatBan] ([MaDatBan], [MaNV], [MaBan], [TenNguoiDat], [SoNguoi], [GhiChu], [ThoiGian], [ThongTinLienHe]) VALUES (28, N'nv01', N'Ban18', N'hu', 3, N'', CAST(N'2024-01-01T03:35:00.000' AS DateTime), N'142542')
SET IDENTITY_INSERT [dbo].[tblDatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[tblHoaDonThanhToan] ON 

INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (3, N'Ban20', N'NV01', N'tiền mặt', CAST(N'2024-05-26T02:36:19.937' AS DateTime), 1, 714000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (4, N'ban19', N'nv01', N'tiền mặt', CAST(N'2024-05-25T23:04:51.563' AS DateTime), 1, 252000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (5, N'ban18', N'nv01', N'tiền mặt', CAST(N'2024-05-25T23:34:43.243' AS DateTime), 1, 1050000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (6, N'Ban11', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:07.900' AS DateTime), 1, 735000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (7, N'Ban03', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:10.210' AS DateTime), 1, 1302000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (8, N'Ban10', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:35:58.013' AS DateTime), 1, 147000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (9, N'Ban15', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:15.593' AS DateTime), 1, 378000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (10, N'Bàn 25 ', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:04.450' AS DateTime), 1, 420000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (11, N'Ban21', N'nv01', N'tiền mặt', CAST(N'2024-05-26T00:26:25.490' AS DateTime), 1, 31500)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (12, N'Ban22', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:18.007' AS DateTime), 1, 504000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (13, N'Ban18', N'nv01', N'tiền mặt', CAST(N'2024-05-25T23:36:31.163' AS DateTime), 1, 1102500)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (14, N'Ban19', N'nv01', N'tiền mặt', CAST(N'2024-05-26T00:25:03.290' AS DateTime), 1, 94500)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (15, N'Ban18', N'nv01', N'tiền mặt', CAST(N'2024-05-26T00:19:24.383' AS DateTime), 1, 1260000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (16, N'Ban19', N'nv01', N'tiền mặt', CAST(N'2024-05-26T00:27:14.680' AS DateTime), 1, 1050000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (17, N'Ban18', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:22.110' AS DateTime), 1, 1470000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (18, N'Ban19', N'nv01', N'tiền mặt', CAST(N'2024-05-26T00:39:32.893' AS DateTime), 1, 0)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (20, N'Ban02', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:01.697' AS DateTime), 1, 294000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (21, N'Ban08', N'nv01', N'tiền mặt', CAST(N'2024-05-26T02:36:13.433' AS DateTime), 1, 1890000)
INSERT [dbo].[tblHoaDonThanhToan] ([MaHD], [MaBan], [MaNV], [PhuongThucTT], [NgayThanhToan], [TrangThai], [TongTien]) VALUES (22, N'Ban10', N'nv01', NULL, NULL, 0, 0)
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
INSERT [dbo].[tblMonAn] ([MaMon], [TenMon], [DonGia], [DonViTinh], [MoTa], [MaLoai]) VALUES (15, N'Nộm chân gà sốt chanh leo0', 100000, N'đĩa', NULL, 13)
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
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV01', N'Nguyễn Duy Hưng', CAST(N'2003-11-08' AS Date), N'0986435177', NULL, N'Nam', N'CV01', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV02', N'Hà Trọng Cường', CAST(N'2001-11-04' AS Date), N'0475125896', NULL, N'Nam', N'CV02', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV03', N'Dương Ngọc Cảnh', CAST(N'2003-07-05' AS Date), N'0123645678', NULL, N'Nam', N'CV03', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV04', N'Lê Đình Dương', CAST(N'2000-04-08' AS Date), N'0158746958', NULL, N'Nam', N'CV02', N'1111')
INSERT [dbo].[tblNhanVien] ([MaNV], [TenNV], [NgaySinh], [SDT], [Email], [GioiTinh], [MaCV], [MatKhau]) VALUES (N'NV05', N'Hà Đức Anh', CAST(N'2000-04-08' AS Date), N'0458768514', NULL, N'Nam', N'CV01', N'1111')
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
/****** Object:  StoredProcedure [dbo].[SP_DangNhap]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LayDSBan]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LayDSBan]
AS
SELECT *
FROM   tblBanAn;

GO
/****** Object:  StoredProcedure [dbo].[SP_LayDSDat]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LayDSHD]    Script Date: 26/05/2024 03:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_LayDSHD]
@ngaybd date, @ngaykt date
as
begin
	select b.MaBan, h.TongTien, h.NgayThanhToan, h.TongTien
	from tblHoaDonThanhToan as h, tblBanAn as b
	where NgayThanhToan between @ngaybd and @ngaykt and h.TrangThai = 1
	and h.MaBan = b.MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemCTHD]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ThemHD]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Trigger [dbo].[TG_trangthaiban]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Trigger [dbo].[TG_sudungban]    Script Date: 26/05/2024 03:08:32 ******/
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
/****** Object:  Trigger [dbo].[TG_thanhtoan]    Script Date: 26/05/2024 03:08:32 ******/
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
USE [master]
GO
ALTER DATABASE [quanlynhahang] SET  READ_WRITE 
GO
