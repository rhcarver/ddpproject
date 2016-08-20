# server.R for DDP Project
library(shiny)
library(MASS)
library(ggplot2)

df <- UScereal

# prepare cereal data for use
attach(df)
df$shelf <- as.factor(df$shelf)
# compute calories from protein, fat, carbs
# source is USDA website: 
# https://fnic.nal.usda.gov/how-many-calories-are-one-gram-fat-carbohydrate-or-protein
protcal <- 4*protein; df$protperc <- 100*protcal/calories
fatcal <- 9 * fat; df$fatperc <- 100*fatcal/calories
carbcal <- 4 * carbo; df$carbper <- 100 - df$protperc - df$fatperc
df$name <-row.names(df)

#adjdf <- subset(df, fatperc < input$maxfat)
#adjdf <- subset(df, sugars < input$maxsug)
# attach(adjdf)

shinyServer(
     function(input, output) {
          output$newplot <- renderPlot({ggplot(subset (df, fatperc < input$maxfat & sugars < input$maxsug), aes(x=protperc, 
          y=carbper, color=shelf, size=sugars)) +
               geom_point() +
          geom_text(aes(label=name), vjust=-1) +
          xlim(0,40) + ylim(60,100) + labs(x="% of calories from protein", 
          y="% of calories from carbohydrate")
          
          })
     }
)
