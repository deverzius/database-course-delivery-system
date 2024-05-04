USE DeliverySystem;
GO

INSERT INTO dbo.mon_an
	(id, ten_mon, gia, mo_ta, id_nha_hang)
VALUES
	(1, N'Phở bò', 50000, N'Mô tả phở bò', 11),
	(2, N'Bún riêu', 40000, N'Mô tả bún riêu cua', 11),
	(3, N'Bánh mì thịt', 35000, N'Mô tả bánh mì thịt', 11),
	(4, N'Gỏi cuốn', 45000, N'Mô tả gỏi cuốn', 11),
	(5, N'Phở gà', 55000, N'Mô tả phở gà', 11),
	(6, N'Bún chả', 40000, N'Mô tả bún chả', 12),
	(7, N'Cơm gà xối mỡ', 60000, N'Mô tả cơm gà xối mỡ', 12),
	(8, N'Bún thịt nướng', 45000, N'Mô tả bún thịt nướng', 12),
	(9, N'Cơm tấm', 35000, N'Mô tả cơm tấm', 12),
	(10, N'Bún bò Huế', 50000, N'Mô tả bún bò Huế', 13),
	(11, N'Gà nướng', 65000, N'Mô tả gà nướng', 13),
	(12, N'Cơm chiên', 40000, N'Mô tả cơm chiên', 13),
	(13, N'Bún mắm', 55000, N'Mô tả bún mắm', 13),
	(14, N'Canh chua', 45000, N'Mô tả canh chua', 14),
	(15, N'Trứng chiên', 25000, N'Mô tả trứng chiên', 14),
	(16, N'Bánh cuốn', 30000, N'Mô tả bánh cuốn', 14),
	(17, N'Ốc len xào dừa', 70000, N'Mô tả ốc len xào dừa', 14),
	(18, N'Bánh tráng trộn', 25000, N'Mô tả bánh tráng trộn', 15),
	(19, N'Mì xào giòn', 40000, N'Mô tả mì xào giòn', 15),
	(20, N'Bánh canh', 45000, N'Mô tả bánh canh', 15),
	(21, N'Xôi gấc', 30000, N'Mô tả xôi gấc', 15),
	(22, N'Chè trôi nước', 35000, N'Mô tả chè trôi nước', 15),
	(23, N'Bánh tráng cuốn', 20000, N'Mô tả bánh tráng cuốn', 16),
	(24, N'Ốc len xào dừa', 70000, N'Mô tả ốc len xào dừa', 16),
	(25, N'Mì vịt tiềm', 55000, N'Mô tả mì vịt tiềm', 16),
	(26, N'Bánh xèo', 40000, N'Mô tả bánh xèo', 16),
	(27, N'Bún ốc', 60000, N'Mô tả bún ốc', 16),
	(28, N'Tôm hấp', 75000, N'Mô tả tôm hấp', 17),
	(29, N'Canh bún', 35000, N'Mô tả canh bún', 17),
	(30, N'Bò kho', 65000, N'Mô tả bò kho', 17),
	(31, N'Bánh tráng nướng', 30000, N'Mô tả bánh tráng nướng', 17);
GO

INSERT INTO dbo.uu_dai_mon_an
	(id_mon_an, ten_ma, ngay_tao, ngay_het_han, mo_ta, phan_tram_giam, so_tien_giam_toi_da)
VALUES
	(1, N'PHOBO10', '2024-05-01', '2024-06-01', N'Giảm 10% cho món Phở bò', 10, 5000),
	(2, N'BUNRIEU15', '2024-05-02', '2024-06-02', N'Giảm 15% cho món Bún riêu', 14.5, 6000),
	(3, N'BANHMIT10', '2024-05-03', '2024-06-03', N'Giảm 10% cho món Bánh mì thịt', 10, 3500),
	(4, N'GOICUON20', '2024-05-04', '2024-06-04', N'Giảm 20% cho món Gỏi cuốn', 15.5, 9000),
	(5, N'PHOGA10', '2024-05-05', '2024-06-05', N'Giảm 10% cho món Phở gà', 12, 5500),
	(6, N'BUNCHA15', '2024-05-06', '2024-06-06', N'Giảm 15% cho món Bún chả', 15, 6000),
	(7, N'COMGAXOIMO10', '2024-05-07', '2024-06-07', N'Giảm 10% cho món Cơm gà xối mỡ', 10, 6000),
	(8, N'BUNTHITNUONG15', '2024-05-08', '2024-06-08', N'Giảm 15% cho món Bún thịt nướng', 10.8, 6750),
	(9, N'COMTAM10', '2024-05-09', '2024-06-09', N'Giảm 10% cho món Cơm tấm', 11.3, 3500);
