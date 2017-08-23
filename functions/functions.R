library(shiny)
library(googlesheets)
library(httr) # Sem essa biblioteca, usar o script de 'autenticacao.R'

saveData <- function(data) {
  # Grab the Google Sheet
  sheet <- gs_key("1FmoHz9-HszXkbOKqZ_2-HxAtV-HDpw3k_Gw7eHk-PK0")
  # Add the data as a new row
  gs_add_row(sheet, input = data)
}

loadData <- function() {
  # Grab the Google Sheet
  sheet <- gs_key("1FmoHz9-HszXkbOKqZ_2-HxAtV-HDpw3k_Gw7eHk-PK0")
  # Read the data
  gs_read_csv(sheet)
}