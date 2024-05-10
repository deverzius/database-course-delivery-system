from django.shortcuts import render, redirect
from django.urls import reverse
from urllib.parse import urlencode
from django.http import HttpResponse
from django.db import connection
from django.views.decorators.csrf import requires_csrf_token, csrf_exempt
from common.constants import *
from common.utils import *


def index(request):
    context = {}
    if request.method == "POST":
        context = create_account(request)
        print(context)

    return render(request, "q31/index.html", context)


def edit_page(request):
    id = request.GET.get("id")
    redirect_url = request.GET.get("redirect")

    context = {}
    cursor = connection.cursor()
    cursor.execute("SELECT id FROM dbo.tai_khoan ORDER BY id ASC")
    rows = cursor.fetchall()
    context.update({"ids": rows})
    
    if redirect_url:
        context.update({"redirect": redirect_url})

    if id and request.method == "POST":
        context.update(edit_account(request, id))

    if id:
        cursor.execute(f"SELECT * FROM dbo.tai_khoan WHERE id={id}")
        row = cursor.fetchone()
        context.update(
            {
                "form": {
                    "id": row[0],
                    "ten_tai_khoan": row[1],
                    "mat_khau": row[2],
                    "sdt": row[3],
                    "gioi_tinh": row[4],
                    "email": row[5],
                    "ngay_sinh": str(row[6]),
                    "ho": row[8],
                    "ten": row[9],
                }
            }
        )

    if context.get("redirect") and context.get("status") == "created":
        print("Now redirect: ...", redirect_url)
        return redirect(f"{redirect_url}?{urlencode({
            "status": "created",
            "message": "Sửa thành công"
        })}")
    else:
        print("No redirect")
        return render(request, "q31/edit-page.html", context)


def del_page(request):
    id = request.GET.get("id")
    print(id)

    context = {}
    cursor = connection.cursor()
    cursor.execute("SELECT id FROM dbo.tai_khoan WHERE da_xoa=0 ORDER BY id ASC")
    rows = cursor.fetchall()
    context.update({"ids": rows})

    if id and request.method == "POST":
        context.update(del_account(request, id))

    if id:
        cursor.execute(f"SELECT * FROM dbo.tai_khoan WHERE id={id}")
        row = cursor.fetchone()
        context.update(
            {
                "form": {
                    "id": row[0],
                    "ten_tai_khoan": row[1],
                    "mat_khau": row[2],
                    "sdt": row[3],
                    "gioi_tinh": row[4],
                    "email": row[5],
                    "ngay_sinh": str(row[6]),
                    "ho": row[8],
                    "ten": row[9],
                }
            }
        )

    return render(request, "q31/del-page.html", context)


# Support Functions
def create_account(request):
    error = {}
    try:
        cursor = connection.cursor()
        error, query = validate_create_account_form(request, error)
        print(query)
        cursor.execute(query)
        cursor.fetchone()
        context = {
            "title": "Q31",
            "error": error,
            "message": "Tạo mới thành công",
            "status": "created",
        }
        return context
    except Exception as e:
        context = {
            "title": "Q31",
            "error": error,
            "form": request.POST,
            "message": e,
            "status": "error",
        }

        return context


def edit_account(request, id):
    error = {}
    try:
        cursor = connection.cursor()
        error, query = validate_edit_account_form(request, error, id)
        cursor.execute(query)
        cursor.fetchone()
        context = {
            "title": "Q31",
            "error": error,
            "message": "Sửa thành công",
            "status": "created",
        }
        return context
    except Exception as e:
        context = {
            "title": "Q31",
            "error": error,
            "form": request.POST,
            "message": e,
            "status": "error",
        }

        return context


def del_account(request, id):
    error = {}
    try:
        cursor = connection.cursor()
        query = f"""EXEC dbo.xoa_tai_khoan {id}"""
        cursor.execute(query)
        cursor.fetchone()
        context = {
            "title": "Q31",
            "error": error,
            "message": "Xoá thành công",
            "status": "created",
        }
        return context
    except Exception as e:
        context = {
            "title": "Q31",
            "error": error,
            "form": request.POST,
            "message": e,
            "status": "error",
        }

        return context
