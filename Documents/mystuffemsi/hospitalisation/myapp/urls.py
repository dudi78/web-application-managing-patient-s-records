from django.urls import path
from . import views
urlpatterns = [
   
    path('details', views.details, name='details'),
    path('menu',views.menu,name='menu'),
    path('registration', views.register, name='registration'),
    path('login', views.login_view, name='login'),
    path('ajouterdossier', views.dossier, name='ajouterdossier'),
    path('chercherdossier/<int:hid>', views.chdossier, name='chercherdossier'),
    path('modifdossier/<int:hid>', views.modifdossier, name='modifdossier'),
    path('addhosp', views.addhosp, name='addhosp'),
    path('Adds', views.Adds, name='Adds'),
    path('delete_row/<int:hid>',views.delete_row, name='delete_row'),
    path('logout', views.logout_view, name='logout'),
   
]
