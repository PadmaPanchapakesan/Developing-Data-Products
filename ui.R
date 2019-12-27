#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Car Speed"),

    # Sidebar with a slider input for Speed of car
    sidebarLayout(
        sidebarPanel(
            sliderInput("speed",
                        "Enter Speed of car:",
                        min = 4,
                        max = 25,
                        value = 15),
            
            ),

        # Show a plot of the generated distribution
        mainPanel(
            h6("Estimated Stopping Distance of the car at the speed chosen is: "),
            textOutput("distance"),
            plotOutput("plot1")
        )
    )
))
