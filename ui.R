library(shiny)
library(googlesheets)
library(httr)

# Write/read functions.
source("functions/functions.R")

shinyUI(
  ui = fluidPage(
    
    # Import CSS styles.
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    titlePanel("Lendo e salvando dados em uma planilha Google Sheets"),
    
    # Shows the table.
    DT::dataTableOutput("responses", width = 300), tags$hr(),
    
    textInput("name", "Nome", ""),
    
    checkboxInput("used_shiny", "Já criei um app em Shiny antes", FALSE),
    
    sliderInput("r_num_years", "Número de anos usando o R",
                0, 25, 2, ticks = FALSE),
    
    actionButton("submit", "Enviar")
    
    # mainPanel(
    #    DT::dataTableOutput("responses")
    # )
  )
)
