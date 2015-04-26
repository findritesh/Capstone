library(shiny)
library(RCurl)
library(datasets)
require(shiny)
require(RCurl)
url2 <- getURL("https://raw.githubusercontent.com/kritimurthy/Capstone/master/gram_2.csv",ssl.verifypeer = FALSE)
gram_2<-read.csv(textConnection(url2))
url3 <- getURL("https://raw.githubusercontent.com/kritimurthy/Capstone/master/gram_3.csv",ssl.verifypeer = FALSE)
gram_3<-read.csv(textConnection(url3))
url4 <- getURL("https://raw.githubusercontent.com/kritimurthy/Capstone/master/gram_4.csv",ssl.verifypeer = FALSE)
gram_4<-read.csv(textConnection(url4))
url5 <- getURL("https://raw.githubusercontent.com/kritimurthy/Capstone/master/gram_5.csv",ssl.verifypeer = FALSE)
gram_5<-read.csv(textConnection(url5))

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
#   # Return the requested dataset
#   datasetInput <- reactive({
#     switch(input$dataset,
#            "rock" = rock,
#            "pressure" = pressure,
#            "cars" = cars)
#   })
  
  # Show the first "n" observations
  output$view <- renderTable({
    text=tolower(input$in_words)
    text1=strsplit(text,' ')
    if(length(text1[[1]])==1){dataset=gram_2}
    if(length(text1[[1]])==2){dataset=gram_3}   
    if(length(text1[[1]])==3){dataset=gram_4}
    if(length(text1[[1]])>=4){
      text1=text1[[1]][(length(text1[[1]])-3):length(text1[[1]])]
        dataset=gram_5}
    output=dataset[dataset$INPUT==text,c("INPUT","OUTPUT")]
    max=max(dim(output)[1],20)
    output=output[1:max,]
    output
  })
})

