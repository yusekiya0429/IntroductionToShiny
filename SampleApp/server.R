#
function(input, output, session) {

    output$ScatterPlot <- renderPlot({
        # XaxisとYaxisを抽出して種類ごとに色分けした散布図を描く.  
      basedat <- pre_penguins %>%
        select(one_of(c("species", "island", input$Xaxis, input$Yaxis, "sex", "year"
                        ))) %>%
        setnames(c("species", "island", "Xaxis", "Yaxis", "sex", "year"))
      plot <- basedat %>%
        ggplot(aes(x = Xaxis, y = Yaxis, color = species, fill = species)) +
        geom_point() +
        xlab(input$Xaxis) +
        ylab(input$Yaxis)
      
      return(plot)
    })

}
