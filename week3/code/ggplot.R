MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
require(ggplot2)
qplot(Prey.mass, Predator.mass, data = MyDF)
qplot(log(Prey.mass), log(Predator.mass), data = MyDF)

# color the points according to the type of feeding interaction:
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, colour = Type.of.feeding.interaction)
# use asp to adjust the ratio
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, colour = Type.of.feeding.interaction, asp = 1)
# change color
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape = Type.of.feeding.interaction, asp = 1)

# set colour
qplot(log(Prey.mass), log(Predator.mass),
    data = MyDF, colour = "red")
qplot(log(Prey.mass), log(Predator.mass),
    data = MyDF, colour = I("red"))

# set point size
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, size = 3)
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, size = I(3))

# Set point shape
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape = I(3))

# Set transparency
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, colour = Type.of.feeding.interaction, alpha = I(.5))

#Add a smoother
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"))

# Add a linear regression
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth")) + geom_smooth(method = "lm")

# Add a smoother for each type of interaction
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"), 
      colour = Type.of.feeding.interaction) + geom_smooth(method = "lm")

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"),
      colour = Type.of.feeding.interaction) + geom_smooth(method = "lm",fullrange = TRUE)

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDF)

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDF, geom = "jitter")

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDF, geom = "boxplot")

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "histogram")

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "histogram", 
      fill = Type.of.feeding.interaction)

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "histogram", 
      fill = Type.of.feeding.interaction, binwidth = 1)

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "density", 
      fill = Type.of.feeding.interaction)

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "density", 
      fill = Type.of.feeding.interaction, 
      alpha = I(0.5))

qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "density", 
      colour = Type.of.feeding.interaction)

qplot(log(Prey.mass/Predator.mass), facets = Type.of.feeding.interaction ~., data = MyDF, geom =  "density")

qplot(log(Prey.mass/Predator.mass), facets =  .~ Type.of.feeding.interaction, data = MyDF, geom =  "density")

qplot(Prey.mass, Predator.mass, data = MyDF, log="xy")

qplot(Prey.mass, Predator.mass, data = MyDF, log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "log(Prey mass) (g)", 
    ylab = "log(Predator mass) (g)")

qplot(Prey.mass, Predator.mass, data = MyDF, log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "Prey mass (g)", 
    ylab = "Predator mass (g)") + theme_bw()

pdf("../results/MyFirst-ggplot2-Figure.pdf")
print(qplot(Prey.mass, Predator.mass, data = MyDF,log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "log(Prey mass) (g)", 
    ylab = "log(Predator mass) (g)") + theme_bw())
dev.off()

