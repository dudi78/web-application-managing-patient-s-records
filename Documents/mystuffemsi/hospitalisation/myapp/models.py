from django.db import models
from django.contrib.auth.models import AbstractUser

class MyUser(AbstractUser):

    phone = models.CharField(max_length=20)
    firstname = models.CharField(max_length=20)
    lastname= models.CharField(max_length=20)

# models.py

from django.db import models

class Hospitalization(models.Model):
    service = models.CharField(max_length=100)
    entry_number = models.PositiveIntegerField()
    chambre = models.PositiveIntegerField()
    lit = models.PositiveIntegerField()
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    cin_number = models.CharField(max_length=20)
    date_of_birth = models.DateField()
    sex = models.CharField(max_length=10)
    telephone = models.PositiveIntegerField()
    address = models.CharField(max_length=200)
    profession = models.CharField(max_length=100)
    marital_status = models.CharField(max_length=50)
    children_number = models.PositiveIntegerField()
    emergency_contact = models.CharField(max_length=200)
    contact_address = models.CharField(max_length=200)
    contact_phone = models.PositiveIntegerField()
    date_of_entry = models.DateField()
