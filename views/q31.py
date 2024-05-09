from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection


def index(request):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM dbo.tai_khoan")
    rows = cursor.fetchall()
    context = {
        "title": "Q31",
        "accounts": rows,
    }
    return render(request, "q31/index.html", context)


def create_account(request):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM dbo.tai_khoan")
    rows = cursor.fetchall()
    print(rows.__len__)
    context = {
        "title": "Q31",
        "accounts": rows,
    }
    return render(request, "q31/index.html", context)
