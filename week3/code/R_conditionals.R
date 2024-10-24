# Checks if an integer is even
is.even <- function(n = 2) {
  # Check if 'n' is divisible by 2 (i.e., even)
  if (n %% 2 == 0) {
    return(paste(n,'is even!'))
  } else {
  return(paste(n,'is odd!'))
  }
}

# Test the is.even function with input 6
is.even(6)

# Checks if a number is a power of 2
is.power2 <- function(n = 2) {
  # Check if log base 2 of 'n' is an integer (i.e., n is a power of 2)
  if (log2(n) %% 1==0) {
    return(paste(n, 'is a power of 2!'))
  } else {
  return(paste(n,'is not a power of 2!'))
    }
}

# Test the is.power2 function with input 4
is.power2(4)

# Checks if a number is prime
is.prime <- function(n) {
  # Handle special cases for 0 and 1
  if (n==0) {
    return(paste(n,'is a zero!'))
  } else if (n==1) {
    return(paste(n,'is just a unit!'))
  }
  # Create a sequence of integers from 2 to n-1  
  ints <- 2:(n-1)
  
  if (all(n%%ints!=0)) {
    # Return message if 'n' is prime
    return(paste(n,'is a prime!'))
  } else {
  return(paste(n,'is a composite!'))
    }
}

# Test the is.prime function with input 3
is.prime(3)