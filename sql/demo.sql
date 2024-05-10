/*
	Q2.1
*/
EXEC dbo.tao_tai_khoan 'tramtram', 'password1', '0254256700', 1, 'tram.nguyenhcmut@mail.com', '2001-12-11', '2021-01-01', 'Tram', 'Nguyen';
SELECT * FROM dbo.tai_khoan;
-- DELETE FROM dbo.tai_khoan WHERE id = 31;

EXEC dbo.sua_tai_khoan 30, 'olivermartin', 'password30', 0, 'oliver.martin@mail.com', '1987-11-30', 'Martin', 'Oliver';
SELECT * FROM dbo.tai_khoan WHERE id = 30;
-- EXEC dbo.sua_tai_khoan 30, 'categorymartin', 'passwordpassword', 0, 'category.martin@mail.com', '2000-11-30', 'Martin', 'Category';

EXEC dbo.xoa_tai_khoan 10;
SELECT * FROM dbo.tai_khoan WHERE id = 10;
-- UPDATE dbo.tai_khoan SET da_xoa = 0 WHERE id = 1;

/*
	Q2.2
*/
SELECT * FROM dbo.don_mon_an WHERE id =11;
-- INSERT
INSERT INTO dbo.gom_mon_an
	(id_don_mon_an, id_mon_an, so_luong)
VALUES
	(11, 3, 2);
SELECT * FROM dbo.don_mon_an WHERE id =11;
-- UPDATE
UPDATE dbo.gom_mon_an
SET so_luong = 3
WHERE id_don_mon_an = 11 AND id_mon_an = 3;
SELECT * FROM dbo.don_mon_an WHERE id =11;
-- DELETE
DELETE FROM dbo.gom_mon_an WHERE id_don_mon_an = 11 AND id_mon_an = 3;
SELECT * FROM dbo.don_mon_an WHERE id =11;



SELECT * FROM dbo.chi_nhanh WHERE id = 1;

EXEC dbo.tao_tai_khoan 'manhmanh', 'password1', '0237756789', 1, 'manh.smith@mail.com', '2000-12-01', '2021-01-01', 'Manh', 'Manh';
INSERT INTO dbo.nhan_vien
	(id, ngay_vao_lam, luong, trang_thai, loai_nhan_vien, so_gplx, id_chi_nhanh)
VALUES
	(31, '2021-03-15', 6700000, 'dang_lam', 'tong_dai_vien', NULL, 1);

SELECT * FROM dbo.chi_nhanh WHERE id = 1;

DELETE FROM dbo.nhan_vien WHERE id = 31;
DELETE FROM dbo.tai_khoan WHERE id = 31;

SELECT * FROM dbo.chi_nhanh WHERE id = 1;




/*
	Q2.3
*/
EXEC dbo.lay_tai_khoan 'id < 5';
EXEC dbo.lay_tai_khoan 'ten_tai_khoan LIKE ''%jo%'' ';


EXEC dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang 5, 2024;

/*
	Q2.4
*/

-- Lấy data của các đơn vận chuyển trong tháng 5 năm 2024
-- SELECT
-- 	tien_hang,
-- 	tien_ship,
-- 	phan_tram_giam,
-- 	so_tien_giam_toi_da,
-- 	gia_tri_don_toi_thieu
-- FROM dbo.don_van_chuyen
-- 	JOIN dbo.don_hang ON don_van_chuyen.id = don_hang.id
-- 	JOIN dbo.ma_khuyen_mai ON don_hang.id_ma_khuyen_mai = ma_khuyen_mai.id
-- WHERE MONTH(don_hang.ngay_tao) = 5 AND YEAR(don_hang.ngay_tao) = 2024;
-- GO
-- Tính doanh thu của các đơn vận chuyển trong tháng 5 năm 2024
SELECT dbo.tinh_doanh_thu_don_van_chuyen_trong_thang(5, 2024) AS tong_doanh_thu_thang
GO



-- Not a shipper
-- SELECT dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang(20, 5, 2024) as danh_gia_trung_binh_cua_shipper_trong_thang
-- Shipper
SELECT dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang(24, 5, 2024) as danh_gia_trung_binh_cua_shipper_trong_thang
GO