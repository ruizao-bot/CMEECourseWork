library(ggplot2)
library(dplyr)

# read data and summarise the feature
data = read.csv("../data/EcolArchives-E089-51-D1.csv")
str(data)
table(data$Type.of.feeding.interaction)
table(data$Predator.lifestage)

# Create lm model
model <- lm(data$Predator.mass ~ data$Prey.mass + data$Predator.lifestage + data$Type.of.feeding.interaction + data$Location)

# Find unique combinations
combinations <- data %>%
  distinct(Type.of.feeding.interaction, Predator.lifestage, Location) %>%
  arrange(Type.of.feeding.interaction, Predator.lifestage, Location)

# Initialize a dataframe to store regression results
regression_results <- data.frame()

# Define a function to seperate summary into different columns
addNewRow <- function(regression_results, feeding_type, predator_stage, location, model, model_summary) {
  regression_results <- rbind(regression_results, data.frame(
    Type.of.feeding.interaction = feeding_type,
    Predator.lifestage = predator_stage,
    Location = location,
    slope = ifelse(missing(model),NA, coef(model)[2]),    # Slope
    intercept =  ifelse(missing(model),NA,coef(model)[1]), # Intercept
    r_squared = ifelse(missing(model_summary),NA,model_summary$r.squared), # R-squared
    f_statistic = ifelse(missing(model_summary),NA,model_summary$fstatistic[1]), # F-statistic
    p_value = ifelse(missing(model_summary),NA,model_summary$coefficients[2, 4]), # p-value
    row.names = NULL
  ))
  return(regression_results)
}

# Loop through each combination
for (i in 1:nrow(combinations)) {
  feeding_type <- combinations$Type.of.feeding.interaction[i]
  predator_stage <- combinations$Predator.lifestage[i]
  location <- combinations$Location[i]
  
  # Filter data for the current combination
  subset_data <- data %>%
    filter(Type.of.feeding.interaction == feeding_type, 
           Predator.lifestage == predator_stage,
           Location == location)
  
  # Check if there are enough data points for regression
  if (nrow(subset_data) > 1) {
    # Perform linear regression
    model <- lm(Predator.mass ~ Prey.mass, data = subset_data)
    
    # Summarize the model to extract statistics
    model_summary <- summary(model)
    if (nrow(model_summary$coefficients) >= 2) {
      if(is.nan(model_summary$fstatistic[1])){
        cat(nrow(regression_results)+1,"Not enough amount of data, unable to process")
      }
      # Store the results in the regression_results dataframe
      regression_results = addNewRow(regression_results, feeding_type, predator_stage, location, model, model_summary)
    } else{
      # If model doesn't have the expected coefficients, add NA values
    regression_results = addNewRow(regression_results, feeding_type, predator_stage, location)
    }
  } else {
    # If not enough data, add NA values
    regression_results = addNewRow(regression_results, feeding_type, predator_stage, location)
  }
}

# Save the regression results to a csv file
write.csv(regression_results, file = "../results/PP_Regress_Results.csv", row.names = FALSE)