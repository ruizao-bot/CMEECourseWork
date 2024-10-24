# A boilerplate R script

# MyFunction: A simple function that prints the class (type) of two arguments and returns them as a vector.
# Args:
#   Arg1: The first argument, can be of any data type (e.g., numeric, character).
#   Arg2: The second argument, can be of any data type (e.g., numeric, character).
# Returns:
#   A vector containing Arg1 and Arg2.

MyFunction = function(Arg1, Arg2) {
    
    #Statements involving Arg1, Arg2
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1)))
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))

    return (c(Arg1, Arg2)) #this is optional, but very useful
}
MyFunction(1,2) #test the function
MyFunction("Riki","Tiki") #A different test