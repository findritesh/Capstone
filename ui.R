library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Text Prediction"),
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      textInput(inputId="in_words",label="Enter initial words","How are")
    ),
    # Show a summary of the dataset and an HTML table with the 
	 # requested number of observations
    mainPanel(
      tableOutput("view")
    )
  )
))

