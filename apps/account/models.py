from django.db import models
from rest_framework import serializers
from django.core.exceptions import ValidationError
from datetime import datetime
from dateutil.relativedelta import relativedelta
import re


# Models
class Account(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    gender = models.BooleanField(default=False)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50, validators=[])

    class Meta:
        db_table = "account"

    def __str__(self):
        return f"""Account: {self.id}"""

    def clean(self):
        if len(self.password) < 8:
            raise ValidationError(
                {"password": "Password must be at least 8 characters long"}
            )

        today = datetime.today()
        age = relativedelta(today, self.date_of_birth).years
        if age < 18:
            raise ValidationError(
                {"date_of_birth": "You must be at least 18 years old to register"}
            )
        
        email_pattern = r"\"?([-a-zA-Z0-9.`?{}]+@\w+\.\w+)\"?"
        if not re.match(email_pattern, self.email):
            raise ValidationError(
                {"email": "Invalid email format"}
            )


# Serializers
class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = "__all__"
