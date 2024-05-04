
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DeliverySystem')
BEGIN
	CREATE DATABASE DeliverySystem;
END;
GO
USE DeliverySystem;
GO


CREATE TABLE dbo.tai_khoan
(
	id INT PRIMARY KEY,
	ten_tai_khoan NVARCHAR(100) NOT NULL,
	mat_khau NVARCHAR(100) NOT NULL,
	sdt NVARCHAR(100) UNIQUE NOT NULL,
	gioi_tinh BIT NOT NULL,
	email NVARCHAR(100) NOT NULL,
	ngay_sinh DATE NOT NULL,
	ngay_tao DATE NOT NULL,
	ho NVARCHAR(100) NOT NULL,
	ten NVARCHAR(100) NOT NULL,
	da_xoa BIT DEFAULT 0
);
GO

CREATE TABLE dbo.khach_hang
(
	id INT PRIMARY KEY,
	loai_khach_hang NVARCHAR(100) NOT NULL CHECK (loai_khach_hang IN ('moi', 'lau_nam', 'trung_thanh')),
	cod_kha_dung BIT DEFAULT 1,
	so_don_da_dat INT DEFAULT 0,
	FOREIGN KEY (id) REFERENCES dbo.tai_khoan(id)
);
GO


CREATE TABLE dbo.nha_hang
(
	id INT PRIMARY KEY,
	trang_thai NVARCHAR(20) NOT NULL CHECK (trang_thai IN ('mo_cua', 'dong_cua', 'dong_cua_vinh_vien')),
	ten_nha_hang NVARCHAR(100) NOT NULL,
	danh_gia FLOAT DEFAULT 0,
	dia_chi NVARCHAR(100) NOT NULL,
	mo_ta NVARCHAR(500) NOT NULL,
	so_don_da_ban INT DEFAULT 0,
	doanh_thu INT DEFAULT 0,
	FOREIGN KEY (id) REFERENCES dbo.tai_khoan(id)
);
GO

CREATE TABLE dbo.mon_an
(
	id INT PRIMARY KEY,
	ten_mon NVARCHAR(100) NOT NULL,
	gia INT NOT NULL,
	mo_ta NVARCHAR(500) NOT NULL,
	id_nha_hang INT NOT NULL,

	FOREIGN KEY (id_nha_hang) REFERENCES dbo.nha_hang(id)
);
GO

CREATE TABLE dbo.uu_dai_mon_an
(
	id_mon_an INT NOT NULL,
	ten_ma NVARCHAR(100) NOT NULL,
	ngay_tao DATE NOT NULL,
	ngay_het_han DATE NOT NULL,
	mo_ta NVARCHAR(300) NULL,
	phan_tram_giam FLOAT NOT NULL,

	PRIMARY KEY (id_mon_an, ten_ma),
	FOREIGN KEY (id_mon_an) REFERENCES dbo.mon_an(id)
);
GO

CREATE TABLE dbo.chi_nhanh
(
	id INT PRIMARY KEY,
	dia_chi NVARCHAR(500) NOT NULL,
	ma_so_thue NVARCHAR(100) NOT NULL,
	trang_thai NVARCHAR(20) NOT NULL CHECK (trang_thai IN ('mo_cua', 'dong_cua')),
	so_nhan_vien INT DEFAULT 0
);
GO

CREATE TABLE dbo.nhan_vien
(
	id INT PRIMARY KEY,
	ngay_vao_lam DATE NOT NULL,
	luong INT NOT NULL,
	chi_so_uy_tin FLOAT DEFAULT 10,
	trang_thai NVARCHAR(20) NOT NULL CHECK (trang_thai IN ('dang_lam', 'nghi_viec')),
	loai_nhan_vien NVARCHAR(20) NOT NULL CHECK (loai_nhan_vien IN ('quan_ly', 'shipper', 'tong_dai_vien')),
	so_gplx NVARCHAR(100) NULL,
	danh_gia FLOAT DEFAULT 5,
	id_chi_nhanh INT NOT NULL,

	FOREIGN KEY (id) REFERENCES dbo.tai_khoan(id),
	FOREIGN KEY (id_chi_nhanh) REFERENCES dbo.chi_nhanh(id)
);
GO

CREATE TABLE dbo.ma_khuyen_mai
(
	id INT PRIMARY KEY,
	phan_tram_giam FLOAT NOT NULL,
	ten_ma NVARCHAR(100) NOT NULL,
	ngay_het_han DATE NOT NULL,
	ngay_tao DATE NOT NULL,
	mo_ta NVARCHAR(300) NULL,
	so_tien_giam_toi_da INT NOT NULL,
	gia_tri_don_toi_thieu INT NOT NULL,

	id_quan_ly INT NOT NULL,
	FOREIGN KEY (id_quan_ly) REFERENCES dbo.nhan_vien(id)
);
GO

