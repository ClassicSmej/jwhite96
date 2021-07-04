from django.urls import include, path
from .views import *


app_name = 'index'
urlpatterns = [
    path('', IndexView.as_view(), name='Index')
]
