#install.packages("ggalluvial")
require(ggalluvial)
require(ggplot2)
require(viridis)
require(utils)
library(readr)
require(dplyr)

A_col <- "#404788FF"
B_col <- "#1F968BFF"
alpha <- 0.8

link <- "https://raw.githubusercontent.com/frm1789/ireland2018/master/ireland.txt"
df <- read.delim(url(link), sep = ",") 

df$porcentage <- as.numeric(df$porcentage) 
df$constituency <- as.character(df$constituency) 
df$response <- as.character(df$response)

ggplot(df,
       aes(weight = porcentage, axis1 = df$constituency, axis2 = response)) +
  geom_alluvium(aes(fill = response, color = response), 
                width = 1/12, alpha = alpha, knot.pos = 0.3,reverse = FALSE) +
  geom_stratum(width = 1/24, color = "grey") +
  geom_text(stat = "stratum", label.strata = TRUE, reverse = TRUE) +
  scale_x_continuous(breaks = 1:2, labels = c("Constituency", "response"))     +
  scale_fill_manual(values  = c(A_col, B_col)) +
  scale_color_manual(values = c(A_col, B_col)) +
  ggtitle("Ireland Referendum") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 12, face = "bold")
  )