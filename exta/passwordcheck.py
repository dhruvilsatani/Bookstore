import requests 
import hashlib
import sys
def request_api_data(query_char):
    url='https://api.pwnedpasswords.com/range/' + query_char
    res= requests.get(url)
    if  res.status_code != 200:
        raise RuntimeError(f'Error on fatching :{res.status_code}, check the api and try again')
    return res
  
def read(hashes,hashes_to_check):
   hashes = (line.split(':') for line in hashes.text.splitlines())
   for h,count in hashes:
      if h == hashes_to_check:
        return count 
   return 0  

def checking(password):
  sh1pass= hashlib.sha1(password.encode('utf-8')).hexdigest().upper()
  firstfivechar, tail =sh1pass[:5],sh1pass[5:]
  response= request_api_data(firstfivechar)
  
  return read(response,tail)



def main(password):
   #for password in args:
      count= checking(password)
      if count :
         print(f'{password} was found {count} times ... you shoud change it')
      else:
         print(f'{password} was not fount your paasword are goood')  
  # return 'completed!!' 
main('')      