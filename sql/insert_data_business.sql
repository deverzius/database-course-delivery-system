USE DeliverySystem;
GO

INSERT INTO dbo.phuong_tien
	(bien_kiem_soat, loai_phuong_tien, hinh_anh_xe, id_shipper)
VALUES
	('51A-43875', 'xe_may', 'https://www.system.com/image24', 24),
	('51A-24892', 'xe_tai', 'https://www.system.com/image25', 25),
	('59A-42367', 'xe_ban_tai', 'https://www.system.com/image26', 26),
	('54A-35463', 'xe_may', 'https://www.system.com/image27', 27),
	('59A-99478', 'xe_may', 'https://www.system.com/image28', 28),
	('53A-79793', 'xe_ban_tai', 'https://www.system.com/image29', 29),
	('53A-49533', 'xe_tai', 'https://www.system.com/image30', 30);
GO

INSERT INTO dbo.don_khieu_nai
	(id, id_don_hang, ngay_tao, ngay_xu_ly, id_quan_ly, id_nhan_vien, loai_khieu_nai, chi_tiet, trang_thai, phan_anh_dung)
VALUES
	(1, 1, '2024-05-01', '2024-05-02', 18, 24, 'khong_nhan_hang', 'Khach hang chua nhan duoc hang', 'da_xu_ly', 1),
	(2, 2, '2024-05-02', '2024-05-03', 19, 25, 'giao_hang_cham', 'Giao hang qua cham', 'da_xu_ly', 0),
	(3, 3, '2024-05-03', '2024-05-04', 20, 26, 'giao_hang_sai', 'Giao hang sai buu kien', 'da_xu_ly', 1),
	(4, 4, '2024-05-04', NULL, 21, 27, 'khac', 'Shipper khong goi dien khi giao hang', 'chua_xu_ly', 0),
	(5, 5, '2024-05-05', NULL, 22, 28, 'khong_nhan_hang', 'Khach hang chua nhan duoc hang', 'chua_xu_ly', 0),
	(6, 6, '2024-05-06', NULL, 23, 29, 'giao_hang_cham', 'Don hang chua giao trong 1 thang', 'chua_xu_ly', 0),
	(7, 7, '2024-05-07', NULL, 24, 30, 'giao_hang_sai', 'Giao hang sai', 'chua_xu_ly', 0);
GO

INSERT INTO dbo.tu_van_giai_dap
	(id_tong_dai_vien, id_khach_hang, van_de, ngay_tu_van, danh_gia_cua_khach_hang)
VALUES
	(20, 1, 'Khach hang chua nhan duoc hang', '2024-05-01', 4.5),
	(21, 2, 'Giao hang qua cham', '2024-05-02', 3.5),
	(22, 3, 'Giao hang sai buu kien', '2024-05-03', 2.5),
	(23, 4, 'Shipper khong goi dien khi giao hang', '2024-05-04', 1.5),
	(20, 5, 'Khach hang chua nhan duoc hang', '2024-05-05', 4.0),
	(21, 6, 'Don hang chua giao trong 1 thang', '2024-05-06', 3.0),
	(22, 7, 'Giao hang sai', '2024-05-07', 2.0),
	(23, 8, 'Khach hang chua nhan duoc hang', '2024-05-08', 4.5),
	(20, 9, 'Giao hang qua cham', '2024-05-09', 3.5),
	(21, 10, 'Giao hang sai buu kien', '2024-05-10', 2.5);
GO
