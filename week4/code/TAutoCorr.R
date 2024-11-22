rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")
ls()
class(ats)
head(ats)
plot(ats)

# Calculate correlation between consecutive years
cor_origin <- cor(ats$Temp[-nrow(ats)], ats$Temp[-1])

# Permutation test
n_permutations <- 10000
cor_perm <- numeric(n_permutations)

for (i in 1:n_permutations) {
  permuted_values <- sample(ats$Temp)
  cor_perm[i] <- cor(permuted_values[-nrow(ats)], permuted_values[-1])
}

# Calculate the p-value
p_value <- mean(abs(cor_perm) >= abs(cor_origin))

# Cat Results
cat("Observed Correlation:", cor_origin, "\n")
cat("Permutation-based p-value:", p_value, "\n")