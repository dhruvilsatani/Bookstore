# # username=input("please enter your username ")
# # password=input("enter your password")

# # password_lenght=len(password)
# # hidden_password= '*' * password_lenght

# # print(f'your username is {username} and password is {hidden_password} and password lenght  id {password_lenght}')
# # row = int(input("enter  the number you want to display"))


# # for i in range(row):
# #     for j in range(i+1):
# #         print("* ",end="")
# #

# #     print("\n")   c
# #map
# my_list=[1,2,3]
# # my_list1=[1,2,3]
# # def multiply(item):
# #     return item*2
# # def check_odd(item):
# #   return  item % 2 != 0


# # print(list(zip(my_list1,my_list)))
# #filter 
# #lambda
# a=[(0,2),(4,2),(9,9),(10,-1)]
# a.sort(key= lambda x: x[1])
# print(a)
# #dictionary comprihantion
# simple_dict={
#     'a':1,p21
#     'b':2

# }
# # my_dict= { k:v*2 for k,v in simple_dict.items()  }
# # print(my_dict)


# # my_dict1 ={num:num*2 for num in [1,2,3]} 
# # print(my_dict1)
# some_list=['a','b','c','b','d','m','n','n']
# duplicates= set([  n  for  n in some_list if some_list.count(n)>1])
# print(duplicates)
for i in range(100):
    print (i)


#decorators 
# from time import time
# def decorators(fn):
#     def wrap(*args, **kwargs):
#        print("*******")
#        t1=time()
#        result= fn(*args, **kwargs)
#        t2=time()
#        print(f'took {t2-t1}')
#        return result
#     return wrap   
# @decorators
# def hello():
#     for i in range(10000000):
#         i*5

# # hello()
# def fib(num):
#     a=0
#     b=1

#     for i in range(num):
#         yield a
#         temp=a
       
#         a=b
        

        
        
# for x in fib(20):
#     print(x)  


