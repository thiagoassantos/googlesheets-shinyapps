library(shiny)
library(googlesheets)
library(DT)
library(httr) 

# Ignore warnings.
set_config(config(ssl_verifypeer = 0L)) 

# Write/read functions.
source("functions/functions.R")

# Import sheets by ID.
gap_ss <- gs_key("1FmoHz9-HszXkbOKqZ_2-HxAtV-HDpw3k_Gw7eHk-PK0")

# Read as 'data'.
gap_data <- gs_read(gap_ss)

# Fields from form.
fields <- c("name", "used_shiny", "r_num_years")

server = function(input, output, session) {
  
  formData <- reactive({
    data <- sapply(fields, function(x) input[[x]])
    data
  })
  
  # Form submit.
  observeEvent(input$submit, {
    saveData(formData())
  })
  
  output$responses <- renderDataTable({
    input$submit
    
    datatable(gap_data)
    
    loadData()
  })
}
