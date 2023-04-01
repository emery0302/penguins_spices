# Load required packages

library(palmerpenguins)
library(tidyverse)
library(lme4)
library(ggplot2)

# Load and explore the Palmer Penguins dataset
data(penguins)
head(penguins)

# Clean the data: Remove rows with missing values
penguins_clean <- penguins %>%
  drop_na()

# Data visualization
# Boxplot of bill length for each species
ggplot(penguins_clean, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal() +
  labs(x = "Penguin Species", y = "Bill Length (mm)", title = "Bill Length by Penguin Species")

# Create a binary response variable for species
penguins_clean$species_bin <- ifelse(penguins_clean$species == "Adelie", 1, 0)

# Fit binomial generalized linear mixed models
glmm_model1 <- glmer(species_bin ~ bill_length_mm + body_mass_g + (1 | island), data = penguins_clean, family = binomial)
glmm_model2 <- glmer(species_bin ~ bill_length_mm + body_mass_g + bill_depth_mm + (1 | island), data = penguins_clean, family = binomial)

summary(glmm_model1)
summary(glmm_model2)

# Model comparison using AIC
AIC(glmm_model1, glmm_model2)

# Choose the best model based on the lowest AIC
best_model <- AIC_values[which.min(AIC_values$AIC), ]
best_model
