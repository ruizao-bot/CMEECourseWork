# Function to simulate exponential growth over a specified number of generations
Exponential <- function(N0 = 1, r = 1, generations = 10) {
  # Runs a simulation of exponential growth
  # Returns a vector of length generations
  
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  # Loop through each generation from 2 to the specified number of generations
  for (t in 2:generations) {
    # Calculate the population size for the current generation based on the previous generation
    N[t] <- N[t-1] * exp(r)
    browser() # Allows for debugging; pauses execution to inspect variables
  }
  return (N)
}

# Plot the results of the exponential growth simulation
plot(Exponential(), type="l", main="Exponential growth")