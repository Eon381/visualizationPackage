#' Function to visualize multiple numerical variables using histograms
#'
#' This function creates a grid of histogram plots for up to 9 numeric variables from a given dataframe.
#' It checks that all variables exist and are numeric before plotting.
#'
#' @param df A data frame containing the data for visualization.
#' @param vars A character vector of column names for visualization.
#'
#' @return A grid of ggplot2 histogram plots that is displayed in the viewer.
#' @examples
#' visualize_numerical(mtcars, c("mpg", "hp", "wt"))
#'
#' @import ggplot2
#' @import gridExtra
#' @export


#Function to visualize numerical variables:
visualize_numerical <- function(df, vars) {

  #Libraries used:
  library(ggplot2)
  library(gridExtra)

  #Checking if number of variables is valid:
  if (length(vars) == 0 || length(vars) > 9) {
    message("Number of variables for the visualization should be from 1 to 9. Try again.")
    return(NULL)
  }

  #Checking if all variables exist in df:
  if (!all(vars %in% names(df))) {
    message("Some variables do not exist in the dataset. Try again.")
    return(NULL)
  }

  #Checking if all selected variables are numeric:
  if (!all(sapply(df[vars], is.numeric))) {
    message("All variables should be numerical. Try again.")
    return(NULL)
  }

  #Creation of histograms:
  plots <- lapply(vars, function(var) {
    ggplot(df, aes(x = .data[[var]])) +
      geom_histogram(fill = "green", color = "black", bins = 30) +
      theme_minimal() +
      ggtitle(var)
  })

  #Setting grid:
  n <- length(vars)
  n_col <- ceiling(sqrt(n))
  n_row <- ceiling(n / n_col)

  #Displaying histograms:
  do.call(grid.arrange, c(plots, ncol = n_col))
}


#' Function to visualize multiple categorical variables using bar plots
#'
#' This function creates a grid of bar plots for up to 9 categorical variables from a given dataframe.
#' It checks that all variables exist and are factor or character before plotting.
#'
#' @param df A data frame containing the data for visualization.
#' @param vars A character vector of column names for visualization.
#'
#' @return A grid of ggplot2 bar plots that is displayed in the viewer.
#' @examples
#' visualize_categorical(as.data.frame(Titanic), c("Class", "Sex", "Age"))
#'
#' @import ggplot2
#' @import gridExtra
#' @export


#Function to visualize categorical variables:
visualize_categorical <- function(df, vars) {

  #Libraries used:
  library(ggplot2)
  library(gridExtra)

  #Checking if number of variables is valid:
  if (length(vars) == 0 || length(vars) > 9) {
    message("Number of variables for the visualization should be from 1 to 9. Try again.")
    return(NULL)
  }

  #Checking if all variables exist in df:
  if (!all(vars %in% names(df))) {
    message("Some variables do not exist in the dataset. Try again.")
    return(NULL)
  }

  #Checking if all selected variables are character or factor:
  if (!all(sapply(df[vars], function(x) is.factor(x) || is.character(x)))) {
    message("All variables should be string or factor. Try once again.")
    return(NULL)
  }

  #Creation of bar plots:
  plots <- lapply(vars, function(var) {
    ggplot(df, aes(x = .data[[var]])) +
      geom_bar(fill = "green", color = "black") +
      theme_minimal() +
      ggtitle(var) +
      theme(axis.text.x = element_text(angle = 90))
  })

  #Setting grid:
  n <- length(vars)
  n_col <- ceiling(sqrt(n))
  n_row <- ceiling(n / n_col)

  #Displaying bar plots:
  do.call(grid.arrange, c(plots, ncol = n_col))
}
