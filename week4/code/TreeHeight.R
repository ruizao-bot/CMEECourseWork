# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"


TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

# import data
data = read.csv( "../data/trees.csv")

#calculate tree height for every row in data
data$TreeHeight = mapply(TreeHeight, 
    data$Angle.degrees, data$Distance.m)

#change the colname  
names(data)[4] <- "TreeHeight.m"

write.csv(data, "../results/TreeHts.csv")