library(shiny)
library(ggplot2)
library(tidyverse)
server <- function(input, output, session){
  output$plot <- renderPlot({
    shiny_data <- read.csv("Consumer_Complaints.csv", header = TRUE, sep =",")
    
    #Bar graph
    barplot(bing_df$sentiment)
  }
  
  )
}


ui<- basicPage(
  h1("Consumer Complaint in Shiny"),
  plotOutput("plot")
)

shinyApp(ui = ui, server= server)

