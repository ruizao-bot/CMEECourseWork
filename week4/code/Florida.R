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

# visualization
png("../results/histogram_plot.png", width = 1000, height = 600, res = 100)
hist(correlations_permuted, breaks = 30, main = "",
     xlab = "Correlation Coefficient", col = "lightblue", border = "black",
     xlim = c(-1, 1))
abline(v = correlation_origin, col = "red", lwd = 2) 
legend("topright", legend = "Original Correlation", col = "red", lwd = 2)
# Close the device to save the file
dev.off()