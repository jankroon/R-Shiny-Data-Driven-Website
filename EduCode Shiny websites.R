library(shiny)

ui1 <- fluidPage(
    titlePanel("Shiny Example 1"),

    sidebarLayout(
        sidebarPanel(
        ),
        mainPanel(
        ),
    )
)

server1 <- function(input, output) {
    }


ui2 <- fluidPage(
    titlePanel("Shiny Example 2"),

    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "chosenNumber",
              label = "Number of bins:",
              value = 10,
              min = 0, 
              max = 50
            )
        ),
        mainPanel(
            plotOutput("mainPlot")
        )
    )
)

server2 <- function(input, output) {
    output$mainPlot <- renderPlot({
       randomData = runif(1000)
       hist(randomData, breaks = input$chosenNumber)
    })
}

ui3 <- fluidPage(
    titlePanel("Shiny Example 3"),

    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "chosenNumber",
              label = "Number of bins:",
              value = 10,
              min = 0, 
              max = 50),
            checkboxGroupInput(inputId = "chosenColour",
              label = "Select colours:",
              choices = c("Red" = "red",
                "Green" = "green",
                "Blue" = "blue")
             )
        ),
        mainPanel(
            plotOutput("mainPlot")
        )
    )
)

server3 <- function(input, output) {
    output$mainPlot <- renderPlot({
       randomData = runif(1000)
       hist(randomData, breaks = input$chosenNumber, col = input$chosenColour)
    })
}

# Select the ui and server code that you want to examine
shinyApp(ui = ui1, server = server1)
#shinyApp(ui = ui2, server = server2)
#shinyApp(ui = ui3, server = server3)
