# visualizationPackage

R package created to expedite the time used to create histograms and barplots using numerical and categorical variables.

To install this package, I recommend running the following code:

install.packages("remotes")  # Only needed once

remotes::install_github("Eon381/visualizationPackage")

Example Usage:

library(visualizationPackage)

# Functions and Examples

The function visualize_numerical creates a grid of histograms for up to 9 numerical variables in a provided data frame. For input, the function asks for a data frame, and a character vector that contains column names. It also checks that all variables exist and if they are factor or character before plotting.

visualize_numerical(mtcars, c("mpg", "hp", "wt"))

The function visualize_categorical creates a grid of barplots for up to 9 categorical variables in a provided data frame. This function takes the same input as its sibling which is a data frame, and a character vector containing column names.

visualize_categorical(as.data.frame(Titanic), c("Class", "Sex", "Age"))
