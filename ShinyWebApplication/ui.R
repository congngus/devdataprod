
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI Caculation App"),
  sidebarLayout(
    sidebarPanel(
      h3("Introducing"),
      p("The body mass index (BMI), or Quetelet index, is a measure of relative weight based on an individual's", 
        em(" mass and height")),
      h3("BMI Categories: ", align = ""),
      p("Underweight = <18.5"),
      p("Normal weight = 18.5–24.9"),
      p("Overweight = 25–29.9"),
      p("Obesity = BMI of 30 or greater"),
      p("Morbidly Obese = BMI of 40 or greater"),
      br()
    ),
    mainPanel(
      p("Please fill feilds for your BMI caculation."),
      selectInput("sex", label = h5("Select Gender"), 
                  choices = list("Male" = 1, "Female" = 2, "None" = 3), selected = 3),
      numericInput("h", 
                   label = h5("Your Height (cm)"), 
                   value = 0),
      numericInput("w", 
                 label = h5("Your Weight (kg)"), 
                 value = 0),
      br(),
      submitButton("Compute BMI"),
      h3("Results:"),
      textOutput("bmi"),
      plotOutput("plot1")
    )
  )
))
