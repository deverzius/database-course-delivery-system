from datetime import date


def validate_create_account_form(request, error):
    if request.POST.get("ten_tai_khoan"):
        ten_tai_khoan = f"""@ten_tai_khoan="{request.POST.get("ten_tai_khoan")}","""
    else:
        error.update({"ten_tai_khoan": "Thiếu tên tài khoản"})

    if request.POST.get("mat_khau"):
        mat_khau = f"""@mat_khau="{request.POST.get("mat_khau")}","""
    else:
        error.update({"mat_khau": "Thiếu mật khẩu"})

    if request.POST.get("sdt"):
        sdt = f"""@sdt="{request.POST.get("sdt")}","""
    else:
        error.update({"sdt": "Thiếu số điện thoại"})

    if request.POST.get("gioi_tinh"):
        gioi_tinh = f"""@gioi_tinh={request.POST.get("gioi_tinh")},"""
    else:
        error.update({"gioi_tinh": "Thiếu giới tính"})

    if request.POST.get("email"):
        email = f"""@email="{request.POST.get("email")}","""
    else:
        error.update({"email": "Thiếu email"})

    ngay_tao = f"""@ngay_tao="{date.today()}","""

    if request.POST.get("ngay_sinh"):
        ngay_sinh = f"""@ngay_sinh="{request.POST.get("ngay_sinh")}","""
    else:
        error.update({"ngay_sinh": "Thiếu ngày sinh"})

    if request.POST.get("ho"):
        ho = f"""@ho="{request.POST.get("ho")}","""
    else:
        error.update({"ho": "Thiếu họ"})

    if request.POST.get("ten"):
        ten = f"""@ten="{request.POST.get("ten")}","""
    else:
        error.update({"ten": "Thiếu tên"})

    query = f"""EXEC dbo.tao_tai_khoan {ten_tai_khoan} {mat_khau} {sdt} {gioi_tinh} {email} {ngay_sinh} {ngay_tao} {ho} {ten}"""[
        :-1
    ]

    return error, query


def validate_edit_account_form(request, error, id):
    if request.POST.get("ten_tai_khoan"):
        ten_tai_khoan = f"""@ten_tai_khoan="{request.POST.get("ten_tai_khoan")}","""
    else:
        error.update({"ten_tai_khoan": "Thiếu tên tài khoản"})

    if request.POST.get("mat_khau"):
        mat_khau = f"""@mat_khau="{request.POST.get("mat_khau")}","""
    else:
        error.update({"mat_khau": "Thiếu mật khẩu"})

    if request.POST.get("gioi_tinh"):
        gioi_tinh = f"""@gioi_tinh={request.POST.get("gioi_tinh")},"""
    else:
        error.update({"gioi_tinh": "Thiếu giới tính"})

    if request.POST.get("email"):
        email = f"""@email="{request.POST.get("email")}","""
    else:
        error.update({"email": "Thiếu email"})

    if request.POST.get("ngay_sinh"):
        ngay_sinh = f"""@ngay_sinh="{request.POST.get("ngay_sinh")}","""
    else:
        error.update({"ngay_sinh": "Thiếu ngày sinh"})

    if request.POST.get("ho"):
        ho = f"""@ho="{request.POST.get("ho")}","""
    else:
        error.update({"ho": "Thiếu họ"})

    if request.POST.get("ten"):
        ten = f"""@ten="{request.POST.get("ten")}","""
    else:
        error.update({"ten": "Thiếu tên"})

    query = f"""EXEC dbo.sua_tai_khoan @id={id}, {ten_tai_khoan} {mat_khau} {gioi_tinh} {email} {ngay_sinh} {ho} {ten}"""[
        :-1
    ]

    return error, query
