#### max upload file size increase 5000M ####
options(shiny.maxRequestSize=5000*1024^2)
options(repos = c(CRAN = "https://cloud.r-project.org/"))
system("ulimit -s 16384")

## load libraries 
need_packages <- c(
  "shiny",
  "shinydashboard",
  "shinyFiles",
  "shinyWidgets",
  "data.table",
  "dplyr",
  "tidyr",
  "stringi",
  "ggplot2",
  "purrr",
  "DT",
  "palmerpenguins"
)

to_be_installed <- setdiff(need_packages, installed.packages())
if (length(to_be_installed) > 0) {
  install.packages(to_be_installed, repos = "https://cloud.r-project.org/", dependencies = TRUE)
}

for (p in need_packages) {
  library(p, character.only = TRUE)
}

## preprocessing
data(penguins)

pre_penguins <- penguins %>%
  drop_na(everything())

colnames <- colnames(pre_penguins)[stri_detect_regex(colnames(pre_penguins), "_")]