CREATE TABLE dbo.don_hang
(
	id INT PRIMARY KEY,
	thoi_gian_nhan DATETIME NOT NULL,
	dia_chi_giao_hang NVARCHAR(500) NOT NULL,
	trang_thai_don_hang NVARCHAR(20) NOT NULL CHECK (trang_thai_don_hang IN ('dang_xu_ly', 'da_xac_nhan', 'dang_giao', 'da_giao', 'da_huy')),
	tien_ship INT NOT NULL,
	sdt_nguoi_nhan NVARCHAR(100) NOT NULL,
	ghi_chu_shipper NVARCHAR(500) NULL,
	ten_nguoi_nhan NVARCHAR(100) NOT NULL,
	anh_nhan_hang NVARCHAR(300) NULL,
	phuong_thuc_thanh_toan NVARCHAR(20) NOT NULL CHECK (phuong_thuc_thanh_toan IN ('tien_mat', 'the_ngan_hang', 'vi_dien_tu')),
	binh_luan NVARCHAR(500) NULL,
	danh_gia FLOAT NULL,
	tong_tien FLOAT NULL,

	id_khach_hang INT NOT NULL,
	id_shipper INT NULL,
	id_ma_khuyen_mai INT NULL,
	FOREIGN KEY (id_khach_hang) REFERENCES dbo.khach_hang(id),
	FOREIGN KEY (id_shipper) REFERENCES dbo.nhan_vien(id),
	FOREIGN KEY (id_ma_khuyen_mai) REFERENCES dbo.ma_khuyen_mai(id)
); 
GO

CREATE TABLE dbo.phuong_tien
(
	bien_kiem_soat NVARCHAR(100) PRIMARY KEY,
	loai_phuong_tien NVARCHAR(100) NOT NULL CHECK (loai_phuong_tien IN ('xe_may', 'xe_tai', 'xe_ban_tai')),
	hinh_anh_xe NVARCHAR(300) NOT NULL,
	id_shipper INT,

	FOREIGN KEY (id_shipper) REFERENCES dbo.nhan_vien(id)
);
GO


CREATE TABLE dbo.don_khieu_nai
(
	id INT PRIMARY KEY,
	id_don_hang INT NOT NULL,
	ngay_tao DATE NOT NULL,
	ngay_xu_ly DATE NULL,
	id_quan_ly INT NULL,
	id_nhan_vien INT NOT NULL,
	loai_khieu_nai NVARCHAR(100) NOT NULL CHECK (loai_khieu_nai IN ('khong_nhan_hang', 'giao_hang_cham', 'giao_hang_sai', 'khac')),
	chi_tiet NVARCHAR(500) NOT NULL,
	trang_thai NVARCHAR(20) NOT NULL CHECK (trang_thai IN ('chua_xu_ly', 'da_xu_ly', 'dang_xu_ly')),
	phan_anh_dung BIT DEFAULT 0,

	FOREIGN KEY (id_don_hang) REFERENCES dbo.don_hang(id),
	FOREIGN KEY (id_quan_ly) REFERENCES dbo.nhan_vien(id),
	FOREIGN KEY (id_nhan_vien) REFERENCES dbo.nhan_vien(id)
);
GO

CREATE TABLE dbo.don_van_chuyen
(
	id INT PRIMARY KEY,
	tien_hang INT NOT NULL,
	dia_chi_lay_hang NVARCHAR(500) NOT NULL,
	khoi_luong FLOAT NOT NULL,
	FOREIGN KEY (id) REFERENCES dbo.don_hang(id)
);
GO

CREATE TABLE dbo.loai_hang_don_van_chuyen
(
	id_don_van_chuyen INT,
	loai_hang NVARCHAR(100) NOT NULL CHECK (loai_hang IN (N'Hàng dễ vỡ', N'Hàng điện tử', N'Hàng thực phẩm', N'Hàng quần áo', N'Hàng gia dụng', N'Hàng mỹ phẩm', N'Hàng sách vở', N'Hàng quà tặng', N'Hàng trang sức', N'Hàng dân dụng', N'Hàng công nghệ', N'Hàng y tế', N'Hàng điện lạnh', N'Hàng nội thất', N'Hàng giày dép', N'Hàng thể thao', N'Hàng phụ kiện', N'Hàng đồ chơi', N'Hàng linh kiện điện tử', N'Hàng vật liệu xây dựng')),
	FOREIGN KEY (id_don_van_chuyen) REFERENCES dbo.don_van_chuyen(id)
);
GO


CREATE TABLE dbo.don_mon_an
(
	id INT NOT NULL,
	tong_tien_mon FLOAT NOT NULL,
	FOREIGN KEY (id) REFERENCES dbo.don_hang(id),
);
GO


CREATE TABLE dbo.gom_mon_an
(
	id_don_mon_an INT NOT NULL,
	id_mon_an INT NULL,
	so_luong INT NOT NULL,
	FOREIGN KEY (id_don_mon_an) REFERENCES dbo.don_hang(id),
	FOREIGN KEY (id_mon_an) REFERENCES dbo.mon_an(id)
);
GO


CREATE TABLE dbo.tu_van_giai_dap
(
	id_tong_dai_vien INT NOT NULL,
	id_khach_hang INT NOT NULL,
	van_de NVARCHAR(500) NOT NULL,
	ngay_tu_van DATE NOT NULL,
	danh_gia_cua_khach_hang FLOAT NULL,

	PRIMARY KEY (id_tong_dai_vien, id_khach_hang),
	FOREIGN KEY (id_tong_dai_vien) REFERENCES dbo.nhan_vien(id),
	FOREIGN KEY (id_khach_hang) REFERENCES dbo.khach_hang(id)
);
GO