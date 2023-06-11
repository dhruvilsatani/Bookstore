from django.shortcuts import render
from rest_framework import status
from rest_framework import generics,permissions
from .models import *
from knox.models import AuthToken #
from rest_framework.filters import SearchFilter
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.filters import SearchFilter
from .serializer import *
from django.contrib.auth import login
from rest_framework.authtoken.serializers import AuthTokenSerializer
from knox.views import LoginView as knoxloginview


class Registerapi(generics.GenericAPIView):
    serializer_class=Registrationserializer
    
    def post(self,request,*args,**kwargs):
        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user=serializer.save()
        
        return Response(
            {
                "user ": Userserializer(user,context=self.get_serializer_context()).data,
                "token":AuthToken.objects.create(user)[1]
            }
        )


class Loginapi(knoxloginview):
    permission_classes=(permissions.AllowAny,)

    def post(self, request, format=None):
        serializer=AuthTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user= serializer.validated_data['user']
        login(request,user)
        if login:
            print("login successfully");
        return super(Loginapi,self).post(request, format=None)
class UserProfileView(APIView):
    
    permission_classes=[permissions.IsAuthenticated,]
    def get(self,request,formate=None):
        serializers= Userprofileserializer(request.user)
        
        return Response(serializers.data,status=status.HTTP_200_OK)        

class listBook(generics.ListCreateAPIView):
    queryset= Books.objects.all()
    serializer_class= Bookserializer
    filter_backends=[SearchFilter]
    search_fields=['^name','category__id']

class listdetailbook(generics.RetrieveDestroyAPIView):
    queryset=Books.objects.all()
    serializer_class=Bookserializer


class listcategory(generics.ListCreateAPIView):
    queryset= Category.objects.all()
    serializer_class= categoryserializer

class listoffer(generics.ListCreateAPIView):
    queryset= Offer.objects.all()
    serializer_class= offerserializer    

# class listorders(generics.ListCreateAPIView):
#    # serializer_class= orderserializer 
#     permission_classes=(permissions.IsAuthenticated,)
#     def  get_queryset(self):
#         user= self.request.user.id
#         queryset=orders.objects.filter(User=user)
#         return queryset

#     def post(self,request,*args,**kwargs):

#         serializer=self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
        
#         return Response(
#             {
#                 "reponse" : "sucessfully added"
#             }
#         )  

class listcustomer(generics.ListCreateAPIView):
    serializer_class= customerserializer 
    permission_classes=(permissions.IsAuthenticated,)
    def  get_queryset(self):
        user= self.request.user.id
        queryset=Customer.objects.filter(user=user)
        return queryset

    def post(self,request,*args,**kwargs):

        serializer=self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        
        return Response(
            {
                "reponse" : "sucessfully added"
            }
        )         
class listdetailcustomer(APIView):
    # queryset=Cart.objects.all()
    # serializer_class=cartserializers  
    http_method_names=["get","post","put","patch","delete"]

    def get(self,request,pk):
        try:
            obj=Customer.objects.get(id=pk)
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND)    
        serializer=customerserializer(obj)
        return Response(serializer.data,status=status.HTTP_200_OK)     
    def delete(self,request,pk):
        try:
            obj=Customer.objects.get(id=pk)
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 
        obj.delete()       
        
        msg={"msg":"not found "}
        return Response(msg,status=status.HTTP_204_NO_CONTENT)  
    def put(self,request,pk): 

        try:
            obj=Customer.objects.get(id=pk)
        except Customer.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 

        serializer=customerserializer(obj,data=request.data,partial=True)
        if serializer.is_valid():
             serializer.save()
             return Response(serializer.data,status=status.HTTP_205_RESET_CONTENT)
        return Response(serializer.data,status=status.HTTP_400_BAD_REQUEST)
     
