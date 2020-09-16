#
# This is the server logic of the Simple Regression Data Exploration Shiny web
# application. 
# The application provides a simple and quick way for exploring the mtcars data 
# set, allowing the user to plot a scatter plot, choose the x and y axes 
# variables, group the data by another variable, while plotting a regression
# line (displaying its equation) and a simple residue plot.
#
# This is the User Interface (UI) file, for more information about how the data
# is handled see the server file (server.R). 
#


# Load Libraries
library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Simple Data Explorer"),

    # Sidebar
    sidebarLayout(
        
        # Populate side bar
        sidebarPanel(width = 5,
                     
            # First Section: Graph settings         
            
            # Section title
            h2("Graph Settings"),
            
            # X axis selection box
            selectInput(inputId = "xAxis",
                        label = "X axis",
                        choices = names(mtcars)
                        
            ),
            
            # Y axis selection box
            selectInput(inputId = "yAxis",
                        label = "Y axis",
                        choices = names(mtcars)
                        
            ),
            
            # Grouping selection box
            selectInput(inputId = "gp",
                        label = "Grouping",
                        choices = names(mtcars)
                
            ),
            
            # Discrete/Continuous check box
            checkboxInput(inputId = "asFactor",
                          label = "Group as Discrete",
                          value = FALSE
            ),
            
            # Section separator
            hr(),
            
            # Second Section: Regression equation         
            
            # Section title
            h2("Model Information"),
            
            # Subsection title
            h3("Equation:"),
            
            # Display Equation
            h4(textOutput("eq")),
            
            # Subsection title
            h3("Residue:"),
            
            # Display R^2
            h4(textOutput("res"))
            
        ),

        # Main panel
        mainPanel(width = 7,
            
            # Draw scatter plot with regression line      
            plotOutput("scatterPlot", 
                       height = "300px"
            ),
            
            # Draw residue x fitted values graph
            plotOutput("resPlot", 
                       height = "300px"
            )
            
        )
        
    )
    
))
