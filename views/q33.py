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
        ("ten_mon", "Tên món", 1),
        ("gia", "Giá", 2),
        ("mo_ta", "Mô tả", 3),
        ("id_nha_hang", "ID nhà hàng", 4),
        ("so_luong_da_dat", "Số lượng đã đặt", 5),
    ]
    context = {"months": range(1, 13), "years": range(2020, 2025), "sorts": sorts}

    month = request.GET.get("month")
    year = request.GET.get("year")
    sort = request.GET.get("sort") or "so_luong_da_dat"
    desc = True if request.GET.get("desc") else False
    search = request.GET.get("search")

    if month:
        context.update({"month": int(month)})
    if year:
        context.update({"year": int(year)})
    if sort:
        context.update({"sort": sort})
    if desc:
        context.update({"desc": desc})
    if search:
        context.update({"search": search})
    if not month or not year:
        return render(request, "q33/index.html", context)

    cursor = connection.cursor()
    cursor.execute(
        f"EXEC dbo.lay_cac_mon_an_duoc_dat_nhieu_nhat_trong_thang {month}, {year}"
    )
    rows = cursor.fetchall()

    # sort = id
    if sort:
        sortOptionsIdx = sorts.index(next(filter(lambda x: x[0] == sort, sorts)))
    else:
        sortOptionsIdx = 5
    rows = sorted(rows, key=lambda tup: tup[sortOptionsIdx], reverse=desc)

    if search:
        non_accent_search = convert_to_non_accent_vietnamese(search)
        rows = list(
            filter(
                lambda x: non_accent_search.lower() in convert_to_non_accent_vietnamese(x[1]).lower()
                or str(non_accent_search) in str(x[4])
                or non_accent_search.lower() in convert_to_non_accent_vietnamese(x[3]).lower(),
                rows,
            )
        )

    context.update({"foods": rows})

    return render(request, "q33/index.html", context)
