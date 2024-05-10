/*
	2.3. (1 điểm) Viết 2 thủ tục trong đó chỉ chứa các câu truy vấn để hiển thị dữ liệu và tham số đầu vào là các giá trị trong mệnh đề WHERE và/hoặc Having (nếu có), gồm:
	- 1 câu truy vấn từ 2 bảng trở lên có mệnh đề where, order by
	- 1 câu truy vấn có aggreate function, group by, having, where và order by có liên kết từ 2 bảng trở lên
	- Có ít nhất 1 thủ tục liên quan đến việc lấy dữ liệu từ bảng trong câu 2.1
	- Chuẩn bị câu lệnh và dữ liệu minh họa cho việc gọi thủ tục khi báo cáo
*/


-- Procedure 1: Lấy tất cả thông tin của tài khoản
CREATE PROCEDURE dbo.lay_tai_khoan
	@where NVARCHAR(200) = ''
AS
BEGIN
	DECLARE @sql NVARCHAR(700);
	IF @where = ''
		SET @sql = N'SELECT * FROM dbo.tai_khoan';
	ELSE
		SET @sql = N'SELECT * FROM dbo.tai_khoan WHERE ' + @where;
	EXEC (@sql);
END;
GO



-- Procedure 2: Danh sách các món ăn được đặt nhiều nhất trong tháng
CREATE PROCEDURE dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang
	@thang NVARCHAR(3),
	@nam NVARCHAR(5),
	@where NVARCHAR(300) = ''
AS
BEGIN
	DECLARE @sql NVARCHAR(700);
	SET @sql = N'SELECT DISTINCT
		ma.id as id,
		ma.ten_mon,
		ma.gia,
		ma.mo_ta,
		ma.id_nha_hang,
		ISNULL(SUM(gma.so_luong), 0) AS so_luong_da_dat
	FROM
		dbo.mon_an AS ma
	JOIN
		dbo.gom_mon_an AS gma ON ma.id = gma.id_mon_an
	JOIN
		dbo.don_hang AS dh ON gma.id_don_mon_an = dh.id
	WHERE
		MONTH(dh.ngay_tao) = ' + @thang + ' AND
		YEAR(dh.ngay_tao) = ' + @nam + ' '

	SET @sql = @sql + N'GROUP BY ma.id, ma.ten_mon, ma.gia, ma.mo_ta, ma.id_nha_hang'

	SET @sql = N'SELECT * FROM (' + @sql + N') as top_mon_an ';

	IF @where <> ''
		SET @sql = @sql + N' WHERE ' + @where;

	SET @sql = @sql + N' ORDER BY so_luong_da_dat DESC';

	EXEC (@sql);
END;
GO

-- DEMO
EXEC dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang 5, 2024, ''

