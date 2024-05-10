/*
	2.2. (1 điểm) Viết 2 trigger để kiểm soát các hành động INSERT, UPDATE, DELETE trên một số bảng đã tạo. Thỏa yêu cầu sau:
	- Có ít nhất 1 trigger có tính toán cập nhật dữ liệu trên bảng dữ liệu khác bảng đang được thiết lập trigger. (Trigger liên quan đến việc tính toán thuộc tính dẫn xuất)
	- Chuẩn bị câu lệnh và dữ liệu minh họa cho việc kiểm tra trigger khi báo cáo. 
*/


-- Trigger 1: Khi có hành động INSERT, UPDATE, DELETE trên bảng dbo.gom_mon_an, cập nhật tổng số tiền mà khách hàng đã chi tiêu trong bảng dbo.don_mon_an
CREATE TRIGGER dbo.cap_nhat_tong_tien_don_mon_an
ON dbo.gom_mon_an
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @id_don_mon_an INT;


    IF EXISTS (SELECT 1 FROM inserted)
        SELECT @id_don_mon_an = id_don_mon_an FROM inserted;
	ELSE
		SELECT @id_don_mon_an = id_don_mon_an FROM deleted;


    UPDATE dbo.don_mon_an
	SET tong_tien_mon = ISNULL((
		SELECT SUM(gma.so_luong * ma.gia * ISNULL(udma.phan_tram_giam, 1))
			FROM dbo.gom_mon_an AS gma
			INNER JOIN dbo.mon_an AS ma ON gma.id_mon_an = ma.id
			LEFT JOIN dbo.uu_dai_mon_an AS udma ON udma.id_mon_an = gma.id_mon_an
			WHERE gma.id_don_mon_an = dbo.don_mon_an.id
	), 0)
	WHERE id = @id_don_mon_an;

END;
GO


-- Trigger 2: Khi có hành động INSERT, UPDATE, DELETE trên bảng dbo.nhan_vien, cập nhật tổng số nhân viên của chi nhánh trong bảng dbo.chi_nhanh
CREATE TRIGGER dbo.cap_nhat_so_nhan_vien_chi_nhanh
ON dbo.nhan_vien
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @id_chi_nhanh INT;

	IF EXISTS (SELECT 1 FROM inserted)
        SELECT @id_chi_nhanh = id_chi_nhanh FROM inserted;
	ELSE IF EXISTS (SELECT 1 from updated)
		SELECT @id_chi_nhanh = id_chi_nhanh FROM updated;
	ELSE
		SELECT @id_chi_nhanh = id_chi_nhanh FROM deleted;

	UPDATE dbo.chi_nhanh
	SET so_nhan_vien = (
		SELECT COUNT(*)
		FROM dbo.nhan_vien
		WHERE id_chi_nhanh = @id_chi_nhanh
	)
	WHERE id = @id_chi_nhanh;
END