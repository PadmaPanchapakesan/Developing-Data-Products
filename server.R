#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to predict mileage of car
shinyServer(function(input, output) {

    data("cars", package = "datasets")
    linearmodel <- lm(dist ~ cars$speed, data = cars)
    
    output$plot1 <- renderPlot({
        plot(cars$speed, cars$dist, xlab = "Speed",
             ylab = "Stopping Distance ", main = "Stopping Distance vs Speed",
             cex = 1.5, pch = 16, bty = "n", col =ifelse(cars$speed %in% c(input$speed),"red","blue"))
        abline(linearmodel)
        
    coef_intercept <- coef(linearmodel)[1]
    coef_speed <- coef(linearmodel)[2]
    
    
    output$distance <- renderText({
          coef_intercept+ coef_speed*input$speed
    })
    
    
    
        
       
    })
    
})
