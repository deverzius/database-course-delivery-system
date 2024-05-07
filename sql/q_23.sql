/*
	2.3. (1 điểm) Viết 2 thủ tục trong đó chỉ chứa các câu truy vấn để hiển thị dữ liệu và tham số đầu vào là các giá trị trong mệnh đề WHERE và/hoặc Having (nếu có), gồm:
	- 1 câu truy vấn từ 2 bảng trở lên có mệnh đề where, order by
	- 1 câu truy vấn có aggreate function, group by, having, where và order by có liên kết từ 2 bảng trở lên
	- Có ít nhất 1 thủ tục liên quan đến việc lấy dữ liệu từ bảng trong câu 2.1
	- Chuẩn bị câu lệnh và dữ liệu minh họa cho việc gọi thủ tục khi báo cáo
*/


CREATE PROCEDURE dbo.lay_tai_khoan_khach_hang
	@id INT = NULL,
	@ten_tai_khoan NVARCHAR(100) = NULL,
	@mat_khau NVARCHAR(100) = NULL,
	@sdt NVARCHAR(100) = NULL,
	@gioi_tinh BIT = NULL,
	@email NVARCHAR(100) = NULL,
	@ngay_sinh DATE = NULL,
	@ngay_tao DATE = NULL,
	@ho NVARCHAR(100) = NULL,
	@ten NVARCHAR(100) = NULL,
	@da_xoa BIT = NULL,
	@cod_kha_dung INT = NULL,
	@so_don_da_dat INT = NULL,
	@loai_khach_hang NVARCHAR(100) = NULL
AS
BEGIN
	SELECT
		tk.id,
		tk.ten_tai_khoan,
		tk.mat_khau,
		tk.sdt,
		tk.gioi_tinh,
		tk.email,
		tk.ngay_sinh,
		tk.ngay_tao,
		tk.ho,
		tk.ten,
		tk.da_xoa,
		kh.cod_kha_dung,
		kh.so_don_da_dat,
		kh.loai_khach_hang
	FROM
		dbo.tai_khoan AS tk
	JOIN
		dbo.khach_hang AS kh ON tk.id = kh.id
	WHERE 
		(@id IS NULL OR tk.id = @id) AND
		(@ten_tai_khoan IS NULL OR tk.ten_tai_khoan = @ten_tai_khoan) AND
		(@mat_khau IS NULL OR tk.mat_khau = @mat_khau) AND
		(@sdt IS NULL OR tk.sdt = @sdt) AND
		(@gioi_tinh IS NULL OR tk.gioi_tinh = @gioi_tinh) AND
		(@email IS NULL OR tk.email = @email) AND
		(@ngay_sinh IS NULL OR tk.ngay_sinh = @ngay_sinh) AND
		(@ngay_tao IS NULL OR tk.ngay_tao = @ngay_tao) AND
		(@ho IS NULL OR tk.ho = @ho) AND
		(@ten IS NULL OR tk.ten = @ten) AND
		(@da_xoa IS NULL OR tk.da_xoa = @da_xoa) AND
		(@cod_kha_dung IS NULL OR kh.cod_kha_dung = @cod_kha_dung) AND
		(@so_don_da_dat IS NULL OR kh.so_don_da_dat = @so_don_da_dat) AND
		(@loai_khach_hang IS NULL OR kh.loai_khach_hang = @loai_khach_hang)
	ORDER BY 
		tk.id, tk.ten_tai_khoan
END;
GO



-- Procedure 2: Danh sách các món ăn được đặt nhiều nhất trong tháng
CREATE PROCEDURE dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang
	@thang INT,
	@nam INT
AS
BEGIN
	SELECT
		ma.id,
		ma.ten_mon,
		ma.gia,
		ma.mo_ta,
		ma.id_nha_hang,
		SUM(gma.so_luong) AS so_luong_da_dat
	FROM
		dbo.mon_an AS ma
	JOIN
		dbo.gom_mon_an AS gma ON ma.id = gma.id_mon_an
	JOIN
		dbo.don_hang AS dh ON gma.id_don_mon_an = dh.id
	WHERE
		MONTH(dh.ngay_tao) = @thang AND
		YEAR(dh.ngay_tao) = @nam
	GROUP BY
		ma.id, ma.ten_mon, ma.gia, ma.mo_ta, ma.id_nha_hang
	ORDER BY
		so_luong_da_dat DESC
END;
GO

EXEC dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang 5, 2024;

