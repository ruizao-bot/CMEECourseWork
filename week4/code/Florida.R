rm(list=ls())
library(ggplot2)
load("../data/KeyWestAnnualMeanTemperature.RData")

ls()
class(ats)
head(ats)

# Plot data
p <- ggplot(data=ats, aes(x = Year, y = Temp)) +
  geom_point(shape = 1) +
  stat_smooth(method="lm", se=FALSE, colour = "red") +
  labs(x = "Year", y = "Temperature") +
  theme_classic()  
plot(p)
ggsave("../results/plot.png", plot = p, width = 8, height = 6, dpi = 300)
# Compute the appropriate correlation coefficient between years and Temperature
correlation_origin = cor(ats$Year, ats$Temp)
correlation_origin
# generate 1000 shuffles
set.seed(123)
n_shuffles <- 1000

# Store correlations
correlations_permuted <- numeric(n_shuffles)

# Repeat the calculation n_shuffles times
for (i in 1:n_shuffles) {
  shuffled_temps <- sample(ats$Temp)
  correlations_permuted[i] <- cor(ats$Year, shuffled_temps)
}

# Print the first few correlations to check
print(head(correlations_permuted))

p_value <- mean(correlations_permuted >= correlation_origin)

# Print the p-value
print(paste("P-value from permutation analysis:", p_value))

# Visualization
h <- ggplot(mapping = aes(x = correlations_permuted)) +
  geom_histogram(colour = "white", fill = "blue") +
  geom_vline(xintercept = correlation_origin, colour = "red", size = 1) +
  labs(x = "Correlation Coefficient", y = "Frequency") +
  xlim(-0.4, 0.6) +
  theme_classic() +
  theme(
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )

# Save the picture
ggsave("../results/histogram_plot.png", plot = h, width = 8, height = 6, dpi = 100)
