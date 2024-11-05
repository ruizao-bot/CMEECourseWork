rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")

ls()
class(ats)
head(ats)
plot(ats)
# Compute the appropriate correlation coefficient between years and Temperature
correlation_origin = cor(ats$Year, ats$Temp)
correlation_origin

n_shuffles <- 1000

# Store correlations
correlations_permuted <- numeric(n_shuffles)

# Repeat the calculation n_shuffles times
for (i in 1:n_shuffles) {
  # Randomly shuffle temperatures
  shuffled_temps <- sample(ats$Temp)
  
  # Calculate the correlation between years and shuffled temperatures
  correlations_permuted[i] <- cor(ats$Year, shuffled_temps)
}

# Print the first few correlations to check
print(head(correlations_permuted))

p_value <- mean(correlations_permuted >= correlation_origin)

# Print the p-value
print(paste("P-value from permutation analysis:", p_value))

# visualization
hist(correlations_permuted, breaks = 30, main = "Distribution of Permuted Correlations",
     xlab = "Correlation Coefficient", col = "lightblue", border = "black",
     xlim = c(-1, 1))
abline(v = correlation_origin, col = "red", lwd = 2)  # Mark original correlation
legend("topright", legend = "Original Correlation", col = "red", lwd = 2)