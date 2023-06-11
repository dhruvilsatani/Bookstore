from django.db import models
from django.contrib.auth.models import User

STATE_CHOICES=(
       ('Gujarat','Gujarat'),
       ('Maharastra','Maharastra'),
       ('Rajsthan','Rajsthan'),
       ('Delhi','Delhi'),
       ('Karnataka','Karnataka')
    )

class Customer(models.Model):
    user= models.ForeignKey(User , on_delete= models.CASCADE)
    name= models.CharField(max_length=200)
    locality=models.CharField(max_length=200)
    city= models.CharField(max_length=200)
    zipcode=models.IntegerField()
    state= models.CharField(choices=STATE_CHOICES,max_length=350)

    def __str__(self) :
        return self.name

class Category(models.Model):
    title=models.CharField(max_length=200)
    image= models.ImageField(max_length=299)
    class Meta:
           verbose_name_plural = "categories"
    
    def __str__(self) :
       return self.title
class author(models.Model):
    name= models.CharField(max_length =200)
    class Meta:
        verbose_name_plural="Author"    
    def __str__(self) :
         return self.name
    
class publisher(models.Model):
    name= models.CharField(max_length=200)
    class Meta:
        verbose_name_plural="Publisher"    
    def __str__(self) :
         return self.name

class Books (models.Model):
     name= models.CharField(max_length=200)
     category=models.ForeignKey(Category,on_delete= models.CASCADE)
     selling_price= models.IntegerField(default=200)
     discounted_price= models.IntegerField(default=199)
     description=models.TextField(default="abc")
     author= models.ForeignKey(author,on_delete=models.CASCADE)
     publisher= models.ForeignKey(publisher,on_delete=models.CASCADE)
     image= models.ImageField(max_length=2000)  
     publish= models.DateField()
     class Meta:
           verbose_name_plural = "Books"
    

     def __str__(self) :
         return self.name

STATUS=(

    ('Accepted ', 'Accepted'),
    ('Packed ', 'Packed'),
    ('On the Way', 'On the Way'),
    ('Delivered','Delivered'),
    ('cancelled', 'cancelled'),
)        



class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    book= models.ForeignKey(Books,on_delete=models.CASCADE,)
    quantity=models.PositiveIntegerField(default=1)

    def __str__(self) :
        return str(self.user)  


    @property
    def price(self):
        newprice=self.book.discounted_price * self.quantity  
        return newprice   
     
    @property
    def total_price(request):
      user= request.user.id  
      cart= Cart.objects.filter(user=user)
      total = sum([ item.price  for item in cart])
      return total

    @property
    def num_of_quantity(request):
      user= request.user.id  
      cart= Cart.objects.filter(user=user)
      quantity=sum([ item.quantity for item in cart]) 
      return quantity

    # @property
    # def num_of_book(request):
    #   user= request.user.id 
    #   cart= Cart.objects.filter(user=user)
    #   items=sum([ item for item in cart]) 
    #   return items 

class orders(models.Model):
    user= models.ForeignKey(User,on_delete=models.CASCADE)
    #cart=models.ForeignKey(Cart,on_delete=models.CASCADE)
    book=models.ForeignKey(Books,on_delete=models.CASCADE)
    customer=models.ForeignKey(Customer,on_delete=models.CASCADE)
    quantity=models.PositiveIntegerField(default=1);
    order_date= models.DateTimeField(auto_now_add=True)
    status= models.CharField(choices=STATUS,max_length=200,default="Pending")    
    class Meta:
           verbose_name_plural = "Orders"    

     
    def __str__(self) :
        return  str(self.user)
    @property
    def price(self):
        newprice=self.book.discounted_price * self.quantity  
        return newprice 


class Offer(models.Model):
    image=models.ImageField(max_length=2000)
    book=models.ForeignKey(Books,on_delete=models.CASCADE)
    class Meta:
           verbose_name_plural = "Offer"
    

    def __str__(self) :
         return str(self.pk)