# visualizationPackage

R package created to expedite the time used to create histograms and barplots using numerical and categorical variables.

To install this package, I recommend running the following code:

install.packages("remotes")  # Only needed once

remotes::install_github("Eon381/visualizationPackage")

Example Usage:

library(visualizationPackage)

# Grid of Histograms containing frequency of "mpg", "hp", and "wt" values.

visualize_numerical(mtcars, c("mpg", "hp", "wt"))

#Grid of Barplots 

visualize_categorical(as.data.frame(Titanic), c("Class", "Sex", "Age"))
