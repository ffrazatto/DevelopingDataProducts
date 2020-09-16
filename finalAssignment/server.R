#
# This is the server logic of the Simple Regression Data Exploration  Shiny web
# application. 
# The application provides a simple and quick way for exploring the mtcars data 
# set, allowing the user to plot a scatter plot, choose the x and y axes 
# variables, group the data by another variable, while plotting a regression
# line (displaying its equation) and a simple residue plot.
#


## Load Libraries
library(shiny)
library(ggplot2)
library(RColorBrewer)
library(stats)


shinyServer(function(input, output) {


    # Define global variable to store the fitted regression model
    models <- reactiveValues(fit1 = 0)
    
    
    # Setup and render scatter plot with regression line
    output$scatterPlot <- renderPlot({

        # Build data frame based on chosen variables
        df <- data.frame(x = mtcars[, input$xAxis], 
                            y = mtcars[, input$yAxis],
                            z = mtcars[, input$gp])

        # Fit simple linear model
        models$fit1 <- lm(y ~ x, data = df) 
        
        # Predict values with calculated linear model
        pred1 <- predict(models$fit1)
        
        
        # Setup color palettes
        ncols <- length(unique(df$z))
        mycolors <- colorRampPalette(brewer.pal(8, "Set1"))(ncols)
        
        # Scatter plot labels.
        g <- labs(x = input$xAxis, y = input$yAxis)
            
        # Verify if the user checked the "Group as Discrete" option
        if(input$asFactor){
            
            # If selected, interpret the grouping variable as a factor
            df$z <- as.factor(df$z)
            
            # Create legend
            cl <- scale_fill_manual(values = mycolors, name = input$gp)
                        
        } else {
            
            # If not selected, interpret the grouping variable as continuous
            df$z <- as.numeric(df$z)
            
            # Create legend
            cl <- scale_color_gradientn(colours = mycolors, name = input$gp)
            
        }
        
        # Draw scatter plot with the desired variables and regression line
        ggplot(data = df, aes(x = x, y = y, colors = z)) + 
            geom_point(aes(colour = z), size = 3) +
            geom_line(aes(y = pred1, color = z), size = 1) + 
            cl + g 
        
    })
        
    # Display Linear Equation
    output$eq <- renderText({
        
        # Get linear model coefficients
        b0 <- round(coef(models$fit1)[1], 3)
        b1 <- round(coef(models$fit1)[2], 3)
        
        # Build text
        paste("y = ", b0, " + x(", b1, ")")
        
    })
    
    # Display Linear Equation
    output$res <- renderText({
        
        # Get linear model R^2
        r2 <- round(summary(models$fit1)$r.squared, 3)
        
        # Build text
        paste("R^2 = ", r2)
        
    })

    # Draw residue plot
    output$resPlot <- renderPlot({
        
        # Which = 1: Residue x fitted values 
        plot(models$fit1, which = 1)
        
    })

})
