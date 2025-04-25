# X軸とY軸を選択したら、あわせて散布図が変わる

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Penguin's Scatter plot"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("Xaxis",
                        "X軸:",
                        choices = colnames,
                        selected = colnames[1],
                        multiple = FALSE),
            
            selectInput("Yaxis",
                        "Y軸:",
                        choices = colnames,
                        selected = colnames[2],
                        multiple = FALSE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("ScatterPlot")
        )
    )
)
