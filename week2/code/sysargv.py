"""
This script demonstrates how to access command-line arguments in Python using the `sys` module.

"""
#!/usr/bin/env python3

import sys
print("This is the name of the script:", sys.argv[0])
print("Number of arguments:", len(sys.argv))
print("The arguments are:", str(sys.argv))
