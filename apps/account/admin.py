from django.contrib import admin, messages
from apps.account.models import Account

# Register your models here.
class AccountAdmin(admin.ModelAdmin):
    ordering = ["id"]

admin.site.register(Account, AccountAdmin)
