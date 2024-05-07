/*
	2.4. (1 điểm) Viết 2 hàm thỏa yêu cầu sau:
	- Chứa câu lệnh IF và/hoặc LOOP để tính toán dữ liệu được lưu trữ
	- Có sử dụng con trỏ.
	- Chứa câu lệnh truy vấn dữ liệu, lấy dữ liệu từ câu truy vấn để kiểm tra tính toán
	- Có tham số đầu vào và kiểm tra tham số đầu vào
	- Chuẩn bị các câu lệnh và dữ liệu để minh họa việc gọi hàm khi báo cáo. 
*/

-- FUNCTION 1
CREATE FUNCTION dbo.tinh_doanh_thu_don_van_chuyen_trong_thang
(
	@thang INT,
	@nam INT
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @doanh_thu FLOAT;

	DECLARE cursor_don_van_chuyen CURSOR FOR
	(
		SELECT
			tien_hang,
			tien_ship,
			phan_tram_giam,
			so_tien_giam_toi_da,
			gia_tri_don_toi_thieu
		FROM dbo.don_van_chuyen
			JOIN dbo.don_hang ON don_van_chuyen.id = don_hang.id
			JOIN dbo.ma_khuyen_mai ON don_hang.id_ma_khuyen_mai = ma_khuyen_mai.id
		WHERE MONTH(don_hang.ngay_tao) = @thang AND YEAR(don_hang.ngay_tao) = @nam
	);

	OPEN cursor_don_van_chuyen;

	DECLARE @tong_doanh_thu FLOAT = 0;

	DECLARE @tien_hang INT;
	DECLARE @tien_ship INT;
	DECLARE @phan_tram_giam FLOAT;
	DECLARE @so_tien_giam_toi_da INT;
	DECLARE @gia_tri_don_toi_thieu INT;

	FETCH NEXT FROM cursor_don_van_chuyen INTO @tien_hang, @tien_ship, @phan_tram_giam, @so_tien_giam_toi_da, @gia_tri_don_toi_thieu;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @tong_tien FLOAT;
		DECLARE @tien_giam FLOAT;

		SET @tong_tien = @tien_hang + @tien_ship;

		IF @tong_tien > @gia_tri_don_toi_thieu
		BEGIN
			SET @tien_giam = @tong_tien * @phan_tram_giam;
			IF @tien_giam > @so_tien_giam_toi_da
			BEGIN
				SET @tien_giam = @so_tien_giam_toi_da;
			END
			SET @tong_tien = @tong_tien - @tien_giam;

			SET @tong_doanh_thu = @tong_doanh_thu + @tong_tien;
		END;

		FETCH NEXT FROM cursor_don_van_chuyen INTO @tien_hang, @tien_ship, @phan_tram_giam, @so_tien_giam_toi_da, @gia_tri_don_toi_thieu;
	END;

	CLOSE cursor_don_van_chuyen;

	RETURN @tong_doanh_thu;
END;
GO

-- DEMO
-- Lấy data của các đơn vận chuyển trong tháng 5 năm 2024
SELECT
	tien_hang,
	tien_ship,
	phan_tram_giam,
	so_tien_giam_toi_da,
	gia_tri_don_toi_thieu
FROM dbo.don_van_chuyen
	JOIN dbo.don_hang ON don_van_chuyen.id = don_hang.id
	JOIN dbo.ma_khuyen_mai ON don_hang.id_ma_khuyen_mai = ma_khuyen_mai.id
WHERE MONTH(don_hang.ngay_tao) = 5 AND YEAR(don_hang.ngay_tao) = 2024;
GO
-- Tính doanh thu của các đơn vận chuyển trong tháng 5 năm 2024
SELECT dbo.tinh_doanh_thu_don_van_chuyen_trong_thang(5, 2024) AS tong_doanh_thu_thang
GO




-- FUNCTION 2
DROP FUNCTION dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang;
GO
CREATE FUNCTION dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang
(
	@id_shipper INT,
	@thang INT,
	@nam INT
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @danh_gia_trung_binh FLOAT = NULL;

	DECLARE cursor_shipper CURSOR FOR
	(
		SELECT
			nv.id,
			tk.ho + ' ' + tk.ten as ten_shipper,
			dh.danh_gia
		FROM dbo.nhan_vien nv
			JOIN dbo.tai_khoan tk 
				ON nv.id = tk.id AND nv.id = @id_shipper AND nv.loai_nhan_vien = 'shipper'
			JOIN dbo.don_hang dh ON nv.id = dh.id_shipper
		WHERE MONTH(dh.ngay_tao) = @thang AND YEAR(dh.ngay_tao) = @nam
	);

	OPEN cursor_shipper;

	DECLARE @id INT;
	DECLARE @ten_shipper NVARCHAR(202);
	DECLARE @danh_gia FLOAT;

	DECLARE @tong_danh_gia FLOAT = 0;
	DECLARE @so_luong_don INT = 0;

	FETCH NEXT FROM cursor_shipper INTO @id, @ten_shipper, @danh_gia;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @danh_gia IS NOT NULL
		BEGIN
			SET @tong_danh_gia = @tong_danh_gia + @danh_gia;
			SET @so_luong_don = @so_luong_don + 1;
		END;
		FETCH NEXT FROM cursor_shipper INTO @id, @ten_shipper, @danh_gia;
	END;

	IF @so_luong_don <> 0
	BEGIN
		SET @danh_gia_trung_binh = @tong_danh_gia / @so_luong_don;
	END;

	CLOSE cursor_shipper;

	RETURN @danh_gia_trung_binh;
END;
GO

-- DEMO
-- Not a shipper
SELECT dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang(20, 5, 2024) as danh_gia_trung_binh_cua_shipper_trong_thang
-- Shipper
SELECT dbo.tinh_toan_danh_gia_trung_binh_cua_shipper_trong_thang(24, 5, 2024) as danh_gia_trung_binh_cua_shipper_trong_thang
GO