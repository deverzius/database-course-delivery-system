USE DeliverySystem;
GO

INSERT INTO dbo.tai_khoan
	(id, ten_tai_khoan, mat_khau, sdt, gioi_tinh, email, ngay_sinh, ngay_tao, ho, ten)
VALUES
	(1, 'johnsmith', 'password1', '0254356789', 1, 'john.smith@mail.com', '2000-12-01', '2021-01-01', 'Smith', 'Join'),
	(2, 'janedoe', 'password2', '0987654321', 0, 'jane.doe@mail.com', '1995-05-10', '2021-01-05', 'Doe', 'Jane'),
	(3, 'michaeljohnson', 'password3', '0321957321', 1, 'michael.johnson@mail.com', '1998-08-15', '2021-02-10', 'Johnson', 'Michael'),
	(4, 'sarahbrown', 'password4', '0223894376', 0, 'sarah.brown@mail.com', '2001-03-20', '2021-03-15', 'Brown', 'Sarah'),
	(5, 'davidwilson', 'password5', '0712332322', 1, 'david.wilson@mail.com', '1990-07-25', '2021-04-20', 'Wilson', 'David'),
	(6, 'emilythomas', 'password6', '0319119333', 0, 'emily.thomas@mail.com', '1992-09-30', '2021-05-25', 'Thomas', 'Emily'),
	(7, 'chrisroberts', 'password7', '0423447789', 1, 'chris.roberts@mail.com', '1988-11-05', '2021-06-30', 'Roberts', 'Chris'),
	(8, 'amycollins', 'password8', '0523532518', 0, 'amy.collins@mail.com', '1994-04-10', '2021-07-10', 'Collins', 'Amy'),
	(9, 'patricklee', 'password9', '0512938475', 1, 'patrick.lee@mail.com', '1996-06-15', '2021-08-15', 'Lee', 'Patrick'),
	(10, 'laurawright', 'password10', '0612983472', 0, 'laura.wright@mail.com', '1985-02-20', '2021-09-20', 'Wright', 'Laura'),
	(11, 'kevinmartinez', 'password11', '0912345678', 1, 'kevin.martinez@mail.com', '1983-10-25', '2021-10-25', 'Martinez', 'Kevin'),
	(12, 'jessicathompson', 'password12', '0133456789', 0, 'jessica.thompson@mail.com', '1989-01-30', '2021-11-30', 'Thompson', 'Jessica'),
	(13, 'samueladams', 'password13', '0523847691', 1, 'samuel.adams@mail.com', '1997-07-05', '2021-12-05', 'Adams', 'Samuel'),
	(14, 'oliviamitchell', 'password14', '0412394876', 0, 'olivia.mitchell@mail.com', '1987-09-10', '2022-01-10', 'Mitchell', 'Olivia'),
	(15, 'danielcook', 'password15', '0213453560', 1, 'daniel.cook@mail.com', '1993-04-15', '2022-02-15', 'Cook', 'Daniel'),
	(16, 'ashleyrogers', 'password16', '0777822100', 0, 'ashley.rogers@mail.com', '1991-08-20', '2022-03-20', 'Rogers', 'Ashley'),
	(17, 'joshuamorgan', 'password17', '0823476129', 1, 'joshua.morgan@mail.com', '1986-12-25', '2022-04-25', 'Morgan', 'Joshua'),
	(18, 'nataliebaker', 'password18', '0999123333', 0, 'natalie.baker@mail.com', '1984-05-30', '2022-05-30', 'Baker', 'Natalie'),
	(19, 'williamgarcia', 'password19', '0321933442', 1, 'william.garcia@mail.com', '1999-02-05', '2022-06-05', 'Garcia', 'William'),
	(20, 'samanthajackson', 'password20', '0923847561', 0, 'samantha.jackson@mail.com', '1996-06-10', '2022-07-10', 'Jackson', 'Samantha'),
	(21, 'alexanderwhite', 'password21', '0421893476', 1, 'alexander.white@mail.com', '1994-08-15', '2022-08-15', 'White', 'Alexander'),
	(22, 'victoriagreen', 'password22', '0123556589', 0, 'victoria.green@mail.com', '1986-04-20', '2022-09-20', 'Green', 'Victoria'),
	(23, 'jacobrobertson', 'password23', '0443894376', 1, 'jacob.robertson@mail.com', '1997-11-25', '2022-10-25', 'Robertson', 'Jacob'),
	(24, 'emilyharris', 'password24', '0712345678', 0, 'emily.harris@mail.com', '1989-03-30', '2022-11-30', 'Harris', 'Emily'),
	(25, 'nathanwood', 'password25', '0529292903', 1, 'nathan.wood@mail.com', '1991-01-05', '2022-12-05', 'Wood', 'Nathan'),
	(26, 'sophiabennett', 'password26', '0319876543', 0, 'sophia.bennett@mail.com', '1998-06-10', '2023-01-10', 'Bennett', 'Sophia'),
	(27, 'ethanjames', 'password27', '0723984571', 1, 'ethan.james@mail.com', '1983-09-15', '2023-02-15', 'James', 'Ethan'),
	(28, 'madisonkelly', 'password28', '0428821010', 0, 'madison.kelly@mail.com', '1985-07-20', '2023-03-20', 'Kelly', 'Madison'),
	(29, 'willowtaylor', 'password29', '0124235777', 1, 'willow.taylor@mail.com', '1996-04-25', '2023-04-25', 'Taylor', 'Willow'),
	(30, 'olivermartin', 'password30', '0423456662', 0, 'oliver.martin@mail.com', '1987-11-30', '2023-05-30', 'Martin', 'Oliver');
