#
# This shiny app runs a simple decision tree model for the iris data set.
#
# 

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Decison tree prediction model for the classification of the the species using
             length,width of sepal and petal"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Enter the following details to predict the species:"),
       numericInput("s.l","Enter the sepal length",value=0,step=0.1),
       numericInput("s.w","Enter the sepal width",value=0,step=0.1),
       numericInput("p.l","Enter the petal length",value=0,step=0.1),
       numericInput("p.w","Enter the petal width",value = 0,step = 0.1),
       h5("These information will be used to predict the species based on the decision tree on 
          the right side"),
       submitButton("submit")
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h5("The following plot describes the decison tree being used to predict the species."),
       plotOutput("plot"),
       h4("The prediction based on the following information is:"),
       textOutput("prediction"),
       h5("The result interpretation are as follows:"),br(),
       h5("1:setosa species"),
       h5("2:versicolor species"),
       h5("3:virginica species")
    )
  )
))
