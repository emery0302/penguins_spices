# penguins_spices
Based on different penguin characteristics to classify the spices.

The data are built in R (penguin). The data vasualizaiton is used in exploration step, and I found that spicies: Adelie has shorter bill than the other two species: Chinstrap & Gentoo. Thus, I built the binary variable for spices, which 1 means Adelie and 0 represents the other two species.

The generlaized linear mixed models are built to clssify whether the species is Adelie. One has fixed effects of bill length and weight, and island is the random effect. Another model adds one fixed effect: depth of bill.

According to AIC, it is suggested that the model with depth of bill has a lower AIC, so this model can fit this dataset better than the model exluding depth of bill.
