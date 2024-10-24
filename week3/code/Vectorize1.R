# Create a 1000x1000 matrix 'M' filled with random numbers between 0 and 1
M = matrix(runif(1000000), 1000, 1000)

# Function to sum all elements of a matrix using nested loops
SumAllElemtns = function(M){
    # Get the dimensions of the matrix (number of rows and columns)
    Dimensions = dim(M)
    # Initialize a variable 'Tot' to store the running total of the sum
    Tot = 0

    # Outer loop: iterate over each row of the matrix
    for(i in 1:Dimensions[1]){
        for(j in 1:Dimensions[2]){
            Tot = Tot + M[i,j]
        }
    }

    # Return the final sum
    return(Tot)
}

# Print the time taken to sum all matrix elements using the custom loop function
print("Using loops, the time taken is:")
print(system.time(SumAllElemtns(M)))

# Print the time taken to sum all matrix elements using the built-in vectorized 'sum' function
print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))