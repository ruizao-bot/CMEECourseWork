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
hist(d$Year)
hist(d$BirdID)
hist(d$Tarsus)
hist(d$Bill)
hist(d$Wing)
hist(d$Mass)


plot_histograms <- function(data, vars) {
  par(mfrow = c(2, 2))  # Set the layout for 4 plots (2x2)
  
  for (var in vars) {
    hist(data[[var]], main = paste("Histogram of", var), 
         xlab = var, col = "lightblue", border = "black")
  }
  
  par(mfrow = c(1, 1))  # Reset the layout to default
}

# Example usage
plot_histograms(d, c("Year", "BirdID", "Tarsus", "Bill", "Wing", "Mass", "Sex", "Sex.1"))
