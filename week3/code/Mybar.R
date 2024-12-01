install.packages('ggplot2')
library(ggplot2)
# Read data from a text file into a dataframe 'a'
a <- read.table("../data/Results.txt", header = TRUE)
# Display the first few rows of the dataframe for inspection
head(a)

# Initialize a new column 'ymin' with zeros for each row in the dataframe
a$ymin = rep(0,dim(a)[1])

# Start creating a ggplot object with the data from dataframe 'a'
p = ggplot(a)

# Add the first line range (geom_linerange) to the plot
p = p + geom_linerange(data = a, aes(
                        x = x,
                        ymin = ymin,
                        ymax = y1,
                        size = (0.5)
                        ),
                    colour = "#E69F00",
                    alpha = 1/2, show.legend = FALSE)


# Add the second line range to the plot
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y2,
                          size = (0.5)
                          ),
                        colour = "#56B4E9",
                        alpha = 1/2, show.legend = FALSE)

# Print the third linerange:
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y3,
                          size = (0.5)
                          ),
                        colour = "#D55E00",
                        alpha = 1/2, show.legend = FALSE)

# Annotate the plot with labels:
p <- p + geom_text(data = a, aes(x = x, y = -500, label = Label))

# now set the axis labels, remove the legend, and prepare for bw printing
p <- p + scale_x_continuous("My x axis",
                            breaks = seq(3, 5, by = 0.05)) + 
                            scale_y_continuous("My y axis") + 
                            theme_bw() + 
                            theme(legend.position = "none") 

# Print the final plot to a PDF file
pdf("../results/MyBars.pdf", # Open blank pdf page using a relative path
    9, 8.3)
print(p)
graphics.off(); #you can also use dev.off() 