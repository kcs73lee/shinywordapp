#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)


# Define UI for application for prediction
shinyUI(fluidPage(
  # Application title
  titlePanel("Super N-gram Word Predictor"),
  p("Please input a word(s) into the text box below and 
almost immediately, your predicted word
    will appear in blue in the main right panel."),
  p("Please Enjoy!"),
  br(),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("text", "Enter your words here...", value= "Example: How are")
    ),
    
    # Show predicted word
    mainPanel(
       h2("and below is your predicted word:"),
       h1(textOutput("predicted"), style="color:blue")
    )
  )
))
