###################
#
# Bachelor Thesis
#
# Title: BioShapes
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

ui = fluidPage(
  #"Bioshapes",
  shinyjs::useShinyjs(),
  tabsetPanel(
    tabPanel(
      "Show Graphic Objects",
      fluidRow(
        column(2,
               tags$div(id = "graphicDescription",
                      style = "padding-top: 50px;padding-bottom: 50px; top: 150px; left: 10px;",
                      htmlOutput("txtDescription"))
        ),
      column(10,
      fluidRow(
        column(4, textOutput("txtGraphicsTitle")),
        column(8, selectInput(inputId = "selectedGraphic", label = "Select Object",
                  choices = c("Complex Duct" = "complex_duct", "Ducts" = "ducts", "Virus" = "virus",
                            "Neuron Design" = "neurondesign",
                            "Description of the Neuron" = "description",
                            "Neurons" = "neurons", "DNA" = "dna", "Blood Cell" = "cell",
                            "Muscle Tissue" = "muscle", "Star" = "star",
                            "Various Curves" = "curves", "Lens" = "lens"))),
      fluidRow(
        column(12, plotOutput("selectedPlot"))
      ))),
      fluidRow(
        column(10,
                downloadButton("downloadData", "Download")
               )
      ),
      fluidRow(
        column(4,
               sliderInput(inputId = "NrCells", label = textOutput("textslider"),
                           value = 8, min = 4, max = 22, step = 2))
        )
    )
  )
)
)
