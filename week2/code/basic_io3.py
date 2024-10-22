"""
This script demonstrates how to store and retrieve complex Python objects 
(such as dictionaries) using the `pickle` module. 

"""
#################
# STORING OBJECTS
#################
# tO SAVE AN OBJECT (EVEN COMPLEX) for later use
my_dictionary = {"a key": 10, "another key": 11}

import pickle

f = open('../sandbox/testp.p', 'wb') ## note the b: accept binary files
pickle.dump(my_dictionary, f)
f.close()

## Load the data again
f = open(',,/sandbox/testp.p', 'rb')
another_dictionary = pickle.load(f)
f.close()

print(another_dictionary)
