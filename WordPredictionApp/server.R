#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
##load required packages
library(shiny)
library(RSQLite)
##
##set working source prediction functions
source('STBO_algo.R')

# Define server logic required to accept word or phrase inputs and return 
# highest predicted next word

shinyServer(function(input, output) {
  
  db<-dbConnect(SQLite(), dbname="ngstorage.db")
  
  texting<- reactive({stbo(input$text, db)})
  
  output$sentence<-renderText({input$text})
  output$predicted<-renderText({
    get<- texting()
  if (get[[1]] == "Please try again") {
    return(get)
  }
  else{
    return(unlist(get)[1])
    }})
  })



  
