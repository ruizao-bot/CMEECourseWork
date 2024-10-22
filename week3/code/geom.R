# load the data
MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))

# barplot
qplot(Predator.lifestage, data = MyDF, geom = "bar")

# boxplot
qplot(Predator.lifestage, log(Prey.mass), data = MyDF, geom = "boxplot")

# violin plot
qplot(Predator.lifestage, log(Prey.mass), data = MyDF, geom = "violin")

# density
qplot(log(Predator.mass), data = MyDF, geom = "density")

# histogram
qplot(log(Predator.mass), data = MyDF, geom = "histogram")

# scatterplot
qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "point")

# smooth
qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "smooth")
qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "smooth", method = "lm")

p <- ggplot(MyDF, aes(x = log(Predator.mass),
                y = log(Prey.mass),
                colour = Type.of.feeding.interaction))
q = p + 
geom_point(size = I(2), shape = I(10)) +
theme_bw() + 
theme(aspect.ratio = 1)
q
q + theme(legend.position = "none") + theme(aspect.ratio=1)
p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) + geom_density()
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction)) + geom_density(alpha=0.5)
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) +  geom_density() + facet_wrap( .~ Type.of.feeding.interaction)
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) +  geom_density() + facet_wrap( .~ Type.of.feeding.interaction, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass))) +  geom_density() + facet_wrap( .~ Location, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location + Type.of.feeding.interaction, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Type.of.feeding.interaction + Location, scales = "free")
p

