"""
This module contains six different functions that print "hello" based on various conditions. 
The functions use a combination of `for` loops, `while` loops, and conditional logic.
"""

########################
def hello_1(x):
    """
    Prints 'hello' whenever the index `j` is divisible by 3, for values from 0 to `x-1`.

    Parameters:
    x (int): The upper limit for the range to iterate over.
    
    Returns:
    None
    """
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')  # Prints a blank line after completion

hello_1(12)

########################
def hello_2(x):
    """
    Prints 'hello' based on two conditions:
    - If `j % 5 == 3`, prints 'hello'.
    - If `j % 4 == 3`, prints 'hello'.

    Parameters:
    x (int): The upper limit for the range to iterate over.

    Returns:
    None
    """
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')  # Prints a blank line after completion

hello_2(12)

########################
def hello_3(x, y):
    """
    Prints 'hello' for each value between `x` and `y-1`.

    Parameters:
    x (int): The starting value of the range.
    y (int): The ending value of the range (exclusive).

    Returns:
    None
    """
    for i in range(x, y):
        print('hello')
    print(' ')  # Prints a blank line after completion

hello_3(3, 17)

########################
def hello_4(x):
    """
    Prints 'hello' while `x` is not equal to 15, incrementing `x` by 3 in each iteration.

    Parameters:
    x (int): The initial value of `x`.

    Returns:
    None
    """
    while x != 15:
        print('hello')
        x = x + 3
    print(' ')  # Prints a blank line after completion

hello_4(0)

########################
def hello_5(x):
    """
    Prints 'hello' based on specific conditions while `x` is less than 100:
    - If `x == 31`, prints 'hello' seven times.
    - If `x == 18`, prints 'hello' once.

    Parameters:
    x (int): The starting value of `x`.

    Returns:
    None
    """
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')  # Prints a blank line after completion

hello_5(12)

########################
def hello_6(x, y):
    """
    Prints 'hello' followed by `y` while `x` is truthy. Increments `y` by 1 each time. 
    Breaks the loop when `y == 6`.

    Parameters:
    x (bool): Determines whether the loop should run.
    y (int): The starting value of `y`.

    Returns:
    None
    """
    while x:  # While x is True
        print("hello! " + str(y))
        y += 1  # Increment y by 1 
        if y == 6:
            break
    print(' ')  # Prints a blank line after completion

hello_6(True, 0)
