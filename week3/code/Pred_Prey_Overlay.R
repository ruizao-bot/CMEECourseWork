MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDF) #check the size of the data frame you loaded

str(MyDF)
head(MyDF)

require(tidyverse)
glimpse(MyDF)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Location <- as.factor(MyDF$Location)
str(MyDF)

plot(MyDF$Predator.mass,MyDF$Prey.mass)

# log
plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass))

#log 10
plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass))

# Change the symblos
plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=20)

#Add labels
plot(log10(MyDF$Predator.mass), log10(MyDF$Prey.mass), pch=20, xlab = "Predator Mass(g)", ylab = "Prey Mass(g)")


hist(MyDF$Predator.mass)
# log10 to deal with right skewed and add labels
hist(log10(MyDF$Predator.mass), xlab = "log10(Predator Mass (g))", ylab = "Count")
# Change bar and borders colors 
hist(log10(MyDF$Predator.mass),xlab="log10(Predator Mass (g))",ylab="Count", col = "lightblue", border = "pink") 

######Overlaying plots###
# Plot predator and prey body masses in different plot
par(mfcol=c(2,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(MyDF$Predator.mass),
    xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
    main = 'Predator') # Add title
par(mfg = c(2,1)) # Second sub-plot
hist(log10(MyDF$Prey.mass), xlab="log10(Prey Mass (g))",ylab="Count", col = "lightgreen", border = "pink", main = 'prey')

# Overlaying plots
hist(log10(MyDF$Predator.mass), 
    xlab="log10(Body Mass (g))", ylab="Count", 
    col = rgb(1, 0, 0, 0.5), #Note 'rgb', fourth value is transparency
    main = "Predator-prey size Overlap") 
hist(log10(MyDF$Prey.mass), col = rgb(0, 0, 1, 0.5), add = T) # Plot prey
legend('topleft',c('Predators','Prey'),   # Add legend
    fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) # Define legend colors

####### Boxplots######
boxplot(log10(MyDF$Predator.mass), xlab = "Location", ylab = "log10(Predator Mass)", main = "Predator mass")

# see how many locations the data are from
boxplot(log(MyDF$Predator.mass) ~ MyDF$Location, 
    xlab = "location", ylab = "Predator Mass",
    main = "Predator mass by location")

# feeding interaction type
boxplot(log(MyDF$Predator.mass) ~ MyDF$Type.of.feeding.interaction,
    xlab = "Location", ylab = "Predator Mass",
    main = "Predator mass by feeding interaction type")

# Combine plot types
 par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
 plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
 par(fig=c(0,0.8,0.4,1), new=TRUE)
 boxplot(log(MyDF$Predator.mass), horizontal=TRUE, axes=FALSE)
 par(fig=c(0.55,1,0,0.8),new=TRUE)
 boxplot(log(MyDF$Prey.mass), axes=FALSE)
 mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)

# Save the graphics
pdf("../results/Pred_Prey_Overlay.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
hist(log(MyDF$Predator.mass), # Plot predator histogram (note 'rgb')
    xlab="Body Mass (g)", ylab="Count", col = rgb(1, 0, 0, 0.5), main = "Predator-Prey Size Overlap") 
hist(log(MyDF$Prey.mass), # Plot prey weights
    col = rgb(0, 0, 1, 0.5), 
    add = T)  # Add to same plot = TRUE
legend('topleft',c('Predators','Prey'), # Add legend
    fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
graphics.off(); #you can also use dev.off() 