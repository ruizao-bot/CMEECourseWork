i = 1
x = 0
def a_function(y):
    x = 0
    for i in range(y):
        x += 1
    return i, x
i, x = a_function(10)
print(i)
print(x)