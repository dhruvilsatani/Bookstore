from django.contrib import admin


from data.models import Category,orders,Books,Customer,Cart,publisher,author,Offer






# Register your models here.
admin.site.register(Category)
admin.site.register(orders)
admin.site.register(Books)
admin.site.register(Customer)
admin.site.register(Cart)
admin.site.register(publisher)
admin.site.register(author)
admin.site.register(Offer)
admin.site.site_header="Book store Admin"
admin.site.site_title="Book store Admin"
admin.site.index_title="Welcome to Bookstore Admin"