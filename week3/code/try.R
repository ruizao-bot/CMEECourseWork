# Function to calculate the mean of a sampled population if conditions are met
doit <- function(x) {
     # Sample 'x' with replacement to create a new sample 'temp_x'
    temp_x <- sample(x, replace = TRUE)

    # Check if the number of unique values in the sample is greater than 30
    if(length(unique(temp_x)) > 30) {#only take mean if sample was sufficient
         # Calculate and print the mean of the sampled values
         print(paste("Mean of this sample was:", as.character(mean(temp_x))))
        } 
    else {
        # Stop execution and print an error message if too few unique values are present
        stop("Couldn't calculate mean: too few unique values!")
        }
    }

# Set a random seed for reproducibility of results
set.seed(1345) # again, to get the same result for illustration

# Generate a population of 50 random values from a normal distribution
popn <- rnorm(50)

# Create a histogram of the generated population to visualize its distribution
hist(popn)