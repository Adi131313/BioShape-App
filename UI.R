ui = fluidPage(
  #"Bioshapes",
  shinyjs::useShinyjs(),
  tabsetPanel(
    tabPanel(
      "Show Graphic Objects",
      fluidRow(
        column(2,
               tags$div(id = "graphicDescription",
                      style = "position: absolute; top: 150px; left: 10px;",
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
               sliderInput(inputId = "NrCells", label = "Number of Cells",
                           value = 8, min = 4, max = 20, step = 2))
        )
    )
  )
)
)

# output$downloadImage <- downloadHandler(
#   filename = "Modified_image.jpeg",
#   contentType = "image/jpeg",
#   content = function(file) {
#     ## copy the file from the updated image location to the final download location
#     file.copy(updatedImageLoc(), file)
#   }
# )
