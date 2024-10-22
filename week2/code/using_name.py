
"""
The script checks whether it is being run directly or being imported as a module in another script.
If the script is run directly, it prints a message indicating so.
If it is imported from another script or module, it prints a different message.

"""
#!/usr/bin/env python3
# Filename: using_name.py
if __name__ =='__main__':
    print('This program is being run by itself!')
else:
    print('I am being imported from another script/program/module!')
print("This module's name is: " + __name__)