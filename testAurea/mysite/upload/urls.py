from django.conf.urls import  url
from django.contrib import sessions
from upload import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]
