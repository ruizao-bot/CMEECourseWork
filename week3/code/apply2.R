# Define a function that modifies a numeric vector based on its sum
SomeOperation = function(v){#(What does this function do)
    if(sum(v)>0) { # note that sum(v) is a single (scalar value)
        return(v*100)
    } else {
        return(v)
    }
}

# Create a 10x10 matrix 'M' filled with random numbers from a normal distribution
M = matrix(rnorm(100),10,10)


# Apply the SomeOperation function to each row of the matrix 'M'
# The 'apply' function takes 'M', applies 'SomeOperation' to each row (M,1),
# and returns a vector of results
print(apply(M,1,SomeOperation))