GO

INSERT INTO dbo.ma_khuyen_mai
	(id, phan_tram_giam, ten_ma, ngay_het_han, ngay_tao, mo_ta, so_tien_giam_toi_da, gia_tri_don_toi_thieu, id_quan_ly)
VALUES
	(1, 10, N'GYU230', '2024-06-01', '2024-05-01', N'Giảm 10% tối đa 5000đ cho đơn từ 80000đ', 5000, 80000, 18),
	(2, 15, N'GJH123', '2024-06-02', '2024-05-02', N'Giảm 15% tối đa 6000đ cho đơn từ 90000đ', 6000, 90000, 18),
	(3, 10, N'JHJ123', '2024-06-03', '2024-05-03', N'Giảm 10% tối đa 3500đ cho đơn từ 70000đ', 3500, 70000, 18),
	(4, 20, N'JHJ123', '2024-06-04', '2024-05-04', N'Giảm 20% tối đa 9000đ cho đơn từ 100000đ', 9000, 100000, 19),
	(5, 10, N'JHJ123', '2024-06-05', '2024-05-05', N'Giảm 10% tối đa 5500đ cho đơn từ 80000đ', 5500, 80000, 19),
	(6, 15, N'JHJ123', '2024-06-06', '2024-05-06', N'Giảm 15% tối đa 6000đ cho đơn từ 90000đ', 6000, 90000, 19);
GO

