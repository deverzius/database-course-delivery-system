USE DeliverySystem;
GO

CREATE TABLE dbo.mon_an
(
	id INT PRIMARY KEY,
	ten_mon NVARCHAR(100) NOT NULL,
	gia INT NOT NULL,
	mo_ta INT NOT NULL,
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
	so_tien_giam_toi_da INT NOT NULL,

	PRIMARY KEY (id_mon_an, ten_ma),
	FOREIGN KEY (id_mon_an) REFERENCES dbo.mon_an(id)
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
	loai_hang NVARCHAR(100) NOT NULL,
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
