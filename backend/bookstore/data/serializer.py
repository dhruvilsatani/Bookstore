from rest_framework import serializers
from .models import *
from  django.contrib.auth.models import User


class Userserializer(serializers.ModelSerializer):
    class Meta:
        model= User
        fields=('id','username','email')

class Registrationserializer(serializers.ModelSerializer):
    class Meta:
        model= User
        fields=('id','username','email','password')
        extra_kwargs={'password':{'write_only':True}}
    def create(self, validated_data):
        user= User.objects.create_user(validated_data['username'],validated_data['email'],validated_data['password'])
        return user 
class Userprofileserializer(serializers.ModelSerializer):
    #user= User.objects.create_user(validated_data['username'],validated_data['email],validated_data['password]);
    class Meta:
        model=User
        fields=['id','username','email']


class categoryserializer(serializers.ModelSerializer):
    class Meta:
          model= Category
          fields=(
            'id',
            'title',
            'image'
          )
class Authorserializer(serializers.ModelSerializer):
    class Meta:
        model=author
        fields=(
            'id',
            'name'

        ) 
class Publisherserializer(serializers.ModelSerializer):
    class Meta:
        model=publisher
        fields=(
            'id',
            'name'

        )                
class Bookserializer(serializers.ModelSerializer):
    author_detail=Authorserializer(source='author',read_only=True,many=False)
    publisher_detail=Publisherserializer(source='publisher',read_only=True,many=False)
    category_detail=categoryserializer(source='category',read_only=True,many=False)
    class Meta:
        model= Books
        fields=(
           'id',
           'name',
           'category',
           'category_detail',
           'selling_price',
           'discounted_price',
           'author',
           'author_detail',
           'publisher',
           'publisher_detail',
           'image',
           'publisher'
)


         
class offerserializer(serializers.ModelSerializer):
    book_detail=Bookserializer(source='book',read_only=True,many=False)
    class Meta:
          model= Offer
          fields=(

            'id',
            'image',
            'book',
            'book_detail'
          )


class  customerserializer(serializers.ModelSerializer): 
    class Meta:
        model=Customer
        fields=(
             'id',
             'user',
             'name',
             'locality',
             'city',
             'zipcode',
             'state'



        )

class update_item(serializers.ModelSerializer):
    class Meta:
        model=Cart
        fields=(
          'id',
          'quantity'

        )



class total(serializers.ModelSerializer):
    grand_total=serializers.SerializerMethodField(method_name='main_total')
    num_of_quantity=serializers.ReadOnlyField()
    num_of_book=serializers.ReadOnlyField()
    class Meta:
        model=Cart
        fields=[
            'num_of_quantity',
            'num_of_book',
            'grand_total',
        ]

    def main_total(self,request):
        user=request.user.id
        items=Cart.objects.filter(user=user)
        total=sum([item.quantity * item.book.discounted_price for item in items])
        return total             

class cartserializers(serializers.ModelSerializer):
    #total_price=serializers.ReadOnlyField()
   # num_of_quantity=serializers.ReadOnlyField()
    book_detail=Bookserializer(source='book',read_only=True,many=False)
    price=serializers.ReadOnlyField()
   # total_price=serializers.SerializerMethodField(method_name='main_total')
   
    class Meta:
        model= Cart
        fields=(
            'id',
            'user',
            'book',
            'book_detail',
            'quantity',
            'price',
       
             )
       
    def validate(self, validated_data):
         user=validated_data["user"]
         books=validated_data["book"]
         current_item=  Cart.objects.filter(user=user,book=books)
         if not self.instance and current_item.count()>0:
             error={'Book already in your cart'}
             raise serializers.ValidationError(error)
         return  validated_data
       



class orderserializer(serializers.ModelSerializer):
    book_detail=Bookserializer(source='book',read_only=True,many=False)
    customer_detail=customerserializer(source='Customer',read_only=True,many=False)
    # cart_detail=cartserializers(source='cart',read_only=True,many=False)
    #book=Bookserializer()
    
    class Meta:
        model=orders
        fields=(
             'id',
             'user',
             'book',
             'book_detail',
             'customer',
             'quantity',
             'price',
             'customer_detail', 
             'order_date',
             'status'
        )               