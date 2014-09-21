
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
  output$bmi <- renderText({
    h <- input$h
    w <- input$w
    if (h == 0) {
      w = 1;
    }
    
    bmi <- round(w/(h/100*h/100), 1)
    
    ## Check and print user BMI.
    if (10 < bmi & bmi < 60) {
      if (input$sex == 1) {
        paste("Your BMI is", bmi , "You are", status(bmi), ", Gentleman.")
      }
      else if (input$sex == 2) {
        paste("Your BMI is", bmi ,"You are", status(bmi), ", Lady.")
      }
      else {
        paste("Your BMI is", bmi ,"You are", status(bmi), ".")
      }
    }
    else if (bmi == 1/0 ) {
      paste("Please give us right input.")
    }
    else {
      paste("Your input may be wrong, please check and caculate again.")
    }
  })
  
  ## Check user status.
  status <- function (x) {
    if (x < 18.5) {
      return ("Underweight")
    }
    else if (24.9 > x) {
      return ("Normal weight")
    }
    else if (29.9 > x) {
      return ("Overweight")
    }
    else if (x > 30){
      return ("Obesity")
    }
    else if (x > 40) {
      return ("Morbidly Obese")
    }
    else {
      return ("")
    }
  } 
  
  ## Round up number.
  round = function(x, n) {
    posneg = sign(x)
    z = abs(x)*10^n
    z = z + 0.5
    z = trunc(z)
    z = z/10^n
    z*posneg
  }
})