class listorders(generics.ListCreateAPIView):
    serializer_class= orderserializer
    
    permission_classes=(permissions.IsAuthenticated,)
    
    def  get_queryset(self):
        user= self.request.user.id
        queryset=orders.objects.filter(user=user)
        return queryset

    def post(self,request,*args,**kwargs):

        serializer=self.get_serializer(data=request.data)
        
        serializer.is_valid(raise_exception=True)
        serializer.save()
        
        return Response(
            {
                "reponse" : "sucessfully added"
            }
        )          
    
class listdetailorder(APIView):
    # queryset=Cart.objects.all()
    #serializer_class=cartserializers
    http_method_names=["get","post","patch","delete"]

    def get(self,request,pk):
        try:
            obj=orders.objects.get(id=pk)
        except orders.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND)    
        serializer=orderserializer(obj)
        return Response(serializer.data,status=status.HTTP_200_OK)

    

    def delete(self,request,pk):
        try:
            obj=orders.objects.get(id=pk)
        except orders.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 
        obj.delete()       
        
        msg={"msg":"not found "}
        return Response(msg,status=status.HTTP_204_NO_CONTENT)       

class listcart(generics.ListCreateAPIView):
    serializer_class= cartserializers 
    permission_classes=(permissions.IsAuthenticated,)
    http_method_names=["get","post","put","patch","delete"]
    def  get_queryset(self):
        user= self.request.user.id
        queryset=Cart.objects.filter(user=user).distinct()
        return queryset

    def post(self,request,*args,**kwargs):

        cart_objects=[p for p in Cart.objects.all() if p.user == self.request.user.id ]
        serializer=self.get_serializer(data=request.data)
        
        
        serializer.save()
        
        return Response(
            {
                "reponse" : "sucessfully added"
            }
        )    
    
    def delete(self,request):
        try:
            obj=Cart.objects.all()
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 
        obj.delete()       
        
        msg={"msg":"not found "}
        return Response(msg,status=status.HTTP_204_NO_CONTENT)
   
       
class listdetailcart(APIView):
    # queryset=Cart.objects.all()
    # serializer_class=cartserializers  
    http_method_names=["get","post","patch","delete"]

    def get(self,request,pk):
        try:
            obj=Cart.objects.get(id=pk)
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND)    
        serializer=cartserializers(obj)
        return Response(serializer.data,status=status.HTTP_200_OK)

    def patch(self,request,pk): 

        try:
            obj=Cart.objects.get(id=pk)
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 

        serializer=cartserializers(obj,data=request.data,partial=True)
        if serializer.is_valid():
             serializer.save()
             return Response(serializer.data,status=status.HTTP_205_RESET_CONTENT)
        return Response(serializer.data,status=status.HTTP_400_BAD_REQUEST)

    def delete(self,request,pk):
        try:
            obj=Cart.objects.get(id=pk)
        except Cart.DoesNotExist:
            msg={"msg":"not found "}
            return Response(msg,status=status.HTTP_404_NOT_FOUND) 
        obj.delete()       
        
        msg={"msg":"not found "}
        return Response(msg,status=status.HTTP_204_NO_CONTENT)    
        # data= request.data
        # book=Cart.objects.get(id=pk)
        
        # book.user=data.get("user",book.user)
        # book.book=data.get("book",book.book)
        # book.quantity=data.get("quantity",book.quantity)
        
        # book.save()
        # serializer=cartserializers(book)

        # return Response(serializer.data)    
    # def patch(self,request,*args,**kwargs):

    #     serializer=self.get_serializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     serializer.save()
        
    #     return Response(
    #         {
    #             "reponse" : "sucessfully updated"
    #         }
    #     )    
        
class listtotal(generics.ListCreateAPIView):
    serializer_class= total
    
    permission_classes=(permissions.IsAuthenticated,)
    def  get_queryset(self):
        user= self.request.user.id
        queryset=Cart.objects.filter(user=user)
        return queryset

class Detailcart(generics.ListCreateAPIView):
    permission_classes=(permissions.IsAuthenticated,)
    queryset=Cart.objects.all()
    serializer_class= cartserializers
    