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
### Server
server <- function(input, output, session) {

  #output$txtTitle <- renderText("TODO: Bioshapes")

  #output$txtGraphicsTitle <- renderText("Bioshapes")

  output$selectedPlot <- renderPlot({

    output$textslider =
      switch(input$selectedGraphic,
             "complex_duct" = renderText("Numărul de poligoane"),
             "virus" = renderText("Numărul de spikes"),
             "neurondesign" = renderText("Numărul de dendrite"),
             "neurons" = renderText("Numărul de dendrite"),
             "ducts" = renderText("Numărul de poligoane"),
             "dna" = renderText("Numărul de perechi de bază"),
             "muscle" = renderText("Numărul de straturi"),
             "star" = renderText("Numărul de vârfuri"),
             "curves" = renderText("Numărul de 'petale'"),
             "lens" = renderText("Poziția lentilei din mijloc"))

    if (input$selectedGraphic == "description" || input$selectedGraphic == "cell") {
      shinyjs::hide("NrCells")
    } else {
      shinyjs::show("NrCells")
    }

    output$txtDescription =
    switch(input$selectedGraphic,
           "complex_duct" = renderText({HTML(paste("
Această funcție creează și afișează un duct complex
creat cu ajutorul funcțiilor draw_blood_cell(), duct() și lens()",
"Parametrii funcției:",
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
unor cercuri creată cu funcția testFilledCircle()
care a dus la crearea funcției și obiectului neuron()",
"Parametrii funcției testFilledCircle():",
"-xy: o listă cu coordonatele pentru centrul cercului",
"-r: raza cercului",
"-R: raza cercului de delimitare",
"-lim: limita plot-ului",
"-line: o valoare care indică desenarea cercului",
"-col: culoarea cercului",
"-col.line: culoarea cercului exterior",
"-add: valoarea care decide adăugarea cercului la plot-ul existent",
"-pin: indică dacă se păstrează raportul de aspect al complotului",
"-...: argumente adiționale", sep="<br/>"))}),
           "neuron" = renderText({HTML(paste("
Această imagine ilustrează un neuron",
"Parametrii funcției:",
"-center: determină coordonatele de generare ale neuronului",
"-n: numărul dendritelor",
"-r: raza corpului",
"-phi: unghiul dendritelor",
"-axon.length: lungimea axonului",
"-dendrite.length: lungimea dendritelor",
"-r.nucl: raza nucleului",
"-r.synapse: raza sinapselor",
"-type.syn: tipul sinapsei",
"-col: culoarea corpului neuronului",
"-col.nucl: culoarea conturului nucleului",
"-fill.nucl: culoarea nucleului",
"-col.synapse: culoarea sinapsei",
sep="<br/>"))}),
           "description" = renderText({HTML(paste("
Aici se poate vizualiza o descriere a componentelor
neuronului realizată cu ajutorul săgeților. Neuronul
a fost generat cu funcția neuron(), titlul cu text(),
iar săgețile cu arrowSimple()",
"Parametrii funcției text():",
"-xy.title: coordonatele titlului",
"-title: textul titlului",
"-cex: font-ul textului",
"Parametrii funcției arrowSimple():",
"-x și y: coordonatele săgeții",
"-d: orientarea vârfului",
"-lwd: grosimea liniei",sep="<br/>"))}),
           "neurons" = renderText({HTML(paste("
În această imagine se poate observa o rețea de neuroni
conectați prin sinapse. Pentru această vizualizare s-a
creat funcția neurons() care generează neuroni cu coordonate
și sinapse diferite",sep="<br/>"))}),
           "ducts" = renderText({HTML(paste("
Imaginea alăturată prezintă două exemple de ducte circulare
cu diferite caracteristici",
"Parametrii funcției:",
"-n: numărul de laturi ale poligonului",
"-R: razele interioare și exterioare ale ductului",
"-nc.r: raza nucleului",
"-center: coordonatele ductului",
"-col: culoarea poligonului",
"-fill: culoarea de umplere a poligonului",
"-nc.fill: culoarea nucleului",
"-phi: unghiul de pornire a cercurilor interioare și exterioare",sep="<br/>"))}),
           "dna" = renderText({HTML(paste("
În acest cadru este descris un fragment de ADN",
"Parametrii funcției: ",
"-x și y: coordonatele celor două puncte între care se va
desena spirala ADN",
"-n: numărul de bifurcații ale spiralei",
"-phi: unghiurile de fază ale celor două spirale componente",
"-A: amplitudinea spiralelor",
"-n.lines: numărul de linii care se vor desena între cele două spirale",
"-lwd: grosimea liniilor",
"-col: culoarea celor două spirale",
"-col.lines: culoarea liniilor dintre spirale", sep="<br/>"))}),
           "cell" = renderText({HTML(paste("
Aici se pot vizualiza un grup de celule sanguine",
"Parametrii funcției:",
"-center: coordonatele celulei",
"-radius: raza celulei",
"-lwd: grosimea liniei de contur a celulei",
"-col: culoarea membranei",
"-fill: culoarea de umplere", sep="<br/>"))}),
           "muscle" = renderText({HTML(paste("
Această imagine prezintă un țesut muscular format
din mai multe celule care sunt create cu ajutorul funcției lens()",
"Parametrii funcției:",
"-scale.x: factorul de scalare pe coordonata x",
"-scale.R: factorul de scalare pentru mărimea lentilelor",
"-x și y: coordonatele pentru fibrele musculare",
"-dx și dy: coodonatele pentru spațierea fibrelor musculare",
"-n: numărul de straturi",
"-fill: culoarea fibrelor musculare", sep="<br/>"))}),
           "star" = renderText({HTML(paste("
În acest plot este prezent un poligon în formă de stea",
"Parametrii funcției:",
"-n: vârfurile stelei",
"-R: mărimea cercului interior și exterior pentru a determina mărimea stelei",
"-center: coordonatele",
"-lwd: grosimea liniei",
"-phi: unghiul de start al stelei în radiani",
"-col: culoarea conturului",
"-fill: culoarea stelei", sep="<br/>"))}),
           "curves" = renderText({HTML(paste("
Aici se pot vizualiza câteva exemple de linii curbe
trasate cu ajutorul funcțiilor matematice. Aceste obiecte
au fost generate cu ajutorul funcției helix.rad()",
"Parametrii funcției: ",
"-R: raza cercului din helix",
"-n: numărul de bucle",
"-center: coordonatele helixului",
"-r: amplitudinea oscilației radiale",
"-phi: unghiul de defazare",
"-lwd: grosimea liniei",
"-col: culoarea liniei",
"-fill: culoarea de umplere",
"-N: numărul de puncte pentru a genera helixul", sep="<br/>"))}),
           "lens" = renderText({HTML(paste("
Alături sunt prezentate câteva exemple de lentile
convexe, dar și procesul prin care au fost create",
"Parametrii funcției: ",
"-x și y: coordonatele lentilei",
"-R: raza lentilei",
"-scale: un factor de scalare pentru raza lentilei",
"-lwd: grosimea liniei",
"-col: culoarea liniei",
"-fill: culoarea de umplere a lentilei", sep="<br/>"))}),
           "virus" = renderText({HTML(paste("
Acest plot ilustrează 3 exemple de virusuri:",
"- cu spikes cu vârf poligonal",
"- cu spikes cu vârf rotund",
"- cu două mărimi de spikes",
"Parametrii funcției:",
"-R: raza virusului",
"-center: coordonatele virusului",
"-n.spike: numărul de spike-uri",
"-off.spike: distanța de generare a spike-urilor",
"-r.spike: raza spike-ului",
"-ngon.spike: numărul laturilor a vârfului",
"-phi.spike: orientarea spike-urilor",
"-lwd: grosimea liniei",
"-lwd.spike: grosimea spike-urilor",
"-col: culoarea liniei",
"col.spike: culoarea liniei spike-ului",
"fill.spike: culoarea de umplere a spike-ului", sep="<br/>"))}))

    plotImage()
  })
    plotImage = function(){
        switch(input$selectedGraphic,
               "complex_duct" = example.complexDuct(n = input$NrCells),
               "virus" = example.virus(N = input$NrCells),
               "neurondesign" = example.neuronDesign(N = input$NrCells),
               "description" = description.neuron(),
               "neurons" = example.neurons(N = input$NrCells),
               "ducts" = example.ducts(n = c(15, input$NrCells)),
               "dna" = example.dna(n = input$NrCells),
               "cell" = example.bloodCells(),
               "muscle" = example.muscle(n = input$NrCells),
               "star" = example.star(n = input$NrCells),
               "curves" = example.curves(nr = input$NrCells),
               "lens" = example.lens(pos = c(0, 5/input$NrCells, 1)))
    }
    output$downloadData <- downloadHandler(
      filename = "Diagram.png",
      contentType = "image/png",
      content = function(file) {
        ## Save the plot as an image file
        png(file)
        plotImage()
        dev.off()
      }
    )
}




