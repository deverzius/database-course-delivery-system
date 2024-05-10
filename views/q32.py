from django.shortcuts import render, redirect
from django.urls import reverse
from urllib.parse import urlencode
from django.http import HttpResponse
from django.db import connection
from django.views.decorators.csrf import requires_csrf_token, csrf_exempt
from common.constants import *
from common.utils import *


def index(request):
    sorts = [
        ("id", "ID", 0),
        ("ten_tai_khoan", "Tên tài khoản", 1),
        ("mat_khau", "Mật khẩu", 2),
        ("sdt", "SĐT", 3),
        ("gioi_tinh", "Giới tính", 4),
        ("email", "Email", 5),
        ("ngay_sinh", "Ngày sinh", 6),
        ("ngay_tao", "Ngày tạo", 7),
        ("ho", "Họ", 8),
        ("ten", "Tên", 9),
        ("da_xoa", "Đã xoá", 10),
    ]
    context = {"sorts": sorts}

    sort = request.GET.get("sort") or "id"
    desc = True if request.GET.get("desc") else False
    search = request.GET.get("search")
    where = request.GET.get("where")

    if sort:
        context.update({"sort": sort})
    if desc:
        context.update({"desc": desc})
    if search:
        context.update({"search": search})
    if where:
        context.update({"where": where})

    cursor = connection.cursor()
    try:
        cursor.execute(f"EXEC dbo.lay_tai_khoan '{where}'")
        rows = cursor.fetchall()
        context.update({"message": ""})
    except Exception as e:
        rows = []
        context.update({"status": "error"})
        context.update({"message": str(e)})
    

    if sort:
        sortOptionsIdx = sorts.index(next(filter(lambda x: x[0] == sort, sorts)))
    else:
        sortOptionsIdx = 0
    rows = sorted(rows, key=lambda tup: tup[sortOptionsIdx], reverse=desc)

    # Nhập id, tên tài khoản, sđt, email, ngày sinh, ngày tạo hoặc họ và tên
    if search:
        non_accent_search = convert_to_non_accent_vietnamese(search).lower()
        rows = list(
            filter(
                lambda x: non_accent_search in str(x[0])
                or non_accent_search in x[1]
                or non_accent_search in x[3]
                or non_accent_search in x[5]
                or non_accent_search in str(x[6])
                or non_accent_search in str(x[7])
                or non_accent_search in x[8]
                or non_accent_search in x[9],
                rows,
            )
        )

    context.update({"accounts": rows})

    print(where)
    return render(request, "q32/index.html", context)
