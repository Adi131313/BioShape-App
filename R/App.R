###################
#
# Bachelor Thesis
#
# Title: App for BioShapes
#
# Candidate: Adrian Cotoc
# Faculty of Mathematics and Informatics, UVT
#
# Coordinator:
#   Prof. Daniela Zaharie
#   Dr. med. Leonard Mada (Syonic SRL)
#
# in collaboration with Syonic SRL
#
# GitHub: https://github.com/Adi131313/BioShapes

library(shiny)
library(shinyjs)
library(shinyBS)

### Bioshapes
path = "C:\\Users\\Adi\\Desktop\\BioShapes\\BioShapes";
devtools::document(path)
devtools::load_all(path)

### App
setwd("C:\\Users\\Adi\\Desktop\\BioShapes\\ShinyAPP"); # aplicatia Shiny
source("UI.R")
source("Server.R")

shinyApp(ui = ui, server = server, options = list(port = 9090))


##########
