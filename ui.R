library(shiny)
load('WDI.RData')
fluidPage(
  titlePanel("Visualization of Some World Economic Indicators"), # title for website
  tabsetPanel(
    tabPanel(
      "World Map", 
      sidebarLayout(
        sidebarPanel(
          selectInput(inputId = "type", label = "Indicator:",
                      choices = c("GDP per capita", "GDP growth", "GNI per capita", 
                      "Foreign Direct Investment" = "FDI", 
                      "Population" = "population")),
          numericInput(inputId = "year", label = "Year:", value=2015, min = 1960, 
                       max = 2015, step = 1, width = NULL)
        ),
        mainPanel(
          htmlOutput(outputId = "map")
        )
      )
    ),
    tabPanel(
      "Country Chart",
      sidebarPanel(
        selectInput(inputId = "indicator", label = "Indicator:",
                    choices = c("GDP per capita", "GDP growth", "GNI per capita", 
                                "Foreign Direct Investment" = "FDI", 
                                "Population" = "population")),
        selectInput(inputId = "country", label = "Country:", 
                    choices = unique(sort(country_data$country)))
      ),
      mainPanel(
        htmlOutput(outputId = "chart")
      )         
    ),
    tabPanel(
      "Documentation",
      uiOutput("doc")
    )
  )
  
)