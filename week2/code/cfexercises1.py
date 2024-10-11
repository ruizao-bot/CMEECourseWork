#!/usr/bin/env python3

"""Some functions exemplifying the use of control statements"""
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time.
__author__ = 'Jiayi Chen (jiayi.chen24@imperial.ac.uk)'
__version__ = '0.0.1'

import sys

def foo_1(x = 0): # if not specified, x should take value 0.

    """Calculate the square root of x"""
    return f"the square root of x is {x ** 0.5}"

def foo_2(x, y = 2):

    """Compare the value of x and y"""
    if x > y:
        return f"x>y, the value of {x}"
    return f"the value of {y}"

def foo_3(x, y, z):

    """ takes three inputs x, y, z and arranges them in non-decreasing order."""
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x):
     
    """ calculates the factorial of x """
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x): 

    """  recursive function that calculates the factorial of x """
    if x == 1:
        return 1
    return x * foo_5(x - 1)
     
def foo_6(x):
    
    """Calculate the factorial of x in a different way; no if statement involved """
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto
    
def main():
    # Test cases
    print(foo_1(9))            # Example test with square root
    print(foo_2(10, 5))        # Compare 10 and 5
    print(foo_3(3, 2, 1))      # Arrange in non-decreasing order
    print(foo_4(5))            # Factorial of 5 iteratively
    print(foo_5(5))            # Factorial of 5 recursively
    print(foo_6(5))            # Factorial of 5 using while loop