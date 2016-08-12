library(shiny)
library(googleVis)
load('WDI.RData')

function(input, output) {
  # code for rendering the map
  output$map <- renderGvis({
    dat <- country_data[country_data$year == input$year, ] 
    gvisGeoChart(dat, locationvar="country", 
                 colorvar=input$type,
                 options=list(projection="kavrayskiy-vii"))
    
  })
  output$chart <- renderGvis({
    dat <- country_data[country_data$country == input$country,]
    gvisColumnChart(data = dat, xvar = "year", yvar = input$indicator)
  })
  output$doc <- renderUI({
    includeHTML("doc.html")
  })
}