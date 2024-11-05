library(ggplot2)
library(dplyr)

# read data and summarise the feature
data = read.csv("../data/EcolArchives-E089-51-D1.csv")
str(data)
table(data$Type.of.feeding.interaction)
table(data$Predator.lifestage)


lm(data$Predator.mass ~ data$Prey.mass + data$Predator.lifestage + data$Type.of.feeding.interaction)

range(data$Prey.mass, na.rm = TRUE)
range(data$Predator.mass, na.rm = TRUE)


p <- ggplot(data, aes(x = Prey.mass, y = Predator.mass, colour = Predator.lifestage)) +
  geom_point(shape = I(3), size = I(1.5)) +  # Scatter points
  geom_smooth(method = "lm", fullrange = TRUE) +  # Linear model smoothing
  facet_wrap(~ Type.of.feeding.interaction, nrow = 5, strip.position = "right") +  # Facet by Feeding Type
  labs(
    x = "Prey Mass in grams",
    y = "Predator Mass in grams",
    color = "Predator Life Stage"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(size = 8, face = "bold"),  # Adjust facet text size and boldness
    strip.background = element_rect(fill = "grey90", color = NA),  # Set facet strip background color
    legend.position = "bottom",
    legend.box = "horizontal",
    legend.direction = "horizontal", 
    legend.title = element_text(size = 8),
    legend.text = element_text(size = 8),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 10),
    plot.title = element_text(angle = -90, vjust = 0.5, hjust = 0.5, size = 12, face = "bold"),
    plot.title.position = "plot" , 
    panel.border = element_rect(color = "black", fill = NA, size = 0.5)
  ) +
  guides(colour = guide_legend(nrow = 1)) +
  scale_x_log10() +  # Log scale for x-axis
  scale_y_log10() +
  coord_fixed(ratio = 0.4)

  #Save the picture as PDF
  ggsave("../results/Predator_Prey_Plot.pdf", plot = p, width = 10, height = 8)

########################################################################
# Find unique combinations of Feeding Type and Predator Life Stage
combinations <- data %>%
  distinct(Type.of.feeding.interaction, Predator.lifestage) %>%
  arrange(Type.of.feeding.interaction, Predator.lifestage)

# Initialize a dataframe to store regression results
regression_results <- data.frame()

# Loop through each combination
for (i in 1:nrow(combinations)) {
  # Extract the current combination
  feeding_type <- combinations$Type.of.feeding.interaction[i]
  predator_stage <- combinations$Predator.lifestage[i]
  
  # Filter data for the current combination
  subset_data <- data %>%
    filter(Type.of.feeding.interaction == feeding_type, 
           Predator.lifestage == predator_stage)
  
  # Check if there are enough data points for regression
  if (nrow(subset_data) > 1) {
    # Perform linear regression
    model <- lm(Predator.mass ~ Prey.mass, data = subset_data)
    
    # Summarize the model to extract statistics
    model_summary <- summary(model)
    if (nrow(model_summary$coefficients) >= 2) {
    # Store the results in the regression_results dataframe
      regression_results <- rbind(regression_results, data.frame(
        Type.of.feeding.interaction = feeding_type,
        Predator.lifestage = predator_stage,
        slope = coef(model)[2],    # Slope
        intercept = coef(model)[1], # Intercept
        r_squared = model_summary$r.squared, # R-squared
        f_statistic = model_summary$fstatistic[1], # F-statistic
        p_value = model_summary$coefficients[2, 4] # p-value
    ))
    } else{
      # If model doesn't have the expected coefficients, add NA values
      regression_results <- rbind(regression_results, data.frame(
        Type.of.feeding.interaction = feeding_type,
        Predator.lifestage = predator_stage,
        slope = NA,    
        intercept = NA, 
        r_squared = NA, 
        f_statistic = NA, 
        p_value = NA 
      ))
    }
  } else {
    # If not enough data, add NA values
    regression_results <- rbind(regression_results, data.frame(
      Type.of.feeding.interaction = feeding_type,
      Predator.lifestage = predator_stage,
      slope = NA,    
      intercept = NA, 
      r_squared = NA, 
      f_statistic = NA, 
      p_value = NA 
    ))
  }
}

# Save the regression results to a CSV file
write.csv(regression_results, file = "../results/PP_Regress_Results.csv", row.names = FALSE)

# Print regression results for verification
print(regression_results)