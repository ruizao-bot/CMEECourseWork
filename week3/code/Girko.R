library(ggplot2)
# Function to build an ellipse based on specified horizontal and vertical radii
build_ellipse <- function(hradius, vradius){ # function that returns an ellipse
  npoints = 250
  a <- seq(0, 2 * pi, length = npoints + 1)
  x <- hradius * cos(a)
  y <- vradius * sin(a)  
  return(data.frame(x = x, y = y))
}

N <- 250 # Assign size of the matrix

# Generate a matrix of random numbers from a normal distribution
M <- matrix(rnorm(N * N), N, N) # Build the matrix

# Calculate the eigenvalues of the matrix
eigvals <- eigen(M)$values # Find the eigenvalues

# Create a dataframe to store the real and imaginary parts of the eigenvalues
eigDF <- data.frame("Real" = Re(eigvals), "Imaginary" = Im(eigvals)) # Build a dataframe

my_radius <- sqrt(N) # The radius of the circle is sqrt(N)

ellDF <- build_ellipse(my_radius, my_radius) # Dataframe to plot the ellipse


# Rename the columns of the ellipse dataframe for clarity
names(ellDF) <- c("Real", "Imaginary") # rename the columns


# plot the eigenvalues
p <- ggplot(eigDF, aes(x = Real, y = Imaginary))
p <- p +
  geom_point(shape = I(3)) +
  theme(legend.position = "none")

# now add the vertical and horizontal line
p <- p + geom_hline(aes(yintercept = 0))
p <- p + geom_vline(aes(xintercept = 0))

# finally, add the ellipse
p <- p + geom_polygon(data = ellDF, aes(x = Real, y = Imaginary, alpha = 1/20, fill = "red"))

# Open a PDF device to save the plot
pdf("../results/Girko.pdf", # Open blank pdf page using a relative path
    9, 8.3)
print(p)
graphics.off(); #you can also use dev.off() 