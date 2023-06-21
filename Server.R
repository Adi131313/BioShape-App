
### Server
server <- function(input, output, session) {

  #output$txtTitle <- renderText("TODO: Bioshapes")

  #output$txtGraphicsTitle <- renderText("Bioshapes")

  output$selectedPlot <- renderPlot({

    output$txtDescription =
    switch(input$selectedGraphic,
           "complex_duct" = renderText({HTML(paste("
Această funcție creează și afișează un duct complex
creat cu ajutorul funcțiilor draw_blood_cell(), duct() și lens()",
"Parametrii:",
"-n: numarul de poligoane din duct",
"-center: poziția obiectului în plot",
"-r: raza membranei bazale, a duct-ului și a lentilelor",
"-h.scale: factorul de scalare a mărimii lentilelor",
"-R.scale: factorul de scalare pentru raza lentilelor",
"-dr: distanța dintre lentile și duct", sep="<br/>"))
             }),
           "neurondesign" = renderText({HTML(paste("
În această imagine se poate vizualiza procesul prin
care a fost creat neuronul, pornind de la intersecția
unor cercuri", sep="<br/>"))}),
           "neuron" = renderText({HTML(paste("
Această imagine ilustrează celula de neuron", sep="<br/>"))}),
           "description" = renderText({HTML(paste("
Aici se poate vizualiza o descriere a componentelor
neuronului realizată cu ajutorul săgeților", sep="<br/>"))}),
           "neurons" = renderText({HTML(paste("
În această imagine se poate observa o rețea de neuroni
conectați prin sinapse", sep="<br/>"))}),
           "ducts" = renderText({HTML(paste("
Imaginea alăturată prezintă două exemple de ducte circulare
cu diferite caracteristici", sep="<br/>"))}),
           "dna" = renderText({HTML(paste("
În acest cadru este descris un fragment de ADN", sep="<br/>"))}),
           "cell" = renderText({HTML(paste("
Aici se pot vizualiza un grup de celule sanguine", sep="<br/>"))}),
           "muscle" = renderText({HTML(paste("
Această imagine prezintă un țesut muscular format
din mai multe celule care sunt create cu ajutorul funcției lens()", sep="<br/>"))}),
           "star" = renderText({HTML(paste("
În acest plot este prezent un poligon în formă de stea", sep="<br/>"))}),
           "curves" = renderText({HTML(paste("
Aici se pot vizualiza câteva exemple de linii curbe
trasate cu ajutorul funcțiilor matematice", sep="<br/>"))}),
           "lens" = renderText({HTML(paste("
Alături sunt prezentate câteva exemple de lentile
convexe, dar și procesul prin care au fost create", sep="<br/>"))}),
           "virus" = renderText({HTML(paste("
Acest plot ilustrează 3 exemple de virusuri:",
"- cu spikes cu vârf poligonal",
"- cu spikes cu vârf rotund",
"- cu două mărimi de spikes", sep="<br/>"))}))

    plotImage()
  })
    plotImage = function(){
        switch(input$selectedGraphic,
               "complex_duct" = example.complexDuct(n = input$NrCells),
               "virus" = example.virus(),
               "neurondesign" = example.neuronDesign(),
               #"neuron" = example.neuron(),
               "description" = description.neuron(),
               "neurons" = example.neurons(),
               "ducts" = example.ducts(n = c(15, input$NrCells)),
               "dna" = example.dna(n = input$NrCells),
               "cell" = example.bloodCells(),
               "muscle" = example.muscle(n = input$NrCells),
               "star" = example.star(n = input$NrCells),
               "curves" = example.curves(),
               "lens" = example.lens())
    }
    output$downloadData <- downloadHandler(
      filename = "Diagram",
      contentType = "image/png",
      content = function(file) {
        ## Save the plot as an image file
        png(file)
        plotImage()
        dev.off()
      }
    )
}




