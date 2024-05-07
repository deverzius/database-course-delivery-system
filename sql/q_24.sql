/*
	2.4. (1 điểm) Viết 2 hàm thỏa yêu cầu sau:
	- Chứa câu lệnh IF và/hoặc LOOP để tính toán dữ liệu được lưu trữ
	- Có sử dụng con trỏ.
	- Chứa câu lệnh truy vấn dữ liệu, lấy dữ liệu từ câu truy vấn để kiểm tra tính toán
	- Có tham số đầu vào và kiểm tra tham số đầu vào
	- Chuẩn bị các câu lệnh và dữ liệu để minh họa việc gọi hàm khi báo cáo. 
*/

DROP FUNCTION dbo.tinh_doanh_thu_don_van_chuyen_trong_thang
GO;

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