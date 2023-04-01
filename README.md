# penguins_spices
Based on different penguin characteristics to classify the spices.

The data are built in R (penguin). The data vasualizaiton is used in exploration step, and I found that species: Adelie has shorter bill than the other two species: Chinstrap & Gentoo. Thus, I built the binary variable for spices, which 1 means Adelie and 0 represents the other two species.

# penguin
The generlaized linear mixed models are built to clssify whether the species is Adelie. One has fixed effects of bill length and weight, and island is the random effect. Another model adds one fixed effect: depth of bill.

According to AIC, it is suggested that the model with depth of bill has a lower AIC, so this model can fit this dataset better than the model exluding depth of bill.


# penguin_1
The different variables are implemented in this analysis. In addition, I try to classify species: Adelie & Gentoo. 
Two generalized linear mixed models are implemented, one uses weights and length of flipper as the fixed effects and island as the random effect. Annother model adds length and gepth of bill as fixed effects.

When Adelie is the target species, I found the model with length and gepth of bill has much smaller AIC (16) than without them (201). Thus, we can conclude that the length and gepth of bill is important to classify Adelie species.

On the other hand, when Gentoo is the target species, the same two models are impenmented. The model with length and gepth of bill also has a smaller AIC (12) than without them (17). However, the AICs are not very differnt like when Adelie is the target species. Thus we believe that weight and length of flipper are good to classify Gentoo, althought adding length and gepth of bill can improve the model fit.