GO

INSERT INTO dbo.khach_hang
	(id, loai_khach_hang)
VALUES
	(1, 'moi'),
	(2, 'lau_nam'),
	(3, 'trung_thanh'),
	(4, 'moi'),
	(5, 'lau_nam'),
	(6, 'trung_thanh'),
	(7, 'moi'),
	(8, 'lau_nam'),
	(9, 'trung_thanh'),
	(10, 'moi');
GO

INSERT INTO dbo.nha_hang
	(id, trang_thai, ten_nha_hang, dia_chi, mo_ta)
VALUES
	(11, 'mo_cua', 'Nha Hang A', '123 ABC Street', 'Nha hang A mo cua tu 8h sang den 10h toi'),
	(12, 'mo_cua', 'Nha Hang B', '456 XYZ Street', 'Nha hang B mo cua tu 7h sang den 9h toi'),
	(13, 'mo_cua', 'Nha Hang C', '789 DEF Street', 'Nha hang C mo cua tu 7h sang den 10h toi'),
	(14, 'mo_cua', 'Nha Hang D', '321 GHI Street', 'Nha hang D mo cua tu 9h sang den 11h toi'),
	(15, 'mo_cua', 'Nha Hang E', '654 JKL Street', 'Nha hang E mo cua tu 7h sang den 12h toi'),
	(16, 'mo_cua', 'Nha Hang F', '987 MNO Street', 'Nha hang F mo cua tu 7h sang den 13h toi'),
	(17, 'mo_cua', 'Nha Hang G', '159 PQR Street', 'Nha hang G mo cua tu 10h sang den 12h toi');
GO

INSERT INTO dbo.chi_nhanh
	(id, dia_chi, ma_so_thue, trang_thai, so_nhan_vien)
VALUES
	(1, N'123 Điện Biên Phủ, Quận 1, TP.HCM', 'THUE8ty902s534', 'mo_cua', 0),
	(2, N'456 Nguyễn Huệ, Quận 1, TP.HCM', 'THUE32g55s8f90', 'mo_cua', 0);
GO

INSERT INTO dbo.nhan_vien
	(id, ngay_vao_lam, luong, trang_thai, loai_nhan_vien, so_gplx, id_chi_nhanh)
VALUES
	(18, '2021-01-01', 15000000, 'dang_lam', 'quan_ly', NULL, 1),
	(19, '2021-01-05', 2300000, 'dang_lam', 'quan_ly', NULL, 2),
	(20, '2021-02-10', 7000000, 'dang_lam', 'tong_dai_vien', NULL, 1),
	(21, '2021-03-15', 6700000, 'dang_lam', 'tong_dai_vien', NULL, 1),
	(22, '2021-04-20', 5500000, 'dang_lam', 'tong_dai_vien', NULL, 2),
	(23, '2021-05-25', 7100000, 'dang_lam', 'tong_dai_vien', NULL, 2),
	(24, '2021-06-30', 8300000, 'dang_lam', 'shipper', '43AHFDF12345', 1),
	(25, '2021-07-10', 8400000, 'dang_lam', 'shipper', '76BSADF12325', 1),
	(26, '2021-08-15', 8200000, 'dang_lam', 'shipper', '44CRKFU43278', 1),
	(27, '2021-09-20', 8600000, 'dang_lam', 'shipper', '55DDSNR87654', 1),
	(28, '2021-10-25', 8800000, 'dang_lam', 'shipper', '66EDJRN46373', 2),
	(29, '2021-11-30', 8100000, 'dang_lam', 'shipper', '41FDSAF35522', 2),
	(30, '2021-12-05', 9000000, 'dang_lam', 'shipper', '18GDSJB23455', 2);
GO