-- INSERT INTO dbo.don_hang
-- 	(id, thoi_gian_nhan, dia_chi_giao_hang, trang_thai_don_hang, tien_ship, sdt_nguoi_nhan, ghi_chu_shipper, ten_nguoi_nhan, anh_nhan_hang, phuong_thuc_thanh_toan, binh_luan, danh_gia, tong_tien, id_khach_hang, id_shipper, id_ma_khuyen_mai)
-- VALUES
-- 	(1, '2024-05-01', N'123 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_xu_ly', 20000, '0123456789', NULL, N'Nguyễn Văn A', NULL, 'tien_mat', NULL, NULL, NULL, 1, 24, 1),
-- 	(2, '2024-05-02', N'456 Nguyễn Huệ, Quận 1, TP.HCM', 'da_xac_nhan', 25000, '0123456789', NULL, N'Nguyễn Văn B', NULL, 'the_ngan_hang', NULL, NULL, NULL, 2, 25, 2),
-- 	(3, '2024-05-03', N'789 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_giao', 30000, '0123456789', NULL, N'Nguyễn Văn C', NULL, 'vi_dien_tu', NULL, NULL, NULL, 3, 26, 3),
-- 	(4, '2024-05-04', N'321 Nguyễn Huệ, Quận 1, TP.HCM', 'da_giao', 35000, '0123456789', NULL, N'Nguyễn Văn D', NULL, 'tien_mat', NULL, NULL, NULL, 4, 27, 4),
-- 	(5, '2024-05-05', N'654 Điện Biên Phủ, Quận 1, TP.HCM', 'da_huy', 40000, '0123456789', NULL, N'Nguyễn Văn E', NULL, 'the_ngan_hang', NULL, NULL, NULL, 5, 28, 5),
-- 	(6, '2024-05-06', N'987 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_xu_ly', 45000, '0123456789', NULL, N'Nguyễn Văn F', NULL, 'vi_dien_tu', NULL, NULL, NULL, 6, 29, 6),
-- 	(7, '2024-05-07', N'159 Điện Biên Phủ, Quận 1, TP.HCM', 'da_xac_nhan', 50000, '0123456789', NULL, N'Nguyễn Văn G', NULL, 'tien_mat', NULL, NULL, NULL, 7, 30, 1),
-- 	(8, '2024-05-08', N'357 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_giao', 55000, '0123456789', NULL, N'Nguyễn Văn H', NULL, 'the_ngan_hang', NULL, NULL, NULL, 8, 24, 2),
-- 	(9, '2024-05-09', N'753 Điện Biên Phủ, Quận 1, TP.HCM', 'da_giao', 60000, '0123456789', NULL, N'Nguyễn Văn I', NULL, 'vi_dien_tu', NULL, NULL, NULL, 9, 25, 3),
-- 	(10, '2024-05-10', N'159 Nguyễn Huệ, Quận 1, TP.HCM', 'da_huy', 65000, '0123456789', NULL, N'Nguyễn Văn J', NULL, 'tien_mat', NULL, NULL, NULL, 10, 26, 4),
-- 	(11, '2024-05-11', N'357 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_xu_ly', 70000, '0123456789', NULL, N'Nguyễn Văn K', NULL, 'the_ngan_hang', NULL, NULL, NULL, 1, 27, 5),
-- 	(12, '2024-05-12', N'753 Nguyễn Huệ, Quận 1, TP.HCM', 'da_xac_nhan', 75000, '0123456789', NULL, N'Nguyễn Văn L', NULL, 'vi_dien_tu', NULL, NULL, NULL, 2, 28, 6),
-- 	(13, '2024-05-13', N'159 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_giao', 80000, '0123456789', NULL, N'Nguyễn Văn M', NULL, 'tien_mat', NULL, NULL, NULL, 3, 29, 1),
-- 	(14, '2024-05-14', N'357 Nguyễn Huệ, Quận 1, TP.HCM', 'da_giao', 85000, '0123456789', NULL, N'Nguyễn Văn N', NULL, 'the_ngan_hang', NULL, NULL, NULL, 4, 30, 2),
-- 	(15, '2024-05-15', N'753 Điện Biên Phủ, Quận 1, TP.HCM', 'da_huy', 90000, '0123456789', NULL, N'Nguyễn Văn O', NULL, 'vi_dien_tu', NULL, NULL, NULL, 5, 24, 3),
-- 	(16, '2024-05-16', N'159 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_xu_ly', 95000, '0123456789', NULL, N'Nguyễn Văn P', NULL, 'tien_mat', NULL, NULL, NULL, 6, 25, 4),
-- 	(17, '2024-05-17', N'357 Điện Biên Phủ, Quận 1, TP.HCM', 'da_xac_nhan', 100000, '0123456789', NULL, N'Nguyễn Văn Q', NULL, 'the_ngan_hang', NULL, NULL, NULL, 7, 26, 5),
-- 	(18, '2024-05-18', N'753 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_giao', 105000, '0123456789', NULL, N'Nguyễn Văn R', NULL, 'vi_dien_tu', NULL, NULL, NULL, 8, 27, 6),
-- 	(19, '2024-05-19', N'159 Điện Biên Phủ, Quận 1, TP.HCM', 'da_giao', 110000, '0123456789', NULL, N'Nguyễn Văn S', NULL, 'tien_mat', NULL, NULL, NULL, 9, 28, 1),
-- 	(20, '2024-05-20', N'357 Nguyễn Huệ, Quận 1, TP.HCM', 'da_huy', 115000, '0123456789', NULL, N'Nguyễn Văn T', NULL, 'the_ngan_hang', NULL, NULL, NULL, 10, 29, 2),
-- 	(21, '2024-05-21', N'753 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_xu_ly', 120000, '0123456789', NULL, N'Nguyễn Văn U', NULL, 'vi_dien_tu', NULL, NULL, NULL, 1, 30, 3),
-- 	(22, '2024-05-22', N'159 Nguyễn Huệ, Quận 1, TP.HCM', 'da_xac_nhan', 125000, '0123456789', NULL, N'Nguyễn Văn V', NULL, 'tien_mat', NULL, NULL, NULL, 2, 24, 4),
-- 	(23, '2024-05-23', N'357 Điện Biên Phủ, Quận 1, TP.HCM', 'dang_giao', 130000, '0123456789', NULL, N'Nguyễn Văn W', NULL, 'the_ngan_hang', NULL, NULL, NULL, 3, 25, 5),
-- 	(24, '2024-05-24', N'753 Nguyễn Huệ, Quận 1, TP.HCM', 'da_giao', 135000, '0123456789', NULL, N'Nguyễn Văn X', NULL, 'vi_dien_tu', NULL, NULL, NULL, 4, 26, 6),
-- 	(25, '2024-05-25', N'159 Điện Biên Phủ, Quận 1, TP.HCM', 'da_huy', 140000, '0123456789', NULL, N'Nguyễn Văn Y', NULL, 'tien_mat', NULL, NULL, NULL, 5, 27, 1),
-- 	(26, '2024-05-26', N'357 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_xu_ly', 145000, '0123456789', NULL, N'Nguyễn Văn Z', NULL, 'the_ngan_hang', NULL, NULL, NULL, 6, 28, 2),
-- 	(27, '2024-05-27', N'753 Điện Biên Phủ, Quận 1, TP.HCM', 'da_xac_nhan', 150000, '0123456789', NULL, N'Nguyễn Văn A1', NULL, 'vi_dien_tu', NULL, NULL, NULL, 7, 29, 3),
-- 	(28, '2024-05-28', N'159 Nguyễn Huệ, Quận 1, TP.HCM', 'dang_giao', 155000, '0123456789', NULL, N'Nguyễn Văn B1', NULL, 'tien_mat', NULL, NULL, NULL, 8, 30, 4),
-- 	(29, '2024-05-29', N'357 Điện Biên Phủ, Quận 1, TP.HCM', 'da_giao', 160000, '0123456789', NULL, N'Nguyễn Văn C1', NULL, 'the_ngan_hang', NULL, NULL, NULL, 9, 24, 5),
-- 	(30, '2024-05-30', N'753 Nguyễn Huệ, Quận 1, TP.HCM', 'da_huy', 165000, '0123456789', NULL, N'Nguyễn Văn D1', NULL, 'vi_dien_tu', NULL, NULL, NULL, 10, 25, 6);
-- GO

