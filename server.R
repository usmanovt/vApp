# Load Data of forecast and observation
load("/home/t/vApp/for_df_03.RData")    ## Load Forecast Data (for_df)
load("/home/t/vApp/fact_df.RData")   ## Load Observed Data (fact_df)

# Load libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(shiny)

# Define server logic required to draw a verification plot
shinyServer(function(input, output) {
  
  # ploting 2 variables temp_for and temp_fact
  output$Plot <- renderPlot({
      forecast <- for_df_03 %>% filter(index == input$index, p_date == input$date) %>% select(hour, temp_for, -index, -p_date, -prec)
      observation <- fact_df %>% filter(index == input$index, hour >= forecast$hour[1], hour <= forecast$hour[nrow(forecast)]) %>% select(-index, -date, -hour, temp_fact)
      verification <- cbind(forecast, observation)
  ggplot(verification, aes(hour)) + geom_line(aes(y = temp_for, colour="forecast")) + geom_line(aes(y = temp_fact, colour="observation"))
  })
})
