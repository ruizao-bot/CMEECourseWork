"""
This module demonstrates the use of global and local variables in Python.
It illustrates how changes to global variables affect the behavior of the program inside and outside of functions.
"""
# Global variable
_a_global = 10

def a_function_1():

    """
    Demonstrates the scope of local and global variables.
    
    """
    _a_local = 4
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
    
a_function_1()

print("Outside the function, the value of _a_global is", _a_global)

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function_2():
    """
    Demonstrates the use of the `global` keyword to modify a global variable from within the function.
    
    Changes `_a_global` to 5 and prints the values of `_a_global` and the local variable `_a_local`.
    """
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function_2()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

def a_function_3():

    """
    Demonstrates nested functions and the use of `global` keyword to modify a global variable from within a nested function.
    
    Prints the value of `_a_global` before and after calling the inner function `_a_function2`, which modifies `_a_global`.
    """
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function_3()

print("The value of a_global in main workspace / namespace now is", _a_global)