-- INSERT INTO dbo.don_van_chuyen
-- 	(id, tien_hang, dia_chi_lay_hang, khoi_luong)
-- VALUES
-- 	(1, 200000, N'123 Điện Biên Phủ, Quận 1, TP.HCM', 2.5),
-- 	(2, 250000, N'456 Nguyễn Huệ, Quận 1, TP.HCM', 3.5),
-- 	(3, 300000, N'789 Điện Biên Phủ, Quận 1, TP.HCM', 4.5),
-- 	(4, 350000, N'321 Nguyễn Huệ, Quận 1, TP.HCM', 5.5),
-- 	(5, 400000, N'654 Điện Biên Phủ, Quận 1, TP.HCM', 6.5),
-- 	(6, 450000, N'987 Nguyễn Huệ, Quận 1, TP.HCM', 7.5),
-- 	(7, 500000, N'159 Điện Biên Phủ, Quận 1, TP.HCM', 8.5),
-- 	(8, 550000, N'357 Nguyễn Huệ, Quận 1, TP.HCM', 9.5),
-- 	(9, 600000, N'753 Điện Biên Phủ, Quận 1, TP.HCM', 10.5),
-- 	(10, 650000, N'159 Nguyễn Huệ, Quận 1, TP.HCM', 11.5);
-- GO

-- INSERT INTO dbo.loai_hang_don_van_chuyen (id_don_van_chuyen, loai_hang)
-- VALUES
--     (1, N'Hàng điện tử'),
--     (2, N'Hàng điện tử'),
--     (3, N'Hàng thực phẩm'),
--     (4, N'Hàng quần áo'),
--     (5, N'Hàng gia dụng'),
--     (6, N'Hàng mỹ phẩm'),
--     (7, N'Hàng sách vở'),
--     (8, N'Hàng quà tặng'),
--     (9, N'Hàng mỹ phẩm'),
--     (10, N'Hàng quần áo');

-- INSERT INTO dbo.don_mon_an (id)
-- VALUES
-- 	(11),
-- 	(12),
-- 	(13),
-- 	(14),
-- 	(15),
-- 	(16),
-- 	(17),
-- 	(18),
-- 	(19),
-- 	(20),
-- 	(21),
-- 	(22),
-- 	(23),
-- 	(24),
-- 	(25),
-- 	(26),
-- 	(27),
-- 	(28),
-- 	(29),
-- 	(30);
-- GO

-- INSERT INTO dbo.gom_mon_an (id_don_mon_an, id_mon_an, so_luong)
-- VALUES
-- 	(11, 1, 2),
-- 	(12, 2, 3),
-- 	(13, 3, 3),
-- 	(14, 4, 4),
-- 	(15, 5, 2),
-- 	(16, 6, 3),
-- 	(17, 7, 4),
-- 	(18, 8, 2),
-- 	(19, 9, 3),
-- 	(20, 10, 3),
-- 	(21, 11, 4),
-- 	(22, 12, 2),
-- 	(23, 13, 3),
-- 	(24, 14, 4),
-- 	(25, 15, 2),
-- 	(26, 16, 3),
-- 	(27, 17, 4),
-- 	(28, 18, 2),
-- 	(29, 19, 3),
-- 	(30, 20, 3),
-- 	(11, 21, 4),
-- 	(12, 22, 2),
-- 	(13, 23, 3),
-- 	(14, 24, 4),
-- 	(15, 25, 2),
-- 	(16, 26, 3),
-- 	(17, 27, 4),
-- 	(18, 28, 2),
-- 	(19, 29, 3),
-- 	(20, 30, 3),
-- 	(21, 1, 4),
-- 	(22, 2, 2),
-- 	(23, 3, 3),
-- 	(24, 4, 4),
-- 	(25, 5, 2),
-- 	(26, 6, 3),
-- 	(27, 7, 4),
-- 	(28, 8, 2),
-- 	(29, 9, 3),
-- 	(30, 10, 3);