library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Weather Research and Forecasting (WRF) Model"),
  
   #Sidebar with a slider input for the number of bins
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "index",
              label = "Index:",
              choices = unique(for_df_03$index),
              selected = 35188),
        
        dateInput("date", 
                  label = "Date", 
                  value = "2015-03-27")   
        
  
  #      selectInput(inputId = "date",
  #            label = "Date:",
  #            choices = unique(for_df_03$p_date),
  #            selected = 2015-03-01)
      ),
    # Show a plot of the generated distribution
      mainPanel(
       
        plotOutput("Plot"))
    )
  ))

