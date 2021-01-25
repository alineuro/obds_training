# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
  
for x in range(-10,-1):
  print (x)
  
  lower = 0
upper = 50

print("Prime numbers", lower, "and", upper, "are:")

for num in range(lower, upper + 1):
   # all prime numbers are greater than 1
   if num > 1:
       for i in range(2, num):
           if (num % i) == 0:
               break
       else:
           print(num)
 
  num = int(input("6:"))
           sum = 0
           for num in range(0, num, 1):
               sum = sum+num
           print("Sum of first", num, "numbers is:", sum)