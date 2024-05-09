/*
	2.1. (1 điểm) Viết các thủ tục để thêm (insert), sửa (update), xóa (delete) dữ liệu vào MỘT bảng dữ liệu. Yêu cầu:
	- Phải có thực hiện việc kiểm tra dữ liệu hợp lệ (validate) để đảm bảo các ràng buộc của bảng dữ liệu
	- Xuất ra thông báo lỗi có nghĩa, chỉ ra được lỗi sai cụ thể (không ghi chung chung là “Lỗi nhập dữ liệu!”)
	Ví dụ: kiểm tra tuổi nhân viên > 18 tuổi, kiểu format số điện thoại, email là hợp lệ, lương nhân viên nhỏ hơn lương giám đốc, v.v.
*/


CREATE PROCEDURE dbo.tao_tai_khoan
	@ten_tai_khoan NVARCHAR(100),
	@mat_khau NVARCHAR(100),
	@sdt NVARCHAR(100),
	@gioi_tinh BIT,
	@email NVARCHAR(100),
	@ngay_sinh DATE,
	@ngay_tao DATE,
	@ho NVARCHAR(100),
	@ten NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @id INT;
	SELECT @id = MAX(id) + 1 FROM dbo.tai_khoan;

	IF EXISTS (SELECT 1 FROM dbo.tai_khoan WHERE sdt = @sdt)
    BEGIN
		RAISERROR('So dien thoai nay da duoc su dung!', 16, 1);
		RETURN;
	END


    IF @sdt NOT LIKE '0[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    BEGIN
		RAISERROR('Dinh dang so dien thoai khong hop le!', 16, 1);
		RETURN;
	END   
	

	IF (@email NOT LIKE '%_@__%.__%')
    BEGIN
		RAISERROR('Dinh dang email khong chinh xac!', 16, 1);
		RETURN;
	END

	IF (LEN(@mat_khau) < 8)
    BEGIN
		RAISERROR('Mat khau can toi thieu 8 chu so!', 16, 1);
		RETURN;
	END


	DECLARE @tuoi INT;
	SET @tuoi = DATEDIFF(YEAR, @ngay_sinh, GETDATE());
	IF (MONTH(@ngay_sinh) > MONTH(GETDATE())) OR
		(MONTH(@ngay_sinh) = MONTH(GETDATE()) AND DAY(@ngay_sinh) > DAY(GETDATE()))
    BEGIN
		SET @tuoi = @tuoi - 1;
	END
	IF (@tuoi < 18)
    BEGIN
		RAISERROR('Nguoi tao tai khoan phai tren 18 tuoi!', 16, 1);
		RETURN;
	END

	INSERT INTO dbo.tai_khoan
		(id, ten_tai_khoan, mat_khau, sdt, gioi_tinh, email, ngay_sinh, ngay_tao, ho, ten, da_xoa)
	VALUES
		(@id, @ten_tai_khoan, @mat_khau, @sdt, @gioi_tinh, @email, @ngay_sinh, @ngay_tao, @ho, @ten, 0);
	
	SELECT 'Tao tai khoan thanh cong!' AS Message;
END
GO





-- Khong duoc sua ngay_tao va sdt
CREATE PROCEDURE dbo.sua_tai_khoan
	@id INT,
	@ten_tai_khoan NVARCHAR(100) = NULL,
	@mat_khau NVARCHAR(100) = NULL,
	@gioi_tinh BIT = NULL,
	@email NVARCHAR(100) = NULL,
	@ngay_sinh DATE = NULL,
	@ho NVARCHAR(100) = NULL,
	@ten NVARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM dbo.tai_khoan WHERE id = @id)
    BEGIN
        RAISERROR('Khong tim thay tai khoan!', 16, 1);
        RETURN;
    END

	IF ((@email IS NOT NULL) AND (@email NOT LIKE '%_@__%.__%'))
    BEGIN
		RAISERROR('Dinh dang email khong chinh xac!', 16, 1);
		RETURN;
	END

	IF ((@mat_khau IS NOT NULL) AND (LEN(@mat_khau) < 8))
    BEGIN
		RAISERROR('Mat khau can toi thieu 8 chu so!', 16, 1);
		RETURN;
	END


	IF (@ngay_sinh IS NOT NULL)
	BEGIN
		DECLARE @tuoi INT;
		SET @tuoi = DATEDIFF(YEAR, @ngay_sinh, GETDATE());
		IF (MONTH(@ngay_sinh) > MONTH(GETDATE())) OR
			(MONTH(@ngay_sinh) = MONTH(GETDATE()) AND DAY(@ngay_sinh) > DAY(GETDATE()))
		BEGIN
			SET @tuoi = @tuoi - 1;
		END
		IF (@tuoi < 18)
		BEGIN
			RAISERROR('Nguoi tao tai khoan phai tren 18 tuoi!', 16, 1);
			RETURN;
		END
	END


    UPDATE dbo.tai_khoan
    SET 
        ten_tai_khoan = ISNULL(@ten_tai_khoan, ten_tai_khoan),
		mat_khau = ISNULL(@mat_khau, mat_khau),
		gioi_tinh = ISNULL(@gioi_tinh, gioi_tinh),
		email = ISNULL(@email, email),
		ngay_sinh = ISNULL(@ngay_sinh, ngay_sinh),
		ho = ISNULL(@ho, ho),
		ten = ISNULL(@ten, ten)
	WHERE id = @id;

    SELECT 'Cap nhat tai khoan thanh cong!' AS Message;
END;
GO

-- DEMO
EXEC dbo.sua_tai_khoan 30, 'olivermartin', 'password30', 0, 'oliver.martin@mail.com', '1987-11-30', 'Martin', 'Oliver';
EXEC dbo.sua_tai_khoan 30, 'categorymartin', 'passwordpassword', 0, 'category.martin@mail.com', '2000-11-30', 'Martin', 'Category';
GO





CREATE PROCEDURE dbo.xoa_tai_khoan
	@id INT
AS
BEGIN
	SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM dbo.tai_khoan WHERE id = @id)
    BEGIN
        RAISERROR('Khong tim thay tai khoan!', 16, 1);
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM DBO.don_hang 
		WHERE id_khach_hang = @id and trang_thai_don_hang IN ('dang_xu_ly', 'da_xac_nhan', 'dang_giao')
	)
	BEGIN
        RAISERROR('Vui long nhan hang hoac huy don hang truoc khi xoa tai khoan!', 16, 1);
        RETURN;
    END

    UPDATE dbo.tai_khoan
    SET 
        da_xoa = 1
	WHERE id = @id;

    SELECT 'Xoa tai khoan thanh cong!' AS Message;
END;
GO
-- DEMO
EXEC dbo.xoa_tai_khoan 1;
UPDATE dbo.tai_khoan SET da_xoa = 0 WHERE id = 1;