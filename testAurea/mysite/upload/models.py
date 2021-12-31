from django.db import models

# Create your models here.

class File(models.Model):
    url = models.CharField(max_length=200)
    content =models.CharField(max_length=200)
    def __str__(self):
        return self.url

