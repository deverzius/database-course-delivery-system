USE DeliverySystem;
GO

INSERT INTO dbo.phuong_tien
	(bien_kiem_soat, loai_phuong_tien, hinh_anh_xe, id_shipper)
VALUES
	('51A-12345', 'xe_may', 'https://www.system.com/image1', 1)


CREATE TABLE dbo.phuong_tien
(
	bien_kiem_soat NVARCHAR(100) PRIMARY KEY,
	loai_phuong_tien NVARCHAR(100) NOT NULL CHECK (loai_phuong_tien IN ('xe_may', 'xe_tai', 'xe_ban_tai')),
	-- gplx NVARCHAR(100) NOT NULL UNIQUE,
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
