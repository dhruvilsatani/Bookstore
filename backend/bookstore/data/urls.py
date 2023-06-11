from django.contrib import admin
from django.urls import path, include
from .views import *
from knox  import views as knoxview


urlpatterns = [

    path('books/',listBook.as_view()  ,name="books"),
    path('offer/',listoffer.as_view()  ,name="offers"),
    path('books/<int:pk>/',listdetailbook.as_view()  ,name="booksdetail"),
    path('category/',listcategory.as_view(), name="category "),
    path('orders/',listorders.as_view(), name="orders"),
    path('orders/<int:pk>/',listdetailorder.as_view()  ,name="orderdetail"),
    path('customer/',listcustomer.as_view(), name="customer"),
    path('customer/<int:pk>/',listdetailcustomer.as_view()  ,name="customerdetail"),
    path('cart/',listcart.as_view(), name="cart"),
    path('cart/<int:pk>/',listdetailcart.as_view()  ,name="cartdetail"),
    path('cart-total/',listtotal.as_view(), name="total"),
    path('register/',Registerapi.as_view(), name="register"),
    path('profile/',UserProfileView.as_view(), name="profile"),
    path('login/',Loginapi.as_view(), name="login"),
    path('logout/',knoxview.LogoutView.as_view(), name="logout"),
    path('logoutdetail/',knoxview.LogoutAllView.as_view(), name="logoutdetail")
]




