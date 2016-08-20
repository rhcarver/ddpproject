#ui.R for DDP Project
library(MASS)
df <- UScereal

shinyUI(pageWithSidebar(
     headerPanel("Personalized Cereal Selector"),
     
     sidebarPanel(
          h3("Choose from 65 popular US Cereals, specifying fat and sugar content"),
          
          sliderInput('maxfat', 'Set your preferred maximum % of calories from fat',value = 8.2, min = 0, max = 25, step = 0.1),
          sliderInput('maxsug', 'Set your preferred maximum grams of sugar per serving',
          value = 12, min = 0, max = 25, step =0.1)
     ),
     mainPanel(
          h5("Tradeoff between protein and carbs"),
          h6("Point colors indicate typical supermarket shelf placement, with 1 nearest floor"),
          h6("Point sizes indicate sugar content in grams"),
          plotOutput('newplot')
     )
))
