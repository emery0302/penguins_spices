# Load required packages
library(tidyverse)
library(lme4)
library(palmerpenguins)
library(ggplot2)

# Load the dataset
data(penguins)

# Data Exploration
head(penguins)
summary(penguins)
str(penguins)

# Data Cleaning
# Remove rows with missing values
penguins_clean <- penguins %>%
  drop_na()

# Check for remaining missing values
summary(penguins_clean)

# Data Visualization
# Scatter plot of body mass and flipper length
ggplot(penguins_clean, aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
  geom_point() +
  labs(title = "Body Mass vs Flipper Length",
       x = "Body Mass (g)",
       y = "Flipper Length (mm)") +
  theme_minimal()

# Box plot of body mass by species
ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  labs(title = "Body Mass Distribution by Species",
       x = "Species",
       y = "Body Mass (g)") +
  theme_minimal()

# Data Analysis and Model Building
# Create a binary response variable (1 for Adelie, 0 for others)
penguins_clean$Is_Adelie <- as.integer(penguins_clean$species == "Adelie")

# Fit a binomial generalized linear mixed model
binomial_glmm <- glmer(Is_Adelie ~ body_mass_g + flipper_length_mm + (1 | island),
                       family = binomial(link = "logit"), data = penguins_clean)

# Model summary
summary(binomial_glmm)

# Model development: add bill length and bill depth as predictors
binomial_glmm2 <- glmer(Is_Adelie ~ body_mass_g + flipper_length_mm + bill_length_mm + bill_depth_mm + (1 | island),
                        family = binomial(link = "logit"), data = penguins_clean)

# Model summary
summary(binomial_glmm2)

# Model comparison using AIC
AIC(binomial_glmm,binomial_glmm2)

# Visualize model predictions
penguins_clean$Predicted_Prob <- predict(binomial_glmm2, type = "response")

ggplot(penguins_clean, aes(x = body_mass_g, y = Predicted_Prob, color = species)) +
  geom_point() +
  labs(title = "Predicted Probability of Being Adelie",
       x = "Body Mass (g)",
       y = "Predicted Probability") +
  theme_minimal()
